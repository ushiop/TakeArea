library GAD requires Groups{
    //英雄‘骨傲地’的技能
    //SR英雄
    struct GAD{

        //死灵法师出生，绑定数据
        static method Spawn(Units u,Units m){
            timer t;
            Data data;
            if(u.IsAbility('A03A')==true){
                t=NewTimer();
                data=Data.create('A03A');
                data.c[0]=u;
                SetTimerData(t,data);
                TimerStart(t,0.1,true,function(){
                    integer x;
                    Data data=Data(GetTimerData(GetExpiredTimer()));
                    Units u=Units(data.c[0]);
                    Buffs b;
                    if(u.Alive()==false){
                        BJDebugMsg("结束了");
                        for(0<=x<4){
                            if(data.u[x]!=null){
                                Units.Remove(data.u[x]);
                                data.u[x]=null;
                            }
                        }
                        ReleaseTimer(GetExpiredTimer());
                        data.Destroy();
                    }else{
                        if(u.IsAbility('B00Q')==true){
                            b=Buffs.Find(u.unit,'B00Q');
                            if(b.Level>=5){
                                if(data.u[0]==null){
                                    data.u[0]=Units.MJ(u.player.player,'e00F','A03A',5,0,0,0,86400,1,1, "stand",".mdx").unit; 
                                }
                            }else{ 
                                if(data.u[0]!=null){
                                    Units.Remove(data.u[0]); 
                                    data.u[0]=null;
                                }
                            }
                        }else{
                            for(0<=x<4){
                                if(data.u[x]!=null){
                                    Units.Remove(data.u[x]);
                                    data.u[x]=null;
                                }
                            }   
                        }
                    }
                });
                t=null;
            }
        }

        //任意单位死亡时增加900码内死灵法师的尸体层数
        static method Death(Units u,Units m){
            Units mj;
            integer s=0;
            GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),900,function GroupIsAliveNotAloc);     
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

        //4
        static method W(Spell e){
            Units u=Units.Get(e.Spell); 
            Buffs b;
            Units mj;
            Dash dash;
            Data data;
            
            u.AnimeSpeed(1);
            //降低尸体层数
            if(u.IsAbility('B00Q')==true){
                b=Buffs.Find(u.unit,'B00Q');
                if(b.Level>=5){
                    b.Level-=5;
                }
            }
            mj=Units.MJ(u.player.player,'e008','A03C',0,u.X()+125*CosBJ(e.Angle+180),u.Y()+125*SinBJ(e.Angle+180),e.Angle,10,1.1,1, "attack","units\\undead\\Abomination\\Abomination.mdl"); 
            mj.AnimeId(2);
            //mj.DelayAnimeSpeed(0,0.2);
            Effect.ToUnit("Abilities\\Spells\\Undead\\RaiseSkeletonWarrior\\RaiseSkeleton.mdl",mj.unit,"chest").Destroy();
            data=Data.create('A03C');
            data.c[0]=u;
            data.c[1]=mj;
            mj=Units.MJ(u.player.player,'e008','A03C',0,mj.X(),mj.Y(),e.Angle,10,2.5,1, "attack","Abilities\\Weapons\\WardenMissile\\WardenMissile.mdl"); 
            mj.SetH(75);
            mj.Position(mj.X(),mj.Y(),true);
            mj.AddAbility(Units.MJType_TSW);
            data.c[2]=mj; 
            data.i[0]=0;
            dash=Dash.Start(mj.unit,e.Angle,2000,Dash.SUB,80,true,false);           
            mj=Units.MJ(u.player.player,'e008','A03C',0,mj.X(),mj.Y(),e.Angle,10,2.5,1, "attack","Abilities\\Weapons\\WardenMissile\\WardenMissile.mdl"); 
            mj.SetH(75);
            mj.Alpha(0);
            data.c[3]=mj;
            dash.Obj=data; 
            dash.onMove=function(Dash dash){
                Data data=Data(dash.Obj);
                Units mj=Units(data.c[3]);
                Effect e;
                unit k;
                if(data.i[0]==0){
                    data.i[0]=2;
                    mj.Position(Units(data.c[1]).X()+100*CosBJ(dash.Angle),Units(data.c[1]).Y()+100*SinBJ(dash.Angle),false);
                }else{
                    data.i[0]-=1;
                    mj.Position(dash.X,dash.Y,false);
                }
                if(dash.Speed<4){
                    dash.Stop();
                }else{
                    k=GroupFind(dash.Unit,dash.X,dash.Y,80,true,false);
                    if(k!=null){
                        e=Effect.ToUnit("Abilities\\Spells\\Undead\\DeathCoil\\DeathCoilSpecialArt.mdl",k,"origin");
                        e.AnimeSpeed(2);
                        e.Destroy();
                        data.u[0]=k;
                        k=null;
                        dash.Stop();
                    }
                }
            };
            dash.onEnd=function(Dash dash){
                Data data=Data(dash.Obj);
                Dash dash1;
                dash1=Dash.Start(dash.Unit,0,1000,Dash.NORMAL,70,true,false);
                dash1.Obj=data;
                dash1.onMove=function(Dash dash){
                    Data data=Data(dash.Obj);
                    Units tf=Units(data.c[1]);
                    Units gz=Units(data.c[2]);
                    Units t;
                    if(data.u[0]!=null){
                        t=Units.Get(data.u[0]);
                        if(t.Alive()==true){
                            t.Position(dash.X,dash.Y,true);
                        }else{
                            data.u[0]=null;
                        }
                    }
                    if(Util.XY2(tf.unit,gz.unit)<150){
                        dash.Stop();
                    }else{
                        dash.MaxDis+=100;
                        dash.Angle=Util.XY(gz.unit,tf.unit);
                    }
                    
                };
                dash1.onEnd=function(Dash dash){
                    Data data=Data(dash.Obj);
                    Units u=Units(data.c[0]);
                    Units tf=Units(data.c[1]);
                    Units gz=Units(data.c[2]);
                    Units gz1=Units(data.c[3]);
                    gz1.Life(0.6);
                    gz1.Anime("death");
                    gz.Life(0.6);
                    gz.Anime("death");
                    tf.AnimeSpeed(2.25);
                    tf.AnimeId(4);
                    tf.Life(0.7);
                    tf.DelayAlpha(255,0,0.65);
                    if(data.u[0]!=null){
                        Buffs.Skill(data.u[0],'A00F',1);
                        u.Damage(data.u[0],Damage.Physics,'A03C',u.Int(true)*10);
                    }
                    data.u[0]=null;
                    data.Destroy();
                };
            };
            e.Destroy();
        }

        static method HERO_START(Spell e){
            Units u=Units.Get(e.Spell);
            u.FlushAnimeId(4);
            u.AnimeSpeed(1.3);
            e.Destroy();
        }

        static method HERO_STOP(Spell e){
            Units u=Units.Get(e.Spell);
            u.AnimeSpeed(1);
            e.Destroy();
        }


        static method onInit(){
            Spell.On(Spell.onSpell,'A03C',GAD.W); 
            Spell.On(Spell.onReady,'A03C',GAD.HERO_START);
            Spell.On(Spell.onStop,'A03C',GAD.HERO_STOP);   
            Damage.On(Damage.onUnitDamage_AddDamage,GAD.Damage_Add);
            Damage.On(Damage.onUnitDamage_SubDamage,GAD.Damage_Sub);
            Units.On(Units.onHeroDeath,GAD.Death);
            Units.On(Units.onUnitDeath,GAD.Death);
            Units.On(Units.onHeroSpawn,GAD.Spawn);
        }
    }
}