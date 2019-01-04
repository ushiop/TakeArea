library MR requires Groups{
    //英雄‘鸣人’的技能
    //R级
    struct MR{
  
        static method Spawn(Units u,Units m){
            timer t;
            Data data;
            if(u.IsAbility('A01X')==true){
                t=NewTimer();
                data=Data.create('A01X');
                data.c[0]=u;
                data.i[0]=0; 
                data.r[0]=u.X();
                data.r[1]=u.Y();
                data.r[2]=0.0;
                data.r[3]=0;
                SetTimerData(t,data);
                TimerStart(t,0.01,true,function(){
                    Data data=Data(GetTimerData(GetExpiredTimer()));
                    Units u=Units(data.c[0]);
                    Units tmp;
                    real speed;
                    if(u.Alive()==false){
                        BJDebugMsg("死了");
                        data.Destroy();
                        ReleaseTimer(GetExpiredTimer());
                    }else{
                        speed=Util.XY2EX(u.X(),u.Y(),data.r[0],data.r[1]);
                        if(speed>5){
                            data.r[2]+=0.01;
                        }else{ 
                            data.r[2]=0;
                            if(data.i[0]==1){
                                data.i[0]=0; 
                                Dash.Start(u.unit,u.F(),300,Dash.SUB,10,true,false).onMove=function(Dash dash){
                                    dash.Angle=GetUnitFacing(dash.Unit);
                                };
                            }
                        }
                        if(data.r[2]>=1.0){
                            data.i[0]=1;
                        } 
                        data.r[0]=u.X();
                        data.r[1]=u.Y();
                        if(data.r[3]==1.0){
                            data.r[3]=0;
                            if((u.HP()/u.MaxHP())<=0.3){
                                Buffs.Add(u.unit,'A01Y','B00B',30,false);
                            } 
                            if(u.IsAbility('B00B')==true){
                                GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),150,function GroupIsAliveNotAloc);     
                                while(FirstOfGroup(tmp_group)!=null){
                                    tmp=Units.Get(FirstOfGroup(tmp_group));
                                    GroupRemoveUnit(tmp_group,tmp.unit);
                                    if(IsUnitEnemy(tmp.unit,u.player.player)==true){  
                                        u.Damage(tmp.unit,Damage.Chaos,'A01X',u.Str(true)*1.0);
                                        DestroyEffect( AddSpecialEffectTarget("fire4.mdl",tmp.unit, "chest") );
                                    }
                                }
                                GroupClear(tmp_group); 
                            }
  
                        }else{
                            data.r[3]+=0.01;
                        }
                    }
                });
                t=null;
            }
        }

        //友军死亡触发九尾
        static method Death(Units u,Units m){ 
            Units mj;
            GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),1200,function GroupIsAliveNotAloc);     
            while(FirstOfGroup(tmp_group)!=null){
                mj=Units.Get(FirstOfGroup(tmp_group));
                GroupRemoveUnit(tmp_group,mj.unit);
                if(IsUnitEnemy(mj.unit,u.player.player)==false){ 
                    if(mj.IsAbility('A01X')==true){
                        Buffs.Add(mj.unit,'A01Y','B00B',30,false);
                    }
                }
            }
            GroupClear(tmp_group);   
        }

        static method Damage(DamageArgs e){
            Units u=e.TriggerUnit;
            if(u.IsAbility('A01X')==true){ 
                if(e.DamageType==Damage.Magic){
                    //九尾之力 魔法减伤15%
                    e.Damage=e.Damage-(e.Damage*0.15);
                }
                if(u.IsAbility('B00B')==true){
                    //情绪激动 所有伤害减少15% 
                    e.Damage=e.Damage-(e.Damage*0.15); 
                }
            } 
        }

        static method onInit(){ 
            Units.On(Units.onHeroDeath,MR.Death);
            Units.On(Units.onHeroSpawn,MR.Spawn);
            Damage.On(Damage.onUnitDamage,MR.Damage);
        }
    }
}