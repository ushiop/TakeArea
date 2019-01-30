library Damage requires Table,Events{
    //伤害系统管理类


    type DamageEventInterface extends function(DamageArgs);


    public struct DamageArgs{
        //自定义伤害事件中传递的参数 
        real Damage;//伤害值
        real OriginDamage;//原始伤害（未被增减伤)
        Units TriggerUnit;//触发单位
        Units DamageUnit;//伤害来源
        integer Spell;//如果是技能伤害，则为技能ID，为0的情况可能是普攻或者被动;
        real DamageType;//伤害类型，由Damage类定义 
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

        static constant real Magic=0;//法术伤害
        static constant real Chaos=1;//混乱伤害
        static constant real Physics=2;//物理伤害
        static constant real Attack=3;//普攻伤害

        //自定义事件
        public { 
            static constant string onItemDamage_AddDamage="Damage.onItemDamage_AddDamage";//任意单位受到伤害时，进行物品增伤结算
            static constant string onItemDamage_SubDamage="Damage.onItemDamage_SubDamage";//任意单位受到伤害时，进行物品减伤结算
            static constant string onItemDamage_EndDamage="Damage.onItemDamage_EndDamage";//任意单位受到伤害,已经计算完物品的加减伤,触发物品其他效果
            static constant string onUnitDamage_AddDamage="Damage.onUnitDamage_AddDamage";//任意单位受到伤害时,进行单位之间的增伤结算
            static constant string onUnitDamage_SubDamage="Damage.onUnitDamage_SubDamage";//任意单位受到伤害时,进行单位之间的减伤结算
            static constant string onUnitDamage_EndDamage="Damage.onUnitDamage_EndDamage";//任意单位受到伤害,已经计算完单位之间的加减伤,触发其他伤害类效果
            static constant string onDamageEnd="Damage.onDamageEnd";//计算完所有加减伤之后的最终伤害,如无意外,就是单位受到的伤害

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
                dmg.OriginDamage=e.Damage;
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
                BJDebugMsg("是否远程:"+Util.B2S(dmg.isRange)+"/是否攻击:"+Util.B2S(e.AttackDamage)+"/伤害类型:"+R2S(dmg.DamageType)+"/技能:"+GetAbilityName(dmg.Spell)+"/伤害者:"+dmg.DamageUnit.name+"/被伤害:"+dmg.TriggerUnit.name);
                Damage.Trigger(Damage.onItemDamage_AddDamage,dmg);//物品增伤计算
                Damage.Trigger(Damage.onUnitDamage_AddDamage,dmg);//单位之间的增伤计算
                Damage.Trigger(Damage.onItemDamage_SubDamage,dmg);//物品减伤计算
                if(dmg.Damage<0) dmg.Damage=0;
                Damage.Trigger(Damage.onUnitDamage_SubDamage,dmg);//单位之间的减伤计算
                if(dmg.Damage<0) dmg.Damage=0;
                Damage.Trigger(Damage.onItemDamage_EndDamage,dmg);//进行物品效果结算,不涉及物品导致的伤害变化了
                Damage.Trigger(Damage.onUnitDamage_EndDamage,dmg); //单位技能效果结算,不涉及伤害变化了
                //测试 BJDebugMsg("伤害:"+R2S(e.Damage));
                if(dmg.Damage<0) dmg.Damage=0;//如果减伤到负数,则设为0
                if(dmg.Damage!=e.Damage){//如果结算伤害不等于原伤害，则用JAPI进行设置 
                    YDWESetEventDamage(dmg.Damage);//设置本次伤害为进行结算后的伤害  
                    //测试 BJDebugMsg("最终伤害:"+R2S(dmg.Damage));
                }
                Damage.Trigger(Damage.onDamageEnd,dmg);//最终伤害,计算完加减伤了,如果大于生命就肯定会死
                dmg.Destroy(); 
            } 
        }

        //使U对M造成dmg点dtype类型伤害，伤害来源于spellid技能,被动填0
        static method To(unit u,unit m,real dtype,integer spellid,real dmg){
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