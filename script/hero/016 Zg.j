library Zg requires Groups{
    //英雄‘眼镜·七夜’的技能
    //SR
    /*
        27 - Q前摇
        24 - Q动作
        28 - Q2 第一阶段(0.768s蓄力)(0.464s蓄力完毕小踹)
        29 - Q2 第二阶段大踹0.421
        30 - Q2 空中下踹
        13 - W 真正的走位
        25 - E 前摇
        26 - E 抛投(0.7s抛出)(0.5s硬直)
        14 - 突然踢人(1.225s整体)(0.541s蓄力)(0.379s踢人)
        8 - 突然决死
        18 - 十七分割 前摇
        19 - 十七分割 过程
        20 - 十七分割 后摇
    */ 
    struct Zg{   

        static method D(Spell e){
            Units u=Units.Get(e.Spell);
            Data data=Data.create('A069');
            Dash dash;
            real x=u.X(),y=u.Y();
            Units ts,ts1;
            integer i;
            u.Pause(true);
            u.AnimeId(19);
            data.c[0]=u;
            data.c[1]=e; 
            ts=Units.MJ(u.player.player,'e008','A069',0,x,y,0,6,u.modelsize,1,"stand",u.model);
            ts.AnimeId(19);
            ts.Alpha(0); 
            data.c[2]=ts; 
            data.r[0]=0.02;
            for(1<=i<70){
                ts1=Units.MJ(u.player.player,'e008','A069',i,x,y,0,6,u.modelsize,1,"stand",u.model);
                ts1.AnimeId(19);
                ts1.Alpha(0);
                ts.Obj=ts1;  
                ts=ts1;
            } 
            Units.MJ(u.player.player,'e008','A069',0,x,y,0,2.5,1,1,"stand", "white-qiquan.mdl");
            Units.MJ(u.player.player,'e008','A069',0,x,y,0,2.5,1,0.8,"stand", "white-qiquan.mdl");
            Units.MJ(u.player.player,'e008','A069',0,x,y,0,2.5,1,0.6,"stand", "white-qiquan.mdl");
            Units.MJ(u.player.player,'e008','A069',0,x,y,0,2.5,1,0.4,"stand", "white-qiquan.mdl");
            //减速
            //
            dash=Dash.Start(u.unit,e.Angle,1000,Dash.ADD,25,true,false);
            dash.Obj=data;
            dash.onMove=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units.Get(dash.Unit);
                Units ts=Units(data.c[2]);
                if(data.r[0]==0){
                    data.r[0]=0.02;
                    if(ts.Obj!=0){
                        ts.Position(dash.X,dash.Y,false);
                        ts.SetF(dash.Angle,true);
                        ts.SetH(u.H());
                        ts.DelayAlpha(255,0,0.8);
                        ts.Life(0.8);
                        data.c[2]=ts.Obj;
                    }
                }else{
                    data.r[0]-=0.01;
                }
            };
            dash.onEnd=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units(data.c[0]); 
                Units ts,ts1,ts2;
                Dash dash1;
                integer i;
                if(data.u[0]==null){ 
                    u.AnimeId(20);
                    u.DelayReleaseAnimePause(0.5); 
                    ts=Units.MJ(u.player.player,'e008','A069',0,dash.X,dash.Y,0,6,u.modelsize,1,"stand",u.model);
                    ts.AnimeId(20);
                    ts.Alpha(0); 
                    ts2=ts;
                    for(1<=i<10){
                        ts1=Units.MJ(u.player.player,'e008','A069',i,dash.X,dash.Y,0,6,u.modelsize,1,"stand",u.model);
                        ts1.AnimeId(20);
                        ts1.Alpha(0);
                        ts.Obj=ts1;  
                        ts=ts1;
                    } 
                        BJDebugMsg(I2S(ts.Obj));
                    dash1=Dash.Start(u.unit,dash.Angle,450,Dash.SUB,dash.Speed,true,false);
                    dash1.Obj=ts2;
                    dash1.onMove=function(Dash dash){
                        Units ts=Units(dash.Obj);
                        Units u=ts.player.hero;
                        BJDebugMsg(I2S(ts.Obj));
                        if(ts.Obj!=0){
                            ts.Position(dash.X,dash.Y,false);
                            ts.SetF(dash.Angle,true);
                            ts.SetH(u.H());
                            ts.DelayAlpha(255,0,0.8);
                            ts.Life(0.8);
                            dash.Obj=ts.Obj;
                        }
                    };
                    
                }else{
                    u.Pause(false);
                }
                Spell(data.c[1]).Destroy();
                data.Destroy();
            };
        }

        //突然决死
        static method R4(Units u,Units m){ 
            real r=GetRandomReal(0,1);
            Dash dash;
            Units mj;
            if(r<=0.01){
                u.Pause(true);
                u.AnimeSpeed(3);
                u.AnimeId(8);  
                Buffs.Skill(m.unit,'A00A',1);
                RuaText(u.unit,"？？ ？ ？？",10,2,1,45,0,0.02);
                Effect.ToUnit("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",m.unit,"chest").Destroy();
                Effect.ToUnit("blink_blue.mdl",u.unit,"origin").Destroy();
                Effect.ToUnit("az-blood-hit.mdl",m.unit,"chest").Destroy();
                mj=Units.MJ(u.player.player,'e008','A064',0,m.X(),m.Y(),Util.XY(u.unit,m.unit),2.5,1,1,"stand", "blood-2.mdl");
                mj.DelayAlpha(255,0,1.99);
                mj=Units.MJ(u.player.player,'e008','A064',0,u.X(),u.Y(),0,0.5,1.5,1.5,"birth","az_lxj_blue_ex.mdl");
                mj.SetH(100); 
                dash=Dash.Start(u.unit,Util.XY(u.unit,m.unit),350,Dash.SUB,60,true,false);
                dash.Obj=mj;
                dash.onMove=function(Dash dash){
                    Units mj=Units(dash.Obj);
                    mj.Position(dash.X,dash.Y,false);
                };
                dash.onEnd=function(Dash dash){ 
                    Units u=Units.Get(dash.Unit);
                    u.DelayReleaseAnimePause(0.3);
                };
                if(u.IsAbility('B01V')==false){ 
                    u.Damage(m.unit,Damage.Physics,'A064',u.Agi(true)*20);
                }else{   
                    Units.MJ(u.player.player,'e008','A064',0,m.X(),m.Y(),0,1,1,1,"stand", "az_hit-red-blade.mdl");
                    Units.MJ(u.player.player,'e008','A064',0,m.X(),m.Y(),0,3,1.5,1,"stand", "blood-boom.mdl");
                    u.Damage(m.unit,Damage.Chaos,'A064',99999);
                }
            }
        }

        //突然踢人
        static method R3(unit ua){
            Units u=Units.Get(ua);
            unit k;
            Data data;
            Dash dash;
            k=GroupRandomFilter(u.unit,u.X(),u.Y(),150,true,u.unit);//随机选取一个友军
            if(k==null){//没有友军
                k=GroupRandomFilter(u.unit,u.X(),u.Y(),150,false,u.unit);//随机选取一个敌军
            }
            if(k!=null){
                data=Data.create('A064');
                u.Pause(true);
                u.AnimeId(14);
                u.AnimeSpeed(2);  
                SpellNameText(u.unit,"？",3,10);
                data.c[0]=u;
                data.u[0]=k; 
                data.i[0]=3;
                Units.MJ(u.player.player,'e008','A065',0,u.X(),u.Y(),0,2,1,1,"stand","blink_blue.mdl");
                dash=Dash.Start(u.unit,GetRandomReal(0,360),450,Dash.NORMAL,22.5,true,false);
                dash.Obj=data;
                dash.onMove=function(Dash dash){
                    Data data=Data(dash.Obj);
                    Units u=Units.Get(dash.Unit);
                    Units m=Units.Get(data.u[0]);
                    u.SetF(Util.XY(u.unit,m.unit),true);
                    if(data.i[0]==0){
                        data.i[0]=3; 
                        SpellNameText(u.unit,"？",3,10);
                    }else{
                        data.i[0]-=1;
                    }
                };
                dash.onEnd=function(Dash dash){
                    Data data=Data(dash.Obj);
                    Units u=Units(data.c[0]);
                    Units m=Units.Get(data.u[0]);
                    Dash dash1;
                    Units.MJ(u.player.player,'e008','A064',0,dash.X,dash.Y,Util.XY(u.unit,m.unit),1,1.1,2,"stand","chongfeng2.mdl");
                        
                    dash1=Dash.Start(u.unit,Util.XY(u.unit,m.unit),Util.XY2(u.unit,m.unit),Dash.SUB,45,true,false);
                    dash1.Obj=data;
                    dash1.onMove=function(Dash dash){
                        if(dash.Speed<12){
                            dash.Stop();
                        }
                    }; 
                    dash1.onEnd=function(Dash dash){
                        Data data=Data(dash.Obj); 
                        Units u=Units(data.c[0]);
                        Data data1;
                        Dash dash1;
                        Dash.Start(u.unit,dash.Angle,350,Dash.SUB,12,true,false);
                        Effect.ToUnit("qqqqq.mdl",data.u[0],"chest").Destroy();
                        u.AnimeSpeed(1.25);
                        u.DelayReleaseAnimePause(0.7);
                        Buffs.Add(data.u[0],'A068','B01Y',4,false); 
                        u.Damage(data.u[0],Damage.Physics,'A064',u.Agi(true)*5); 
                        Buffs.Skill(data.u[0],'A00W',1);
                        data1=Data.create('A064');
                        data1.g[0]=CreateGroup();
                        data1.c[0]=u;
                        HitFlys.Add(data.u[0],17);
                        dash1=Dash.Start(data.u[0],dash.Angle,800,Dash.SUB,40,true,true);
                        dash1.Obj=data1;
                        dash1.onMove=function(Dash dash){
                            Data data=Data(dash.Obj);
                            Units u=Units(data.c[0]);
                            Units mj;
                            GroupEnumUnitsInRange(tmp_group,dash.X,dash.Y,110,function GroupIsAliveNotAloc);     
                            while(FirstOfGroup(tmp_group)!=null){
                                mj=Units.Get(FirstOfGroup(tmp_group));
                                GroupRemoveUnit(tmp_group,mj.unit);
                                if(IsUnitEnemy(mj.unit,u.player.player)==true&&IsUnitInGroup(mj.unit,data.g[0])==false){    
                                    GroupAddUnit(data.g[0],mj.unit);
                                    u.Damage(mj.unit,Damage.Physics,'A064',u.Agi(true)*3);  
                                    Dash.Start(mj.unit,Util.XY(dash.Unit,mj.unit),350,Dash.SUB,25,true,false);  
                                    Effect.ToUnit("qqqqq.mdl",mj.unit,"chest").Destroy(); 
                                }
                            }
                            GroupClear(tmp_group); 
                        };
                        dash1.onEnd=function(Dash dash){
                            Data data=Data(dash.Obj);
                            DestroyGroup(data.g[0]);
                            data.g[0]=null;
                            data.Destroy();
                        };
                        data.u[0]=null;
                        data.Destroy();
                    };
                };
                k=null;
            }
        }

        //突然反转-受到伤害后判断累计伤害是否超过60%
        static method Damage(DamageArgs e){
            Data data;
            Buffs b;
            if(e.TriggerUnit.IsAbility('B01W')==true){
                b=Buffs.Find(e.TriggerUnit.unit,'B01W');
                data=Data(b.Obj);
                data.r[0]+=e.Damage;
                if(data.r[0]>=e.TriggerUnit.MaxHP()*0.6){
                    if(data.i[0]==0){
                        data.i[0]=1;
                        UnitRemoveAbility(e.TriggerUnit.unit, 'BPSE' );  
                        RuaText(e.TriggerUnit.unit,"？ ？？ ？？？",10,2,1,45,0,0.02);
                        RuaText(e.DamageUnit.unit,"！！！！！",10,2,1,45,0,0.02);
                        Units.MJ(e.TriggerUnit.player.player,'e008','A065',0,e.TriggerUnit.X(),e.TriggerUnit.Y(),0,2,1,1,"stand","az-blue-lizi-shangsheng_ex.mdl");
                        Buffs.Add(e.TriggerUnit.unit,'A067','B01X',4,false);
                    }
                }
            }
            if(e.DamageType==Damage.Attack){ 
                if(e.DamageUnit.IsAbility('A064')==true){
                    if(e.DamageUnit.player.lv15!=null){
                        Zg.R4(e.DamageUnit,e.TriggerUnit);
                    }
                }
            }
        }

        //突然反转-受到眩晕后开始计算2秒内累计伤害，重复被眩晕不会重新计算
        static method R2(unit ua,integer aid){
            Data data;
            Units u=Units.Get(ua);
            Buffs b;
            if(u.IsAbility('A064')==true){
                if(u.player.lv15!=null){
                    if(aid=='A00C'||aid=='A00A'||aid=='A00W'||aid=='A00F'){
                        if(u.IsAbility('B01W')==false){
                            data=Data.create('A064');
                            data.r[0]=0;
                            b=Buffs.Add(u.unit,'A066','B01W',2,false);
                            b.Obj=data;
                            b.onEnd=function(Buffs b){
                                Data data=Data(b.Obj);
                                data.Destroy();
                            };
                        } 
                    }
                }
            }
        }

        //突然贫血
        static method R1(Units u){
            real r; 
            if(u.player.lv15!=null){
                r=GetRandomReal(0,1); 
                if(r<=0.05){
                    RuaText(u.unit,"？？？",10,2,1,45,0,0.02);
                    Buffs.Skill(u.unit,'A00W',1);         
                }
            } 
        }

        static method R(Spell e){
            Units u=Units.Get(e.Spell); 
            Buffs b;
            u.Pause(true);
            u.Pause(false);
            b=Buffs.Add(u.unit,'A065','B01V',10,false);
            b.Obj=e;
            b.onEnd=function(Buffs b){
                Spell(b.Obj).Destroy();
                Zg.R1(Units.Get(b.Unit));
            };
            Units.MJ(u.player.player,'e008','A065',0,u.X(),u.Y(),0,2,1,1,"stand","az-blue-lizi-shangsheng.mdl");
            if(u.GetAbilityCD('A062')!=0){
                u.SetAbilityCD('A062',0);
            }
            if(u.GetAbilityCD('A061')!=0){
                u.SetAbilityCD('A061',0);
            }
        }

        static method E(Spell e){
            Units u=Units.Get(e.Spell);
            Data data;
            real x=u.X(),y=u.Y(),f=u.F(),f1;
            unit k;
            HitFlys h;
            Units mj;
            Dash dash; 
            u.SetAbilityCD('A061',0);
            k=GroupFind(u.unit,x+70*CosBJ(f+180),y+70*SinBJ(f+180),85,true,false);
            if(k!=null){
                data=Data.create('A062');
                u.Pause(true);
                u.AnimeId(26);
                u.AnimeSpeed(2.3);
                data.c[0]=u;
                data.c[1]=e; 
                Buffs.Skill(k,'A00F',1);
                if(u.GetAbilityCD('A05X')!=0){ 
                    u.SetAbilityCD('A05X',u.GetAbilityCD('A05X')*0.6);
                }
                f1=Util.XYEX(GetUnitX(k),GetUnitY(k),x+250*CosBJ(f),y+250*SinBJ(f));
                mj=Units.MJ(u.player.player,'e008','A062',0,x,y,f+180,2,1.5,1.25,"stand","dingzhi_by_wood_effect_blood_biaoxue_2.mdl");
                if(e.State!=Spell.SpellState){
                    Effect.ToUnit("qqqqq.mdl",k,"chest").Destroy();
                    mj.Model(".mdl");
                }
                dash=Dash.Start(k,f1,300,Dash.ADD,40,true,false);
                dash.Obj=mj;
                dash.onMove=function(Dash dash){
                    Units mj=Units(dash.Obj);
                    Units u=Units.Get(dash.Unit);
                    mj.Position(dash.X,dash.Y,false);
                    mj.SetH(u.H());
                };
                h=HitFlys.Add(k,20);
                h.Obj=u;
                HitFlys.Lister(h,HitFlys.onEnd,function(HitFlys h){
                    Units u=Units(h.Obj);
                    Units m=Units.Get(h.Unit);
                    real x=m.X(),y=m.Y();
                    HitFlys hh;
                    Units mj;
                    Buffs.Skill(m.unit,'A00F',1); 
                    GroupEnumUnitsInRange(tmp_group,x,y,150,function GroupIsAliveNotAloc);     
                    while(FirstOfGroup(tmp_group)!=null){
                        mj=Units.Get(FirstOfGroup(tmp_group));
                        GroupRemoveUnit(tmp_group,mj.unit);
                        if(IsUnitEnemy(mj.unit,u.player.player)==true&&mj.unit!=m.unit){  
                            u.Damage(mj.unit,Damage.Physics,'A062',u.Agi(true)*6);  
                            Dash.Start(mj.unit,Util.XYEX(x,y,mj.X(),mj.Y()),300,Dash.SUB,15,true,false);
                            Effect.ToUnit("qqqqq.mdl",mj.unit,"chest").Destroy();
                        }
                    } 
                    GroupClear(tmp_group); 
                    u.Damage(m.unit,Damage.Physics,'A062',u.Agi(true)*12);  
                    Util.Duang(x,y,0.5,150,150,-96,0.02,50);
                    Units.MJ(u.player.player,'e008','A062',0,x,y,0,2,1.3,1,"stand","warstompcaster.mdl").SetH(150);
                    Units.MJ(u.player.player,'e008','A062',0,x,y,0,2,1.3,1,"stand","white-qiquan-new.mdl").SetH(150);
                    Dash.Start(m.unit,Util.XY(u.unit,m.unit),400,Dash.SUB,25,true,false); 
                    Effect.ToUnit("hit-juhuang-lizi.mdl",m.unit,"chest").Destroy();
                    hh=HitFlys.Add(m.unit,45);
                    hh.Obj=u;
                    HitFlys.Lister(hh,HitFlys.onEnd,function(HitFlys h){
                        Timers.Start(0.01,Units.Get(h.Unit),function(Timers t){
                            Units u=Units(t.Data());
                            HitFlys.Add(u.unit,30);
                            t.Destroy();
                        });
                    });
                });
                h=HitFlys.Add(u.unit,15);
                Dash.Start(u.unit,f1,75,Dash.SUB,10,true,false);
                h.Obj=data;
                HitFlys.Lister(h,HitFlys.onEnd,function(HitFlys h){
                    Data data=Data(h.Obj);
                    Units u=Units(data.c[0]);
                    u.DelayReleaseAnimePause(0.23);
                    Zg.R1(u);
                    Spell(data.c[1]).Destroy();
                    data.Destroy();
                });
                k=null;
            }else{
                Zg.R1(u);
                e.Destroy();
            } 
        }

        static method W(Spell e){
            Units u=Units.Get(e.Spell);
            Data data=Data.create('A061'); 
            u.Pause(true);
            u.AnimeId(13);
            u.AnimeSpeed(2);
            data.c[0]=u;
            data.c[1]=e;
            data.r[0]=0.26;
            Timers.Start(0.01,data,function(Timers t){
                Data data=Data(t.Data());
                Units u=Units(data.c[0]);
                Dash dash;
                real x,y,f;
                if(data.r[0]<=0){
                    if(u.Alive()==true){
                        u.AnimeSpeed(0); 
                        u.Alpha(255);
                        x=u.X();
                        y=u.Y();
                        f=Spell(data.c[1]).Angle;
                        Util.Duang(x,y,0.5,100,100,-36,0.02,50);
                        Units.MJ(u.player.player,'e008','A061',0,x,y,f,1,1.1,2,"stand","chongfeng2.mdl").SetH(50);
                        Units.MJ(u.player.player,'e008','A061',0,x,y,Spell(data.c[1]).Angle,2,0.5,1.25,"stand","white-qiquan.mdl").SetH(50);
                        dash=Dash.Start(u.unit,Spell(data.c[1]).Angle,600,Dash.SUB,45,true,false);
                        dash.Obj=data;
                        dash.onMove=function(Dash dash){
                            Data data=Data(dash.Obj);
                            Units u=Units(data.c[0]);
                            unit k=null;
                            Dash dash1;
                            real dis;
                            if(dash.Speed>5){
                                k=GroupFind(u.unit,dash.X+50*CosBJ(dash.Angle),dash.Y+50*SinBJ(dash.Angle),70,true,false);
                                if(k!=null){
                                    dis=Util.XY2(u.unit,k)+75;
                                    data.u[0]=k;
                                    k=null;
                                    dash.Stop(); 
                                    u.Pause(true);
                                    u.AnimeSpeed(1.5);  
                                    dash1=Dash.Start(u.unit,dash.Angle,dis,Dash.NORMAL,dis/10,true,false);
                                    dash1.onEnd=function(Dash dash){
                                        Units u=Units.Get(dash.Unit);  
                                        u.AnimeSpeed(1);
                                        u.Pause(false);
                                        Buffs.Add(u.unit,'A063','B01U',0.3,false);
                                        if(u.player.press.W==true){
                                            u.SetF(dash.Angle+180,true);
                                        }
                                        if(u.player.lv15!=null){
                                            if(u.player.press.R==false){
                                                if(GetRandomReal(0,1)<=0.5){ 
                                                    Zg.R3(u.unit);
                                                }
                                            } 
                                        }
                                    };
                                }
                            }else{
                                dash.Stop();
                            }
                        };
                        dash.onEnd=function(Dash dash){
                            Data data=Data(dash.Obj);
                            Units u=Units(data.c[0]); 
                            if(data.u[0]==null){
                                Dash.Start(u.unit,dash.Angle,200,Dash.SUB,dash.Speed,true,false);
                                u.AnimeSpeed(1);
                                u.DelayReleaseAnimePause(0.6);
                                if(u.player.lv15!=null){
                                    if(u.player.press.R==false){
                                        if(GetRandomReal(0,1)<=0.5){ 
                                            Zg.R3(u.unit);
                                        }
                                    } 
                                }
                            }else{
                                u.Pause(false);
                                data.u[0]=null;
                            }
                            Zg.R1(u); 
                            Spell(data.c[1]).Destroy();
                            data.Destroy();
                        };
                    }else{
                        u.Alpha(255);
                        u.AnimeSpeed(1);
                        u.Pause(false); 
                        Spell(data.c[1]).Destroy();
                        data.Destroy();
                    }
                    t.Destroy();
                }else{
                    if(u.IsTimeStop()==false){
                        data.r[0]-=0.01;
                        if(data.r[0]==0.25||data.r[0]==0.15||data.r[0]==0.05){
                            u.Alpha(0);
                        }
                        if(data.r[0]==0.2||data.r[0]==0.1){
                            u.Alpha(255);
                        }
                    }
                }
            });
        }

        static method Q2(Units u){
            Buffs b=Buffs.Find(u.unit,'B01T');  
            Data data=Data.create('A05X');
            b.Level=0;
            b.Stop(); 
            BJDebugMsg("触发Q2");
            u.Pause(true);
            u.AnimeId(28);
            u.AddAbility('A060'); 
            IssueImmediateOrder(u.unit,"stop"); 
            data.c[0]=u;
            data.r[0]=0.77;//一段蓄力
            data.r[1]=0.23;//小踹动作0.46
            Dash.Start(u.unit,u.F()+180,50,Dash.SUB,7,true,false);
            SpellNameText(u.unit,"自己也不清楚怎么使出的踢击",3,10);
            Timers.Start(0.01,data,function(Timers t){
                Data data=Data(t.Data());
                Units u=Units(data.c[0]);
                Units mj;
                real x=u.X(),y=u.Y(),f=u.F();
                Dash dash; 
                if(u.Alive()==false){
                    u.RemoveAbility('A060'); 
                    u.AnimeSpeed(1);
                    u.Pause(false);
                    t.Destroy();
                    data.Destroy();
                }else{
                    if(data.r[0]<=0){//小踹
                        if(data.r[1]==0.23){
                            u.AnimeSpeed(2);
                            data.r[1]-=0.01;
                            dash=Dash.Start(u.unit,f,150,Dash.SUB,10,true,false); 
                            mj=Units.MJ(u.player.player,'e009','A05X',0,x+100*CosBJ(f),y+100*SinBJ(f),f+180,1,0.7,2,"stand","white-qiquan-juhuang.mdl");
                            mj.SetH(105);  
                            mj.DelaySizeEx(0.7,1.5,0.9);
                            Dash.Start(mj.unit,f+180,150,Dash.SUB,10,true,false); 
                            dash.Obj=data;
                            dash.onMove=function(Dash dash){
                                Data data=Data(dash.Obj);
                                Units u=Units(data.c[0]);
                                unit k=null;
                                Units mj;
                                k=GroupFind(u.unit,dash.X+50*CosBJ(dash.Angle),dash.Y+50*SinBJ(dash.Angle),50,true,false);
                                if(k!=null){
                                    data.u[0]=k;
                                    dash.Stop();
                                    GroupEnumUnitsInRange(tmp_group,GetUnitX(k),GetUnitY(k),100,function GroupIsAliveNotAloc);     
                                    while(FirstOfGroup(tmp_group)!=null){
                                        mj=Units.Get(FirstOfGroup(tmp_group));
                                        GroupRemoveUnit(tmp_group,mj.unit);
                                        if(IsUnitEnemy(mj.unit,u.player.player)==true){  
                                            u.Damage(mj.unit,Damage.Physics,'A05X',u.Agi(true)*2); 
                                            Buffs.Skill(mj.unit,'A00W',1); 
                                            Effect.ToUnit("qqqqq.mdl",mj.unit,"chest").Destroy(); 
                                        }
                                    }
                                    GroupClear(tmp_group); 
                                    u.Pause(true);
                                    data=Data.create('A05X');
                                    data.c[0]=u;
                                    data.r[0]=0.23; 
                                    Timers.Start(0.01,data,function(Timers t){
                                        Data data=Data(t.Data());
                                        Units u=Units(data.c[0]);
                                        Units mj;
                                        real x,y,f;
                                        Dash dash;
                                        HitFlys h;
                                        if(u.Alive()==false){
                                            u.RemoveAbility('A060');
                                            u.AnimeSpeed(1);
                                            u.Pause(false);
                                            t.Destroy();
                                            data.Destroy();
                                        }else{
                                            if(data.r[0]<=0){ 
                                                x=u.X();
                                                y=u.Y();
                                                f=u.F();
                                                u.AnimeId(29);
                                                mj=Units.MJ(u.player.player,'e008','A05X',0,x,y,f,1,u.modelsize,1,"stand",u.model);
                                                mj.AnimeId(29);
                                                mj.DelayAlpha(255,0,0.8);  
                                                Units.MJ(u.player.player,'e00N','A05X',0,x+100*CosBJ(f),y+100*SinBJ(f),f,1,0.75,1.25,"stand","cf2.mdl").SetH(125);  
                                                GroupEnumUnitsInRange(tmp_group,x+125*CosBJ(f),y+125*SinBJ(f),125,function GroupIsAliveNotAloc);     
                                                while(FirstOfGroup(tmp_group)!=null){
                                                    mj=Units.Get(FirstOfGroup(tmp_group));
                                                    GroupRemoveUnit(tmp_group,mj.unit);
                                                    if(IsUnitEnemy(mj.unit,u.player.player)==true){ 
                                                        u.Damage(mj.unit,Damage.Physics,'A05X',u.Agi(true)*2); 
                                                        Buffs.Skill(mj.unit,'A00W',1); 
                                                        Effect.ToUnit("qqqqq.mdl",mj.unit,"chest").Destroy(); 
                                                        HitFlys.Add(mj.unit,35);
                                                        Dash.Start(mj.unit,f,550,Dash.SUB,30,true,false);
                                                    }
                                                }
                                                GroupClear(tmp_group); 
                                                Dash.Start(u.unit,f,550,Dash.SUB,30,true,false).onMove=function(Dash dash){
                                                    Units u=Units.Get(dash.Unit); 
                                                    if(dash.NowDis>120&&dash.NowDis<160){
                                                        u.Alpha(0);
                                                        Effect.ToUnit("blink_blue.mdl",u.unit,"origin").Destroy();
                                                    } 
                                                };
                                                h=HitFlys.Add(u.unit,40);
                                                HitFlys.Lister(h,HitFlys.onDown,function(HitFlys h){
                                                    Units u=Units.Get(h.Unit);
                                                    Units mj;
                                                    integer i=0;
                                                    real f=u.F();
                                                    real x=u.X()+125*CosBJ(f),y=u.Y()+125*SinBJ(f);
                                                    u.Alpha(255);
                                                    if(u.Alive()==true){ 
                                                        u.AnimeId(30);
                                                        u.AnimeSpeed(1.75);
                                                        u.DelayAnimeSpeed(0.5,0.3);
                                                        GroupEnumUnitsInRange(tmp_group,x,y,150,function GroupIsAliveNotAloc);     
                                                        while(FirstOfGroup(tmp_group)!=null){
                                                            mj=Units.Get(FirstOfGroup(tmp_group));
                                                            GroupRemoveUnit(tmp_group,mj.unit);
                                                            if(IsUnitEnemy(mj.unit,u.player.player)==true){ 
                                                                if(mj.H()>600){
                                                                    u.Damage(mj.unit,Damage.Physics,'A05X',u.Agi(true)*5); 
                                                                    Buffs.Skill(mj.unit,'A00F',1); 
                                                                    Effect.ToUnit("hit-juhuang-lizi.mdl",mj.unit,"chest").Destroy(); 
                                                                    HitFlys.Reset(mj.unit);
                                                                    HitFlys.Add(mj.unit,-40); 
                                                                    i=1;
                                                                } 
                                                            }
                                                        }
                                                        GroupClear(tmp_group); 
                                                        if(i==1){ 
                                                            HitFlys.Reset(u.unit);
                                                            HitFlys.Add(u.unit,25);
                                                            Dash.Start(u.unit,f+180,200,Dash.SUB,10,true,false);
                                                            mj=Units.MJ(u.player.player,'e008','A05X',0,x,y,f,2,2,0.8,"stand","warstompcaster.mdl");
                                                            mj.SetH(u.H()-50);
                                                            HitFlys.Add(mj.unit,-40); 
                                                            mj=Units.MJ(u.player.player,'e008','A05X',0,x,y,f,2.5,1,0.7,"stand","white-qiquan-juhuang.mdl");
                                                            mj.SetH(u.H()-50);  
                                                        }
                                                    }
                                                });
                                                HitFlys.Lister(h,HitFlys.onEnd,function(HitFlys h){
                                                    Units u=Units.Get(h.Unit);
                                                    Zg.R1(u);
                                                    u.RemoveAbility('A060'); 
                                                    u.AnimeSpeed(1);
                                                    u.Pause(false);
                                                });
                                                t.Destroy(); 
                                                data.Destroy();
                                            }else{
                                                if(u.IsTimeStop()==false){
                                                    data.r[0]-=0.01;
                                                }
                                            }
                                        }
                                    });
                                    k=null;
                                }
                            };
                            dash.onEnd=function(Dash dash){
                                Data data=Data(dash.Obj);
                                Units u=Units(data.c[0]);
                                if(data.u[0]==null){
                                    Zg.R1(u);
                                    u.RemoveAbility('A060');
                                    u.AnimeSpeed(1);
                                }else{
                                    data.u[0]=null;
                                } 
                                u.Pause(false);
                                data.Destroy();
                            };
                            t.Destroy();
                        }
                    }else{
                        if(u.IsTimeStop()==false){//蓄力中
                            data.r[0]-=0.01; 
                            if(ModuloReal(data.r[0],0.1)==0.1){
                                mj=Units.MJ(u.player.player,'e008','A05X',0,x,y,f,0.6,0.3,1,"stand","white-qiquan.mdl");  
                            }
                        }
                    }
                }
            });
        }

        static method Q(Spell e){
            Units u=Units.Get(e.Spell);
            Data data=Data.create('A05X');
            Dash dash;
            Units mj;
            real x=u.X(),y=u.Y(); 
            data.c[0]=u;
            data.c[1]=e;
            u.Pause(true);
            u.AnimeId(24);
            u.AddAbility('A05Y');  
            Util.Duang(x,y,0.5,100,100,-36,0.02,50);
            mj=Units.MJ(u.player.player,'e008','A05X',0,x,y,e.Angle,2,0.65,1.35,"stand","dust2.mdl");
            mj.DelayAnimeSpeed(0.7,0.5);  
            Dash.Start(mj.unit,e.Angle,150,Dash.SUB,30,true,false);
            mj=Units.MJ(u.player.player,'e008','A05X',0,x,y,0,0.5,1.5,1.5,"birth","az_lxj_blue_ex.mdl");
            mj.SetH(100); 
            data.c[2]=mj;
            mj=Units.MJ(u.player.player,'e008','A05X',0,x,y,e.Angle,0.6,1,1.25,"stand","dg7.mdl"); 
            mj.AnimeId(4);
            data.c[3]=mj; 
            data.g[0]=CreateGroup();
            dash=Dash.Start(u.unit,e.Angle,400,Dash.SUB,50,true,false);
            dash.Obj=data; 
            dash.onMove=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units(data.c[0]);
                Units mj=Units(data.c[2]);
                Units ts;
                if(dash.Speed>15){  
                    mj.Position(dash.X,dash.Y,false);
                    mj=Units(data.c[3]); 
                    mj.Position(dash.X,dash.Y,false);
                    GroupEnumUnitsInRange(tmp_group,dash.X+125*CosBJ(dash.Angle),dash.Y+125*SinBJ(dash.Angle),150,function GroupIsAliveNotAloc);     
                    while(FirstOfGroup(tmp_group)!=null){
                        mj=Units.Get(FirstOfGroup(tmp_group));
                        GroupRemoveUnit(tmp_group,mj.unit);
                        if(IsUnitEnemy(mj.unit,u.player.player)==true&&IsUnitInGroup(mj.unit,data.g[0])==false){    
                            GroupAddUnit(data.g[0],mj.unit);
                            u.Damage(mj.unit,Damage.Physics,'A05X',u.Agi(true)*2); 
                            Buffs.Skill(mj.unit,'A00W',1);
                            Dash.Start(mj.unit,dash.Angle,50+(dash.MaxDis-dash.NowDis),Dash.SUB,25,true,false); 
                            ts=Units.MJ(u.player.player,'e008','A05X',0,mj.X(),mj.Y(),dash.Angle,2.5,1,1,"stand", "blood-2.mdl");
                            ts.DelayAlpha(255,0,1.99);
                            Effect.ToUnit("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",mj.unit,"chest").Destroy();
                                        
                        }
                    }
                    GroupClear(tmp_group); 
                }
            };
            dash.onEnd=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units(data.c[0]);
                Buffs.Add(u.unit,'A05Z','B01T',5,false);
                Timers.Start(0.2,u,function(Timers t){
                    Units u=Units(t.Data());
                    u.RemoveAbility('A05Y');
                    t.Destroy();
                });
                Dash.Start(u.unit,dash.Angle,150,Dash.SUB,dash.Speed,true,false);
                u.Pause(false);
                DestroyGroup(data.g[0]);
                data.g[0]=null;
                Zg.R1(u);
                Spell(data.c[1]).Destroy(); 
                data.Destroy();
            };
        }

        static method Press(player ps,string k){
            Players p=Players.Get(ps);
            if(k=="Q"){ 
                if(p.hero.IsAbility('B01T')==true&&p.hero.IsAbility('BPSE')==false&&p.hero.IsPause()==false){
                    if(Buffs.Find(p.hero.unit,'B01T').Level==1){ 
                        Zg.Q2(p.hero);
                    }
                }
            } 
        } 

        static method HERO_START(Spell e){
            Units u=Units.Get(e.Spell);
            Dash dash;  
            Units ts,ts1;
            integer i;
            if(e.Id=='A05X'){
                if(u.IsAbility('B01T')==false){
                    if(u.IsAbility('B01U')==true){
                        SpellText(u.unit,e.Id,3,10);
                        u.SetAbilityCD('A05X',10);
                        u.SetMP(u.MP()-50);
                        Zg.Q(e);
                    }else{
                        u.FlushAnimeId(27);
                        e.Destroy();
                    }
                }else{ 
                    IssueImmediateOrder(u.unit,"stop"); 
                    Zg.Press(u.player.player,"Q");
                } 
            }
            if(e.Id=='A061'){
                u.SetF(e.Angle,true);
                e.Destroy();
            }
            if(e.Id=='A062'){
                if(u.IsAbility('B01U')==true){ 
                    SpellText(u.unit,e.Id,3,10);
                    u.SetAbilityCD('A062',15);
                    u.SetMP(u.MP()-150);
                    Zg.E(e);
                }else{ 
                    u.FlushAnimeId(25);
                    Dash.Start(u.unit,e.Angle+180,70,Dash.SUB,6,true,false);
                    e.Destroy();
                }
            } 
            if(e.Id=='A069'){
                u.AddAbility('A06A');
                u.FlushAnimeId(18); 
                dash=Dash.Start(u.unit,e.Angle+180,250,Dash.SUB,4,true,false);
                dash.onMove=function(Dash dash){
                    Units ts;
                    Units u=Units.Get(dash.Unit);
                    if(u.IsAbility('A06A')==true){
                        if(dash.NowDis>70){
                            if(dash.Obj==0){
                                dash.Obj=1;
                                ts=Units.MJ(u.player.player,'e008','A069',0,dash.X+100*CosBJ(dash.Angle+180),dash.Y+100*SinBJ(dash.Angle+180),0,0.5,1.5,1.5,"birth","az_lxj_blue_ex.mdl");
                                ts.SetH(115);
                                Dash.Start(ts.unit,dash.Angle,150,Dash.NORMAL,30,true,false);
                            }
                        }
                    }else{
                        dash.Stop();
                    }                    
                };
                //第一个残影
                ts=Units.MJ(u.player.player,'e008','A069',0,u.X(),u.Y(),u.F(),2,u.modelsize,1,"stand",u.model);
                ts.AnimeId(18);
                ts.Alpha(0); 
                Timers.Start(0.08,ts,function(Timers t){
                    Units ts=Units(t.Data());
                    Units u=ts.player.hero;
                    if(u.Alive()==true&&u.IsAbility('A06A')==true){
                        if(ts.Obj!=0){
                            ts.Position(u.X(),u.Y(),false);
                            ts.SetF(u.F(),true);
                            ts.DelayAlpha(255,0,0.4);
                            ts.Life(0.4);
                            ts.SetH(u.H());
                            t.SetData(ts.Obj);
                        } 
                    }else{
                        t.Destroy();
                    }
                });
                // 
                for(1<=i<5){
                    ts1=Units.MJ(u.player.player,'e008','A069',i,u.X(),u.Y(),u.F(),2,u.modelsize,1,"stand",u.model);
                    ts1.AnimeId(18);
                    ts1.Alpha(0);
                    ts.Obj=ts1;  
                    ts=ts1;
                }
                e.Destroy();
            }
            
        }

        static method HERO_STOP(Spell e){
            if(e.Id=='A069'){
                Units.Get(e.Spell).RemoveAbility('A06A');
            }
            e.Destroy();
        }
 
        static method Order(EventArgs e){
            Units u=Units.Get(e.TriggerUnit);
            real f; 
            if(u.IsAbility('B01X')==true&&e.OrderId!=851973){ 
                if(e.OrderTargetUnit==null){ 
                    f=Util.XYEX(u.X(),u.Y(),e.OrderTargetX,e.OrderTargetY);
                }else{
                    f=Util.XY(u.unit,e.OrderTargetUnit);
                } 
                u.SetF(f,true);
            } 
                  
        }

        static method onInit(){  
            Damage.On(Damage.onUnitDamage_EndDamage,Zg.Damage); 
            Press.OnSnyc(Press.onSnycPressKeyDown,Zg.Press);
            Buffs.On(Buffs.onUnitSkill,Zg.R2); 
            Events.On(Events.onUnitOrderToUnit,Zg.Order);
            Events.On(Events.onUnitOrderToLocation,Zg.Order); 
            Spell.On(Spell.onReady,'A05X',Zg.HERO_START); 
            Spell.On(Spell.onReady,'A061',Zg.HERO_START); 
            Spell.On(Spell.onReady,'A062',Zg.HERO_START); 
            Spell.On(Spell.onReady,'A069',Zg.HERO_START); 
            Spell.On(Spell.onStop,'A069',Zg.HERO_STOP); 
            Spell.On(Spell.onSpell,'A061',Zg.W);
            Spell.On(Spell.onSpell,'A05X',Zg.Q);
            Spell.On(Spell.onSpell,'A062',Zg.E);
            Spell.On(Spell.onSpell,'A064',Zg.R);
            Spell.On(Spell.onSpell,'A069',Zg.D);
        }
    }
} 