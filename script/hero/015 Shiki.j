library Shiki requires Groups{
    //英雄‘极死·七夜’的技能
    //SR
    /*  35 屈腿 0.4秒
        16 踢腿
        17 上翻 0.433秒 
        20 空踢 
        36 空踢（无前摇-无高度）
        38 上翻 0.433秒 无高度
        39 空踢 无高度
        6 划小刀
        13 划小刀后撤
        12 划小刀突刺
        21 后跳 1.567秒
        2 后跳反击
        22 关灯杀跳跃 1.4秒
        23 关灯杀跳跃收尾 
        10 关灯杀前摇
        37 扭脖子前摇
        41 扭脖子前摇残影
        42 扭脖子扔刀残影
        43 扭脖子冲刺残影
        34 扭脖子处决
        33 扭脖子冲刺*/
    struct Shiki{ 
        
        static method D(Spell e){
            Units u=Units.Get(e.Spell);
            Dash dash;
            Buffs b;
            Units ts;
            
            dash.mdl
        }

        static method R(Spell e){
            Units u=Units.Get(e.Spell);
            Data data=Data.create('A05O');
            Units ts,ts1;
            Dash dash;
            Buffs b;
            integer i;
            u.Pause(true);
            u.AnimeId(22); 
            IssueImmediateOrder(u.unit,"stop"); 
            CinematicFadeBJ( bj_CINEFADETYPE_FADEOUTIN, 1.6, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 0, 0, 0, 25 );
            //Q2残影 A05P B01M
            b=Buffs.Add(u.unit,'A05P','B01M',1.4,false);
            ts=Units.MJ(u.player.player,'e008','A05O',0,u.X(),u.Y(),u.F(),2,u.modelsize,1,"stand",u.model);
            ts.AnimeId(22);
            ts.Alpha(0);
            data.c[0]=u;
            data.c[1]=ts;
            b.Obj=data;
            b.onEnd=function(Buffs b){
                Data data=Data(b.Obj);
                Units u=Units(data.c[0]);
                Units ts=Units(data.c[1]);  
                HitFlys.Remove(ts.unit);
                if(b.Level==0){ 
                    ts.Position(u.X(),u.Y(),false);
                    ts.SetF(u.F(),true); 
                    ts.SetH(u.H());
                    Effect.ToUnit("blackblink.mdl",ts.unit,"origin").Destroy();
                    ts.AnimeSpeed(0);
                    ts.DelayAlpha(255,0,0.5);
                }
                ts.Life(1);
                data.Destroy();
            };
            // 
            data=Data.create('A05O');
            data.c[0]=u;
            data.c[1]=e; 
            data.r[0]=1.4;//无效属性
            data.r[1]=0;//(0.02s)残影帧  
            data.u[0]=null;//目标
            data.u[1]=ts.unit;//高度辅助
            data.i[0]=0;//起跳判定
            //第一个残影
            ts=Units.MJ(u.player.player,'e008','A05O',0,u.X(),u.Y(),u.F(),2,u.modelsize,1,"stand",u.model);
            ts.AnimeId(22);
            ts.Alpha(0); 
            //
            data.c[2]=ts;//技能残影
            for(1<=i<28){
                ts1=Units.MJ(u.player.player,'e008','A05O',i,u.X(),u.Y(),u.F(),2,u.modelsize,1,"stand",u.model);
                ts1.AnimeId(22);
                ts1.Alpha(0);
                ts.Obj=ts1;  
                ts=ts1;
            }
            //第二个残影
            ts=Units.MJ(u.player.player,'e008','A05O',0,u.X(),u.Y(),u.F(),2,u.modelsize,1,"stand",u.model);
            ts.AnimeId(22);
            ts.Alpha(0); 
            //
            data.c[3]=ts;//技能残影-地面
            for(1<=i<28){
                ts1=Units.MJ(u.player.player,'e008','A05O',i,u.X(),u.Y(),u.F(),2,u.modelsize,1,"stand",u.model);
                ts1.AnimeId(22);
                ts1.Alpha(0);
                ts.Obj=ts1;  
                ts=ts1;
            } 
            Units.MJ(u.player.player,'e008','A05O',0,u.X(),u.Y(),0,1,0.8,1.25,"stand","white-qiquan.mdl");
            //Dash.Start(u.unit,e.Angle+180,200,Dash.SUB,4.28,true,false);
            dash=Dash.Start(u.unit,e.Angle,600,Dash.NORMAL,4.28,true,false);
            dash.Obj=data;
            dash.onMove=function(Dash dash){ 
                Data data=Data(dash.Obj); 
                Units u=Units(data.c[0]);
                Units ts=Units.Get(data.u[1]);
                Units cy=Units(data.c[2]);
                Units cys=Units(data.c[3]);
                unit k;
                real x=u.X(),y=u.Y();
                if(u.IsAbility('B01M')==false){
                    dash.Stop();
                }else{ 
                    if(data.r[1]==0){
                        data.r[1]=0.04;
                        if(dash.NowDis>200){ 
                            if(data.i[0]==0){
                                data.i[0]=1; 
                                HitFlys.Add(data.u[1],15).LocalPower=0.35;
                            }
                            if(cy.Obj!=0){
                                cy.Alpha(191);
                                cy.Position(x,y,false);
                                cy.SetF(u.F(),true);
                                cy.SetH(ts.H());
                                cy.AnimeSpeed(0);
                                cy.Life(0.1);
                                data.c[2]=cy.Obj;
                            }
                        }
                        if(dash.NowDis>200){ 
                            if(cys.Obj!=0){
                                cys.DelayAlpha(0,127,0.1);
                                cys.Position(x,y,false);
                                cys.SetF(u.F(),true); 
                                cys.AnimeSpeed(0);
                                cys.Life(0.11);
                                data.c[3]=cys.Obj;
                            }
                        }
                        k=GroupFind(u.unit,x+125*CosBJ(dash.Angle),y+125*SinBJ(dash.Angle),70,true,false);
                        if(k!=null){
                            data.u[0]=k;
                            dash.Stop();
                            Buffs.Add(u.unit,'A05S','B01P',0.52,false);
                            u.Pause(true);
                            u.Alpha(0); 
                            Effect.ToUnit("blackblink.mdl",u.unit,"origin").Destroy();  
                            Units.MJ(u.player.player,'e008','A05O',0,u.X(),u.Y(),u.F(),2,1,1,"stand","blackblink.mdl").SetH(ts.H());        
                            Timers.Start(0.5,data,function(Timers t){
                                Data data=Data(t.Data());
                                Units u=Units(data.c[0]);
                                Units m=Units.Get(data.u[0]);
                                Units ts;
                                Data data1;
                                Dash dash;
                                Buffs b;
                                Units mj;
                                real x,y,f=GetRandomReal(0,360); 
                                u.Pause(false);
                                u.Alpha(255);
                                if(u.IsAbility('B01P')==true&&m.Alive()==true){ 
                                    x=m.X();
                                    y=m.Y();
                                    Units.MJ(u.player.player,'e008','A05O',0,x,y,f,2,0.5,2,"stand","dark3.mdl"); 
                                    Units.MJ(u.player.player,'e008','A05O',0,x,y,f,2,1.2,1.5,"stand","by_wood_effect_yuanbanlin_sand2.mdl");
                                    Units.MJ(u.player.player,'e008','A05O',0,x,y,f,2,5,2.5,"stand","arcdirve02b1.mdl").SetH(150); 
                                    Units.MJ(u.player.player,'e008','A05O',0,x,y,f,4,3,1,"stand","blood-boom.mdl");  
                                    Units.MJ(u.player.player,'e008','A05O',0,x,y,f,4,3,1,"stand","blood-boom2.mdl"); 
                                    Util.Duang(x,y,1,350,350,-36,0.02,50);
                                    //Util.Range(x,y,350); 
                                    GroupEnumUnitsInRange(tmp_group,x,y,350,function GroupIsAliveNotAloc);     
                                    while(FirstOfGroup(tmp_group)!=null){
                                        mj=Units.Get(FirstOfGroup(tmp_group));
                                        GroupRemoveUnit(tmp_group,mj.unit);
                                        if(IsUnitEnemy(mj.unit,u.player.player)==true){    
                                            Dash.Start(mj.unit,Util.XYEX(x,y,mj.X(),mj.Y()),200,Dash.SUB,10,true,false);
                                            HitFlys.Add(mj.unit,25);
                                            Buffs.Skill(mj.unit,'A00F',1);
                                            u.Damage(mj.unit,Damage.Physics,'A05O',u.Agi(true)*17); 
                                            Effect.ToUnit("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",mj.unit,"chest").Destroy();
                                        } 
                                    } 
                                    GroupClear(tmp_group);
                                } 
                                data.u[0]=null;
                                data.u[1]=null;
                                Spell(data.c[1]).Destroy();
                                t.Destroy();
                                data.Destroy();
                                if(u.IsAbility('A05F')==false){
                                    u.Pause(true);
                                    u.AnimeId(23);
                                    ts=Units.MJ(u.player.player,'e008','A05O',0,u.X(),u.Y(),u.F(),2,u.modelsize,1,"stand",u.model);
                                    ts.AnimeId(23);
                                    ts.Alpha(0);
                                    data1=Data.create('A05O');
                                    data1.c[0]=u;
                                    data1.c[1]=ts;
                                    b=Buffs.Add(u.unit,'A05Q','B01N',0.6,false);
                                    b.Obj=data1;
                                    b.onEnd=function(Buffs b){
                                        Data data=Data(b.Obj);
                                        Units u=Units(data.c[0]);
                                        Units ts=Units(data.c[1]); 
                                        if(b.Level==0){
                                            ts.Position(u.X(),u.Y(),false);
                                            ts.SetF(u.F(),true); 
                                            Effect.ToUnit("blackblink.mdl",ts.unit,"origin").Destroy();
                                            ts.AnimeSpeed(0);
                                            ts.DelayAlpha(255,0,0.5);
                                        }
                                        ts.Life(1);
                                        data.Destroy();                        
                                    };
                                    dash=Dash.Start(u.unit,u.F(),600,Dash.SUB,40,true,false);
                                    dash.onMove=function(Dash dash){
                                        Units u=Units.Get(dash.Unit);
                                        if(u.IsAbility('B01N')==false){
                                            dash.Stop();
                                        }
                                    };
                                    dash.onEnd=function(Dash dash){
                                        Units u=Units.Get(dash.Unit);
                                        u.Pause(false); 
                                    };
                                }
                            });
                        } 
                    }else{
                        data.r[1]-=0.01;
                    }
                }
            };
            dash.onEnd=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units(data.c[0]);
                Spell e=Spell(data.c[1]);  
                Buffs b; 
                Units ts;
                u.Pause(false); 
                /*if(u.H()>0){
                    HitFlys.ResetPower(u.unit);
                }*/
                if(u.IsAbility('B01M')==true){
                    Buffs.Find(u.unit,'B01M').Stop();
                }
                if(data.u[0]==null){//没抓到人,结束技能  
                    e.Destroy();
                    data.u[1]=null;
                    data.Destroy();
                    //------------------
                    if(u.IsAbility('A05F')==false){//如果不是被Q2打断的,则有硬直
                        BJDebugMsg("关灯后摇");
                        u.Pause(true);
                        u.AnimeId(23);
                        ts=Units.MJ(u.player.player,'e008','A05O',0,u.X(),u.Y(),u.F(),2,u.modelsize,1,"stand",u.model);
                        ts.AnimeId(23);
                        ts.Alpha(0);
                        data=Data.create('A05O');
                        data.c[0]=u;
                        data.c[1]=ts;
                        b=Buffs.Add(u.unit,'A05Q','B01N',0.6,false);
                        b.Obj=data;
                        b.onEnd=function(Buffs b){
                            Data data=Data(b.Obj);
                            Units u=Units(data.c[0]);
                            Units ts=Units(data.c[1]); 
                            if(b.Level==0){
                                ts.Position(u.X(),u.Y(),false);
                                ts.SetF(u.F(),true); 
                                Effect.ToUnit("blackblink.mdl",ts.unit,"origin").Destroy();
                                ts.AnimeSpeed(0);
                                ts.DelayAlpha(255,0,0.5);
                            }
                            ts.Life(1);
                            data.Destroy();                        
                        };
                        dash=Dash.Start(u.unit,u.F(),300,Dash.SUB,15,true,false);
                        dash.onMove=function(Dash dash){
                            Units u=Units.Get(dash.Unit);
                            if(u.IsAbility('B01N')==false){
                                dash.Stop();
                            }
                        };
                        dash.onEnd=function(Dash dash){
                            Units u=Units.Get(dash.Unit);
                            u.Pause(false); 
                        };
                    }
                } 
            };

        }

        static method SubDamage(DamageArgs e){
            if(e.TriggerUnit.IsAbility('B01J')==true||e.TriggerUnit.IsAbility('B01L')==true||e.TriggerUnit.IsAbility('B01M')==true||e.TriggerUnit.IsAbility('B01P')==true){
                e.Damage=0;
            }
        }

        static method Damage(DamageArgs e){
            Units m;
            Buffs b;
            if(e.TriggerUnit.IsAbility('B01J')==true){ 
                b=Buffs.Find(e.TriggerUnit.unit,'B01J');
                if(b.Level==1){//未打断时可触发
                    b.Level=2;
                    Data(b.Obj).c[3]=e.DamageUnit;
                    b.Stop(); 
                }
               
            }
        } 

        //A05M B01K
        static method E1(Units u,Units m){
            Data data=Data.create('A05K');
            Buffs b; 
            Units ts;
            real x=m.X(),y=m.Y(),f=m.F();
            data.c[0]=u;
            data.c[1]=m;
            u.Pause(true);
            u.AnimeId(2);
            u.AnimeSpeed(2);
            ts=Units.MJ(u.player.player,'e008','A05K',0,u.X(),u.Y(),u.F(),10,u.modelsize,1,"stand",u.model);
            ts.AnimeId(2);
            ts.Alpha(0);
            ts.AnimeSpeed(2);
            data.c[2]=ts;
            b=Buffs.Add(u.unit,'A05M','B01K',0.5,false);
            b.Obj=data;
            b.onEnd=function(Buffs b){
                Data data=Data(b.Obj);
                Units u=Units(data.c[0]);
                Units ts=Units(data.c[2]);
                u.Pause(false);
                u.AnimeSpeed(1);
                if(b.Level==0){
                    ts.Position(u.X(),u.Y(),false);
                    ts.SetF(u.F(),true); 
                    Effect.ToUnit("blackblink.mdl",ts.unit,"origin").Destroy();
                    ts.AnimeSpeed(0);
                    ts.DelayAlpha(255,0,0.5);
                }
                ts.Life(1);
                data.Destroy();
            };
            u.Position(x+50*CosBJ(f+180),y+50*SinBJ(f+180),false);
            u.SetF(f,true);
            Buffs.Skill(m.unit,'A00F',1); 
            u.Damage(m.unit,Damage.Physics,'A05K',u.Agi(true)*10); 
            Buffs.Add(u.unit,'A05N','B01L',2,false);
            Dash.Start(m.unit,f,100,Dash.SUB,30,true,false);  
            ts=Units.MJ(u.player.player,'e008','A05K',0,m.X(),m.Y(),f,2,1.5,1,"stand","dingzhi_by_wood_effect_blood_biaoxue_2.mdl");
            ts.SetH(115);
            Dash.Start(ts.unit,f,100,Dash.SUB,30,true,false);
            Effect.ToUnit("az_hit-red-blade.mdl",m.unit,"chest").Destroy();
            Effect.ToUnit("az-blood-hit.mdl",m.unit,"chest").Destroy();
            ts=Units.MJ(u.player.player,'e008','A05K',0,x+300*CosBJ(f+180),y+300*SinBJ(f+180),f,1,1,1,"birth","az_lxj_blue_ex.mdl");
            ts.SetH(115);
            Dash.Start(ts.unit,f,350,Dash.NORMAL,30,true,false);
            
        }

        static method E(Spell e){
            //A05L B01J
            Units u=Units.Get(e.Spell);
            Buffs b;
            Data data=Data.create('A05K');
            Units ts;
            u.Pause(true);
            u.AnimeId(21);
            u.AnimeSpeed(1.1);
            data.c[0]=u;
            data.c[1]=e;
            ts=Units.MJ(u.player.player,'e008','A05G',0,u.X(),u.Y(),u.F(),10,u.modelsize,1,"stand",u.model);
            ts.AnimeId(21);
            ts.Alpha(0);
            ts.AnimeSpeed(1.1);
            data.c[2]=ts;
            Dash.Start(u.unit,u.F()+180,600,Dash.SUB,20,true,false).onMove=function(Dash dash){
                Units u=Units.Get(dash.Unit);
                Spell e;
                if(u.IsAbility('B01J')==false){
                    dash.Stop();
                }else{
                    if(dash.Speed<2.8){
                        if(u.player.press.R==true&&u.GetAbilityCD('A05O')==0){
                            Buffs.Find(u.unit,'B01J').Stop();
                            u.SetAbilityCD('A05O',20);
                            e=Spell.UseSpell(u.unit,'A05O',Spell.SpellState);
                            e.Angle=u.F();
                            Shiki.R(e);

                        }
                    }
                }
            };
            b=Buffs.Add(u.unit,'A05L','B01J',1.3,false);
            b.Obj=data;
            b.onEnd=function(Buffs b){
                Data data=Data(b.Obj);
                Units u=Units(data.c[0]);
                Units ts=Units(data.c[2]);
                Units new;
                Units m;
                Data data1;
                u.AnimeSpeed(1);
                u.Pause(false);
                if(b.Level==0||b.Level==2){//等于0或2表示是被打断/触发的，都会出残影
                    ts.Position(u.X(),u.Y(),false);
                    ts.SetF(u.F(),true); 
                    Effect.ToUnit("blackblink.mdl",ts.unit,"origin").Destroy();
                    ts.AnimeSpeed(0);
                    ts.DelayAlpha(255,0,0.5);
                }
                if(b.Level==2){//等于2表示是触发了
                    m=Units(data.c[3]);//伤害来源
                    new=u.Copy();
                    u.CopyItem(new.unit,true);
                    u.player.hero=new;
                    u.Pause(true); 
                    u.AnimeSpeed(0); 
                    u.AddAbility('Aloc'); 
                    new.Position(u.X(),u.Y(),false);
                    new.SetF(u.F(),true);
                    if(u.IsAbility('B01D')==true){
                        Buffs.Find(u.unit,'B01D').Move(u,new);
                    }
                    Units.Kill(u.unit); 
                    ShowUnit(u.unit,false); 
                    new.Select(new.player.player);
                    if(u.GetAbilityCD('A05O')!=0){
                        new.SetAbilityCD('A05O',u.GetAbilityCD('A05O')*0.5);
                    }
                    if(u.GetAbilityCD('A05T')!=0){
                        new.SetAbilityCD('A05T',u.GetAbilityCD('A05T')*0.5);
                    }
                    Shiki.E1(new,m);
                }//等于1是啥也没发生
                ts.Life(1);
                Spell(data.c[1]).Destroy();
                data.Destroy();
            };
        }

        static method W(Spell e){
            Units u=Units.Get(e.Spell);
            Data data=Data.create('A05G');
            Units ts;
            data.c[0]=u;
            data.c[1]=e;
            data.r[0]=0;//已持续时间
            data.r[1]=0;//伤害间隔(0.1s)
            data.r[2]=0;//增伤间隔(0.5s)
            data.r[3]=0;//增伤系数(+0.25)
            data.r[4]=75;//伤害距离和范围(+25)
            //用于Q2的替身残影
            ts=Units.MJ(u.player.player,'e008','A05G',0,u.X(),u.Y(),u.F(),10,u.modelsize,1,"stand",u.model);
            ts.AnimeId(6);
            ts.Alpha(0);
            data.c[2]=ts;
            //
            Buffs.Add(u.unit,'A05H','B01G',10,false); 
            u.Pause(true);  
            u.AnimeId(6);
            Units.MJ(u.player.player,'e008','A05G',0,u.X(),u.Y(),0,1,0.4,1.25,"stand","white-qiquan.mdl");
            ts=Units.MJ(u.player.player,'e008','A05G',0,u.X(),u.Y(),u.F(),5,0.8,1,"stand","shiki-bahuajing.mdl");
            data.c[3]=ts; 
            Dash.Start(u.unit,u.F(),150,Dash.SUB,10,true,false);  
            Timers.Start(0.01,data,function(Timers t){
                Data data=Data(t.Data());
                Units u=Units(data.c[0]);
                Units ts;
                Units ts1;
                Data data1;
                Buffs b;
                boolean press=false;
                real f1,x,y;
                integer ani,asp;
                Units mj;
                if(data.r[0]<0.3){
                    press=true;
                }else{
                    press=u.player.press.W;
                }
                if(u.Alive()==false||data.r[0]>=2.0||u.IsAbility('B01G')==false||press==false||u.IsAbility('BPSE')==true){
                    ts=Units(data.c[2]);
                    if(u.Alive()==true){
                        u.Pause(false);
                        if(u.IsAbility('B01G')==false){
                            BJDebugMsg("砍人：因Q2中断结束");  
                            Effect.ToUnit("blackblink.mdl",ts.unit,"origin").Destroy();
                            ts.AnimeSpeed(0);
                            ts.DelayAlpha(255,0,0.5);
                        }else{
                            Buffs.Find(u.unit,'B01G').Stop();
                            BJDebugMsg("砍人：因松开W或到达上限时间或眩晕结束"); 
                            x=u.X()+data.r[4]*CosBJ(u.F());
                            y=u.Y()+data.r[4]*SinBJ(u.F());
                            if(data.r[0]>1){
                                //前踢
                                f1=0; 
                                ani=12;
                                asp=2;
                                mj=Units.MJ(u.player.player,'e008','A05G',0,u.X(),u.Y(),u.F(),2,1.25,1.15,"stand","zzmxcl_tuci_zise.mdl");
                                mj.SetH(100);
                                Dash.Start(mj.unit,u.F(),200,Dash.SUB,30,true,false); 
                                GroupEnumUnitsInRange(tmp_group,x,y,data.r[4],function GroupIsAliveNotAloc);     
                                while(FirstOfGroup(tmp_group)!=null){
                                    mj=Units.Get(FirstOfGroup(tmp_group));
                                    GroupRemoveUnit(tmp_group,mj.unit);
                                    if(IsUnitEnemy(mj.unit,u.player.player)==true){    
                                        Dash.Start(mj.unit,Util.XY(mj.unit,u.unit),200,Dash.SUB,8,true,false);
                                        HitFlys.Add(mj.unit,15);
                                        u.Damage(mj.unit,Damage.Physics,'A05G',u.Agi(true)*2);  
                                        Buffs.Skill(mj.unit,'A00W',1);  
                                    } 
                                } 
                                GroupClear(tmp_group);  
                            }else{
                                f1=180;
                                asp=1;
                                ani=13;
                                Units.MJ(u.player.player,'e008','A05G',0,u.X(),u.Y(),u.F(),1,1,1.25,"stand","dg7_zise.mdl").AnimeId(0);
                                GroupEnumUnitsInRange(tmp_group,x,y,data.r[4],function GroupIsAliveNotAloc);     
                                while(FirstOfGroup(tmp_group)!=null){
                                    mj=Units.Get(FirstOfGroup(tmp_group));
                                    GroupRemoveUnit(tmp_group,mj.unit);
                                    if(IsUnitEnemy(mj.unit,u.player.player)==true){    
                                        Dash.Start(mj.unit,Util.XY(u.unit,mj.unit),200,Dash.SUB,15,true,true);
                                        u.Damage(mj.unit,Damage.Physics,'A05G',u.Agi(true)*6);  
                                    } 
                                } 
                                GroupClear(tmp_group); 
                            }
                            
                            //后撤 A05I,B01H
                            //用于Q2的替身残影
                            ts1=Units.MJ(u.player.player,'e008','A05G',0,u.X(),u.Y(),u.F(),10,u.modelsize,1,"stand",u.model);
                            ts1.AnimeId(ani);
                            ts1.Alpha(0);
                            ts1.AnimeSpeed(asp);
                            //
                            u.Pause(true);
                            u.AnimeId(ani); 
                            u.AnimeSpeed(asp);
                            data1=Data.create('A05G');
                            data1.c[0]=u;
                            data1.c[1]=ts1;
                            b=Buffs.Add(u.unit,'A05I','B01H',data.r[0]/2,false);
                            b.Obj=data1;
                            b.onEnd=function(Buffs b){
                                Data data=Data(b.Obj);
                                Units u=Units(data.c[0]);
                                Units ts=Units(data.c[1]);
                                u.AnimeSpeed(1);
                                u.Pause(false);
                                if(b.Level==0){  
                                    ts.Position(u.X(),u.Y(),false);
                                    ts.SetF(u.F(),true);
                                    Dash.AllStop(ts.unit);
                                    Effect.ToUnit("blackblink.mdl",ts.unit,"origin").Destroy();
                                    ts.AnimeSpeed(0);
                                    ts.DelayAlpha(255,0,0.5);
                                }
                                ts.Life(1);
                                data.Destroy();
                            };
                            //Dash.Start(ts1.unit,u.F()+f1,500*(data.r[0]/2),Dash.SUB,20,true,false);
                            Dash.Start(u.unit,u.F()+f1,500*(data.r[0]/2),Dash.SUB,20,true,false);
                           
                        }
                    }else{
                        BJDebugMsg("砍人：因死亡结束");
                    }
                    ts.Life(1);
                    Units(data.c[3]).Life(0.3);
                    Units(data.c[3]).DelayAlpha(255,0,0.2);
                    Spell(data.c[1]).Destroy();
                    t.Destroy();
                    data.Destroy();
                }else{
                    ts=Units(data.c[3]);
                    data.r[0]+=0.01;
                    data.r[1]+=0.01;
                    data.r[2]+=0.01;
                    ts.Position(u.X(),u.Y(),false);
                    ts.SetF(u.F(),true);
                    if(data.r[1]>=0.1){
                        //伤害
                        data.r[1]=0;
                        x=u.X()+data.r[4]*CosBJ(u.F());
                        y=u.Y()+data.r[4]*SinBJ(u.F());
                        //Util.Range(x,y,data.r[4]);
                        GroupEnumUnitsInRange(tmp_group,x,y,data.r[4],function GroupIsAliveNotAloc);     
                        while(FirstOfGroup(tmp_group)!=null){
                            mj=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,mj.unit);
                            if(IsUnitEnemy(mj.unit,u.player.player)==true){    
                                Dash.Start(mj.unit,Util.XYEX(mj.X(),mj.Y(),x,y),50,Dash.SUB,10,true,false);
                                Buffs.Add(mj.unit,'A05J','B01I',1,false).Type=Buffs.TYPE_SUB+Buffs.TYPE_DISPEL_TRUE;
                                u.Damage(mj.unit,Damage.Physics,'A05G',u.Agi(true)*(1+data.r[3])); 
                                Effect.ToUnit("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",mj.unit,"chest").Destroy();
                                if(data.r[0]>=1){ 
                                    Buffs.Skill(mj.unit,'A00W',1); 
                                    ts1=Units.MJ(u.player.player,'e008','A02G',0,mj.X(),mj.Y(),Util.XY(u.unit,mj.unit),2,1,1,"stand", "blood-2.mdl");
                                    ts1.DelayAlpha(255,0,1.99);
                                }
                            } 
                        } 
                        GroupClear(tmp_group);
                    } 
                    if(data.r[2]>=0.5){
                        //增伤
                        data.r[2]=0;
                        data.r[3]+=0.25;
                        data.r[4]+=25;
                        if(data.r[3]==0.5){
                            Effect.ToUnit("yooobug_hit_blue.mdl",u.unit,"weapon").Destroy();
                        }
                        ts.Size(0.8+(data.r[3]/1.5)); 
                        Units.MJ(u.player.player,'e008','A05G',0,u.X(),u.Y(),0,1,0.4+(data.r[3]/2),1.25+data.r[3],"stand","white-qiquan.mdl");
                        ts=Units.MJ(u.player.player,'e008','A05G',0,ts.X(),ts.Y(),ts.F(),1,0.8+data.r[3],1,"stand","shiki-bahuajing.mdl");
                        ts.DelayAlpha(255,0,0.5);
                        Dash.Start(ts.unit,ts.F(),100,Dash.SUB,10,true,false);
                        ts=Units.MJ(u.player.player,'e008','A05G',0,u.X(),u.Y(),u.F(),0.5,u.modelsize,1,"stand",u.model);
                        ts.AnimeId(6);
                        ts.DelayAlpha(255,0,0.25);
                        ts.DelaySizeEx(0.5,u.modelsize+0.25,0.25); 
                        Dash.Start(u.unit,u.F(),75,Dash.SUB,6,true,false);
                    }
                }
            });
        }

        static method Q3(Units u,Units m,real f){
            HitFlys ad;
            f=f+180;
            u.Pause(true);
            BJDebugMsg("暂停3");
            Buffs.Skill(m.unit,'A00F',1);
            u.Damage(m.unit,Damage.Physics,'A05A',u.Agi(true)*5); 
            u.AnimeId(36);
            HitFlys.Reset(m.unit);
            HitFlys.Lister(HitFlys.Add(m.unit,-30),HitFlys.onEnd,function(HitFlys h){
                Units u=Units.Get(h.Unit);
                Effect.To("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl",u.X(),u.Y()).Destroy();
                Util.Duang(u.X(),u.Y(),0.7,175,175,-220,0.02,50);  
                Timers.Start(0.01,u,function(Timers t){
                    Units u=Units(t.Data());
                    HitFlys.Lister(HitFlys.Add(u.unit,15),HitFlys.onEnd,function(HitFlys h){
                        Units u=Units.Get(h.Unit);
                        Effect.To("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl",u.X(),u.Y()).Destroy();
                        Util.Duang(u.X(),u.Y(),0.4,175,175,-64,0.02,50);   
                    });
                    t.Destroy();
                });
                              
            });
            HitFlys.Reset(u.unit);
            ad=HitFlys.Add(u.unit,15);
            HitFlys.Lister(ad,HitFlys.onEnd,function(HitFlys h){
                Units u=Units.Get(h.Unit); 
                u.RemoveAbility('A05F'); 
                u.Pause(false);
                BJDebugMsg("暂停3-解除");
            }); 
            Effect.ToUnit("hiteffect08purplea.mdl",m.unit,"chest").Destroy();
            Effect.ToUnit("hit-juhuang-lizi.mdl",m.unit,"chest").Destroy();
            Dash.Start(m.unit,f,500,Dash.SUB,40,true,false);
            Dash.Start(u.unit,f+180,200,Dash.SUB,20,true,false);
            Units.MJ(u.player.player,'e00E','A05A',0,u.X(),u.Y(),f,2,0.8,1.5,"stand","cf2.mdl").SetH(m.H());
            //Effect.ToUnit("cf2.mdl",u.unit,"right foot");
                                
        }

        static method Q2(Units u){
            Buffs b=Buffs.Find(u.unit,'B01D');
            Data data=Data(b.Obj);
            Units m=Units(data.c[1]);
            b.Level=0;
            b.Stop(); 
            BJDebugMsg("触发Q2");
            /*
                中断技能，通过结束BUFF来结束技能硬直，每个技能单独判断
                B01F - 踢人(Q)的后半段硬直，可取消
                B01G - 砍人(W)的过程硬直，可取消
                B01H - 砍人(W)后撤/前踢的过程硬直，可取消
                B01J - 后跳(E)的过程硬直，可取消
                B01K - 后跳(E)的反击硬直，可取消
                B01M - 关灯杀(R)的过程硬直,可取消(同时取消技能)
                B01N - 关灯杀(R)的后摇硬直,可取消
                B01P - 关灯杀(R)的关灯硬直，可取消（同时取消伤害)
            */
            if(u.IsAbility('B01F')==true){
                b=Buffs.Find(u.unit,'B01F');
                b.Level=0;
                b.Stop(); 
            }
            if(u.IsAbility('B01G')==true){
                b=Buffs.Find(u.unit,'B01G');
                b.Level=0;
                b.Stop();
            }
            if(u.IsAbility('B01H')==true){
                b=Buffs.Find(u.unit,'B01H');
                b.Level=0;
                b.Stop();
            }
            if(u.IsAbility('B01K')==true){
                b=Buffs.Find(u.unit,'B01K');
                b.Level=0;
                b.Stop();
            }
            if(u.IsAbility('B01M')==true){
                b=Buffs.Find(u.unit,'B01M');
                b.Level=0;
                b.Stop();
            }
            if(u.IsAbility('B01P')==true){
                b=Buffs.Find(u.unit,'B01P');
                b.Level=0;
                b.Stop();
            }
            if(u.IsAbility('B01N')==true){
                b=Buffs.Find(u.unit,'B01N');
                b.Level=0;
                b.Stop();
            }
            if(u.IsAbility('B01J')==true){
                b=Buffs.Find(u.unit,'B01J');
                if(b.Level==1){//未触发时可取消，触发后不可
                    b.Level=0;
                    b.Stop();
                }
            }
            u.AddAbility('A05F'); 
            data=Data.create('A05A');
            data.c[0]=u;
            data.c[1]=m;
            Timers.Start(0.01,data,function(Timers t){
                Data data1=Data(t.Data());
                Data data;
                Units u=Units(data1.c[0]);
                Units m=Units(data1.c[1]); 
                real x=u.X(),y=u.Y(),f=Util.XY(u.unit,m.unit),x1=m.X(),y1=m.Y(),f1; 
                //Units.MJ(u.player.player,'e008','A05A',0,x,y,f,1,1,1,"stand","blink_darkblue.mdl").SetH(u.H());
                //Effect.ToUnit("blink_darkblue.mdl",u.unit,"chest").Destroy();
                if(m.H()<200){//高度过低时会踢起来
                    u.Pause(true);
                    BJDebugMsg("暂停2");
                    u.Position(x1+120*CosBJ(f),y1+120*SinBJ(f),false);
                    u.SetF(f+180,true);
                    u.AnimeId(39);
                    f1=f;
                    f=u.F();
                    Dash.Start(m.unit,f,150,Dash.SUB,10,true,false);
                    Dash.Start(u.unit,f,150,Dash.SUB,10,true,false);
                    HitFlys.Add(u.unit,20);
                    HitFlys.Add(m.unit,25);
                    Buffs.Skill(m.unit,'A00F',1);
                    data=Data.create('A05A');
                    data.c[0]=u;
                    data.c[1]=m;
                    data.i[0]=0;
                    data.r[0]=f1;
                    Timers.Start(0.15,data,function(Timers t){
                        Data data=Data(t.Data());
                        Units u=Units(data.c[0]);
                        Units m=Units(data.c[1]);
                        if(data.i[0]==0){
                            if(u.Alive()==true&&m.Alive()==true){ 
                                //HitFlys.Reset(u.unit);
                                //HitFlys.Reset(m.unit);
                                HitFlys.Add(m.unit,15);
                                HitFlys.Add(u.unit,25); 
                            }
                            data.i[0]+=1;
                        }else{ 
                            u.Pause(false);
                            BJDebugMsg("暂停2-解除");
                            if(u.Alive()==true&&m.Alive()==true){  
                                Shiki.Q3(u,m,data.r[0]);
                            }
                            t.Destroy();
                            data.Destroy();
                        }
                    });
                }else{//在天上则直接踹
                    u.Position(x1+120*CosBJ(f),y1+120*SinBJ(f),false);
                    u.SetF(f+180,true);
                    Shiki.Q3(u,m,f);
                }
                t.Destroy();
                data1.Destroy();
            });
        }

        static method Q(Spell e){
            Units u=Units.Get(e.Spell);
            Dash dash;
            Data data=Data.create('A05A');
            data.c[0]=u;
            data.c[1]=e;
            u.Pause(true);
            BJDebugMsg("暂停");
            IssueImmediateOrder(u.unit,"stop"); 
            u.SetF(e.Angle,true);
            u.AnimeId(16);
            Units.MJ(u.player.player,'e008','A05A',0,u.X(),u.Y(),e.Angle,1,1.15,1.25,"stand","dust2_white.mdl");
            dash=Dash.Start(u.unit,e.Angle,600,Dash.SUB,75,true,false);
            dash.Obj=data;
            dash.onMove=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units(data.c[0]);
                Units m;
                Units mj;
                Units ts;
                unit k=null;
                real x=dash.X+70*CosBJ(dash.Angle),y=dash.Y+70*SinBJ(dash.Angle);
                if(dash.Speed>3){
                    k=GroupFind(u.unit,x,y,70,true,false);
                    if(k!=null){
                        dash.Stop(); 
                        m=Units.MJ(u.player.player,'e008','A05A',0,x,y,dash.Angle+180,2,1.5,1,"stand","chongfeng2.mdl");
                        Dash.Start(m.unit,dash.Angle,400,Dash.SUB,50,true,false);
                        /*m=Units.MJ(u.player.player,'e008','A05A',0,dash.X,dash.Y,dash.Angle,1,u.modelsize,1.5,"stand",u.model);
                        m.AnimeId(16);
                        m.DelayAlpha(255,0,0.2); */
                        m=Units.Get(k);
                        k=null;
                        Units.MJ(u.player.player,'e008','A05A',0,dash.X,dash.Y,dash.Angle,1,0.5,0.6,"stand","white-qiquan.mdl");
                        
                        GroupEnumUnitsInRange(tmp_group,x+100*CosBJ(dash.Angle),y+100*SinBJ(dash.Angle),225,function GroupIsAliveNotAloc);     
                        while(FirstOfGroup(tmp_group)!=null){
                            mj=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,mj.unit);
                            if(IsUnitEnemy(mj.unit,u.player.player)==true&&mj.unit!=m.unit){    
                                Dash.Start(mj.unit,dash.Angle,450,Dash.SUB,40,true,false); 
                                HitFlys.Add(mj.unit,20);
                                Buffs.Add(mj.unit,'A05D','B01E',6,false).Type=Buffs.TYPE_SUB+Buffs.TYPE_DISPEL_TRUE;
                            } 
                        } 
                        GroupClear(tmp_group);
                        u.Damage(m.unit,Damage.Physics,'A05A',u.Agi(true)*5); 
                        Buffs.Skill(m.unit,'A00F',1);
                        u.Pause(true);
                        BJDebugMsg("暂停1");
                        u.AnimeId(38);
                        u.AnimeSpeed(0.75); 
                        u.AddAbility('A05B');
                        //用于Q2的替身残影
                        ts=Units.MJ(u.player.player,'e008','A05A',0,u.X(),u.Y(),u.F(),10,u.modelsize,1,"stand",u.model);
                        ts.AnimeId(38);
                        ts.AnimeSpeed(0.75);
                        ts.Alpha(0);
                        //
                        HitFlys.Add(u.unit,12);
                        HitFlys.Add(m.unit,16);
                        Effect.ToUnit("hiteffect08purplea.mdl",m.unit,"chest").Destroy();
                        Effect.ToUnit("hiteffect08purplea.mdl",m.unit,"chest").Destroy();
                        data=Data.create('A05A');
                        data.c[0]=u;
                        data.c[1]=m;
                        data.c[2]=ts;
                        Timers.Start(0.15,data,function(Timers t){
                            Data data=Data(t.Data());
                            Units u=Units(data.c[0]);
                            Units m=Units(data.c[1]); 
                            Units ts=Units(data.c[2]); 
                            Data data1;
                            Buffs b;
                            if(u.Alive()==true){ 
                                //u.DelayReleaseAnimePause(0.32);
                                b=Buffs.Add(u.unit,'A05E','B01F',0.32,false);
                                b.Obj=ts;
                                b.onEnd=function(Buffs b){
                                    Units u=Units.Get(b.Unit);
                                    Units ts=Units(b.Obj);
                                    //如果是提前结束的BUFF，则是Q2打断，显示残影
                                    if(b.Level==0){
                                        Effect.ToUnit("blackblink.mdl",ts.unit,"origin").Destroy();
                                        ts.Position(u.X(),u.Y(),false);
                                        ts.SetF(u.F(),true);
                                        ts.SetH(u.H()); 
                                        ts.AnimeSpeed(0);
                                        ts.DelayAlpha(255,0,0.5);
                                    } 
                                    ts.Life(1.5);
                                    //
                                    u.AnimeSpeed(1);
                                    u.Pause(false);
                                    BJDebugMsg("暂停1-解除");
                                };
                                Buffs.Skill(m.unit,'A00F',1);
                                //Units.MJ(u.player.player,'e00C','A05A',0,m.X(),m.Y(),u.F()+180,2,2,1.5,"stand","by_wood_gongchengsipai_2.mdl").SetH(m.H()+100);
                                Units.MJ(u.player.player,'e00E','A05A',0,u.X(),u.Y(),Util.XY(u.unit,m.unit),2,0.8,1.5,"stand","cf2.mdl").SetH(m.H());
                                
                                Dash.Start(m.unit,u.F(),150,Dash.SUB,10,true,false);
                                Dash.Start(u.unit,u.F()+180,100,Dash.SUB,10,true,false);
                                
                                HitFlys.Add(u.unit,20);
                                HitFlys.Add(m.unit,25);
                                Effect.ToUnit("hiteffect08purplea.mdl",m.unit,"chest").Destroy();
                                Effect.ToUnit("hit-juhuang-lizi.mdl",m.unit,"chest").Destroy();
                                if(m.Alive()==true){
                                    //标记
                                    data1=Data.create('A05A');
                                    data1.c[0]=u;
                                    data1.c[1]=m;
                                    b=Buffs.Add(u.unit,'A05C','B01D',10,false);
                                    b.Obj=data1;
                                    b.onTime=function(Buffs b){ 
                                        Data data=Data(b.Obj);
                                        Units m=Units(data.c[1]);
                                        if(m.Alive()==false){
                                            b.Stop();
                                        }
                                    };
                                    b.onEnd=function(Buffs b){
                                        Data data=Data(b.Obj);
                                        data.Destroy();
                                    };
                                } 
                            }else{
                                ts.Life(0.1);
                            }
                            u.RemoveAbility('A05B');
                            t.Destroy();
                            data.Destroy();
                        });
                    }
                } 
            };
            dash.onEnd=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units(data.c[0]);
                u.Pause(false);
                BJDebugMsg("暂停-解除");
                Spell(data.c[1]).Destroy();
                data.Destroy();
            };
        }
 

        static method Press(player ps,string k){
            Players p=Players.Get(ps);
            if(k=="Q"){ 
                if(p.hero.IsAbility('B01D')==true&&p.hero.IsAbility('BPSE')==false){
                    if(Buffs.Find(p.hero.unit,'B01D').Level==1){ 
                        Shiki.Q2(p.hero);
                    }
                }
            } 
        }
 
        static method Order(EventArgs e){
            Units u=Units.Get(e.TriggerUnit);
            real f; 
            if(u.IsAbility('A05A')==true&&e.OrderId!=851973){
                
                if(e.OrderTargetUnit==null){ 
                    f=Util.XYEX(u.X(),u.Y(),e.OrderTargetX,e.OrderTargetY);
                }else{
                    f=Util.XY(u.unit,e.OrderTargetUnit);
                } 
                u.SetF(f,true);
            } 
                  
        }

        static method HERO_START(Spell e){
            Units u=Units.Get(e.Spell);
            Buffs b;
            if(e.Id=='A05A'){
                if(u.IsAbility('B01D')==false){ 
                    u.FlushAnimeId(35);
                    Dash.Start(u.unit,e.Angle+180,80,Dash.SUB,10,true,false);
                }else{
                    if(Buffs.Find(u.unit,'B01D').Level==1){  
                        IssueImmediateOrder(u.unit,"stop"); 
                        Shiki.Q2(u);
                    }
                }
            }
            if(e.Id=='A05O'){
                u.FlushAnimeId(10); 
                Dash.Start(u.unit,e.Angle+180,100,Dash.SUB,7,true,false);
                b=Buffs.Add(u.unit,'A05R','B01O',0.4,false);
                b.Obj=0;
                b.onTime=function(Buffs b){
                    Units u=Units.Get(b.Unit);
                    Units ts;
                    b.Obj+=1;
                    if(b.Obj==30){
                        ts=Units.MJ(u.player.player,'e008','A05O',0,u.X()+100*CosBJ(u.F()+180),u.Y()+100*SinBJ(u.F()+180),0,0.5,1.5,1.5,"birth","az_lxj_blue_ex.mdl");
                        ts.SetH(115);
                        Dash.Start(ts.unit,u.F(),150,Dash.NORMAL,30,true,false);
                        //Units.MJ(u.player.player,'e008','A05O',0,u.X(),u.Y(),0,1.5,1.25,2,"stand","kc_ex.mdl");
                    }
                };
            }
            if(e.Id=='A05T'){ 
                u.FlushAnimeId(37); 
            }
            e.Destroy();
        }

        static method HERO_STOP(Spell e){ 
            Units u=Units.Get(e.Spell);
            if(e.Id=='A05O'){
                if(u.IsAbility('B01O')==true){
                    Buffs.Find(u.unit,'B01O').Stop();
                }
            }
            e.Destroy();
        }


        static method onInit(){   
            Press.OnSnyc(Press.onSnycPressKeyDown,Shiki.Press);
            Spell.On(Spell.onReady,'A05A',Shiki.HERO_START); 
            Spell.On(Spell.onReady,'A05O',Shiki.HERO_START); 
            Spell.On(Spell.onReady,'A05T',Shiki.HERO_START); 
            Spell.On(Spell.onStop,'A05O',Shiki.HERO_STOP); 
            Spell.On(Spell.onSpell,'A05A',Shiki.Q);
            Spell.On(Spell.onSpell,'A05G',Shiki.W);
            Spell.On(Spell.onSpell,'A05K',Shiki.E);  
            Spell.On(Spell.onSpell,'A05O',Shiki.R); 
            Spell.On(Spell.onSpell,'A05T',Shiki.D); 
            Damage.On(Damage.onUnitDamage_SubDamage,Shiki.SubDamage); 
            Damage.On(Damage.onUnitDamage_EndDamage,Shiki.Damage); 
            Events.On(Events.onUnitOrderToUnit,Shiki.Order);
            Events.On(Events.onUnitOrderToLocation,Shiki.Order); 
        }
    }
}

         