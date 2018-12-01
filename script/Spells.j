library Spells requires Units{
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

        //删除实例
        method Destroy(){
            this.Use=this.Use-1;
            if(this.Use==0){
                if(this.Kill==true){
                    Units.Kill(this.Spell);
                }
                this.Spell=null;
                this.deallocate();
            }
        }

                //自定义事件
        public {

            static constant string onSpell="Spell.UnitSpell";//任意单位发动技能效果

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
 

        static method onUnitSpell(EventArgs e){
            Units u=Units.Get(e.TriggerUnit);
            Spell tmp=Spell.allocate();
            tmp.Spell=u.unit;
            tmp.Target=e.SpellTargetUnit;
            tmp.X=e.SpellTargetX;
            tmp.Y=e.SpellTargetY;
            tmp.Id=e.SpellId;
            if(tmp.Target==null){
                tmp.Angle=Utils.XYEX(GetUnitX(tmp.Spell),GetUnitY(tmp.Spell),tmp.X,tmp.Y);
                tmp.Dis=Utils.XY2EX(GetUnitX(tmp.Spell),GetUnitY(tmp.Spell),tmp.X,tmp.Y);
            }else{
                tmp.Angle=Utils.XY(tmp.Spell,tmp.Target);
                tmp.Dis=Utils.XY2(tmp.Spell,tmp.Target);
            }
            
            tmp.Kill=false;
            tmp.Use=1;
            if(u.spell!=0){
                tmp.Use=2;
                SpellEventInterface(u.spell).evaluate(tmp);
            } 
            Spell.Trigger(Spell.onSpell,tmp.Id,tmp);
        }

        static method onInit(){
            Events.On(Events.onUnitSpell,Spell.onUnitSpell);
        }
    }
}