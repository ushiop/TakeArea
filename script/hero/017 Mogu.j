library Mogu requires Groups{
    //英雄‘妹红’的技能
    //SR
    struct Mogu{ 

        /*
            2 - 回旋踢动作
            9 - 回旋踢（远）终结踢
            23 - 回旋踢(近)终结踢
            24 飞踢 前摇
            25 飞踢 踢
            26 飞踢 落地
            27 火柱 前摇 
            28 火柱 喷火
            29 火柱 收招
            A06S B026 -复活蛋蛋BUFF
            A06R B025 - 不死鸟BUFF
        */

        static method D(unit u){
            
        }

        static method Damage(DamageArgs e){
            if(e.TriggerUnit.IsAbility('B026')==true){
                e.Damage=0;
            }else{
                if(e.TriggerUnit.IsAbility('A06Q')==true){//是妹红
                    if(e.TriggerUnit.player.lv20!=null){//20级了
                        if(e.TriggerUnit.player.nextherotype==-1){//未指定复活英雄
                            if(e.Damage>(e.TriggerUnit.HP()-5)){//致死
                                e.Damage=0;
                                Mogu.D(e.TriggerUnit.unit);
                            }
                        }
                    }
                }
            } 
        }

        static method R(Spell e){
            Units u=Units.Get(e.Spell);
            Data data=Data.create('A06M');
            Units mj;
            real x=u.X(),y=u.Y();
            u.Pause(true);
            u.AnimeId(28);
            u.PositionEnabled(false);
            Units.MJ(u.player.player,'e008','A06M',0,x,y,0,5,1.5,1, "stand","!huobao.mdl");
            Units.MJ(u.player.player,'e008','A06M',0,x,y,0,5,0.75,2, "stand","!huobao.mdl");
            Units.MJ(u.player.player,'e008','A06M',0,x,y,0,5,2.5,0.8, "stand","Abilities\\Spells\\Other\\Doom\\DoomDeath.mdl");
            //Units.MJ(u.player.player,'e008','A06M',0,x,y,0,5,2,2, "stand","az_coco_e2.mdl");
            Units.MJ(u.player.player,'e008','A06M',0,x,y,0,5,2,1, "stand","fire-boom-new.mdl"); 
            Units.MJ(u.player.player,'e008','A06M',0,x,y,0,5,1.8,2, "stand","az_kaer_t1.mdl");
            mj=Units.MJ(u.player.player,'e008','A06M',0,x,y,0,6,1.5,0.75, "birth","by_wood_effect_tianhuo_1_1.mdl");  //持续 x1.5
            data.c[2]=mj;
            mj=Units.MJ(u.player.player,'e008','A06M',0,x,y,0,6,2,1, "birth","chushou_by_wood_effect_unusual_kof_caoti_huozhu.mdl");  //持续 0.75
            data.c[3]=mj;
            mj=Units.MJ(u.player.player,'e008','A06M',0,x,y,0,6,3,1, "stand","fire-zhendi-guangzhu.mdl");  //持续 2
            data.c[4]=mj; 
            /*
                伤害 减速
            */
            GroupEnumUnitsInRange(tmp_group,x,y,450,function GroupIsAliveNotAloc);     
            while(FirstOfGroup(tmp_group)!=null){
                mj=Units.Get(FirstOfGroup(tmp_group));
                GroupRemoveUnit(tmp_group,mj.unit);
                if(IsUnitEnemy(mj.unit,u.player.player)==true){ 
                    //伤害和减速 
                    u.Damage(mj.unit,Damage.Magic,'A06M',u.Str(true)*10);
                    Dash.Start(mj.unit,Util.XY(u.unit,mj.unit),300,Dash.SUB,20,true,false); 
                    HitFlys.Add(mj.unit,10); 
                    Effect.ToUnit("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",mj.unit,"chest").Destroy();
                    Buffs.Add(mj.unit,'A06P','B024',4,false).Type=Buffs.TYPE_SUB+Buffs.TYPE_DISPEL_TRUE;
                }  
            }
            GroupClear(tmp_group); 
            u.player.Duang(80,0.5);  
            Util.Duang(x,y,0.5,400,400,-100,0.02,50);
            data.c[0]=u;
            data.c[1]=e;
            data.r[0]=1;//持续时间
            data.r[1]=0;//间隔时间
            data.r[2]=0;//持续时间
            Timers.Start(0.01,data,function(Timers t){
                Data data=Data(t.Data());
                Units u=Units(data.c[0]);
                real x=u.X(),y=u.Y();
                Units mj;
                HitFlys h;
                real hp;
                if(u.Alive()==false||u.player.press.R==false||u.IsAbility('BPSE')==true||data.r[0]<=0||u.IsTimeStop()==true||u.IsAbility('B026')==true){
                    Units(data.c[2]).Life(0.1);
                    Units(data.c[3]).Anime("death");
                    Units(data.c[4]).Life(0.1); 
                    u.PositionEnabled(true);
                    if(data.r[2]<1){//爆发小于1秒硬直极短
                        u.Anime("stand");
                        u.DelayReleaseAnimePause(0.25);
                    }else{
                        u.AnimeId(29);
                        h=HitFlys.Add(u.unit,16);
                        h.LocalPower=0.7;
                        HitFlys.Lister(h,HitFlys.onEnd,function(HitFlys h){
                            Units u=Units.Get(h.Unit);
                            u.DelayReleaseAnimePause(0.5);
                        }); 
                        u.player.Duang(35,0.1); 
                        
                        Units.MJ(u.player.player,'e008','A06M',0,x,y,0,0.75,4,1, "stand","fire-zhendi-guangzhu.mdl");
                        Units.MJ(u.player.player,'e008','A06M',0,x,y,0,5,2,1, "stand","warstompcaster.mdl");
                        Units.MJ(u.player.player,'e008','A06M',0,x,y,0,5,3,2, "stand","fire-boom-new.mdl"); 
                        GroupEnumUnitsInRange(tmp_group,x,y,550,function GroupIsAliveNotAloc);     
                        while(FirstOfGroup(tmp_group)!=null){
                            mj=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,mj.unit);
                            if(IsUnitEnemy(mj.unit,u.player.player)==true){ 
                                //伤害和减速 
                                u.Damage(mj.unit,Damage.Chaos,'A06M',u.Str(true)*2);   
                                Dash.Start(mj.unit,Util.XY(u.unit,mj.unit),600,Dash.SUB,30,true,true); 
                            }  
                        } 
                        GroupClear(tmp_group); 
                    }
                    /*if(data.r[2]>1){
                        Units.MJ(u.player.player,'e008','A06M',0,x,y,0,5,1.8,2, "stand","az_kaer_t1.mdl");
                    }*/
                    Spell(data.c[1]).Destroy();
                    t.Destroy();
                    data.Destroy();
                }else{
                    data.r[0]-=0.01;
                    data.r[2]+=0.01;
                    if(data.r[1]==0){
                        data.r[1]=0.1;
                        u.player.Duang(10,0.05); 
                        Util.Duang(x,y,0.4,400,400,-60,0.02,50);
                        mj=Units.MJ(u.player.player,'e008','A06M',0,x,y,0,5,3,1.25, "stand","Abilities\\Spells\\Other\\Doom\\DoomDeath.mdl");
                        HitFlys.Add(mj.unit,GetRandomReal(20,50));
                        HitFlys.Add(u.unit,10.5);
                        if(data.r[2]>1){
                            mj=Units.MJ(u.player.player,'e008','A06M',0,x,y,0,5,2.2,1.5, "stand","chushou_by_wood_effect_flame_explosion_2.mdl"); 
                            mj.SetH(115);
                            mj=Units.MJ(u.player.player,'e008','A06M',0,x,y,GetRandomReal(0,360),5,2.25,1, "stand","white-qiquan.mdl"); 
                            mj.Color(255,0,0);
                            HitFlys.Add(mj.unit,40);
                            
                        }
                        //伤害
                        GroupEnumUnitsInRange(tmp_group,x,y,475,function GroupIsAliveNotAloc);     
                        while(FirstOfGroup(tmp_group)!=null){
                            mj=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,mj.unit);
                            if(IsUnitEnemy(mj.unit,u.player.player)==true){ 
                                //伤害和减速 
                                u.Damage(mj.unit,Damage.Magic,'A06M',u.Str(true)); 
                                HitFlys.Add(mj.unit,9.5); 
                                Buffs.Skill(mj.unit,'A00C',1);
                            }  
                        } 
                        GroupClear(tmp_group); 
                    }else{ 
                        data.r[1]-=0.01;
                    }
                    if(data.r[0]<=0){
                        hp=u.MaxHP()*0.05;
                        if(u.HP()>=hp){
                            if((u.HP()-hp)<2){
                                u.SetHP(1);
                            }else{ 
                                u.SetHP(u.HP()-hp);
                            }
                            data.r[0]+=0.1;
                            u.player.Duang(10,0.05); 
                        }
                    }
                }
            });
        }

        static method E(Spell e){
            Units u=Units.Get(e.Spell);
            Dash dash;
            Data data=Data.create('A06I');
            Units mj;
            u.Pause(true);
            u.AnimeId(25); 
            u.AddAbility('A06L');
            data.c[0]=u;
            data.c[1]=e;
            data.r[0]=0;
            data.r[1]=0; 
            if(GetRandomInt(0,1)==1){
                Units.MJ(u.player.player,'e008','A06I',0,u.X(),u.Y(),e.Angle,2,1.0,2, "stand","ball_fire_kc.mdl").SetH(100);  
            }else{
                Units.MJ(u.player.player,'e00C','A06I',0,u.X(),u.Y(),e.Angle,2,2,0.6, "stand","fire-hit-kulouwang.mdl");     
            }
            mj=Units.MJ(u.player.player,'e00C','A06I',0,u.X(),u.Y(),e.Angle,2,2,2, "stand","fire-hit-kulouwang.mdl");       
            Dash.Start(mj.unit,e.Angle,500,Dash.SUB,25,true,false);
            HitFlys.Add(u.unit,6);
            dash=Dash.Start(u.unit,e.Angle,1600,Dash.SUB,80,true,false);
            dash.Obj=data;
            dash.onMove=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units(data.c[0]);
                Units mj,mjs;
                if(dash.Speed<6||u.IsAbility('A06L')==false||u.IsAbility('B026')==true){
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
                                mjs=Units.MJ(u.player.player,'e008','A06I',0,mj.X(),mj.Y(),dash.Angle,3,1.5,1,"stand","fire-hit-kulouwang.mdl");
                                mjs.SetH(75);
                                Dash.Start(mjs.unit,dash.Angle,200,Dash.SUB,10,true,false);
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
                Data data1=Data.create('A06L');
                if(u.Alive()==true&&u.IsAbility('B026')==false){ 
                    u.AnimeSpeed(0.75);
                    u.AnimeId(26);
                    u.DelayReleaseAnimePause(0.4);
                    Dash.Start(u.unit,dash.Angle,300,Dash.SUB,dash.Speed,true,false);
                    data1.c[0]=u;
                    data1.r[0]=dash.X;
                    data1.r[1]=dash.Y;
                    data1.r[2]=dash.Angle;
                    data1.r[3]=0.4*(dash.MaxDis-dash.NowDis);
                    data1.r[4]=dash.Speed;
                    data1.r[5]=0.4;
                    u.AddAbility('A06O');
                    Timers.Start(0.01,data1,function(Timers t){
                        Data data=Data(t.Data());
                        Units u=Units(data.c[0]);
                        Spell e;
                        if(u.Alive()==false||data.r[5]<=0||u.IsAbility('B026')==true){
                            BJDebugMsg("删除了");   
                            t.Destroy();
                            data.Destroy(); 
                            u.RemoveAbility('A06L');
                            u.RemoveAbility('A06O');
                        }else{
                            data.r[5]-=0.01;
                            if(u.IsAbility('A06L')==false){
                                BJDebugMsg("柔化");
                                Dash.Start(u.unit,data.r[2],data.r[3],Dash.SUB,data.r[4],true,false);
                                e=Spell.UseSpell(u.unit,'A06G',Spell.ReadyState); 
                                Mogu.W(e);
                                u.SetAbilityCD('A06G',10); 
                                Units.MJ(u.player.player,'e008','A06I',0,data.r[0],data.r[1],data.r[2],3.5,2.5,1, "death","orboffire.mdl").SetH(u.H()+75);  
                                SpellNameText(u.unit,"大回旋踢",3,10); 
                                data.r[5]=0;
                            }else if(u.IsAbility('A06O')==false){
                                
                                BJDebugMsg("柔化爆发");
                                e=Spell.UseSpell(u.unit,'A06M',Spell.ReadyState); 
                                Mogu.R(e);
                                u.SetAbilityCD('A06M',20); 
                                Units.MJ(u.player.player,'e008','A06I',0,data.r[0],data.r[1],data.r[2],3.5,2.5,1, "death","orboffire.mdl").SetH(u.H()+75);  
                                SpellNameText(u.unit,"爆发",3,10); 
                                data.r[5]=0;
                            }
                            
                        }
                    });
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
            data.r[7]=0;//由飞踢柔化的特效间隔
            u.Pause(true);
            u.AnimeSpeed(data.r[0]);
            u.AnimeId(2);
            Timers.Start(0.01,data,function(Timers t){
                Data data=Data(t.Data());
                Units u=Units(data.c[0]);
                Units mj;
                real x,y,f;
                Data data1;
                if(u.Alive()==true&&u.IsAbility('B026')==false){
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
                                                if(u.Alive()==true&&u.IsAbility('B026')==false){
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
                                                if(u.Alive()==true&&u.IsAbility('B026')==false){
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
                                                            integer s=0;
                                                            u.aidindex=1;
                                                            mj=Units.MJ(u.player.player,'e008','A06G',0,u.X(),u.Y(),GetRandomReal(0,360),3,3,0.6,"stand","by_wood_effect_yuzhiboyou_fire_fengxianhuo_2.mdl");
                                                            mj.SetH(u.H()); 
                                                            GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),150,function GroupIsAliveNotAloc);     
                                                            while(FirstOfGroup(tmp_group)!=null){
                                                                mj=Units.Get(FirstOfGroup(tmp_group));
                                                                GroupRemoveUnit(tmp_group,mj.unit);
                                                                if(IsUnitEnemy(mj.unit,u.player.player)==true){ 
                                                                    if(mj.H()>=u.H()-50){ 
                                                                        if(s<2){
                                                                            s+=1; 
                                                                            Dash.Start(mj.unit,Util.XY(u.unit,u.player.hero.unit),400,Dash.SUB,13,true,false);
                                                                        }else{ 
                                                                            Dash.Start(mj.unit,GetRandomReal(0,360),400,Dash.SUB,13,true,false);
                                                                        }
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
                                if(Spell(data.c[1]).State==Spell.ReadyState){ 
                                    Effect.ToUnit("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",u.unit,"foot left").Destroy();
                                    Effect.ToUnit("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",u.unit,"foot right").Destroy();
                                     
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
                                if(u.IsAbility('B026')==false){//不处于蛋蛋复活状态
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
                                } 
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

        static method Press(player ps,string k){
            Players p=Players.Get(ps);
            if(k=="W"){ 
                if(p.hero.IsAbility('A06L')==true&&p.hero.IsAbility('BPSE')==false){
                    if(p.hero.GetAbilityCD('A06G')==0){ 
                        p.hero.RemoveAbility('A06L');
                    }
                }
            } 
            if(k=="R"){ 
                if(p.hero.IsAbility('A06O')==true&&p.hero.IsAbility('BPSE')==false){
                    if(p.hero.GetAbilityCD('A06M')==0){ 
                        p.hero.RemoveAbility('A06O');
                    }
                }
            } 
        } 

        static method HERO_START(Spell e){
            Units u=Units.Get(e.Spell);
            if(e.Id=='A06I'){
                u.FlushAnimeId(24);
                u.AddAbility('A06K');
                HitFlys.Add(u.unit,7);
                Timers.Start(0.01,u,function(Timers t){ 
                    Units u=Units(t.Data()); 
                    real x,y;
                    if(u.Alive()==false||t.Expired()>20||u.IsAbility('B026')==true){
                        BJDebugMsg("删除了");
                        t.Destroy();
                    }else{
                        if(t.Expired()==19){
                            if(u.IsAbility('A06K')==true){
                                x=u.X(),y=u.Y();
                                Util.Duang(x,y,0.5,200,200,-36,0.02,50);
                                Units.MJ(u.player.player,'e008','A06I',0,x,y,GetRandomReal(0,360),0.8,1,4, "stand","fire2.mdl").DelayAnime(2,0.2);
                                
                            }
                        } 
                    } 
                });
                Dash.Start(u.unit,e.Angle+180,75,Dash.NORMAL,4,true,false);
            }
            if(e.Id=='A06M'){
                u.FlushAnimeId(27);
                u.AddAbility('A06N'); 
                Timers.Start(0.01,u,function(Timers t){
                    Units u=Units(t.Data());
                    Units mj;
                    if(u.Alive()==false||t.Expired()>60||u.IsAbility('A06N')==false||u.IsAbility('B026')==true){   
                        t.Destroy();
                    }else{   
                        if(ModuloInteger(t.Expired(),10)==0){ 
                            Units.MJ(u.player.player,'e008','A06M',0,u.X(),u.Y(),0,0.8,2,1, "birth","az-red-mofazhen_ex.mdl");
                            GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),450,function GroupIsAliveNotAloc);     
                            while(FirstOfGroup(tmp_group)!=null){
                                mj=Units.Get(FirstOfGroup(tmp_group));
                                GroupRemoveUnit(tmp_group,mj.unit);
                                if(IsUnitEnemy(mj.unit,u.player.player)==true){
                                    if(Util.XY2(u.unit,mj.unit)>200){
                                        Dash.Start(mj.unit,Util.XY(mj.unit,u.unit),200,Dash.SUB,10,true,false);
                                    }else{
                                        Dash.Start(mj.unit,Util.XY(mj.unit,u.unit),100,Dash.NORMAL,7,true,true);
                                    } 
                                }
                            }
                            GroupClear(tmp_group); 
                        }  
                    } 
                });
                      
            }
            e.Destroy();
        }

        static method HERO_STOP(Spell e){
            Units u=Units.Get(e.Spell); 
            if(e.Id=='A06I'){
                u.RemoveAbility('A06K');
            }
            if(e.Id=='A06M'){
                u.RemoveAbility('A06N');
            }
            e.Destroy();
        }

        static method onInit(){ 
            Damage.On(Damage.onDamageEnd,Mogu.Damage); 
            Units.On(Units.onHeroSpawn,Mogu.Spawn); 
            Units.On(Units.onAlocDeath,Mogu.Q); 
            Spell.On(Spell.onSpell,'A06G',Mogu.W);
            Spell.On(Spell.onSpell,'A06I',Mogu.E);
            Spell.On(Spell.onSpell,'A06M',Mogu.R);
            Spell.On(Spell.onReady,'A06I',Mogu.HERO_START); 
            Spell.On(Spell.onStop,'A06I',Mogu.HERO_STOP);  
            Spell.On(Spell.onReady,'A06M',Mogu.HERO_START); 
            Spell.On(Spell.onStop,'A06M',Mogu.HERO_STOP);  
            Press.OnSnyc(Press.onSnycPressKeyDown,Mogu.Press);
        }
    }
}