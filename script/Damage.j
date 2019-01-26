library Damage requires Table,Events{
    //伤害系统管理类


    type DamageEventInterface extends function(DamageArgs);


    public struct DamageArgs{
        //自定义伤害事件中传递的参数 
        real Damage;//伤害值
        Units TriggerUnit;//触发单位
        Units DamageUnit;//伤害来源
        integer Spell;//如果是技能伤害，则为技能ID，为0的情况可能是普攻或者被动;
        integer DamageType;//伤害类型，由Damage类定义 
        boolean isRange;//是否是远程 

        static method create()->DamageArgs{
            return DamageArgs.allocate();
        }

        //删除实例
        method Destroy(){ 
            this.deallocate();
        }
    }


    public struct Damage{

        private static HandleTable ht;

        static constant integer Magic=0;//法术伤害
        static constant integer Chaos=1;//混乱伤害
        static constant integer Physics=2;//物理伤害
        static constant integer Attack=3;//普攻伤害

        //自定义事件
        public { 

            static constant string onItemDamage="Damage.onItemDamage";//任意单位受到伤害（触发该事件时计算各种物品的加减伤)
            static constant string onUnitDamage="Damage.onUnitDamage";//任意单位受到伤害(触发该事件时计算单位各种技能的加减伤)

            //触发指定事件名
            static method Trigger(string eName,DamageArgs e){
                integer i;
                DamageEventInterface callback;
                for(1<=i<Table[eName][0]){  
                    callback=DamageEventInterface(Table[eName][i]);
                    callback.evaluate(e);
                }        
            }

            //注册自定义单位事件
            static method On(string eName,DamageEventInterface callback){  
                if(Table[eName][0]==0){ 
                    Table[eName][0]=1;
                }
                Table[eName][Table[eName][0]]=callback;
                Table[eName][0]=Table[eName][0]+1;
            }
        }
 
            //收到任意伤害时读取相关信息并封装成DamageArgs实例触发自定义事件
        public  static method onDamage(EventArgs e){
            DamageArgs dmg;
            if(e.Damage>0){
                dmg=DamageArgs.create(); 
                dmg.TriggerUnit=Units.Get(e.TriggerUnit);
                dmg.DamageUnit=Units.Get(e.DamageUnit);
                dmg.Damage=e.Damage; 
                if(YDWEIsEventDamageType(DAMAGE_TYPE_MAGIC)&&YDWEIsEventAttackType(ATTACK_TYPE_NORMAL)){
                    dmg.DamageType=Damage.Magic;
                }else if(YDWEIsEventDamageType(DAMAGE_TYPE_UNIVERSAL)&&YDWEIsEventAttackType( ATTACK_TYPE_CHAOS)){
                    dmg.DamageType=Damage.Chaos;
                }else if(YDWEIsEventDamageType(DAMAGE_TYPE_NORMAL)&&YDWEIsEventAttackType( ATTACK_TYPE_HERO)){
                    if(e.AttackDamage==true){ 
                        dmg.DamageType=Damage.Attack;
                    }else{ 
                        dmg.DamageType=Damage.Physics;
                    }
                }else{
                    dmg.DamageType=Damage.Attack;
                }
                if(dmg.DamageType!=Damage.Attack){ 
                    dmg.Spell=ht[Units.Get(e.DamageUnit).player.player];
                }else{
                    dmg.Spell=0;
                }
                dmg.isRange=e.RangeDamage; 
                Damage.Trigger(Damage.onItemDamage,dmg);//进行物品效果结算
                Damage.Trigger(Damage.onUnitDamage,dmg); //进行单位技能效果结算
                //测试 BJDebugMsg("伤害:"+R2S(e.Damage));
                if(dmg.Damage!=e.Damage){//如果结算伤害不等于原伤害，则用JAPI进行设置 
                    YDWESetEventDamage(dmg.Damage);//设置本次伤害为进行结算后的伤害  
                    //测试 BJDebugMsg("最终伤害:"+R2S(dmg.Damage));
                }
                dmg.Destroy(); 
            } 
        }

        //使U对M造成dmg点dtype类型伤害，伤害来源于spellid技能,被动填0
        static method To(unit u,unit m,integer dtype,integer spellid,real dmg){
            Units t=Units.Get(u);
            ht[t.player.player]=spellid;
            if(dtype==Damage.Magic){
                UnitDamageTarget(u,m,dmg,false,false,ATTACK_TYPE_NORMAL,DAMAGE_TYPE_MAGIC,WEAPON_TYPE_WHOKNOWS);
            }else if(dtype==Damage.Chaos){
                UnitDamageTarget(u,m,dmg,false,false,ATTACK_TYPE_CHAOS,DAMAGE_TYPE_UNIVERSAL,WEAPON_TYPE_WHOKNOWS);
            }else if(dtype==Damage.Physics){
                UnitDamageTarget(u,m,dmg,false,false,ATTACK_TYPE_HERO,DAMAGE_TYPE_NORMAL,WEAPON_TYPE_WHOKNOWS);
            }else{ 
                UnitDamageTarget(u,m,dmg,true,false,ATTACK_TYPE_HERO,DAMAGE_TYPE_NORMAL,WEAPON_TYPE_WHOKNOWS);
            }
        }

        //玩家离开游戏时清空记录的施法信息
        public  static method onDisconnect(EventArgs p){
            if(ht.exists(p.TriggerPlayer)==true){
                ht.flush(p.TriggerPlayer);
            }
        }
 
        static method onInit(){
            ht=HandleTable.create(); 
            Events.On(Events.onPlayerDisconnect,Damage.onDisconnect);
            Events.On(Events.onUnitDamage,Damage.onDamage); 

        }


    } 

}