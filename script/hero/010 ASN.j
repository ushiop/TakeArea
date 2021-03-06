library ASN requires Groups{
    //英雄‘亚斯娜’的技能
    //R级
    //12 13 -戳  14-前摇
    struct ASN{
        static integer R_attack;
        static integer R_defend;
        /*static method R(Spell e){
            Units u=Units.Get(e.Spell);
            Data data=Data.create('A02X');
            Dash dash;
            real x=u.X(),y=u.Y(),f=u.F();
            Units mj;
            u.Pause(true);
            u.SetF(u.F(),true);
            u.AnimeId(12);
            data.c[0]=u;
            data.c[1]=e;
            mj=Units.MJ(u.player.player,'e008','A02X',0,x,y,f,2,2.5,0.5,"birth", "az_lxj_blue_ex.mdl");//akiha claw.mdl
            mj.SetH(100);
            data.c[2]=mj;
            Effect.ToUnit("az-blue-lizi-shangsheng.mdl",u.unit,"weapon").Destroy();
            Units.MJ(u.player.player,'e008','A02X',0,x+250*CosBJ(f),y+250*SinBJ(f),f,5,1.25,1,"stand", "cf2.mdl"); 
            Units.MJ(u.player.player,'e008','A02X',0,x+600*CosBJ(f),y+600*SinBJ(f),f,2,3.5,2,"stand", "akiha claw.mdl");
            Units.MJ(u.player.player,'e009','A02X',0,x+300*CosBJ(f),y+300*SinBJ(f),f,5,1.5,1,"stand", "white-qiquan-new.mdl");
            Units.MJ(u.player.player,'e008','A02X',0,x+400*CosBJ(f),y+400*SinBJ(f),f,0.334,1.5,1,"stand", "dash.mdl");//akiha claw.mdl
            mj=Units.MJ(u.player.player,'e008','A02X',0,x,y,f,10,u.modelsize,1,"stand", "Asuna.mdl");//akiha claw.mdl
            mj.AnimeId(14);
            mj.DelayAlpha(0,255,0.3); 
            Units.MJ(u.player.player,'e008','A02X',0,x,y,f,5,1.25,1.15,"stand", "az-blue-lizi-shangsheng.mdl");
            data.c[3]=mj;
            dash=Dash.Start(u.unit,f,1500,Dash.PWX,200,true,false);
            dash.Obj=data;
            dash.onMove=function(Dash dash){
                Data data=Data(dash.Obj);
                Units(data.c[2]).Position(dash.X,dash.Y,false);
            };
            dash.onEnd=function(Dash dash){
                Data data=Data(dash.Obj);
                Dash dash1;
                Units mj=Units(data.c[3]);
                Units(data.c[0]).Pause(false);
                Spell(data.c[1]).Destroy(); 
                mj.AnimeId(4);
                data.i[0]=0;
                Util.Duang(mj.X(),mj.Y(),0.4,150,150,-286,0.02,50);
                Units.MJ(mj.player.player,'e008','A02S',0,mj.X(),mj.Y(),dash.Angle,3,1,1,"stand", "bule-dark-salsh_red.mdl").SetH(100);
                dash1=Dash.Start(mj.unit,Util.XY(mj.unit,mj.player.hero.unit),Util.XY2(mj.unit,mj.player.hero.unit),Dash.NORMAL,100,true,false);
                dash1.Obj=data;
                dash1.onMove=function(Dash dash){
                    Data data=Data(dash.Obj);
                    Units u=Units(data.c[0]);
                    if(data.i[0]==0){
                        data.i[0]=2;
                        Units.MJ(u.player.player,'e008','A02X',0,dash.X,dash.Y,90+GetRandomReal(-15,15),2,1,1,"stand", "akiha claw.mdl").SetH(100);
                        //Units.MJ(u.player.player,'e008','A02X',0,dash.X,dash.Y,dash.Angle,2,0.75,1,"stand", "dust2.mdl");
                        Units.MJ(u.player.player,'e008','A02S',0,dash.X,dash.Y,GetRandomReal(0,360),2,2.5,1,"death", "by_wood_gongchengsipai_3.mdl").SetH(100);//akiha claw.mdl
                    }else{
                        data.i[0]-=1;
                    }
                    Units.Get(dash.Unit).Alpha(150+R2I(105*(dash.Speed/150.0)));
                     
                };
                dash1.onEnd=function(Dash dash){
                    Data data=Data(dash.Obj);
                    Units mj=Units(data.c[3]);
                    mj.Life(0.5);
                    mj.DelayAlpha(mj.color_alpha,0,0.4);
                    data.Destroy();
                };
            };
        }*/
        //ASN AI
        static method AI(unit ua){
            Units u=Units.Get(ua);
            unit target,no,no1;
            real x=u.X(),y=u.Y();
            real x1,y1;     
            Units mj;
            target=GroupFind(u.unit,x,y,1000,true,false);
            if(target!=null){
                x1=GetUnitX(target);
                y1=GetUnitY(target); 
 
                no=GroupFind(u.unit,x,y,600,true,false);
                if(no!=null){ 
                    u.SetF(Util.XY(u.unit,no),true);   
                    IssuePointOrder(u.unit, "charm",GetUnitX(no),GetUnitY(no)); //流星
                }  

                no=GroupFind(u.unit,x,y,300,true,false);
                if(no!=null){ 
                    u.SetF(Util.XY(u.unit,no),true);  
                    IssueImmediateOrder( u.unit, "fanofknives" );//剑光冲击
                }  
            }
            target=null;
            no=null;
        }

        static method Spawn(Units u,Units m){
            timer t;
            if(u.IsAbility('A02R')==true){
                u.ai=ASN.AI;
                t=NewTimer();
                SetTimerData(t,u);
                TimerStart(t,0.1,true,function(){
                    Units u=Units(GetTimerData(GetExpiredTimer()));
                    if(u.Alive()==false){ 
                        ReleaseTimer(GetExpiredTimer());
                    }else{
                        if(u.MoveSpeed()>500){ 
                            if(u.Data()==0){ 
                                AddUnitAnimationProperties(u.unit, "fast", true );
                                u.SetData(1);
                            }
                        }else{
                            if(u.Data()==1){
                                u.SetData(0);
                                AddUnitAnimationProperties(u.unit, "fast", false );
                            }
                        }
                    }
                });
                t=null;
            }
        }

        //减伤
        static method Damage_Sub(DamageArgs e){
            real f,cd;
            Units mj;
            if(e.DamageType==Damage.Attack&&e.TriggerUnit.IsAbility('A02X')==true&&e.TriggerUnit.player.lv15!=null&&e.TriggerUnit.IsAbility('B00O')==false){
                if(e.isRange==false){//仅抵挡近战攻击
                    e.Damage=0;//抵消伤害
                }
            }
        }

        //增伤
        static method Damage_Add(DamageArgs e){
            if(e.DamageUnit.IsAbility('A02V')&&e.DamageUnit.player.lv10!=null){ 
                //E的移速转伤害
                if(e.DamageUnit.movespeed>522.0){
                    //大于522的移速转化为伤害
                    e.Damage+=e.Damage*((e.DamageUnit.movespeed-522.0)*0.001); 
                }
            }
        }

        //受到伤害
        static method Damage(DamageArgs e){
            Buffs b;
            real f,cd;
            Units mj;
            if(e.DamageType==Damage.Attack&&e.DamageUnit.IsAbility('B00K')==true&&e.DamageUnit.IsAbility('B00L')==true){
                //普攻触发剑光冲击
                f=Util.XY(e.DamageUnit.unit,e.TriggerUnit.unit);
                b=Buffs.Find(e.DamageUnit.unit,'B00K'); 
                ASN.W2(e.DamageUnit.unit,e.TriggerUnit.unit,f,2);
                b.Level-=1;
                if(b.Level<=0){
                    b.Stop();
                }  
            }
            if(e.DamageType==Damage.Attack&&e.DamageUnit.IsAbility('A02V')&&e.DamageUnit.player.lv10!=null){
                //E的普攻减CD
                if(e.DamageUnit.GetAbilityCD('A02R')>0){ 
                    e.DamageUnit.SetAbilityCD('A02R',e.DamageUnit.GetAbilityCD('A02R')-1);
                }
                if(e.DamageUnit.GetAbilityCD('A02S')>0){ 
                    e.DamageUnit.SetAbilityCD('A02S',e.DamageUnit.GetAbilityCD('A02S')-1);
                }
            }
            if(e.DamageUnit.IsAbility('A02V')&&e.DamageUnit.player.lv10!=null){
                //E的移速BUFF
                b=Buffs.Add(e.DamageUnit.unit,'A02W','B00M',5,false);
                b.onFlush=function(Buffs b){
                    Units u=Units.Get(b.Unit);
                    b.Level+=1; 
                    u.SetMoveSpeed(10);
                };
                b.onEnd=function(Buffs b){
                    Units u=Units.Get(b.Unit);
                    u.SetMoveSpeed(-(b.Level*10));
                };
                if(b.Level==1){
                    e.DamageUnit.SetMoveSpeed(10);
                }
            }
            if(e.DamageType==Damage.Attack&&e.TriggerUnit.IsAbility('A02X')==true&&e.TriggerUnit.player.lv15!=null&&e.TriggerUnit.IsAbility('B00O')==false){
                if(e.isRange==false&&e.TriggerUnit.IsTimeStop()==false){//仅抵挡近战攻击,被时停时不触发
                    f=e.OriginDamage+GetUnitState(e.TriggerUnit.unit, ConvertUnitState(0x15));
                    if(e.DamageUnit.Weapon()==Units.WeaponUnknow){
                        BJDebugMsg("----------这是一条BUG信息，如果你愿意，请截图给作者，谢谢！A:"+e.DamageUnit.name+"/D"+e.TriggerUnit.name);
                    }else{
                        e.TriggerUnit.Alpha(0);
                        Buffs.Add(e.TriggerUnit.unit,'A036','B00P',0.4,false).onEnd=function(Buffs b){
                            Units u=Units.Get(b.Unit);
                            u.DelayAlpha(0,255,0.4);
                        };
                        if(e.DamageUnit.Weapon()==Units.WeaponFist){
                            //对方没武器,额外伤害
                            e.TriggerUnit.Damage(e.DamageUnit.unit,Damage.Physics,'A02X',GetUnitState(e.TriggerUnit.unit, ConvertUnitState(0x15))*2);
                            mj=Units.MJ(e.TriggerUnit.player.player,'e008','A02X',0,e.TriggerUnit.X(),e.TriggerUnit.Y(),Util.XY(e.TriggerUnit.unit,e.DamageUnit.unit),0.5,e.TriggerUnit.modelsize,3,"attack", "Asuna.mdl");//akiha claw.mdl
                            Effect.ToUnit("az_lxj_blue_ex.mdl",mj.unit,"weapon");
                            mj.DelayAlpha(255,0,0.4);  
                            RunSoundOnUnit(ASN.R_attack,mj.unit); 
                        }else{
                            //有武器，音波与腿颤

                            //腿颤效果
                            if(e.TriggerUnit.IsAbility('B00N')==false){
                                e.TriggerUnit.SetMoveSpeed(-500);
                            }
                            Buffs.Add(e.TriggerUnit.unit,'A034','B00N',1,false).onEnd=function(Buffs b){
                                Units u=Units.Get(b.Unit);
                                u.SetMoveSpeed(500);
                            };
 
                            //分身格挡
                            mj=Units.MJ(e.TriggerUnit.player.player,'e008','A02X',0,e.TriggerUnit.X(),e.TriggerUnit.Y(),Util.XY(e.TriggerUnit.unit,e.DamageUnit.unit),10,e.TriggerUnit.modelsize,3,"attack", "Asuna.mdl");//akiha claw.mdl
                            Effect.ToUnit("az_lxj_blue_ex.mdl",mj.unit,"weapon");
                            mj.AnimeId(15); 
                            RunSoundOnUnit(ASN.R_defend,mj.unit); 
                            Dash.Start(mj.unit,mj.F()+180,150,Dash.SUB,10,true,false).onEnd=function(Dash dash){
                                Units u=Units.Get(dash.Unit);
                                u.DelayAlpha(255,0,0.4);
                                u.Life(0.5);
                            };


                            //音波效果
                            Units.MJ(e.TriggerUnit.player.player,'e008','A02X',0,e.TriggerUnit.X(),e.TriggerUnit.Y(),GetRandomReal(0,360),2,0.6,1,"stand", "white-qiquan.mdl");
                            Units.MJ(e.TriggerUnit.player.player,'e008','A02X',0,e.TriggerUnit.X(),e.TriggerUnit.Y(),0,2,0.5,1,"stand", "kc_ex.mdl");
 
                            GroupEnumUnitsInRange(tmp_group,e.TriggerUnit.X(),e.TriggerUnit.Y(),200,function GroupIsAliveNotAloc);     
                            while(FirstOfGroup(tmp_group)!=null){
                                mj=Units.Get(FirstOfGroup(tmp_group));
                                GroupRemoveUnit(tmp_group,mj.unit);
                                if(IsUnitEnemy(mj.unit,e.TriggerUnit.player.player)==true){    
                                    e.TriggerUnit.Damage(mj.unit,Damage.Physics,'A02X',f);
                                    Buffs.Skill(mj.unit,'A037',1); 
                                }
                            }
                            GroupClear(tmp_group);                               
                        }
                        cd=2-(GetUnitState(e.TriggerUnit.unit, ConvertUnitState(0x51))/10);
                        if(cd<0.4||e.TriggerUnit.IsAbility('B00K')==true) cd=0.4; 
                        Buffs.Add(e.TriggerUnit.unit,'A035','B00O',cd,false);
                    }
                }
            }
        }

        //剑光冲击状态开始普攻
        static method W3(EventArgs e){ 
            Units u=Units.Get(e.AttackUnit); 
            if(u.IsAbility('B00K')==true){
                u.Alpha(0);
                Buffs.Add(u.unit,'A02T','B00L',0.2,false).onEnd=function(Buffs b){
                    Units u=Units.Get(b.Unit);
                    u.DelayAlpha(0,255,0.6); 
                };
            } 
        }

        //发动剑光冲击
        //stype==1 命令触发 ==2 普攻触发
        static method W2(unit ua,unit target,real f,integer stype){
            Units u=Units.Get(ua);
            Data data=Data.create('A02S');
            Units mj;
            Dash dash;
            real x=u.X(),y=u.Y(),a;
            data.c[0]=u;
            if(stype==1){ //命令触发 
                //u.Position(x+300*CosBJ(f),y+300*SinBJ(f),false);
                u.SetF(f,true); 
                u.DelayAlpha(0,255,0.5);
                mj=Units.MJ(u.player.player,'e008','A02S',0,x,y,f,3,0.25,1,"stand", "bule-dark-salsh_red.mdl");//akiha claw.mdl
                mj.SetH(100);
                data.c[1]=mj;
                mj=Units.MJ(u.player.player,'e008','A02S',0,x,y,f,2,2,1,"birth", "az_lxj_blue_ex.mdl");//akiha claw.mdl
                mj.SetH(100);
                data.c[2]=mj;
                mj=Units.MJ(u.player.player,'e008','A02S',0,x,y,f,10,u.modelsize,1,"stand", "Asuna.mdl");//akiha claw.mdl
                mj.AnimeId(12);
                data.c[3]=mj; 
                data.g[0]=CreateGroup();
                Units.MJ(u.player.player,'e009','A02S',0,x,y,f,2,0.85,1.75,"stand", "rasengan_eff4.mdl").SetH(75);//akiha claw.mdl
                Units.MJ(u.player.player,'e008','A02S',0,x,y,f,1,0.75,2,"stand", "dust2_white.mdl");
                dash=Dash.Start(mj.unit,f,400,Dash.SUB,150,true,false);
                dash.Obj=data;
                dash.onMove=function(Dash dash){
                    Data data=Data(dash.Obj);
                    Units u=Units(data.c[0]);
                    Units mj;
                    //Units(data.c[1]).Position(dash.X,dash.Y,false);
                    Units(data.c[2]).Position(dash.X+50*CosBJ(dash.Angle),dash.Y+50*SinBJ(dash.Angle),false);
                    if(dash.Speed<6){
                        dash.Stop();
                    }else{
                        GroupEnumUnitsInRange(tmp_group,dash.X,dash.Y,125,function GroupIsAliveNotAloc);     
                        while(FirstOfGroup(tmp_group)!=null){
                            mj=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,mj.unit);
                            if(IsUnitEnemy(mj.unit,u.player.player)==true){   
                                if(IsUnitInGroup(mj.unit,data.g[0])==false){
                                    GroupAddUnit(data.g[0],mj.unit);
                                    u.Damage(mj.unit,Damage.Physics,'A02S',u.Agi(true)*1.4);
                                    Effect.ToUnit("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",mj.unit, "chest").Destroy();
                                    Dash.Start(mj.unit,dash.Angle,100,Dash.SUB,25,true,true); 
                                }

                            }
                        }
                        GroupClear(tmp_group);   
                    }
                };
                dash.onEnd=function(Dash dash){
                    Data data=Data(dash.Obj); 
                    Units mj=Units(data.c[3]);
                    Units(data.c[0]).Position(dash.X,dash.Y,false); 
                    mj.Life(0.5);
                    mj.DelayAlpha(255,0,0.4);
                    DestroyGroup(data.g[0]);
                    data.g[0]=null;
                    data.Destroy();
                };
            }else{//攻击触发
                a=GetRandomReal(-60,60);
                u.Position(u.X()+100*CosBJ(f+a),u.Y()+100*SinBJ(f+a),false);
                u.SetF(Util.XY(u.unit,target),true);
                Dash.Start(target,u.F(),75,Dash.SUB,5,true,false); 
                mj=Units.MJ(u.player.player,'e009','A02S',0,x,y,f,1,1.15,0.65,"birth", "az_lxj_blue_ex.mdl");//akiha claw.mdl
                mj.SetH(100);
                data.c[1]=mj;
                mj=Units.MJ(u.player.player,'e008','A02S',0,x,y,f,10,u.modelsize,1,"stand", "Asuna.mdl");//akiha claw.mdl
                mj.AnimeId(12);
                data.c[2]=mj;   
                Units.MJ(u.player.player,'e008','A02S',0,x,y,f,3,0.15,1,"stand", "bule-dark-salsh_red.mdl").SetH(100);
                //Units.MJ(u.player.player,'e009','A02S',0,x,y,f,1,1,1,"stand", "by_wood_gongchengsipai_2.mdl").SetH(75);//akiha claw.mdl
                
                dash=Dash.Start(mj.unit,f,250,Dash.SUB,50,true,false);
                dash.Obj=data;
                dash.onMove=function(Dash dash){
                    Data data=Data(dash.Obj);
                    Units(data.c[1]).Position(dash.X+50*CosBJ(dash.Angle),dash.Y+50*SinBJ(dash.Angle),false);
                };
                dash.onEnd=function(Dash dash){
                    Data data=Data(dash.Obj); 
                    Units mj=Units(data.c[2]);
                    mj.Life(0.5);
                    mj.DelayAlpha(255,0,0.4);
                    data.Destroy();
                };       
                Units.MJ(u.player.player,'e008','A02S',0,GetUnitX(target),GetUnitY(target),f,1,1.5,1.5,"death", "by_wood_gongchengsipai_3.mdl").SetH(100);//akiha claw.mdl
                Effect.ToUnit("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",target, "chest").Destroy();
                /*GroupEnumUnitsInRange(tmp_group,GetUnitX(target),GetUnitY(target),150,function GroupIsAliveNotAloc);     
                while(FirstOfGroup(tmp_group)!=null){
                    mj=Units.Get(FirstOfGroup(tmp_group));
                    GroupRemoveUnit(tmp_group,mj.unit);
                    if(IsUnitEnemy(mj.unit,u.player.player)==true){   
                        u.Damage(mj.unit,Damage.Physics,'A02S',u.Agi(true)*1.4);
                        Effect.ToUnit("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",mj.unit, "chest").Destroy();
                    }
                }
                GroupClear(tmp_group);*/
            }
        }

        //命令触发剑光冲击
        static method W1(EventArgs e){ 
            Units u=Units.Get(e.TriggerUnit);
            real f;
            Buffs b;   
            if(u.IsAbility('B00K')==true){//剑光冲击
                if(e.OrderId==851983&&u.player.AI()==false){
                    if(e.OrderTargetUnit==null){ 
                        f=Util.XYEX(u.X(),u.Y(),e.OrderTargetX,e.OrderTargetY);
                    }else{
                        f=Util.XY(u.unit,e.OrderTargetUnit);
                    }
                    b=Buffs.Find(u.unit,'B00K'); 
                    if(b.NowTime<6.990){ 
                        ASN.W2(u.unit,null,f,1);
                        b.Level-=1;
                        if(b.Level<=0){
                            b.Stop();
                        }  
                    }
                }  
            } 
        }

        //发动剑光冲击
        static method W(Spell e){
            Units u=Units.Get(e.Spell);
            Buffs b; 
            Data data;
            u.Pause(true);
            u.Pause(false);
            if(u.IsAbility('B00K')==true){
                Buffs.Add(u.unit,'A02U','B00K',7,false).Level=8;
                e.Destroy();
            }else{
                data=Data.create('A02S');
                data.c[0]=e;
                data.r[0]=GetUnitState(u.unit, ConvertUnitState(0x25))-0.4; //0.4 
                SetUnitState(u.unit, ConvertUnitState(0x25),GetUnitState(u.unit, ConvertUnitState(0x25)) - data.r[0] );
                b=Buffs.Add(u.unit,'A02U','B00K',7,false);
                b.Level=8;
                b.Obj=data;
                b.onEnd=function(Buffs b){
                    Data data=Data(b.Obj);
                    Units u=Units.Get(b.Unit);
                    SetUnitState(u.unit, ConvertUnitState(0x25),GetUnitState(u.unit, ConvertUnitState(0x25)) + data.r[0] );
                    Spell(data.c[0]).Destroy();
                    data.Destroy();
                };
            }
        }

        static method Q(Spell e){
            Units u=Units.Get(e.Spell);
            Dash dash;
            Data data=Data.create('A02R');
            real x=u.X(),y=u.Y(),f=e.Angle; 
            Units mj=Units.MJ(u.player.player,'e008','A02R',0,x+100*CosBJ(f),y+100*SinBJ(f),f,1,0.9,4,"birth", "dg1.mdl");//akiha claw.mdl
            mj.SetH(100); 
            data.c[2]=mj;
            Units.MJ(u.player.player,'e008','A02R',0,x,y,f,1,1,1.25,"stand", "dust2_white.mdl");
            Util.Duang(x,y,0.4,100,100,-115,0.02,50);
            u.Pause(true);
            u.AnimeId(12);
            u.SetF(e.Angle,true);
            mj=Units.MJ(u.player.player,'e008','A02R',0,x,y,GetRandomReal(0,360),3,3,5,"stand", "arcdirve02b1.mdl");
            mj.SetH(75);     
            data.c[0]=u;
            data.c[1]=e;
            data.c[3]=mj; 
            data.g[0]=CreateGroup();
            data.r[0]=0;
            data.r[4]=Damage.Physics;
            if(e.State!=Spell.SpellState){
                data.r[4]=Damage.Chaos; 
                mj=Units.MJ(u.player.player,'e009','A02R',0,x,y,f,2,1.5,2, "stand","wind.mdx");
                mj.SetH(100); 
                Dash.Start(mj.unit,f,250,Dash.SUB,60,true,false);
            }
            dash=Dash.Start(u.unit,f,300,Dash.SUB,100,true,false);
            dash.Obj=data;
            dash.onMove=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units(data.c[0]);
                Units mj; 
                real x=dash.X,y=dash.Y,dis=50,f=dash.Angle+180;
                if(dash.NowDis>130&&dash.NowDis<145){ 
                    mj=Units.MJ(u.player.player,'e008','A02R',0,x+dis*CosBJ(f),y+dis*SinBJ(f),f,1.5,2,0.75,"birth", "az_lxj_blue_ex.mdl");
                    mj.SetH(75);
                    Dash.Start(mj.unit,dash.Angle,250,Dash.SUB,100,true,false);
                } 
                Units(data.c[2]).Position(dash.X,dash.Y,false);
                Units(data.c[3]).Position(dash.X,dash.Y,false);
                Units(data.c[3]).SetF(Units(data.c[3]).F()+3,true);
                if(dash.Speed>5){ 
                    if(data.r[0]<=0){
                        data.r[0]=0.05; 
                        //剑尖
                        GroupEnumUnitsInRange(tmp_group,dash.X+125*CosBJ(dash.Angle),dash.Y+125*SinBJ(dash.Angle),100,function GroupIsAliveNotAloc);     
                        while(FirstOfGroup(tmp_group)!=null){
                            mj=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,mj.unit);
                            if(IsUnitEnemy(mj.unit,u.player.player)==true){  
                                if(IsUnitInGroup(mj.unit,data.g[0])==false){
                                    GroupAddUnit(data.g[0],mj.unit); 
                                    u.Damage(mj.unit,data.r[4],'A02R',u.Agi(true)*5);
                                    Effect.ToUnit("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",mj.unit, "chest").Destroy();
                                    Dash.Start(mj.unit,dash.Angle,200,Dash.SUB,75,true,true);
                                }
                            }
                        }
                        GroupClear(tmp_group);  
                        //身体周围
                        GroupEnumUnitsInRange(tmp_group,dash.X,dash.Y,100,function GroupIsAliveNotAloc);     
                        while(FirstOfGroup(tmp_group)!=null){
                            mj=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,mj.unit);
                            if(IsUnitEnemy(mj.unit,u.player.player)==true){  
                                if(IsUnitInGroup(mj.unit,data.g[0])==false){
                                    GroupAddUnit(data.g[0],mj.unit); 
                                    u.Damage(mj.unit,data.r[4],'A02R',u.Agi(true)*5);
                                    Effect.ToUnit("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",mj.unit, "chest").Destroy();
                                    Dash.Start(mj.unit,dash.Angle,300,Dash.SUB,75,true,true);
                                }
                            }
                        }
                        GroupClear(tmp_group);  
                    }else{
                        data.r[0]-=0.01;
                    }  
                }else{
                    if(Spell(data.c[1]).State!=Spell.SpellState){
                        dash.Stop(); 
                        Dash.Start(u.unit,dash.Angle,200,Dash.SUB,20,true,false); 
                    }
                }
            };
            dash.onEnd=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units(data.c[0]);
                u.Pause(false);
                DestroyGroup(data.g[0]);
                data.g[0]=null;
                Spell(data.c[1]).Destroy();
                data.Destroy();
            };
        }

        static method HERO_START(Spell e){
            Units u=Units.Get(e.Spell);
            if(u.MoveSpeed()>=500){ 
                SpellNameText(u.unit,"! 闪光穿刺 !",3,10);
                u.SetAbilityCD('A02R',5);
                u.SetMP(u.MP()-50);
                ASN.Q(e);
            }else{ 
                u.FlushAnimeId(14);
                e.Destroy();
            }
        }

        static method onInit(){  
            Spell.On(Spell.onSpell,'A02R',ASN.Q);
            Spell.On(Spell.onSpell,'A02S',ASN.W);
            Spell.On(Spell.onReady,'A02R',ASN.HERO_START);
            Units.On(Units.onHeroSpawn,ASN.Spawn);
            Events.On(Events.onUnitOrderToUnit,ASN.W1);
            Events.On(Events.onUnitOrderToLocation,ASN.W1); 
            Events.On(Events.onUnitAttack,ASN.W3);
            Damage.On(Damage.onUnitDamage_EndDamage,ASN.Damage);
            Damage.On(Damage.onUnitDamage_AddDamage,ASN.Damage_Add);
            Damage.On(Damage.onUnitDamage_SubDamage,ASN.Damage_Sub);
            R_attack=DefineSound("Sound\\Units\\Combat\\MetalMediumSliceMetal3.wav",1000, false, true);
            R_defend=DefineSound("resource\\sound_effect_asn_r.wav",1000, false, true);
        }
    }
}