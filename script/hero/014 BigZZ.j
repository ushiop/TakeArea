library BigZZ requires Groups{
    //英雄‘大佐助’的技能
    //SR
    struct BigZZ{

        static method W(Spell e){
            Units u=Units.Get(e.Spell);
            Units mj;
            Dash dash;
            real x=u.X()+50*CosBJ(e.Angle),y=u.Y()+50*SinBJ(e.Angle),f=e.Angle;
            u.Pause(true); 
            u.DelayReleaseAnimePause(0.2);
            u.AnimeSpeed(2.5);
            u.AnimeId(4);
            mj=Units.MJ(u.player.player,'e009','A050',0,x,y,f,1.5,1.5,1,"stand","by_wood_effect_yuzhiboyou_fire_babangouyu_2_di_.mdl");
            mj.SetH(100); 
            //Units.MJ(u.player.player,'e008','A050',0,x+100*CosBJ(f),y+100*SinBJ(f),f,1.5,1.5,1,"stand","by_wood_effect_yuzhiboyou_fire_fengxianhuo_2.mdl").SetH(100);
            dash=Dash.Start(mj.unit,e.Angle,700,Dash.SUB,50,true,false); 
            e.Destroy();
        }

        static method Death(Units u,Units m){
            if(u.IsAbility('A04U')==true){
                Units.Kill(Units(u.Data()).unit);
            }
        }

        static method Spawn(Units u,Units m){
            if(u.IsAbility('A04U')==true){
                u.SetData(Units.MJ(u.player.player,'e00L','A04U',0,0,0,0,86400,1,1,"two",".mdl"));    
            }
        }

        static method Q_Order(EventArgs e){
            Units u=Units.Get(e.TriggerUnit);
            real f;
            if(u.IsAbility('B019')==true&&e.OrderId==851971){
                if(e.OrderTargetUnit==null){ 
                    f=Util.XYEX(u.X(),u.Y(),e.OrderTargetX,e.OrderTargetY);
                }else{
                    f=Util.XY(u.unit,e.OrderTargetUnit);
                }
                u.Position(u.X(),u.Y(),true);
                u.SetF(f,false);
            }
        }

        static method Q(Spell e){
            Units u=Units.Get(e.Spell); 
            Data data=Data.create('A04U'); 
            Units.Kill(Units(u.Data()).unit);
            u.Pause(true); 
            u.AnimeSpeed(1);
            u.AnimeId(8);
            data.c[0]=u;
            data.c[1]=e;
            Timers.Start(0.4,data,function(Timers t){
                Data data=Data(t.Data());
                Units u=Units(data.c[0]);
                Units mj;
                Dash dash;
                if(u.Alive()==true){ 
                    Buffs.Add(u.unit,'A04W','B019',10,false);
                    mj=Units.MJ(u.player.player,'e008','A04U',0,u.X(),u.Y(),u.F(),11,u.modelsize,1,"stand",u.model);
                    mj.AddAbility(TeamTips_Ability_Id[u.player.teamid]); 
                    data.c[2]=mj; 
                    u.Alpha(0);
                    u.AddAbility('A04V');
                    u.AddAbility('A04Z');
                    mj.AnimeId(6);
                    mj.AnimeSpeed(2);
                    dash=Dash.Start(u.unit,u.F(),1000,Dash.NORMAL,10,true,false);
                    dash.Obj=data;
                    dash.onMove=function(Dash dash){ 
                        Data data=Data(dash.Obj);
                        Units u=Units.Get(dash.Unit);
                        Units ts=Units(data.c[2]);
                        unit k; 
                        Dash dash1;
                        if(u.IsAbility('B019')==true){
                            dash.Angle=u.F();
                            dash.MaxDis+=100;
                            k=GroupFind(u.unit,dash.X+100*CosBJ(dash.Angle),dash.Y+100*SinBJ(dash.Angle),100,true,false);
                            if(k!=null){
                                data.i[0]=1;
                                dash.Stop(); 
                                data.r[0]=0;
                                data.g[0]=CreateGroup();
                                u.Pause(true);
                                u.AnimeId(7);
                                u.AddAbility('A04X');
                                u.SetF(Util.XY(u.unit,k),true);
                                dash1=Dash.Start(u.unit,u.F(),450,Dash.SUB,30,true,false);
                                dash1.Obj=data;
                                dash1.onMove=function(Dash dash){
                                    Data data=Data(dash.Obj);
                                    Units u=Units(data.c[0]);
                                    Units mj;
                                    if(dash.Speed<4){
                                        dash.Stop();
                                    }else{ 
                                        if(data.r[0]<=0){
                                            data.r[0]=0.04;
                                            Units.MJ(u.player.player,'e008','A04U',0,dash.X,dash.Y,GetRandomReal(0,360),1,1,1,"stand","az_storm_v2_z_5.mdl");
                                            //Units.MJ(u.player.player,'e008','A04U',0,dash.X,dash.Y,GetRandomReal(0,360),0.5,2,1,"death","by_wood_effect_yubanmeiqin_lightning_dianjishanghai.mdl").SetH(75);
                                            GroupEnumUnitsInRange(tmp_group,dash.X,dash.Y,125,function GroupIsAliveNotAloc);     
                                            while(FirstOfGroup(tmp_group)!=null){
                                                mj=Units.Get(FirstOfGroup(tmp_group));
                                                GroupRemoveUnit(tmp_group,mj.unit);
                                                if(IsUnitEnemy(mj.unit,u.player.player)==true&&IsUnitInGroup(mj.unit,data.g[0])==false){    
                                                    GroupAddUnit(data.g[0],mj.unit);
                                                    u.Damage(mj.unit,Damage.Magic,'A04U',u.Agi(true)*5); 
                                                    Units.MJ(u.player.player,'e008','A04U',0,mj.X(),mj.Y(),GetRandomReal(0,360),0.5,2,1,"death","by_wood_effect_yubanmeiqin_lightning_dianjishanghai.mdl").SetH(75);
                                                    //Effect.ToUnit("by_wood_effect_yubanmeiqin_lightning_dianjishanghai.mdl",mj.unit,"chest").Destroy();
                                                    Buffs.Skill(mj.unit,'A04Y',1);
                                                }
                                            }
                                            GroupClear(tmp_group);
                                        }else{
                                            data.r[0]-=0.01;
                                        }
                                    }
                                };
                                dash1.onEnd=function(Dash dash){
                                    Data data=Data(dash.Obj);
                                    Units u=Units(data.c[0]);
                                    u.RemoveAbility('A04X');
                                    u.DelayReleaseAnimePause(0.2); 
                                    Dash.Start(u.unit,dash.Angle,200,Dash.SUB,dash.Speed,true,false);
                                    DestroyGroup(data.g[0]);
                                    data.g[0]=null;
                                    Spell(data.c[1]).Destroy();
                                    data.Destroy();
                                };
                                k=null;
                            }
                        }else{
                            dash.Stop();
                        }
                        ts.Position(dash.X,dash.Y,false);
                        ts.SetF(dash.Angle,true);
                    };
                    dash.onEnd=function(Dash dash){
                        Data data=Data(dash.Obj);
                        Units u=Units(data.c[0]);
                        Units mj=Units(data.c[2]); 
                        if(u.IsAbility('B019')==true){
                            Buffs.Find(u.unit,'B019').Stop();
                        }
                        u.RemoveAbility('A04V'); 
                        u.RemoveAbility('A04Z');
                        u.Alpha(255);
                        u.SetData(Units.MJ(u.player.player,'e00L','A04U',0,0,0,0,86400,1,1,"two",".mdl")); 
                        Dash.Start(u.unit,u.F(),200,Dash.SUB,dash.Speed,true,false);
                        mj.Life(0.3);
                        mj.Alpha(0);
                        if(data.i[0]==0){ 
                            Spell(data.c[1]).Destroy();
                            data.Destroy();
                        }
                    };
                }else{
                    Spell(data.c[1]).Destroy();
                    data.Destroy();
                }  
                u.Pause(false);
                t.Destroy();
            });
        }


        //5 挥手雷电 6 雷电奔跑 7 雷电穿刺 8 搓雷电
        //3 喷火 4 喷火中
        static method HERO_START(Spell e){
            Units u=Units.Get(e.Spell);
            if(u.IsAbility('A04U')==true){
                u.FlushAnimeId(5); 
                e.Destroy();
            }
            if(u.IsAbility('A050')==true){
                u.FlushAnimeId(3);
                e.Destroy();
            }
        }
 

        static method onInit(){ 
            Spell.On(Spell.onSpell,'A050',BigZZ.W); 
            Spell.On(Spell.onSpell,'A04U',BigZZ.Q); 
            Spell.On(Spell.onReady,'A04U',BigZZ.HERO_START);  
            Spell.On(Spell.onReady,'A050',BigZZ.HERO_START);  
            Units.On(Units.onHeroSpawn,BigZZ.Spawn);
            Units.On(Units.onHeroDeath,BigZZ.Death); 
            Events.On(Events.onUnitOrderToUnit,BigZZ.Q_Order);
            Events.On(Events.onUnitOrderToLocation,BigZZ.Q_Order); 
        }
    }
}