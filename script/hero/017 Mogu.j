library Mogu requires Groups{
    //英雄‘妹红’的技能
    //SR
    struct Mogu{

        static method Q(Units u,Units m){
            if(u.aid=='A06E'&&u.aidindex==0){ 
                Units.MJ(u.player.player,'e008','A06E',1,u.X(),u.Y(),GetRandomReal(0,360),2.5,0.8,2, "stand","chushou_by_wood_effect_flame_explosion_2.mdl");
                Util.Range(u.X(),u.Y(),150);
                GroupDamage(u, u.X(),u.Y(),150,u.player.hero.Str(true)*1.5,Damage.Magic,'A06E',false); 
            }
        }

        static method Spawn(Units u,Units m){
            Data data;
            if(u.IsAbility('A06E')==true){
                data=Data.create('A06E');
                data.c[0]=u;
                data.c[1]=Effect.ToUnit("fire-buff-qiquan.mdl",u.unit,"origin");
                data.r[0]=0;
                BJDebugMsg("有了");
                Timers.Start(0.05,data,function(Timers t){
                    Data data=Data(t.Data());
                    Units u=Units(data.c[0]);
                    Units mj;
                    if(u.IsTimeStop()==false){
                        if(data.r[0]==0){
                            data.r[0]=1;
                            if(u.Alive()==true){
                                //伤害和留下火
                                Effect.ToUnit("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",u.unit,"right hand").Destroy();
                                Effect.ToUnit("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",u.unit,"left hand").Destroy();
                                Effect.ToUnit("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",u.unit,"chest").Destroy();
                                mj=Units.MJ(u.player.player,'e008','A06E',0,u.X(),u.Y(),0,GetRandomReal(0.5,1.5),1.5,1, "stand","Environment\\LargeBuildingFire\\LargeBuildingFire1.mdl");
                                mj.Position(mj.X(),mj.Y(),true);
                                mj.AddAbility(Units.MJType_FZW);
                                GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),125,function GroupIsAliveNotAloc);     
                                while(FirstOfGroup(tmp_group)!=null){
                                    mj=Units.Get(FirstOfGroup(tmp_group));
                                    GroupRemoveUnit(tmp_group,mj.unit);
                                    if(IsUnitEnemy(mj.unit,u.player.player)==true){
                                        u.Damage(mj.unit,Damage.Magic,'A06E',u.Str(true));  
                                        Buffs.Add(mj.unit,'A06F','B021',2,false);
                                    }
                                }
                                GroupClear(tmp_group); 
                            }else{
                                BJDebugMsg("没了");
                                Effect(data.c[1]).Destroy();
                                data.Destroy();
                                t.Destroy();
                            }
                        }else{
                            data.r[0]-=0.05;
                        }
                    }
                });
            }
        }

        static method onInit(){
            Units.On(Units.onHeroSpawn,Mogu.Spawn); 
            Units.On(Units.onAlocDeath,Mogu.Q);
        }
    }
}