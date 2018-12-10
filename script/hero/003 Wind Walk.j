library WindWalk requires Groups{
    //英雄‘风行者’的技能
    //R级英雄
    struct WindWalk{

        static method E1(){
            Data data=Data(GetTimerData(GetExpiredTimer()));
            Units u=Units(data.c[0]);
            Spell e=Spell(data.c[1]);
            Dash dash; 
            if(u.Alive()==true&&data.i[0]>0){
                if(u.player.press.E==true){
                    if(data.r[1]!=0){
                        data.r[1]-=1;
                    }else{
                        data.r[1]=2;
                        data.r[0]=data.r[0]-0.01;
                        if(data.r[0]<0.02){
                            data.r[0]=0.02;
                        }
                        TimerStart(GetExpiredTimer(),data.r[0],true,function WindWalk.E1);
                    }
                } 
                u.Position(data.r[2],data.r[3],false);
                dash=Dash.Start(u.unit,GetRandomReal(0,360),200,Dash.SUB,60,true,false);
                dash.onEnd=function(Dash dash){
                    Units u=Units.Get(dash.Unit);
                    Units mj;
                    mj=Units.MJ(u.player.player,'e008','A00L',0,dash.X,dash.Y,dash.Angle,0.7,1.3,1.5, "attack","units\\creeps\\SylvanusWindrunner\\SylvanusWindrunner.mdl"); 
                    mj.Alpha(50); 
                    DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Orc\\MirrorImage\\MirrorImageCaster.mdl",mj.unit, "origin") );
                    mj=Units.MJ(u.player.player,'e008','A00L',0,u.X()+50*CosBJ(dash.Angle),u.Y()+50*SinBJ(dash.Angle),dash.Angle,3,1.5,1, "stand","Abilities\\Weapons\\MoonPriestessMissile\\MoonPriestessMissile.mdl"); 
                    mj.SetH(70);
                    mj.Position(mj.X(),mj.Y(),true);
                    dash=Dash.Start(mj.unit,mj.F(),900,Dash.ADD,60,true,false);
                    dash.onMove=function(Dash dash){
                        Units u=Units.Get(dash.Unit);
                        unit k=GroupFind(u.unit,u.X(),u.Y(),60,false);
                        if(k!=null){
                            DestroyEffect( AddSpecialEffectTarget("Abilities\\Weapons\\MakuraMissile\\MakuraMissile.mdl",k, "chest"));
                            Dash.Start(k,dash.Angle,100,Dash.SUB,20,true,true);
                            dash.Stop(); 
                            u.Damage(k,Damage.Physics,'A00L',u.player.hero.Agi()*15.0);
                        }     
                    };
                    dash.onEnd=function(Dash dash){
                        Units u=Units.Get(dash.Unit);
                        u.Anime("death");
                        u.Life(0.5);                        
                    };
                }; 
                data.i[0]-=1;
            }else{
                ReleaseTimer(GetExpiredTimer());
                u.AnimeId(5);
                u.Alpha(255);
                u.Pause(false);
                e.Destroy();
                data.Destroy();
            }
        }

        static method E(Spell e){
            Units u=Units.Get(e.Spell);
            timer t=NewTimer();
            Data data=Data.create('A00L');
            u.Pause(true);
            u.Alpha(0);
            data.c[0]=u;
            data.c[1]=e;
            data.r[0]=0.08;
            data.r[1]=2;
            data.r[2]=u.X();
            data.r[3]=u.Y();
            data.i[0]=30;
            SetTimerData(t,data);
            TimerStart(t,data.r[0],true,function WindWalk.E1);
            t=null;
        }

        static method W(Spell e){
            Units u=Units.Get(e.Spell);
            integer i;
            Dash dash;
            Units mj;
            u.Pause(true);
            for(0<=i<3){
                mj=Units.MJ(u.player.player,'e008','A00K',0,u.X()+50*CosBJ(u.F()),u.Y()+50*SinBJ(u.F()),u.F()+(-15+(i*15)),3,1.5,1, "stand","Abilities\\Weapons\\MoonPriestessMissile\\MoonPriestessMissile.mdl"); 
                mj.SetH(70);
                mj.Position(mj.X(),mj.Y(),true);
                dash=Dash.Start(mj.unit,mj.F(),900,Dash.SUB,40,true,false);
                dash.onMove=function(Dash dash){
                    Units u=Units.Get(dash.Unit);
                    unit k=GroupFind(u.unit,u.X(),u.Y(),60,false);
                    if(k!=null){
                        DestroyEffect( AddSpecialEffectTarget("Abilities\\Weapons\\MakuraMissile\\MakuraMissile.mdl",k, "chest"));
                        Dash.Start(k,dash.Angle,100,Dash.SUB,20,true,true);
                        dash.Stop(); 
                        u.Damage(k,Damage.Physics,'A00K',u.player.hero.Agi()*10.0);
                    }                    
                    if(dash.Speed<2){
                        dash.Stop();
                    }
                };
                dash.onEnd=function(Dash dash){
                    Units u=Units.Get(dash.Unit);
                    u.Anime("death");
                    u.Life(0.5);                        
                };
            }
            Units.MJ(u.player.player,'e009','A00K',0,u.X(),u.Y(),u.F(),2,0.5,2.5, "stand","tx.mdx").SetH(80);
            u.AnimeSpeed(2.5);
            u.AnimeId(6);
            dash=Dash.Start(u.unit,u.F()+180,300,Dash.SUB,50,true,false);
            dash.Obj=e;
            dash.onEnd=function(Dash dash){
                Units u=Units.Get(dash.Unit),mj;
                Dash dash1;
                integer i;
                if(u.Alive()==true){
                    for(0<=i<6){
                        mj=Units.MJ(u.player.player,'e008','A00K',0,u.X()+125*CosBJ(u.F()),u.Y()+125*SinBJ(u.F()),dash.Angle+180+(-30+(i*15)),3,1.5,1, "stand","Abilities\\Weapons\\MoonPriestessMissile\\MoonPriestessMissile.mdl"); 
                        mj.SetH(70);
                        mj.Position(mj.X(),mj.Y(),true);
                        dash1=Dash.Start(mj.unit,mj.F(),900,Dash.ADD,80,true,false);
                        dash1.onMove=function(Dash dash){
                            Units u=Units.Get(dash.Unit);
                            unit k=GroupFind(u.unit,u.X(),u.Y(),60,false);
                            if(k!=null){
                                DestroyEffect( AddSpecialEffectTarget("Abilities\\Weapons\\MakuraMissile\\MakuraMissile.mdl",k, "chest"));
                                Dash.Start(k,dash.Angle,100,Dash.SUB,20,true,true);
                                dash.Stop(); 
                                u.Damage(k,Damage.Physics,'A00K',u.player.hero.Agi()*10.0);
                            }   
                        };
                        dash1.onEnd=function(Dash dash){
                            Units u=Units.Get(dash.Unit);
                            u.Anime("death");
                            u.Life(0.5);                        
                        };
                    }
                }
                Spell(dash.Obj).Destroy();
                u.AnimeSpeed(1);
                u.Pause(false);
            };
        } 
     
        static method Q(Spell e){
            Units u=Units.Get(e.Spell);
            Dash dash;
            u.Alpha(0); 
            DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Orc\\MirrorImage\\MirrorImageCaster.mdl",e.Spell, "origin") );
            dash=Dash.Start(e.Spell,u.F()+90,200,Dash.SUB,40,true,false);
            dash.Obj=e;
            dash.onEnd=function(Dash dash){
                Units u=Units.Get(dash.Unit);
                Dash dash1;
                u.Alpha(255);
                if(u.Alive()==true){
                    u.Alpha(0);  
                    u.AnimeSpeed(2.5);
                    u.AnimeId(6);
                    dash1=Dash.Start(u.unit,u.F()-90,400,Dash.ADD,100,true,false);
                    dash1.Obj=dash.Obj;
                    dash1.onMove=function(Dash dash){
                        Units u=Units.Get(dash.Unit);
                        Units mj; 
                        Dash dash1;
                        
                            mj=Units.MJ(u.player.player,'e008','A00J',0,u.X(),u.Y(),u.F(),10,1.5,1, "stand","Abilities\\Weapons\\MoonPriestessMissile\\MoonPriestessMissile.mdl"); 
                            mj.Position(u.X(),u.Y(),true); 
                            mj.SetH(50);
                            dash1=Dash.Start(mj.unit,u.F(),900,Dash.ADD,50,true,false);
                            dash1.onMove=function(Dash dash){
                                Units u=Units.Get(dash.Unit);
                                unit k=GroupFind(u.unit,u.X(),u.Y(),60,false);
                                if(k!=null){
                                    DestroyEffect( AddSpecialEffectTarget("Abilities\\Weapons\\MakuraMissile\\MakuraMissile.mdl",k, "chest"));
                                    Dash.Start(k,dash.Angle,100,Dash.SUB,20,true,true);
                                    dash.Stop(); 
                                    u.Damage(k,Damage.Physics,'A00J',u.player.hero.Agi()*5.0);
                                }
                            };
                            dash1.onEnd=function(Dash dash){
                                Units u=Units.Get(dash.Unit);
                                u.Anime("death");
                                u.Life(0.5);
                            };
                        
                    };
                    dash1.onEnd=function(Dash dash){
                        Units u=Units.Get(dash.Unit); 
                        Spell(dash.Obj).Destroy();
                        u.AnimeSpeed(1);
                        u.Alpha(255);
                    };
                }else{
                    Spell(dash.Obj).Destroy();
                }
            }; 
        }

        static method HERO_START(Spell e){
            Units u=Units.Get(e.Spell);
            if(e.Id=='A00K'){
                u.AnimeSpeed(4);
                u.FlushAnimeId(5);
            }
            e.Destroy();
        }

        static method HERO_STOP(Spell e){
            Units u=Units.Get(e.Spell);
            u.AnimeSpeed(1);
            e.Destroy();
        }

        static method onInit(){
            Spell.On(Spell.onSpell,'A00L',WindWalk.E);
            Spell.On(Spell.onSpell,'A00J',WindWalk.Q);
            Spell.On(Spell.onSpell,'A00K',WindWalk.W);
            Spell.On(Spell.onReady,'A00K',HERO_START);
            Spell.On(Spell.onStop,'A00K',HERO_STOP);
        }
    }
}