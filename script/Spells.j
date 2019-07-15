library Spells requires SpellNameText{
    //技能管理类
     
    type SpellEventInterface extends function(Spell);
 
    public struct Spell{

        unit Spell;//施法者
        unit Target;//目标单位
        real X;//目标点X
        real Y;//目标点Y
        real Angle;//施法方向
        real Dis;//施法距离
        integer Id;//技能ID
        integer Obj;//自定义数据
        boolean Kill;//技能实例销毁时是否杀死施法单位
        integer Use;//实例的引用计数，为0时销毁
        integer State;//该技能实例的阶段

        //删除实例
        method Destroy(){
            this.Use=this.Use-1;
            if(this.Use==0){ 
                //测试 
                BJDebugMsg(GetAbilityName(this.Id)+"结束-阶段:"+I2S(this.State));
                if(this.Kill==true){
                    Units.Kill(this.Spell);
                }
                this.Target=null;
                this.Spell=null;
                this.deallocate();
            }
        }

                //自定义事件
        public {

            static constant integer SpellState=0;
            static constant integer ReadyState=1;
            static constant integer StartState=2;
            static constant integer StopState=3;

            static constant string onSpell="Spell.UnitSpell";//任意单位发动技能效果
            static constant string onReady="Spell.UnitReadySpell";//任意单位准备发动技能效果(进入技能前摇)
            static constant string onStart="Spell.UnitStartSpell";//任意单位开始发动技能效果(进入单位前摇)
            static constant string onStop="Spell.UnitStopSpell";//任意单位停止发动技能效果

            //触发指定事件名
            static method Trigger(string eName,integer id,Spell m){ 
                SpellEventInterface callback;
                if(Table[eName][id]!=0){
                    SpellEventInterface(Table[eName][id]).evaluate(m);
                }else{
                    m.Destroy();
                }
            }

            //注册自定义单位事件
            static method On(string eName,integer spellid,SpellEventInterface callback){   
                Table[eName][spellid]=callback; 
            }
        }

        //让一个单位模拟使用一个技能并返回Spells，用于技能衔接,可设置技能阶段
        static method UseSpell(unit ua,integer spell,integer state)->Spell{
            Units u=Units.Get(ua);
            Spell tmp; 
            tmp=Spell.allocate();
            if(state==Spell.SpellState){//如果模拟的是发动技能效果则显示技能名
                SpellText(u.unit,spell,3,10);
            }
            tmp.Spell=u.unit;
            tmp.Target=null;//调用方自己添加
            tmp.X=0;//调用方自己添加
            tmp.Y=0;//调用方自己添加
            tmp.Id=spell; 
            tmp.Angle=0;//调用方自己添加
            tmp.Dis=0;//调用方自己添加 
            tmp.Obj=0;
            tmp.Kill=false;
            tmp.Use=1;
            tmp.State=state;
            //测试 
            BJDebugMsg(GetAbilityName(tmp.Id)+"模拟生成-阶段:"+I2S(tmp.State)); 
            return tmp; 
        }
 

        static method onUnitSpell(EventArgs e){
            Units u=Units.Get(e.TriggerUnit);
            Spell tmp;
            if(GetUnitAbilityLevel(e.TriggerUnit,'Aloc')==0){
                tmp=Spell.allocate();
                SpellText(u.unit,e.SpellId,3,10);
                tmp.Spell=u.unit;
                tmp.Target=e.SpellTargetUnit;
                tmp.X=e.SpellTargetX;
                tmp.Y=e.SpellTargetY;
                tmp.Id=e.SpellId;
                if(tmp.Target==null){
                    tmp.Angle=Util.XYEX(GetUnitX(tmp.Spell),GetUnitY(tmp.Spell),tmp.X,tmp.Y);
                    tmp.Dis=Util.XY2EX(GetUnitX(tmp.Spell),GetUnitY(tmp.Spell),tmp.X,tmp.Y);
                }else{
                    tmp.Angle=Util.XY(tmp.Spell,tmp.Target);
                    tmp.Dis=Util.XY2(tmp.Spell,tmp.Target);
                }
                tmp.Obj=0;
                tmp.Kill=false;
                tmp.Use=1;
                tmp.State=Spell.SpellState;
                //测试 
                BJDebugMsg(GetAbilityName(tmp.Id)+"生成-阶段:"+I2S(tmp.State));
                if(u.spell!=0){
                    tmp.Use=2;
                    SpellEventInterface(u.spell).evaluate(tmp);
                } 
                Spell.Trigger(Spell.onSpell,tmp.Id,tmp);
            }
        }

        //! textmacro SpellFunc takes name,ev,type
        static method onUnit$name$(EventArgs e){
            Units u=Units.Get(e.TriggerUnit);
            Spell tmp;
            if(GetUnitAbilityLevel(e.TriggerUnit,'Aloc')==0){
                tmp=Spell.allocate();
                tmp.Spell=u.unit;
                tmp.Target=e.SpellTargetUnit;
                tmp.X=e.SpellTargetX;
                tmp.Y=e.SpellTargetY;
                tmp.Id=e.SpellId;
                if(tmp.Target==null){
                    tmp.Angle=Util.XYEX(GetUnitX(tmp.Spell),GetUnitY(tmp.Spell),tmp.X,tmp.Y);
                    tmp.Dis=Util.XY2EX(GetUnitX(tmp.Spell),GetUnitY(tmp.Spell),tmp.X,tmp.Y);
                }else{
                    tmp.Angle=Util.XY(tmp.Spell,tmp.Target);
                    tmp.Dis=Util.XY2(tmp.Spell,tmp.Target);
                } 
                tmp.Obj=0;
                tmp.Kill=false;
                tmp.Use=1; 
                tmp.State=$type$;
                //测试 
                BJDebugMsg(GetAbilityName(tmp.Id)+"生成-阶段:"+I2S(tmp.State));
                if(u.spell!=0){
                    tmp.Use=2;
                    SpellEventInterface(u.spell).evaluate(tmp);
                } 
                Spell.Trigger(Spell.on$ev$,tmp.Id,tmp);
            }

        } 
        //! endtextmacro
        //! runtextmacro SpellFunc("StartSpell","Start","2")
        //! runtextmacro SpellFunc("StopSpell","Stop","3")
        //! runtextmacro SpellFunc("ReadySpell","Ready","1")

        static method onInit(){
            Events.On(Events.onUnitSpell,Spell.onUnitSpell);
            Events.On(Events.onUnitStartSpell,Spell.onUnitStartSpell);
            Events.On(Events.onUnitStopSpell,Spell.onUnitStopSpell);
            Events.On(Events.onUnitReadySpell,Spell.onUnitReadySpell);
        }
    }
}