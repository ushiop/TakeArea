library GAD requires Groups{
    //英雄‘骨傲地’的技能
    //SR英雄
    struct GAD{

        //任意单位死亡时增加900码内死灵法师的尸体层数
        static method Death(Units u,Units m){
            Units mj;
            integer s=0;
            GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),700,function GroupIsAliveNotAloc);     
            while(FirstOfGroup(tmp_group)!=null){
                mj=Units.Get(FirstOfGroup(tmp_group));
                GroupRemoveUnit(tmp_group,mj.unit);
                if(mj.IsAbility('A03A')==true){   
                    if(s==0){
                        s=1;
                        Effect.To("Abilities\\Spells\\Undead\\RaiseSkeletonWarrior\\RaiseSkeleton.mdl",u.X(),u.Y()).Destroy(); 
                    }
                    Buffs.Add(mj.unit,'A03B','B00Q',86400,false).onFlush=function(Buffs b){
                        b.Level+=1;
                    }; 
                    Effect.ToUnit("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdl",mj.unit,"chest");
                }
            }
            GroupClear(tmp_group);   
        }

        //Q被动增伤
        static method Damage_Add(DamageArgs e){
            if(e.TriggerUnit.IsAbility('A03A')==true){
                if(e.DamageType==Damage.Attack||e.DamageType==Damage.Physics){
                    //物理伤害则翻倍
                    e.Damage+=e.Damage;
                }
            }
        }

        //Q被动减伤
        static method Damage_Sub(DamageArgs e){
            Buffs b;
            if(e.TriggerUnit.IsAbility('B00Q')==true){
                b=Buffs.Find(e.TriggerUnit.unit,'B00Q');
                if(b.Level>=100){
                    e.Damage=0;
                }else{ 
                    e.Damage-=e.Damage*(b.Level*0.01);
                }
            }
        }


        static method onInit(){
            Damage.On(Damage.onUnitDamage_AddDamage,GAD.Damage_Add);
            Damage.On(Damage.onUnitDamage_SubDamage,GAD.Damage_Sub);
            Units.On(Units.onHeroDeath,GAD.Death);
            Units.On(Units.onUnitDeath,GAD.Death);
        }
    }
}