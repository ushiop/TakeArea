library SL requires Groups{
    //R级英雄‘神裂’的技能
    struct SL{

        //9
        static method W(Spell e){
            Units u=Units.Get(e.Spell);
            Data data=Data.create('A018');
            Dash dash;
            u.Pause(true); 
            u.AnimeSpeed(2);
            u.AnimeId(9);
            data.c[0]=u;
            data.c[1]=e;
            data.i[0]=0;
            data.i[1]=0;
            dash=Dash.Start(u.unit,e.Angle,1000,Dash.SUB,20,true,false);
            dash.Obj=data;
            dash.onMove=function(Dash dash){ 
                Data data=Data(dash.Obj);
                Units u=Units(data.c[0]);
                real x=dash.X+100*CosBJ(dash.Angle),y=dash.Y+100*SinBJ(dash.Angle);
                unit k;
                Units mj;
                Dash dash1; 
                if(dash.Speed<4){
                    if(data.i[0]==0){
                        data.i[0]=1;
                        u.AnimeId(0);
                        u.AnimeSpeed(1);
                        u.Pause(false); 
                        BJDebugMsg("222");
                    }
                }else{
                    if(dash.Speed>10){
                        DestroyEffect( AddSpecialEffect("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl", dash.X,dash.Y) );
                    }
                    k=GroupFind(u.unit,x,y,80,true,false);
                    if(k!=null){
                        data.i[0]=2;
                        dash.Stop(); 
                        u.AnimeSpeed(1);
                        u.AnimeId(1);
                        u.Alpha(0);
                        Units.MJ(u.player.player,'e008','A018',0,u.X()+Util.XY2(u.unit,k)/2*CosBJ(Util.XY(u.unit,k)),u.Y()+Util.XY2(u.unit,k)/2*SinBJ(Util.XY(u.unit,k)),u.F(),2,1,1, "stand","qqqqq.mdl").SetH(100); 
                        Dash.Start(u.unit,Util.XY(k,u.unit),200,Dash.SUB,10,true,false);
                        Dash.Start(k,Util.XY(u.unit,k),300,Dash.SUB,5,true,true);
                        data.u[0]=k;
                        data.i[1]=2; 
                        mj=Units.MJ(u.player.player,'e008','A018',5,u.X(),u.Y(),0,5,0.75,1, "stand","blink_blue.mdl");
                        data.c[2]=mj;
                        dash1=Dash.Start(mj.unit,Util.XY(u.unit,k)+45,Util.XY2(u.unit,k)*4,Dash.SUB,60,true,false);
                        dash1.Obj=data;
                        dash1.onMove=function(Dash dash){
                            Units u=Units.Get(dash.Unit);
                            u.SetF(dash.Angle,true);
                            if(dash.Speed<4){
                                dash.Stop();
                            }
                        };
                        dash1.onEnd=function(Dash dash){
                            Data data=Data(dash.Obj);
                            Units u=Units.Get(dash.Unit);
                            timer t=NewTimer();
                            u.Model("niuzai_squished.mdl"); 
                            u.AddAbility('A019');
                            u.SetH(0);
                            u.Size(0.75);
                            u.Alpha(200);
                            u.AnimeId(3);
                            u.AnimeSpeed(3);
                            data.i[2]=5;
                            SetTimerData(t,data);
                            TimerStart(t,0.05,true,function(){
                                Data data=Data(GetTimerData(GetExpiredTimer()));
                                Units u=Units(data.c[2]);
                                Units m=Units(data.c[0]);
                                Dash dash;
                                if(data.i[2]==0){                  
                                    u.RemoveAbility('A019');
                                    u.AnimeSpeed(1);
                                    u.AnimeId(8);
                                    u.Life(0.8);
                                    ReleaseTimer(GetExpiredTimer());
                                    data.i[1]-=1;
                                    if(data.i[1]==0){ 
                                        if(m.Alive()==true){
                                            data.r[0]=GetUnitX(data.u[0]);
                                            data.r[1]=GetUnitY(data.u[0]);
                                            dash=Dash.Start(m.unit,Util.XY(m.unit,data.u[0]),Util.XY2(m.unit,data.u[0])+300,Dash.SUB,125,true,false);
                                            dash.Obj=data;
                                            dash.onMove=function(Dash dash){
                                                Data data=Data(dash.Obj);
                                                Units u=Units(data.c[0]);
                                                SetUnitX(data.u[0],data.r[0]);
                                                SetUnitY(data.u[0],data.r[1]);
                                                if(Util.XY2(u.unit,data.u[0])<150){
                                                    data.r[0]=data.r[0]+10*CosBJ(dash.Angle+180);
                                                    data.r[1]=data.r[1]+10*SinBJ(dash.Angle+180);
                                                    Units.MJ(u.player.player,'e008','A018',0,GetUnitX(data.u[0]),GetUnitY(data.u[0]),0,2,1.5,2, "stand","az-blood-hit.mdl").SetH(100); 
                            
                                                    Units.MJ(u.player.player,'e008','A018',0,GetUnitX(data.u[0]),GetUnitY(data.u[0]),0,2,1.5,2, "stand","yooobug_hit_blue.mdl").SetH(100); 
                            
                                                }
                                                if(dash.Speed<4){
                                                    dash.Stop();
                                                }
                                            };
                                            dash.onEnd=function(Dash dash){
                                                Data data=Data(dash.Obj);
                                                Units u=Units(data.c[0]);  
                                                u.SetF(Util.XY(u.unit,data.u[0]),true);
                                                u.Alpha(255);
                                                u.AnimeSpeed(1.5);
                                                u.AnimeId(8);
                                                u.DelayReleaseAnimePause(0.4);
                                                data.u[0]=null; 
                                                Spell(data.c[1]).Destroy();
                                                data.Destroy();
                                            };
                                        }else{
                                            m.Alpha(255);
                                            m.Pause(false); 
                                            data.u[0]=null; 
                                            Spell(data.c[1]).Destroy();
                                            data.Destroy();
                                        }
                                    } 
                                }else{
                                    u.Position(GetUnitX(data.u[0])+225*CosBJ(Util.XY(u.unit,data.u[0])+45),GetUnitY(data.u[0])+225*SinBJ(Util.XY(u.unit,data.u[0])+45),false);
                                    u.SetF(Util.XY(u.unit,data.u[0]),true); 
                                    u.AnimeId(3);
                                    DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",data.u[0], "chest") );
                                    data.i[2]-=1;
                                }
                            }); 
                            t=null;
                        };
                        //------------
                        mj=Units.MJ(u.player.player,'e008','A018',6,u.X(),u.Y(),0,5,0.75,1, "stand","blink_blue.mdl");
                        data.c[3]=mj;
                        dash1=Dash.Start(mj.unit,Util.XY(u.unit,k)-45,Util.XY2(u.unit,k)*4,Dash.SUB,60,true,false);
                        dash1.Obj=data;
                        dash1.onMove=function(Dash dash){
                            if(dash.Speed<4){
                                dash.Stop();
                            }
                        };
                        dash1.onEnd=function(Dash dash){
                            Data data=Data(dash.Obj);
                            Units u=Units.Get(dash.Unit);
                            timer t=NewTimer();
                            u.Model("niuzai_squished.mdl"); 
                            u.AddAbility('A019');
                            u.SetH(0);
                            u.Size(0.75);
                            u.Alpha(200);
                            u.AnimeId(3);
                            u.AnimeSpeed(3);
                            data.i[3]=5;
                            SetTimerData(t,data);
                            TimerStart(t,0.05,true,function(){
                                Data data=Data(GetTimerData(GetExpiredTimer()));
                                Units u=Units(data.c[3]);
                                Units m=Units(data.c[0]);
                                Dash dash;
                                if(data.i[3]==0){
                                    u.RemoveAbility('A019');
                                    u.AnimeSpeed(1);
                                    u.AnimeId(8);
                                    u.Life(0.8);
                                    ReleaseTimer(GetExpiredTimer());
                                    data.i[1]-=1;
                                    if(data.i[1]==0){ 
                                        if(m.Alive()==true){
                                            data.r[0]=GetUnitX(data.u[0]);
                                            data.r[1]=GetUnitY(data.u[0]);
                                            dash=Dash.Start(m.unit,Util.XY(m.unit,data.u[0]),Util.XY2(m.unit,data.u[0])+300,Dash.SUB,125,true,false);
                                            dash.Obj=data;
                                            dash.onMove=function(Dash dash){
                                                Data data=Data(dash.Obj);
                                                Units u=Units(data.c[0]);
                                                SetUnitX(data.u[0],data.r[0]);
                                                SetUnitY(data.u[0],data.r[1]);
                                                if(Util.XY2(u.unit,data.u[0])<150){
                                                    data.r[0]=data.r[0]+10*CosBJ(dash.Angle+180);
                                                    data.r[1]=data.r[1]+10*SinBJ(dash.Angle+180);
                                                    Units.MJ(u.player.player,'e008','A018',0,GetUnitX(data.u[0]),GetUnitY(data.u[0]),0,2,1.5,2, "stand","az-blood-hit.mdl").SetH(100); 
                            
                                                    Units.MJ(u.player.player,'e008','A018',0,GetUnitX(data.u[0]),GetUnitY(data.u[0]),0,2,1.5,2, "stand","yooobug_hit_blue.mdl").SetH(100); 
                            
                                                }
                                                if(dash.Speed<4){
                                                    dash.Stop();
                                                }
                                            };
                                            dash.onEnd=function(Dash dash){
                                                Data data=Data(dash.Obj);
                                                Units u=Units(data.c[0]);  
                                                u.SetF(Util.XY(u.unit,data.u[0]),true);
                                                u.AnimeSpeed(1.5);
                                                u.Alpha(255); 
                                                u.AnimeId(8);
                                                u.DelayReleaseAnimePause(0.4);
                                                data.u[0]=null; 
                                                Spell(data.c[1]).Destroy();
                                                data.Destroy();
                                            };
                                        }else{
                                            m.Alpha(255);
                                            m.Pause(false); 
                                            data.u[0]=null; 
                                            Spell(data.c[1]).Destroy();
                                            data.Destroy();
                                        } 
                                    }
                                }else{
                                    u.Position(GetUnitX(data.u[0])+225*CosBJ(Util.XY(u.unit,data.u[0])-45),GetUnitY(data.u[0])+225*SinBJ(Util.XY(u.unit,data.u[0])-45),false);
                                    u.SetF(Util.XY(u.unit,data.u[0]),true); 
                                    u.AnimeId(3);
                                    DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",data.u[0], "chest") );
                                    data.i[3]-=1;
                                }
                            });
                            t=null;
                        };
                        k=null;
                    }
                }
            };
            dash.onEnd=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units(data.c[0]);
                if(data.i[0]==0){ 
                    u.AnimeId(0);
                    u.AnimeSpeed(1);
                    u.Pause(false); 
                    
                        BJDebugMsg("1111");
                }
                if(data.i[0]<=1){ 
                    if(data.i[1]!=0){
                        BJDebugMsg("!!!!!!!!!!!!!!!!!!!!");
                    }
                    Spell(data.c[1]).Destroy();
                    data.Destroy(); 
                    
                        BJDebugMsg("3333");
                } 
            };
        }


        //3
        static method Q(Spell e){
            Units u=Units.Get(e.Spell);
            Data data=Data.create('A017');
            timer t=NewTimer();
            u.Pause(true);
            u.AnimeSpeed(4);
            u.AnimeId(3);
            data.c[0]=u;
            data.c[1]=e;
            SetTimerData(t,data);
            TimerStart(t,0.1,false,function(){
                Data data=Data(GetTimerData(GetExpiredTimer()));
                Units u=Units(data.c[0]);
                Units mj;
                real x=u.X(),y=u.Y(); 
                real f=Util.XYEX(x,y,x+100*CosBJ(u.F()),y+100*SinBJ(u.F())); 
                if(u.Alive()==true){
                    Units.MJ(u.player.player,'e008','A017',0,x,y,u.F(),2,0.5,2.2, "stand","[spell]xinzhao_r2_3.mdl").SetH(100); 
                    GroupEnumUnitsInRange(tmp_group,x,y,300,function GroupIsAliveNotAloc);                   
                    while(FirstOfGroup(tmp_group)!=null){
                        mj=Units.Get(FirstOfGroup(tmp_group));
                        GroupRemoveUnit(tmp_group,mj.unit);
                        if(IsUnitEnemy(mj.unit,u.player.player)==true){  
                            if(Util.FAN(u.unit,mj.unit,f,80)==true){ 
                                u.Damage(mj.unit,Damage.Physics,'A017',u.Str(true)*5.0);  
                                DestroyEffect( AddSpecialEffectTarget("az-blood-hit.mdl", mj.unit, "chest") );
                                Dash.Start(mj.unit,Util.XY(u.unit,mj.unit),200.0,Dash.SUB,20,true,true);
                            }
                        }
                    }
                    GroupClear(tmp_group);    
                }
                u.AnimeSpeed(2);
                u.DelayReleaseAnimePause(0.4);
                Spell(data.c[1]).Destroy();
                data.Destroy();
                ReleaseTimer(GetExpiredTimer());
            });
            t=null; 
        }


        static method HERO_START(Spell e){
            Units u=Units.Get(e.Spell);
            if(e.Id=='A018'){
                u.FlushAnimeId(1);
                e.Destroy();
            }

        }

        static method HERO_STOP(Spell e){ 
            Units u=Units.Get(e.Spell);
            
            e.Destroy();
        }

        static method onInit(){ 
            Spell.On(Spell.onSpell,'A017',SL.Q);  
            Spell.On(Spell.onSpell,'A018',SL.W);  
            Spell.On(Spell.onReady,'A018',SL.HERO_START);
            Spell.On(Spell.onStop,'A018',SL.HERO_STOP);   
        }
    }
}