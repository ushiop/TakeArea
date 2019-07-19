library Ichigo requires Groups{
    //英雄‘一护’的技能
    //SR
    struct Ichigo{ 

        static method AI(unit ua){
            Units u=Units.Get(ua);
            unit target,no;
            real x=u.X(),y=u.Y();
            real x1,y1;     
            Units mj;
            Buffs b;
            target=GroupFind(u.unit,x,y,1000,true,false);
            if(target!=null){
                x1=GetUnitX(target);
                y1=GetUnitY(target);   

                if(u.player.lv10!=null){
                    if(GetRandomInt(0,1)==0&&u.IsTimeStop()==false&&u.IsAbility('BPSE')==false&&u.IsPause()==false){
                        Ichigo.Q(u.unit,Util.XY2EX(x,y,x1,y1),Util.XYEX(x,y,x1,y1)); 
                    }
                } 
                no=GroupFind(u.unit,x,y,600,true,false);
                if(no!=null){ 
                    x1=GetUnitX(target);
                    y1=GetUnitY(target);
                    u.SetF(Util.XY(u.unit,no),true);   
                    IssuePointOrder(u.unit, "channel",x1,y1);//月牙天冲
                }  

                no=GroupFind(u.unit,x,y,300,true,false);
                if(no!=null){ 
                    x1=GetUnitX(target);
                    y1=GetUnitY(target);
                    u.SetF(Util.XY(u.unit,no),true);    
                    IssueImmediateOrder( u.unit, "instant" );//灵压爆发
                }  
                
                 
                no=GroupFind(u.unit,x,y,600,true,false);
                if(no!=null){ 
                    x1=GetUnitX(target);
                    y1=GetUnitY(target);
                    u.SetF(Util.XY(u.unit,no),true);   
                    IssueImmediateOrder( u.unit, "fanofknives" );//爆发
                } 
                   
            } 
            target=null;
            no=null;
        }

        static method D(Spell e){
            Units u=Units.Get(e.Spell);
            Buffs b;
            integer agi;
            u.Pause(true);
            u.Pause(false);
            Effect.To("red-lizi-zhendi-fast.mdl",u.X(),u.Y()).Destroy();
            Effect.To("devilslam.mdl",u.X(),u.Y()).Destroy(); 
            Ichigo.EADD(u.unit,30);
            //Effect.ToUnit("dead spirit by deckai3.mdl",u.unit,"origin").Destroy();
            if(u.IsAbility('B02A')==false){//初次施放
                b=Buffs.Add(u.unit,'A071','B02A',10,false);
                b.Obj=e;
                agi=R2I(u.Agi(true)*0.3);
                u.SetExAgi(agi);
                b.Level=agi;
                b.onTime=function(Buffs b){
                    Units u=Units.Get(b.Unit);
                    u.SetMP(u.MP()+0.5);
                };
                b.onEnd=function(Buffs b){
                    Units u=Units.Get(b.Unit);
                    u.SetExAgi(-b.Level);
                    Spell(b.Obj).Destroy();
                };
            }else{//多次施放
                Buffs.Add(u.unit,'A071','B02A',10,false);
                e.Destroy();
            }
        }

        static method R(Spell e){
            Units u=Units.Get(e.Spell);
            Data data=Data.create('A06Y');
            u.Pause(true);
            u.AnimeId(15); 
            data.c[0]=u;
            data.c[1]=e;
            data.r[0]=0.3;
            data.r[1]=0.1;
            Timers.Start(0.01,data,function(Timers t){
                Data data=Data(t.Data());
                Units u=Units(data.c[0]);
                real x=u.X(),y=u.Y();
                Units mj;
                if(u.IsTimeStop()==false){
                    if(u.Alive()==false||data.r[0]<=0){
                        if(u.Alive()==true){
                            //爆发  
                            Ichigo.EADD(u.unit,15);
                            Units.MJ(u.player.player,'e008','A06Y',0,x,y,0,3,1,2, "stand","black_thunderclapcaster.mdl");
                            Units.MJ(u.player.player,'e008','A06Y',0,x,y,0,3,1,1, "stand","white-qiquan_ex.mdl");
                            Units.MJ(u.player.player,'e008','A06Y',0,x,y,90,3,1,0.8, "stand","white-qiquan_ex.mdl");
                            Units.MJ(u.player.player,'e008','A06Y',0,x,y,180,3,1,0.6, "stand","white-qiquan_ex.mdl");
                            Units.MJ(u.player.player,'e008','A06Y',0,x,y,270,3,1,0.6, "stand","white-qiquan_ex.mdl"); 
                            Util.Duang(x,y,0.5,200,200,-64,0.05,50);
                            u.player.Duang(60,0.3);
                            u.DelayReleaseAnimePause(0.5);
                            GroupEnumUnitsInRange(tmp_group,x,y,450,function GroupIsAliveNotAloc);     
                            while(FirstOfGroup(tmp_group)!=null){
                                mj=Units.Get(FirstOfGroup(tmp_group));
                                GroupRemoveUnit(tmp_group,mj.unit);
                                if(IsUnitEnemy(mj.unit,u.player.player)==true){ 
                                    u.Damage(mj.unit,Damage.Magic,'A06Y',u.Agi(true)*12);
                                    Buffs.Add(mj.unit,'A06Z','B029',6,false).Type=Buffs.TYPE_SUB+Buffs.TYPE_DISPEL_TRUE;
                                    if(Util.XY2(u.unit,mj.unit)<=200){
                                        Buffs.Skill(mj.unit,'A00F',1);
                                        HitFlys.Add(mj.unit,12); 
                                    }   
                                    Dash.Start(mj.unit,Util.XY(u.unit,mj.unit),200,Dash.SUB,10,true,false);
                                    
                                }  
                            }
                            GroupClear(tmp_group);
                        }else{ 
                            u.Pause(false);
                        }
                        data.Destroy();
                        t.Destroy();
                    }else{ 
                        data.r[0]-=0.01;
                        data.r[1]-=0.01;
                        if(data.r[1]==0){
                            data.r[1]=0.1; 
                            Units.MJ(u.player.player,'e008','A06Y',0,x,y,GetRandomReal(0,360),0.5,1.5,1.25, "stand","dark1.mdl");
                            //
                        }
                        if(data.r[0]==0.1){
                            u.AnimeId(10);
                            Units.MJ(u.player.player,'e008','A06Y',0,x,y,GetRandomReal(0,360),3,2,2, "stand","bymutou_huozhu_siwang.mdl");
                            
                        }
                    }
                }
            });
        }

        static method AddDamage(DamageArgs e){
            if(e.TriggerUnit.IsAbility('B02D')==true){
                e.Damage+=e.Damage;
            }
        }

        static method Attack(DamageArgs e){
            Buffs b;
            if(e.DamageType==Damage.Attack){ 
                if(e.DamageUnit.IsAbility('B028')==true){
                    b=Buffs.Find(e.DamageUnit.unit,'B028');
                    if(b.Level>=5){
                        Ichigo.EUSE(e.DamageUnit.unit,5,Util.XY(e.DamageUnit.unit,e.TriggerUnit.unit));
                    }
                }
            }
        }

        static method EUSE(unit ua,integer s,real f){
            Units u=Units.Get(ua);
            Buffs b;
            Units mj;
            Dash dash;
            Data data;
            if(u.IsAbility('B028')==true){
                b=Buffs.Find(u.unit,'B028');
                if(b.Level>=s){//发动效果
                    //---
                    mj=Units.MJ(u.player.player,'e008','A06V',0,u.X()+50*CosBJ(f),u.Y()+50*SinBJ(f),f,2,1,1, "stand","blackgetsuga2_x90.mdl");
                    mj.SetH(100);
                    mj.DelayAlpha(255,0,0.5);
                    mj.DelaySizeEx(1,2,0.5);
                    mj.AddAbility(Units.MJType_TSW);
                    mj.Position(mj.X(),mj.Y(),true);
                    data=Data.create('A06V');
                    data.c[0]=u; 
                    data.g[0]=CreateGroup();
                    dash=Dash.Start(mj.unit,f,600,Dash.SUB,25,true,false);
                    dash.Obj=data;
                    dash.onMove=function(Dash dash){
                        Data data=Data(dash.Obj);
                        Units u=Units.Get(dash.Unit);
                        Units mj; 
                        GroupEnumUnitsInRange(tmp_group,dash.X,dash.Y,200,function GroupIsAliveNotAloc);     
                        while(FirstOfGroup(tmp_group)!=null){
                            mj=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,mj.unit);
                            if(IsUnitEnemy(mj.unit,u.player.player)==true){
                                if(Util.FAN(u.unit,mj.unit,dash.Angle,80)==true){ 
                                    if(IsUnitInGroup(mj.unit,data.g[0])==false){ 
                                    //伤害和减速 
                                        u.Damage(mj.unit,Damage.Magic,'A06V',u.Agi(true)*5); 
                                        Units.MJ(u.player.player,'e008','A06V',0,mj.X()+120*CosBJ(mj.F()+180),mj.Y()+120*SinBJ(mj.F()+180),mj.F(),3,1,2,"death","yytc.mdl"); 
                                        GroupAddUnit(data.g[0],mj.unit);
                                    }
                                }
                            }  
                        }
                        GroupClear(tmp_group);
                    };
                    dash.onEnd=function(Dash dash){
                        Data data=Data(dash.Obj);
                        DestroyGroup(data.g[0]);
                        data.g[0]=null;
                        data.Destroy();
                    };
                    //---
                    b.Level-=s; 
                    if(b.Level<5){
                        if(b.Obj!=0){
                            BJDebugMsg("删除");
                            Effect(b.Obj).Destroy();
                            b.Obj=0;
                        }
                        if(b.Level<=0){
                            b.Stop();
                        }
                    }
                }
            }
        }

        static method EADD(unit ua,integer s){
            Units u=Units.Get(ua);
            Buffs b;
            if(u.player.lv10!=null){
                if(u.IsAbility('B028')==false){
                    b=Buffs.Add(u.unit,'A06X','B028',86400,false);
                    b.Level=0;
                    b.onEnd=function(Buffs b){
                        Units u=Units.Get(b.Unit);
                        if(b.Obj!=0){ 
                            BJDebugMsg("删除");
                            Effect(b.Obj).Destroy();
                        }
                    };
                }
                b=Buffs.Find(u.unit,'B028');
                b.Level+=s;
                if(b.Level>=5){
                    if(b.Obj==0){ 
                        BJDebugMsg("添加");
                        b.Obj=Effect.ToUnit("buff_hei.mdl",u.unit,"weapon");
                    }
                }
            }
        }

        static method W(Spell e){
            Units u=Units.Get(e.Spell);
            real f=e.Angle,x=u.X(),y=u.Y();
            Units mj;
            Dash dash;
            Data data;
            Ichigo.EADD(u.unit,5);
            data=Data.create('A06U');
            mj=Units.MJ(u.player.player,'e008','A06U',0,x,y,f,10,1.4,0.8, "birth","az_jingzi_jiansheng01_e1.mdl");
            Dash.Start(mj.unit,f,700,Dash.SUB,60,true,false); 
            mj=Units.MJ(u.player.player,'e008','A06U',0,x,y,f,3,1,1, "stand","yytc.mdl");
            mj.AddAbility(Units.MJType_TSW);
            mj.Position(x,y,true);
            data.c[0]=u;
            data.c[1]=mj;
            data.g[0]=CreateGroup();
            if(e.State==Spell.SpellState){
                BJDebugMsg("66");
                data.r[0]=u.Agi(true)*6;
            }else{
                BJDebugMsg("22");
                data.r[0]=u.Agi(true)*2;
            }
            dash=Dash.Start(mj.unit,f,1600,Dash.SUB,100,true,false);
            dash.Obj=data;
            dash.onMove=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units(data.c[0]);
                Units mj;
                if(dash.Speed<10){
                    dash.Stop();
                }else{ 
                    GroupEnumUnitsInRange(tmp_group,dash.X,dash.Y,125,function GroupIsAliveNotAloc);     
                    while(FirstOfGroup(tmp_group)!=null){
                        mj=Units.Get(FirstOfGroup(tmp_group));
                        GroupRemoveUnit(tmp_group,mj.unit);
                        if(IsUnitEnemy(mj.unit,u.player.player)==true&&IsUnitInGroup(mj.unit,data.g[0])==false){ 
                            //伤害和减速 
                            u.Damage(mj.unit,Damage.Magic,'A06U',data.r[0]); 
                            Units.MJ(u.player.player,'e008','A06U',0,mj.X()+120*CosBJ(mj.F()+180),mj.Y()+120*SinBJ(mj.F()+180),mj.F(),3,1,2,"death","yytc.mdl"); 
                            GroupAddUnit(data.g[0],mj.unit);
                        }  
                    }
                    GroupClear(tmp_group);
                }
            };
            dash.onEnd=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units(data.c[0]);
                Units mj=Units(data.c[1]);
                mj.Anime("death");
                DestroyGroup(data.g[0]);
                data.g[0]=null;
                data.Destroy();
            };
            e.Destroy();
                
        }
        
        static method Q(unit ua,real dis,real f){
            Units u=Units.Get(ua);
            real maxdis=600+(u.Agi(true)*10);
            real mp=0,speed=0;
            Dash dash;
            Units mj;
            Data data;
            dis=dis-50;
            if(dis>maxdis){
                dis=maxdis;
            }
            mp=dis*0.08;
            if(mp<50){
                mp=50;
            }
            if(u.MP()>=mp){//发动成功
                Buffs.Add(u.unit,'A079','B02D',1,false).Level+=1;
                mp+=Buffs.Find(u.unit,'B02D').Level*2; 
                if(dis>1000){
                    if(dis>2000){
                        speed=dis/4;
                    }else{ 
                        speed=dis/2;
                    }
                }else{
                    speed=dis;
                }
                u.SetMP(u.MP()-mp);
                Ichigo.EADD(u.unit,1);
                Units.MJ(u.player.player,'e008','A06T',0,u.X(),u.Y(),0,3,1,1, "stand","blackblink.mdl");
                Units.MJ(u.player.player,'e008','A06T',0,u.X(),u.Y(),GetRandomReal(0,360),3,0.5,1.5, "stand","white-qiquan_ex.mdl");
                u.Alpha(0);
                if(dis>1000){
                    mj=Units.MJ(u.player.player,'e008','A06T',0,u.X(),u.Y(),0,1,4,3, "stand","Abilities\\Weapons\\AvengerMissile\\AvengerMissile.mdl");
                    mj.SetH(100);
                    data=Data.create('A06T');
                    data.c[0]=mj;
                    data.r[0]=u.X()+dis*CosBJ(f);
                    data.r[1]=u.Y()+dis*SinBJ(f);
                    Timers.Start(0.3,data,function(Timers t){
                        Data data=Data(t.Data());
                        Units mj=Units(data.c[0]);
                        mj.Position(data.r[0],data.r[1],false); 
                        mj.Size(0);
                        data.Destroy();
                        t.Destroy();
                    });
                }  
                u.SetF(f,true);
                dash=Dash.Start(u.unit,f,dis,Dash.NORMAL,speed,true,false);
                dash.onMove=function(Dash dash){
                    Units u=Units.Get(dash.Unit);
                    real dis=GetRandomReal(0,200);
                    real f=GetRandomReal(0,360);

                    if(u.IsAbility('BPSE')==true){
                        dash.Stop();
                    }else{ 
                        Units.MJ(u.player.player,'e008','A06T',0,dash.X+dis*CosBJ(f),dash.Y+dis*SinBJ(f),0,3,1,1, "stand","blackblink.mdl");
                    }
                };
                dash.onEnd=function(Dash dash){
                    Units u=Units.Get(dash.Unit);
                    Buffs.Add(u.unit,'A06W','B027',0.25,false);
                    u.DelayAlpha(0,255,0.5);
                };
            }else{
                TextForPlayer(u.player.player,u.unit,"瞬步所需魔法值不足!",0.8,14,90);
            }
        }

        static method Q_Order(EventArgs e){
            Units u=Units.Get(e.TriggerUnit);
            real f,dis; 
            if(u.IsAbility('A06T')==true&&e.OrderId==851971&&u.IsTimeStop()==false&&u.IsAbility('BPSE')==false&&u.IsPause()==false&&u.player.press.Q==true){
                if(e.OrderTargetUnit==null){ 
                    f=Util.XYEX(u.X(),u.Y(),e.OrderTargetX,e.OrderTargetY);
                    dis=Util.XY2EX(u.X(),u.Y(),e.OrderTargetX,e.OrderTargetY);
                }else{
                    f=Util.XY(u.unit,e.OrderTargetUnit);
                    dis=Util.XY2(u.unit,e.OrderTargetUnit);
                }
                Ichigo.Q(u.unit,dis,f);
            }
            if(e.OrderId==852600&&u.IsAbility('B027')==true){
                if(e.OrderTargetUnit==null){ 
                    f=Util.XYEX(u.X(),u.Y(),e.OrderTargetX,e.OrderTargetY);
                    dis=Util.XY2EX(u.X(),u.Y(),e.OrderTargetX,e.OrderTargetY);
                }else{
                    f=Util.XY(u.unit,e.OrderTargetUnit);
                    dis=Util.XY2(u.unit,e.OrderTargetUnit);
                }
                u.SetF(f,true);
            }
        }

        static method HERO_START(Spell e){
            Units u=Units.Get(e.Spell);
            Units mj;
            if(e.Id=='A06U'){
                if(u.IsAbility('B027')==true){
                    u.SetMP(u.MP()-100);
                    u.SetAbilityCD('A06U',0.1); 
                    u.DelayAlpha(0,255,2);
                    mj=Units.MJ(u.player.player,'e008','A06U',0,u.X(),u.Y(),e.Angle,1,u.modelsize,2.5, "stand",u.model);
                    mj.AnimeId(13);
                    mj.DelayAlpha(255,0,1);
                    Ichigo.W(e);
                }else{
                    u.FlushAnimeId(13); 
                    e.Destroy();
                }
                
            }
             
        }

        static method Spawn(Units u,Units m){
            if(u.IsAbility('A06U')==true){
                u.ai=Ichigo.AI;
            }
        }

        /*static method HERO_STOP(Spell e){
            Units u=Units.Get(e.Spell);
            if(e.Id=='A06U'){
                u.AnimeSpeed(1);
            }
            e.Destroy();
        }*/

        static method onInit(){ 
            Units.On(Units.onHeroSpawn,Ichigo.Spawn);
            Damage.On(Damage.onUnitDamage_EndDamage,Ichigo.Attack); 
            Damage.On(Damage.onUnitDamage_AddDamage,Ichigo.AddDamage); 
            
            Spell.On(Spell.onSpell,'A070',Ichigo.D);
            Spell.On(Spell.onSpell,'A06Y',Ichigo.R);
            Spell.On(Spell.onSpell,'A06U',Ichigo.W);
            Spell.On(Spell.onReady,'A06U',Ichigo.HERO_START); 
            //Spell.On(Spell.onStop,'A06U',Ichigo.HERO_STOP);  
            Events.On(Events.onUnitOrderToUnit,Ichigo.Q_Order);
            Events.On(Events.onUnitOrderToLocation,Ichigo.Q_Order); 
        }
    }
} 