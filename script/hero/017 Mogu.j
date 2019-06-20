library Mogu requires Groups{
    //英雄‘妹红’的技能
    //SR
    struct Mogu{ 

        /*
            2 - 回旋踢动作
            9 - 回旋踢（远）终结踢
            23 - 回旋踢(近)终结踢
            24 前摇
            25 踢
            26 落地
        */

        static method E(Spell e){
            Units u=Units.Get(e.Spell);
            Dash dash;
            Data data=Data.create('A06I');
            u.Pause(true);
            u.AnimeId(25); 
            data.c[0]=u;
            data.c[1]=e;
            data.r[0]=0;
            data.r[1]=0;
            HitFlys.Add(u.unit,6);
            dash=Dash.Start(u.unit,e.Angle,1600,Dash.SUB,80,true,false);
            dash.Obj=data;
            dash.onMove=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units(data.c[0]);
                Units mj;
                if(dash.Speed<6){
                    dash.Stop();
                }else{
                    if(data.r[0]==0){
                        data.r[0]=0.05;
                        GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),150,function GroupIsAliveNotAloc);     
                        while(FirstOfGroup(tmp_group)!=null){
                            mj=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,mj.unit);
                            if(IsUnitEnemy(mj.unit,u.player.player)==true&&mj.IsAbility('B023')==false){ 
                                //伤害和减速 
                                u.Damage(mj.unit,Damage.Physics,'A06I',u.Str(true)*13);
                                Dash.Start(mj.unit,dash.Angle,(dash.MaxDis-dash.NowDis)+GetRandomReal(0,200),Dash.SUB,dash.Speed*0.88,true,true);
                                HitFlys.Reset(mj.unit);
                                HitFlys.Add(mj.unit,10);
                                Units.MJ(u.player.player,'e008','A06I',0,mj.X(),mj.Y(),dash.Angle,3,1.5,1,"stand","fire-hit-kulouwang.mdl").SetH(75);
                                Effect.ToUnit("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",mj.unit,"chest").Destroy();
                                Buffs.Add(mj.unit,'A06J','B023',3,false).Type=Buffs.TYPE_SUB+Buffs.TYPE_DISPEL_TRUE;
                            }  
                        }
                        GroupClear(tmp_group);  
                    }else{
                        data.r[0]-=0.01;
                    }
                    if(data.r[1]==0){
                        Effect.ToUnit("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",u.unit,"foot left").Destroy();
                        Effect.ToUnit("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",u.unit,"foot right").Destroy();

                        data.r[1]=0.1;
                    }else{
                        data.r[1]-=0.01;
                    }
                }
            };
            dash.onEnd=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units(data.c[0]);
                if(u.Alive()==true){
                    u.AnimeSpeed(0.75);
                    u.AnimeId(26);
                    u.DelayReleaseAnimePause(0.4);
                    Dash.Start(u.unit,dash.Angle,300,Dash.SUB,dash.Speed,true,false);
                }else{ 
                    u.Pause(false); 
                } 
                Spell(data.c[1]).Destroy();
                data.Destroy();
            };
        }

        static method W1(Data data){
            Units u=Units(data.c[0]);
            Spell e=Spell(data.c[1]);
            data.i[0]+=1;
            data.i[1]=0;//当前阶段，0为后回旋，1为输出回旋
            data.r[1]=0.329/data.r[0];//后回旋，结束时牵引判定
            data.r[2]=0.123/data.r[0];//前回旋，伤害判定
            data.r[3]=0;//前回旋火焰角度
            data.r[4]=180/(data.r[2]/0.01);//前回旋火焰角度幅度
            data.r[5]=0;//后回旋火焰角度
            data.r[6]=180/(data.r[1]/0.01);//后回旋火焰角度幅度 
            u.Pause(true);
            u.AnimeSpeed(data.r[0]);
            u.AnimeId(2);
            Timers.Start(0.01,data,function(Timers t){
                Data data=Data(t.Data());
                Units u=Units(data.c[0]);
                Units mj;
                real x,y,f;
                Data data1;
                if(u.Alive()==true){
                    if(u.IsTimeStop()==false){
                        if(data.i[1]==0){
                            if(data.r[1]<=0){
                                //后回旋结束，进入前回旋
                                //u.AnimeSpeed(0.4*data.r[0]);
                                Dash.Start(u.unit,u.F(),50,Dash.NORMAL,u.MoveSpeed()/100,true,false);
                                data.i[1]=1;
                            }else{
                                data.r[1]-=0.01; 
                                if(data.r[1]>=0.13&&data.r[1]<=0.14){//牵引周围敌人 
                                    BJDebugMsg("??");
                                    mj=Units.MJ(u.player.player,'e008','A06G',0,u.X(),u.Y(),GetRandomReal(0,360),2,1,2,"stand","dark1_ex.mdl");
                                    mj.DelaySizeEx(1,0.5,0.5);
                                    f=u.F();
                                    x=u.X()+150*CosBJ(f);
                                    y=u.Y()+150*SinBJ(f);
                                    f=Util.XYEX(x,y,x+100*CosBJ(f),y+100*SinBJ(f));
                                    GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),250,function GroupIsAliveNotAloc);     
                                    while(FirstOfGroup(tmp_group)!=null){
                                        mj=Units.Get(FirstOfGroup(tmp_group)); 
                                        GroupRemoveUnit(tmp_group,mj.unit);
                                        if(IsUnitEnemy(mj.unit,u.player.player)==true){
                                            if((Util.XY2(mj.unit,u.unit)>200&&Util.FAN(u.unit,mj.unit,f,80)==true)||(Util.FAN(u.unit,mj.unit,f,80)==false)){ 
                                                Dash.Start(mj.unit,Util.XYEX(mj.X(),mj.Y(),x,y),Util.XY2EX(mj.X(),mj.Y(),x,y),Dash.NORMAL,15,true,true);
                                                Effect.ToUnit("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",mj.unit,"chest").Destroy();
                                            }  
                                        }
                                    }
                                    GroupClear(tmp_group); 
                                    
                                }
                                //后回旋火焰
                                    f=(u.F()+90)+data.r[5];
                                    data.r[5]+=data.r[6];
                                    mj=Units.MJ(u.player.player,'e008','A06G',0,u.X()+70*CosBJ(f),u.Y()+70*SinBJ(f),GetRandomReal(0,360),2,0.5,1,"death","Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl");
                                    mj.SetH(70-(data.r[5]/2)); 
                                    Dash.Start(mj.unit,f,70,Dash.SUB,15,true,false); 
                            }
                        }else{
                            if(data.r[2]<=0){
                                u.AnimeSpeed(1);
                                u.Pause(false);
                                t.Destroy();
                                if(u.player.press.W==true&&u.IsAbility('BPSE')==false&&data.i[0]<4){
                                    //继续踢
                                    data.r[0]+=0.25;
                                    Mogu.W1(data);
                                }else{
                                    //不踢了 
                                    if(u.IsAbility('BPSE')==false){ 
                                        data1=Data.create('A06G');
                                        data1.c[0]=u;
                                        data1.c[1]=data.c[1];
                                        data1.r[0]=0.2;
                                        if(data.i[0]>2){
                                            //踢远并减速
                                            data1.r[0]=0.24;
                                            u.Pause(true);
                                            u.AnimeId(9);
                                            u.AnimeSpeed(1);
                                            Timers.Start(0.01,data1,function(Timers t){ 
                                                Data data=Data(t.Data());
                                                Units u=Units(data.c[0]);
                                                Units mj;
                                                real x,y,f;
                                                if(u.Alive()==true){
                                                    if(data.r[0]<=0){
                                                        x=u.X();
                                                        y=u.Y(); 
                                                        f=u.F();
                                                        x=x+100*CosBJ(f);
                                                        y=y+100*SinBJ(f);
                                                        Dash.Start(u.unit,f,125,Dash.SUB,10,true,false);
                                                        mj=Units.MJ(u.player.player,'e009','A06G',0,x,y,f,2,1,1.25,"stand","Abilities\\Spells\\Other\\Doom\\DoomDeath.mdl");
                                                        mj.SetH(75);
                                                        Dash.Start(mj.unit,f,140,Dash.SUB,12,true,false); 
                                                        GroupEnumUnitsInRange(tmp_group,x,y,150,function GroupIsAliveNotAloc);     
                                                        while(FirstOfGroup(tmp_group)!=null){
                                                            mj=Units.Get(FirstOfGroup(tmp_group));
                                                            GroupRemoveUnit(tmp_group,mj.unit);
                                                            if(IsUnitEnemy(mj.unit,u.player.player)==true){ 
                                                                //伤害和减速
                                                                
                                                                u.Damage(mj.unit,Damage.Physics,'A06G',u.Str(true)*5);
                                                                Dash.Start(mj.unit,f,1000,Dash.SUB,20,true,true);
                                                                HitFlys.Reset(mj.unit);
                                                                HitFlys.Add(mj.unit,22);
                                                                Effect.ToUnit("by_wood_effect_yuzhiboyou_fire_fengxianhuo_2.mdl",mj.unit,"chest").Destroy();
                                                                Effect.ToUnit("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",mj.unit,"chest").Destroy();
                                                                Buffs.Add(mj.unit,'A06H','B022',6,false).Type=Buffs.TYPE_SUB+Buffs.TYPE_DISPEL_TRUE;
                                                            }  
                                                        }
                                                        GroupClear(tmp_group);  
                                                        u.DelayReleaseAnimePause(0.4);
                                                        t.Destroy();
                                                        Spell(data.c[1]).Destroy();
                                                        data.Destroy();
                                                    }else{
                                                        if(u.IsTimeStop()==false){
                                                            data.r[0]-=0.01;
                                                        }
                                                    }
                                                }else{
                                                    u.Pause(false);
                                                    t.Destroy();
                                                    Spell(data.c[1]).Destroy();
                                                    data.Destroy();
                                                } 
                                            });
                                        }else{
                                            //踢高并眩晕 
                                            u.Pause(true);
                                            u.AnimeId(23);
                                            u.AnimeSpeed(0.7);
                                            Timers.Start(0.01,data1,function(Timers t){ 
                                                Data data=Data(t.Data());
                                                Units u=Units(data.c[0]);
                                                Units mj;
                                                real x,y,f;
                                                if(u.Alive()==true){
                                                    if(data.r[0]<=0){
                                                        x=u.X();
                                                        y=u.Y();
                                                        f=u.F();
                                                        x=x+100*CosBJ(f);
                                                        y=y+100*SinBJ(f);
                                                        Dash.Start(u.unit,f,125,Dash.SUB,10,true,false);
                                                        HitFlys.Add(u.unit,20);
                                                        mj=Units.MJ(u.player.player,'e008','A06G',0,x,y,0,2,0.5,0.7,"stand",".mdl");
                                                        Dash.Start(mj.unit,f,140,Dash.NORMAL,5,true,false); 
                                                        Timers.Start(0.01,mj,function(Timers t){
                                                            Units u=Units(t.Data());
                                                            Units mj;
                                                            if(u.aidindex==1){
                                                                t.Destroy();
                                                            }else{
                                                                if(u.Obj==0){
                                                                    u.Obj=2;
                                                                    mj=Units.MJ(u.player.player,'e008','A06G',0,u.X(),u.Y(),GetRandomReal(0,360),2,GetRandomReal(1,2),1,"death","Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl");
                                                                    mj.SetH(u.H());
                                                                    if(GetRandomInt(1,4)==1){
                                                                        mj=Units.MJ(u.player.player,'e008','A06G',0,u.X(),u.Y(),GetRandomReal(0,360),3,1,1.4,"stand","by_wood_effect_yuzhiboyou_fire_fengxianhuo_2.mdl");
                                                                        mj.SetH(u.H());  
                                                                    }
                                                                }else{
                                                                    u.Obj-=1;
                                                                }
                                                            }
                                                        });
                                                        HitFlys.Lister(HitFlys.Add(mj.unit,35),HitFlys.onDown,function(HitFlys h){
                                                            Units u=Units.Get(h.Unit);
                                                            Units mj;
                                                            u.aidindex=1;
                                                            mj=Units.MJ(u.player.player,'e008','A06G',0,u.X(),u.Y(),GetRandomReal(0,360),3,3,0.6,"stand","by_wood_effect_yuzhiboyou_fire_fengxianhuo_2.mdl");
                                                            mj.SetH(u.H()); 
                                                            GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),150,function GroupIsAliveNotAloc);     
                                                            while(FirstOfGroup(tmp_group)!=null){
                                                                mj=Units.Get(FirstOfGroup(tmp_group));
                                                                GroupRemoveUnit(tmp_group,mj.unit);
                                                                if(IsUnitEnemy(mj.unit,u.player.player)==true){ 
                                                                    if(mj.H()>=u.H()-50){ 
                                                                        Dash.Start(mj.unit,GetRandomReal(0,360),400,Dash.SUB,13,true,false);
                                                                        HitFlys.Reset(mj.unit);
                                                                        HitFlys.Add(mj.unit,20);
                                                                        //Effect.ToUnit("by_wood_effect_yuzhiboyou_fire_fengxianhuo_2.mdl",mj.unit,"chest").Destroy();
                                                                        Effect.ToUnit("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",mj.unit,"chest").Destroy();
                                                                    }
                                                                }
                                                            }
                                                            GroupClear(tmp_group);  
                                                        }); 
                                                        GroupEnumUnitsInRange(tmp_group,x,y,150,function GroupIsAliveNotAloc);     
                                                        while(FirstOfGroup(tmp_group)!=null){
                                                            mj=Units.Get(FirstOfGroup(tmp_group));
                                                            GroupRemoveUnit(tmp_group,mj.unit);
                                                            if(IsUnitEnemy(mj.unit,u.player.player)==true){ 
                                                                //伤害和眩晕 
                                                                Buffs.Skill(mj.unit,'A00F',1);
                                                                u.Damage(mj.unit,Damage.Magic,'A06G',u.Str(true)*4);
                                                                u.Damage(mj.unit,Damage.Physics,'A06G',u.Str(true)*3);
                                                                Dash.Start(mj.unit,f,140,Dash.NORMAL,5,true,false);
                                                                HitFlys.Reset(mj.unit);
                                                                HitFlys.Add(mj.unit,35);
                                                                Effect.ToUnit("by_wood_effect_yuzhiboyou_fire_fengxianhuo_2.mdl",mj.unit,"chest").Destroy();
                                                                Effect.ToUnit("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",mj.unit,"chest").Destroy();
                                                            }
                                                        }
                                                        GroupClear(tmp_group);  
                                                        u.DelayReleaseAnimePause(0.35);
                                                        t.Destroy();
                                                        Spell(data.c[1]).Destroy();
                                                        data.Destroy();
                                                    }else{
                                                        if(u.IsTimeStop()==false){
                                                            data.r[0]-=0.01;
                                                        }
                                                    }
                                                }else{
                                                    u.Pause(false);
                                                    t.Destroy();
                                                    Spell(data.c[1]).Destroy();
                                                    data.Destroy();
                                                } 
                                            });
                                        }
                                    }else{
                                        Spell(data.c[1]).Destroy();
                                    }
                                    data.Destroy();
                                }
                            }else{
                                data.r[2]-=0.01; 
                                f=(u.F()-90)+data.r[3];
                                data.r[3]+=data.r[4];
                                mj=Units.MJ(u.player.player,'e008','A06G',0,u.X()+60*CosBJ(f),u.Y()+60*SinBJ(f),GetRandomReal(0,360),2,0.5,0.7,"stand","by_wood_effect_yuzhiboyou_fire_fengxianhuo_2.mdl");
                                mj.SetH(30+(data.r[3]/2)); 
                                Dash.Start(mj.unit,f,70,Dash.SUB,15,true,false); 
                                if(data.r[2]>=0.04&&data.r[2]<=0.05){
                                    x=u.X();
                                    y=u.Y();
                                    f=Util.XYEX(x,y,x+100*CosBJ(u.F()),y+100*SinBJ(u.F()));
                                    GroupEnumUnitsInRange(tmp_group,x,y,200,function GroupIsAliveNotAloc);     
                                    while(FirstOfGroup(tmp_group)!=null){
                                        mj=Units.Get(FirstOfGroup(tmp_group));
                                        GroupRemoveUnit(tmp_group,mj.unit);
                                        if(IsUnitEnemy(mj.unit,u.player.player)==true){
                                            if(Util.FAN(u.unit,mj.unit,f,80)==true){ 
                                                //伤害 
                                                u.Damage(mj.unit,Damage.Physics,'A06G',u.Str(true)); 
                                                u.Damage(mj.unit,Damage.Magic,'A06G',u.Str(true));
                                                Dash.Start(mj.unit,f,50,Dash.NORMAL,6,true,true);
                                                HitFlys.Add(mj.unit,13);
                                                Effect.ToUnit("by_wood_effect_yuzhiboyou_fire_fengxianhuo_2.mdl",mj.unit,"chest").Destroy();
                                                Effect.ToUnit("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",mj.unit,"chest").Destroy();
                                            } 
                                        }
                                    }
                                    GroupClear(tmp_group);  
                                }
                            }   
                        }        
                    }
                }else{
                    u.AnimeSpeed(1);
                    u.Pause(false);
                    t.Destroy();
                    Spell(data.c[1]).Destroy();
                    data.Destroy(); 
                }
            });
        }

        static method W(Spell e){
            Data data=Data.create('A06G');
            data.c[0]=Units.Get(e.Spell);
            data.c[1]=e;
            data.i[0]=0;//踢的次数
            data.r[0]=1.0;//速度倍率
            Mogu.W1(data);
        }

        static method Q(Units u,Units m){
            if(u.aid=='A06E'&&u.aidindex==0){ 
                Units.MJ(u.player.player,'e008','A06E',1,u.X(),u.Y(),GetRandomReal(0,360),2.5,0.8,2, "stand","chushou_by_wood_effect_flame_explosion_2.mdl");
                //Util.Range(u.X(),u.Y(),150);
                GroupDamage(u, u.X(),u.Y(),150,u.player.hero.Str(true)*1.5,Damage.Magic,'A06E',false); 
            }
        }

        static method Spawn(Units u,Units m){
            Data data;
            if(u.IsAbility('A06E')==true){
                data=Data.create('A06E');
                data.c[0]=u;
                data.c[1]=Effect.ToUnit("fire-buff-qiquan.mdl",u.unit,"origin");
                data.r[0]=0;
                BJDebugMsg("有了");
                Timers.Start(500,data,function(Timers t){//0.05
                    Data data=Data(t.Data());
                    Units u=Units(data.c[0]);
                    Units mj; 
                    if(u.IsTimeStop()==false){
                        if(data.r[0]==0){
                            data.r[0]=1;
                            if(u.Alive()==true){
                                //伤害和留下火
                                Effect.ToUnit("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",u.unit,"right hand").Destroy();
                                Effect.ToUnit("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",u.unit,"left hand").Destroy();
                                Effect.ToUnit("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",u.unit,"chest").Destroy();
                                mj=Units.MJ(u.player.player,'e008','A06E',0,u.X(),u.Y(),0,GetRandomReal(0.5,1.5),1.5,1, "stand","Environment\\LargeBuildingFire\\LargeBuildingFire1.mdl");
                                mj.Position(mj.X(),mj.Y(),true);
                                mj.AddAbility(Units.MJType_FZW);
                                GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),150,function GroupIsAliveNotAloc);     
                                while(FirstOfGroup(tmp_group)!=null){
                                    mj=Units.Get(FirstOfGroup(tmp_group));
                                    GroupRemoveUnit(tmp_group,mj.unit);
                                    if(IsUnitEnemy(mj.unit,u.player.player)==true){
                                        u.Damage(mj.unit,Damage.Magic,'A06E',u.Str(true));  
                                        Buffs.Add(mj.unit,'A06F','B021',2,false).Type=Buffs.TYPE_SUB+Buffs.TYPE_DISPEL_TRUE;
                                    }
                                }
                                GroupClear(tmp_group); 
                            }else{
                                BJDebugMsg("没了");
                                Effect(data.c[1]).Destroy();
                                data.Destroy();
                                t.Destroy();
                            }
                        }else{
                            data.r[0]-=0.05;
                        }
                    }
                });
            }
        }

        static method HERO_START(Spell e){
            Units u=Units.Get(e.Spell);
            if(e.Id=='A06I'){
                u.FlushAnimeId(24);
                HitFlys.Add(u.unit,7);
                Dash.Start(u.unit,e.Angle+180,75,Dash.NORMAL,4,true,false);
            }
        }

        /*static method HERO_STOP(Spell e){

        }*/

        static method onInit(){
            Units.On(Units.onHeroSpawn,Mogu.Spawn); 
            Units.On(Units.onAlocDeath,Mogu.Q); 
            Spell.On(Spell.onSpell,'A06G',Mogu.W);
            Spell.On(Spell.onSpell,'A06I',Mogu.E);
            Spell.On(Spell.onReady,'A06I',Mogu.HERO_START); 
            //Spell.On(Spell.onStop,'A06I',Mogu.HERO_STOP); 
        }
    }
}