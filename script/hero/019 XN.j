library XN requires Groups{
    //英雄‘傻娜’的技能
    //SSR
    struct XN{ 

        /*
            20 - 上挑前摇
            21 - 上挑
        */

        static method Q(Spell e){
            Units u=Units.Get(e.Spell);
            Data data=Data.create('A074');
            Dash dash;
            u.Pause(true);
            u.AnimeId(21);
            data.c[0]=u;
            data.c[1]=e;
            data.r[0]=0.34;//判定帧
            data.g[0]=CreateGroup();
            //HitFlys.Add(u.unit,10);
            Effect.ToUnit("buff_fire.mdl",u.unit,"weapon").Destroy();
                
            dash=Dash.Start(u.unit,e.Angle,150,Dash.SUB,30,true,false);
            dash.Obj=data;
            dash.onMove=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units(data.c[0]); 
                Units mj;
                if(data.r[0]>0){
                    
                    GroupEnumUnitsInRange(tmp_group,dash.X+80*CosBJ(dash.Angle),dash.Y+80*SinBJ(dash.Angle),80,function GroupIsAliveNotAloc);     
                    while(FirstOfGroup(tmp_group)!=null){
                        mj=Units.Get(FirstOfGroup(tmp_group));
                        GroupRemoveUnit(tmp_group,mj.unit);
                        if(IsUnitEnemy(mj.unit,u.player.player)==true){ 
                            if(IsUnitInGroup(mj.unit,data.g[0])==false){ 
                                u.Damage(mj.unit,Damage.Magic,'A074',u.Agi(true)*3);
                                GroupAddUnit(data.g[0],mj.unit);
                                HitFlys.Add(mj.unit,16);
                                Dash.Start(mj.unit,dash.Angle,150,Dash.SUB,10,true,false); 
                                Effect.ToUnit("Abilities\\Weapons\\LordofFlameMissile\\LordofFlameMissile.mdl",mj.unit,"chest").Destroy();
                                Effect.ToUnit("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",mj.unit,"chest").Destroy();
                                XN.FIRE_ADD(mj.unit);
                            } 
                            Buffs.Skill(mj.unit,'A075',1); 
                        }  
                    }
                    GroupClear(tmp_group);
                }
                data.r[0]-=0.01;
            };
            dash.onEnd=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units(data.c[0]); 
                Spell(data.c[1]).Destroy();
                u.DelayReleaseAnimePause(0.3);
                DestroyGroup(data.g[0]);
                data.g[0]=null;
                data.Destroy(); 
            };
        }

        //'A073','B02B' 火种
        static method FIRE_ADD(unit u){//给目标单位添加火种
            Buffs b;
            b=Buffs.Add(u,'A073','B02B',86400,false);
            b.Type=Buffs.TYPE_SUB+Buffs.TYPE_DISPEL_TRUE;
            b.onFlush=function(Buffs b){
                if(b.Level<3){ 
                    b.Level+=1;
                }
            };
                            
        }

        static method D1(Units u,real disx,real disy){
            Data data=Data(u.Obj);
            Units mj;
            real f,dis,x=u.X()+disy*CosBJ(disx),y=u.Y()+disy*SinBJ(disx);
            Dash dash;
            if(GroupNumber(data.g[0])!=0){
                mj=Units.Get(GroupFirst(data.g[0]));
                GroupRemoveUnit(data.g[0],mj.unit);
                mj.Position(mj.X(),mj.Y(),true);
                mj.AddAbility(Units.MJType_TSW);
                f=Util.XYEX(mj.X(),mj.Y(),x,y);
                dis=Util.XY2EX(mj.X(),mj.Y(),x,y);
                dash=Dash.Start(mj.unit,f,dis+200,Dash.SUB,60,true,false);
                dash.onMove=function(Dash dash){
                    Units u=Units.Get(dash.Unit);
                    unit k=null; 
                    Buffs b;
                    if(dash.Speed<3){
                        dash.Stop();
                    }else{
                        k=GroupFind(u.unit,dash.X+25*CosBJ(dash.Angle),dash.Y+25*SinBJ(dash.Angle),100,true,false);
                        if(k!=null){
                            u.Damage(k,Damage.Chaos,'A072',u.Agi(true)*2);
                            Dash.Start(k,dash.Angle,100,Dash.SUB,10,true,true);
                            XN.FIRE_ADD(k);
                            Units.MJ(u.player.player,'e008','A072',0,dash.X,dash.Y,dash.Angle,2,2.5,1, "stand","fire-hit-kulouwang.mdl");
                            k=null; 
                            dash.Stop();
                        }
                    }
                };
                dash.onEnd=function(Dash dash){
                    Units u=Units.Get(dash.Unit);
                    u.Anime("death"); 
                    u.Life(1.5);
                };
            }
        }

        static method Spawn(Units u,Units m){
            Data data;
            if(u.IsAbility('A072')==true){
                //是傻娜
                data=Data.create('A072');
                data.c[0]=u;
                data.g[0]=CreateGroup();//红莲单位组
                data.r[0]=5;//红莲刷新间隔
                data.r[1]=0;//旋转角度
                u.Obj=data;
                BJDebugMsg("来了");
                Timers.Start(0.01,data,function(Timers t){
                    Data data=Data(t.Data());
                    Units u=Units(data.c[0]);
                    Units mj;
                    real x=u.X(),y=u.Y(),f,a=0;
                    if(u.Alive()==true){
                        if(data.r[0]<=0){ 
                            data.r[0]=5; 
                            if(GroupNumber(data.g[0])<2){
                                mj=Units.MJ(u.player.player,'e008','A072',0,u.X(),u.Y(),0,86400,1.25,1, "stand","Abilities\\Weapons\\LordofFlameMissile\\LordofFlameMissile.mdl");
                                mj.SetH(100);
                                mj.Alpha(0);
                                GroupAddUnit(data.g[0],mj.unit);
                            } 
                        }else{
                            if(u.IsTimeStop()==false){
                                data.r[0]-=0.01; 
                                data.r[1]+=3;
                                if(data.r[1]>360){
                                    data.r[1]=0;
                                }
                            }
                        }
                        GroupAddGroup(data.g[0],tmp_group);  
                        while(FirstOfGroup(tmp_group)!=null){
                            mj=Units.Get(FirstOfGroup(tmp_group));  
                            GroupRemoveUnit(tmp_group,mj.unit);  
                            mj.Position(x+150*CosBJ(a+data.r[1]),y+150*SinBJ(a+data.r[1]),false); 
                            mj.SetF(Util.XY(mj.unit,u.unit),true);
                            mj.SetH(u.H()+75);
                            a+=180;
                        }
                        GroupClear(tmp_group);
                    }else{
                        BJDebugMsg("没了");
                        GroupAddGroup(data.g[0],tmp_group);  
                        while(FirstOfGroup(tmp_group)!=null){
                            mj=Units.Get(FirstOfGroup(tmp_group));   
                            GroupRemoveUnit(tmp_group,mj.unit); 
                            mj.Anime("death");
                            mj.Life(2.5);
                        }
                        u.Obj=0;
                        GroupClear(tmp_group);
                        DestroyGroup(data.g[0]);
                        data.g[0]=null;
                        data.Destroy();
                        t.Destroy();
                    }
                });
            }
        }

        static method Order(EventArgs e){
            Units u=Units.Get(e.TriggerUnit);   
            if(e.OrderId==Order.Attack){//是A键  
                if(u.IsAbility('A072')==true){//是夏娜 
                    if(u.IsAbility('BPSE')==false){ 
                        XN.D1(u,e.OrderAngle,e.OrderDis); 
                    }
                }
            } 
        }

        static method HERO_START(Spell e){
            Units u=Units.Get(e.Spell);
            if(e.Id=='A074'){
                u.FlushAnimeId(20);
            }
            e.Destroy();
        } 

        static method HERO_STOP(Spell e){
            Units u=Units.Get(e.Spell);
            e.Destroy();
        }

        static method onInit(){
            Units.On(Units.onHeroSpawn,XN.Spawn);
            
            Events.On(Events.onUnitOrderToUnit,XN.Order);
            Events.On(Events.onUnitOrderToLocation,XN.Order); 

            Spell.On(Spell.onSpell,'A074',XN.Q);    
            Spell.On(Spell.onReady,'A074',XN.HERO_START); 
            Spell.On(Spell.onStop,'A074',XN.HERO_STOP);  
        }
    }
}