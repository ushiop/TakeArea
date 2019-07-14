library XN requires Groups{
    //英雄‘傻娜’的技能
    //SSR
    struct XN{ 

        /*
            20 - 上挑前摇
            21 - 上挑
        */

        

        static method Q1(Units u){//一文字
            /*
                11 - 一文字
                0.933 前冲
                0.167 判定
            */
            Buffs b=Buffs.Find(u.unit,'B02C');
            Data data=Data.create('A074');
            b.Level=0;
            b.Stop();
            u.Pause(true);
            u.AnimeId(11);
            u.AnimeSpeed(2);
            u.SetF(u.F(),true);
            Order.To(u.unit,"stop");
            data.c[0]=u;
            data.c[1]=Effect.ToUnit("buff_fire.mdl",u.unit,"weapon");
            data.r[0]=0.46;//0.93
            data.r[1]=0.16;
            data.i[0]=0;//阶段
            Timers.Start(0.01,data,function(Timers t){
                Data data=Data(t.Data());
                Units u=Units(data.c[0]);
                real x=u.X(),y=u.Y(),f=u.F(),x1,y1;
                integer i,o;
                Units mj;
                if(u.Alive()==false){
                    Effect(data.c[1]).Destroy();
                    u.AnimeSpeed(1);
                    u.Pause(false);
                    t.Destroy();
                    data.Destroy();
                }else{ 
                    if(u.IsTimeStop()==false){
                        if(data.i[0]==0){
                            if(data.r[0]<=0){
                                //前冲
                                data.i[0]=1;
                                u.AnimeSpeed(1);
                                Dash.Start(u.unit,f,100,Dash.SUB,25,true,false);
                                Units.MJ(u.player.player,'e008','A074',0,x+50*CosBJ(f),y+50*SinBJ(f),f,2.5,1.75,1, "stand","az-xiapi_chengse.mdl");
                                GroupEnumUnitsInRange(tmp_group,x+200*CosBJ(f),y+200*SinBJ(f),225,function GroupIsAliveNotAloc);     
                                while(FirstOfGroup(tmp_group)!=null){
                                    mj=Units.Get(FirstOfGroup(tmp_group));
                                    GroupRemoveUnit(tmp_group,mj.unit);
                                    if(IsUnitEnemy(mj.unit,u.player.player)==true){  
                                        u.Damage(mj.unit,Damage.Chaos,'A074',u.Agi(true)*2);  
                                        Dash.Start(mj.unit,f,200,Dash.SUB,40,true,false); 
                                        
                                        Effect.ToUnit("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",mj.unit,"chest").Destroy(); 
                                        XN.FIRE_BOOM(u.unit,mj.unit);  
                                    }  
                                }
                                GroupClear(tmp_group);
                                //判定 
                                //az_lina_d2.mdl
                                for(1<=i<4){
                                    for(1<=o<3){
                                        x1=x+(100*i)*CosBJ(f);
                                        y1=y+(100*i)*SinBJ(f);
                                        Units.MJ(u.player.player,'e009','A074',0,x1+(o*20)*CosBJ(f-60),y1+(o*20)*SinBJ(f-60),f-60,2.5,2,1, "death","Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl").SetH(100);
                                        Units.MJ(u.player.player,'e009','A074',0,x1+(o*20)*CosBJ(f+60),y1+(o*20)*SinBJ(f+60),f+60,2.5,2,1, "death","Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl").SetH(100);
                                
                                    }
                                }  
                            }else{
                                data.r[0]-=0.01;
                            }
                        }else{
                            if(data.r[1]<=0){ 
                                
                                u.DelayReleaseAnimePause(0.4);
                                Effect(data.c[1]).Destroy();
                                t.Destroy();
                                data.Destroy();
                            }else{
                                data.r[1]-=0.01;
                            }
                        }
                    }
                }
            });
        }

        static method Press(player ps,string k){
            Players p=Players.Get(ps);
            if(k=="Q"){ 
                if(p.hero.IsAbility('B02C')==true&&p.hero.IsPause()==false&&p.hero.IsAbility('BPSE')==false){
                    if(Buffs.Find(p.hero.unit,'B02C').Level==1){ 
                        XN.Q1(p.hero);
                    }
                }
            } 
        } 

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
            if(u.player.press.D==true){
                XN.D2(u,e.Angle);
            }
            Effect.ToUnit("buff_fire.mdl",u.unit,"weapon").Destroy();
            Buffs.Add(u.unit,'A076','B02C',5,false).Level=1;
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

        static method FIRE_BOOM(unit ua,unit ma){//由U引爆M身上的火种
            Buffs b;
            Units u=Units.Get(ua),m=Units.Get(ma);  
            Data data;
            if(m.IsAbility('B02B')==true){
                b=Buffs.Find(m.unit,'B02B');
                data=Data.create('A073');
                data.c[0]=u;
                data.c[1]=m;
                data.i[0]=b.Level;
                data.r[0]=10;//击飞高度
                data.r[1]=0.3;//爆炸间隔
                b.Stop();
                Timers.Start(0.1,data,function(Timers t){
                    Data data=Data(t.Data());
                    Units u=Units(data.c[0]);
                    Units m=Units(data.c[1]);
                    if(m.Alive()==false||data.i[0]<=0){
                        t.Destroy();
                        data.Destroy();
                    }else{
                        t.SetTime(data.r[1]);
                        data.i[0]-=1;
                        Buffs.Skill(m.unit,'A00A',1); 
                        u.Damage(m.unit,Damage.Chaos,'A073',u.Agi(true)*2); 
                        if(u.GetAbilityCD('A074')!=0){//减少上挑冷却
                            u.SetAbilityCD('A074',u.GetAbilityCD('A074')-1);
                        }

                        //视觉效果
                        HitFlys.Add(m.unit,data.r[0]);
                        Dash.Start(m.unit,GetRandomReal(0,360),100,Dash.SUB,10,true,false);
                        Effect.ToUnit("Abilities\\Spells\\Items\\AIfb\\AIfbSpecialArt.mdl",m.unit,"chest").Destroy();
                        Effect.ToUnit("by_wood_effect_yuzhiboyou_fire_fengxianhuo_2.mdl",m.unit,"chest").Destroy();
                        
                        data.r[0]+=10;
                        data.r[1]+=0.15;
                    }
                });
            }
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

        static method D2(Units u,real angle){
            Data data=Data(u.Obj);
            Units mj;
            Dash dash;
            Units tmp;
            if(GroupNumber(data.g[0])!=0){
                mj=Units.Get(GroupFirst(data.g[0])); 
                GroupRemoveUnit(data.g[0],mj.unit); 
                mj.Position(mj.X(),mj.Y(),true);
                mj.AddAbility(Units.MJType_TSW);
                mj.Model("by_wood_effect_yuzhiboyou_fire_haohuoqiu.mdl");
                mj.Anime("birth");
                mj.SetF(angle,true); 
                /*
                    击退判定
                */
                //Util.Range(u.X()+100*CosBJ(angle),u.Y()+100*SinBJ(angle),200);
                GroupEnumUnitsInRange(tmp_group,u.X()+100*CosBJ(angle),u.Y()+100*SinBJ(angle),200,function GroupIsAliveNotAloc);     
                while(FirstOfGroup(tmp_group)!=null){
                    tmp=Units.Get(FirstOfGroup(tmp_group));
                    GroupRemoveUnit(tmp_group,tmp.unit);
                    if(IsUnitEnemy(tmp.unit,u.player.player)==true){  
                        HitFlys.Add(tmp.unit,12.5);
                        Dash.Start(tmp.unit,angle,950,Dash.SUB,30,true,true);  
                        Effect.ToUnit("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",tmp.unit,"chest").Destroy();

                    }  
                }
                GroupClear(tmp_group);
                HitFlys.Add(mj.unit,20);
                dash=Dash.Start(mj.unit,angle,1100,Dash.SUB,75,true,false);
                dash.onMove=function(Dash dash){
                    Units u=Units.Get(dash.Unit);
                    if(u.H()<=50){
                        dash.Stop();
                    }
                }; 
                dash.onEnd=function(Dash dash){
                    Units u=Units.Get(dash.Unit);
                    Units tmp;
                    /*
                        伤害判定
                    */
                    //Units.MJ(u.player.player,'e008','A072',0,dash.X,dash.Y,dash.Angle,3,0.7,1, "death","by_wood_effect_yuzhiboyou_fire_babangouyu_2_di__ex.mdl");
                    Util.Range(u.X(),u.Y(),325);
                    GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),300,function GroupIsAliveNotAloc);     
                    while(FirstOfGroup(tmp_group)!=null){
                        tmp=Units.Get(FirstOfGroup(tmp_group));
                        GroupRemoveUnit(tmp_group,tmp.unit);
                        if(IsUnitEnemy(tmp.unit,u.player.player)==true){  
                            Effect.ToUnit("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",tmp.unit,"chest").Destroy();
                        
                            u.Damage(tmp.unit,Damage.Magic,'A072',u.Agi(true)*5);
                            HitFlys.Add(tmp.unit,25);
                            Dash.Start(tmp.unit,Util.XY(u.unit,tmp.unit),400,Dash.SUB,55,true,false);  
                        }  
                    }
                    GroupClear(tmp_group);
                    Units.MJ(u.player.player,'e008','A072',0,dash.X,dash.Y,dash.Angle,5,2,2, "stand","chushou_by_wood_effect_flame_explosion_2.mdl");
                    u.Anime("death");
                    u.Life(10);
                };
            } 
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
                        Units.MJ(u.player.player,'e009','A072',0,dash.X,dash.Y,dash.Angle,2.5,1.5,1, "death","Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl").SetH(100);
                    
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

            Press.OnSnyc(Press.onSnycPressKeyDown,XN.Press);
            Spell.On(Spell.onSpell,'A074',XN.Q);    
            Spell.On(Spell.onReady,'A074',XN.HERO_START); 
            Spell.On(Spell.onStop,'A074',XN.HERO_STOP);  
        }
    }
}