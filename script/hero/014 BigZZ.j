library BigZZ requires Groups{
    //英雄‘大佐助’的技能
    //R
    struct BigZZ{
        //A058,B01C
        static method R1(unit ua,unit ma){
            Units u=Units.Get(ua);
            Units m=Units.Get(ma);
            Buffs b;
            Data data;
            if(m.IsAbility('B01C')==false){
                b=Buffs.Add(m.unit,'A058','B01C',86400,false);
                data=Data.create('A055');
                data.c[0]=u.player;
                //BJDebugMsg("A----ID:"+I2S(data)+"/U:"+I2S(data.c[0]));
                data.r[0]=0;
                b.Obj=data;
                b.onTime=function(Buffs b){
                    //BJDebugMsg(R2S(ModuloReal(b.Time,1))+"/时间:"+R2S(b.Time));
                    Data data=Data(b.Obj);
                    Players h=Players(data.c[0]);
                    Units u=Units.Get(b.Unit);
                    Units mj;
                    if(data.r[0]==0){
                        data.r[0]=1;
                        h.hero.Damage(b.Unit,Damage.Physics,'A055',u.MaxHP()*0.01); 
                        GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),125,function GroupIsAliveNotAloc);     
                        while(FirstOfGroup(tmp_group)!=null){
                            mj=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,mj.unit);
                            if(IsUnitEnemy(mj.unit,h.player)==true&&mj.unit!=u.unit){  
                                BigZZ.R1(h.hero.unit,mj.unit);
                            }
                        }
                        GroupClear(tmp_group);
                    }else{
                        data.r[0]-=0.01;
                    }
                };
                b.onEnd=function(Buffs b){
                    Data data=Data(b.Obj);
                    data.Destroy();
                };
            }
        }
 
        static method R(Spell e){
            Units u=Units.Get(e.Spell); 
            u.Pause(true);
            u.AnimeSpeed(0); 
            Units.MJ(u.player.player,'e008','A055',0,u.X(),u.Y(),0,0.6,1,3,"stand","zztz.mdl");
            Timers.Start(0.3,e,function(Timers t){
                Spell e=Spell(t.Data());
                Units u=Units.Get(e.Spell);
                Data data=Data.create('A055');
                Data data1,data2;
                real x=u.X(),y=u.Y();
                Units mj;
                Units tmp;
                Buffs b;
                Units.MJ(u.player.player,'e008','A055',0,x,y,GetRandomReal(0,360),3,2,1,"stand","bymutou_huozhu_siwang.mdl");
                Units.MJ(u.player.player,'e008','A055',0,x,y,0,2,1.75,1,"stand","AZ_TZFire.mdl").DelayAnime(1,0.6);
                u.DelayReleaseAnimePause(0.5); 
                u.SetAbilityCD('A055',86400);
                t.Destroy();
                //Util.Range(x,y,350);
                GroupEnumUnitsInRange(tmp_group,x,y,350,function GroupIsAliveNotAloc);     
                while(FirstOfGroup(tmp_group)!=null){
                    mj=Units.Get(FirstOfGroup(tmp_group));
                    GroupRemoveUnit(tmp_group,mj.unit);
                    if(IsUnitEnemy(mj.unit,u.player.player)==true){    
                        u.Damage(mj.unit,Damage.Chaos,'A055',(u.Agi(true)+u.Int(true))*5); 
                        //Units.MJ(u.player.player,'e008','A04U',0,mj.X(),mj.Y(),GetRandomReal(0,360),0.5,2,1,"death","by_wood_effect_yubanmeiqin_lightning_dianjishanghai.mdl").SetH(75);
                        //Effect.ToUnit("by_wood_effect_yubanmeiqin_lightning_dianjishanghai.mdl",mj.unit,"chest").Destroy();
                        //Buffs.Skill(mj.unit,'A04Y',1);
                        BigZZ.R1(u.unit,mj.unit);
                    }
                }
                GroupClear(tmp_group);

                //---------------手里剑附魔
                GroupEnumUnitsInRange(tmp_group,x,y,350,function GroupIsTSW); 
                while(FirstOfGroup(tmp_group)!=null){
                    tmp=Units.Get(FirstOfGroup(tmp_group));  
                    GroupRemoveUnit(tmp_group,tmp.unit);
                    if(tmp.aid=='A051'){  
                        if(tmp.IsAbility('A057')==false){
                            //BJDebugMsg("天照附魔");
                            tmp.AddAbility('A057'); 
                            data1=Data(tmp.Obj);
                            data2=Data(data1.c[2]);
                            data2.c[0]=Effect.ToUnit("buff_hei.mdl",tmp.unit,"chest"); 
                            //BJDebugMsg("B----ID:"+I2S(data2)+"/U:"+I2S(data2.c[0]));
                        } 
                    }   
                }  
                GroupClear(tmp_group); 
                //--------------------------
                data.c[0]=u;
                //BJDebugMsg("C----ID:"+I2S(data)+"/U:"+I2S(data.c[0]));
                data.c[1]=e;
                data.r[0]=0;//伤害间隔
                data.r[1]=0;//手里剑附魔间隔
                b=Buffs.Add(u.unit,'A056','B01B',86400,false);
                b.Obj=data;
                b.onTime=function(Buffs b){
                    //225
                    Data data=Data(b.Obj);
                    Units u=Units(data.c[0]);
                    Units tmp;
                    Data data1,data2;
                    Units mj;
                    real x=u.X(),y=u.Y();
                    if(data.r[0]==0){
                        if(u.MP()>40){  
                            u.SetMP(u.MP()-40);
                            data.r[0]=1;
                            GroupEnumUnitsInRange(tmp_group,x,y,250,function GroupIsAliveNotAloc);     
                            while(FirstOfGroup(tmp_group)!=null){
                                mj=Units.Get(FirstOfGroup(tmp_group));
                                GroupRemoveUnit(tmp_group,mj.unit);
                                if(IsUnitEnemy(mj.unit,u.player.player)==true){    
                                    u.Damage(mj.unit,Damage.Chaos,'A055',u.Int(true)*2); 
                                    //Units.MJ(u.player.player,'e008','A04U',0,mj.X(),mj.Y(),GetRandomReal(0,360),0.5,2,1,"death","by_wood_effect_yubanmeiqin_lightning_dianjishanghai.mdl").SetH(75);
                                    //Effect.ToUnit("by_wood_effect_yubanmeiqin_lightning_dianjishanghai.mdl",mj.unit,"chest").Destroy();
                                    //Buffs.Skill(mj.unit,'A04Y',1);
                                    BigZZ.R1(u.unit,mj.unit);
                                }
                            }
                            GroupClear(tmp_group);
                        }
                        else{
                            b.Stop();
                        }
                    }else{
                        data.r[0]-=0.01;
                    }
                    //---------------手里剑附魔
                    if(data.r[1]==0){
                        data.r[1]=0.1;
                        GroupEnumUnitsInRange(tmp_group,x,y,250,function GroupIsTSW); 
                        while(FirstOfGroup(tmp_group)!=null){
                            tmp=Units.Get(FirstOfGroup(tmp_group));  
                            GroupRemoveUnit(tmp_group,tmp.unit);
                            if(tmp.aid=='A051'){  
                                if(tmp.IsAbility('A057')==false){
                                    //BJDebugMsg("天照附魔");
                                    tmp.AddAbility('A057'); 
                                    data1=Data(tmp.Obj);
                                    data2=Data(data1.c[2]);
                                    data2.c[0]=Effect.ToUnit("buff_hei.mdl",tmp.unit,"chest"); 
                                    //BJDebugMsg("D----ID:"+I2S(data2)+"/U:"+I2S(data2.c[0]));
                                } 
                            }   
                        }  
                        GroupClear(tmp_group); 
                    }else{
                        data.r[1]-=0.01;
                    }
                    //---------------手里剑附魔
                }; 
                b.onEnd=function(Buffs b){
                    Data data=Data(b.Obj);
                    Units u=Units(data.c[0]);
                    u.SetAbilityCD('A055',5);
                    Spell(data.c[1]).Destroy();
                    data.Destroy();
                };
            });
        }

        static method E2(player ps,string k){
            Players p=Players.Get(ps);
            if(k=="E"){ 
                if(p.hero.IsAbility('B01A')==true){
                    Buffs.Find(p.hero.unit,'B01A').Stop();
                }
            }
            if(k=="R"){
                if(p.hero.IsAbility('B01B')==true){
                    Buffs.Find(p.hero.unit,'B01B').Stop();
                }
            }
        }

        static method E1(unit slj){
            Units u=Units.Get(slj);
            Units h=u.player.hero;
            Data data=Data.create('A051');
            Dash dash; 
            data.c[0]=u;
            //BJDebugMsg("E----ID:"+I2S(data)+"/U:"+I2S(data.c[0]));
            data.g[0]=CreateGroup();
            data.i[0]=GetRandomInt(0,1000);
            u.RemoveAbility(Units.MJType_FZW);
            dash=Dash.Start(u.unit,Util.XY(u.unit,h.unit),1000,Dash.NORMAL,70,true,false);
            
            //BJDebugMsg("手里剑-回收中/"+u.name+"/DASH："+I2S(dash)+"/RANDOM:"+I2S(data.i[0])+"/DATA:"+I2S(data)+"/U:"+I2S(u)+"/U2:"+I2S(data.c[0]));
            dash.Obj=data;
            dash.onMove=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units.Get(dash.Unit);
                Units h=u.player.hero;
                Units mj;
                integer fire=0,light=0,dark=0;
                if(h.Alive()==true){
                    dash.MaxSpeed=45;
                }else{ 
                    if(Util.XY2(u.unit,h.unit)>3000){ 
                        dash.MaxSpeed=(Util.XY2(u.unit,h.unit)/100)+70;
                    }else{
                        dash.MaxSpeed=70;
                    }
                }
                dash.Angle=Util.XY(u.unit,h.unit);
                dash.MaxDis+=100;
                if(Util.XY2(u.unit,h.unit)<140){
                    dash.Stop();
                }else{ 
                    if(u.IsAbility('A053')==true){
                        fire=1;
                    }
                    if(u.IsAbility('A054')==true){
                        light=1;
                    }
                    if(u.IsAbility('A057')==true){
                        dark=1;
                    }
                    GroupEnumUnitsInRange(tmp_group,dash.X,dash.Y,150,function GroupIsAliveNotAloc);     
                    while(FirstOfGroup(tmp_group)!=null){
                        mj=Units.Get(FirstOfGroup(tmp_group));
                        GroupRemoveUnit(tmp_group,mj.unit);
                        if(IsUnitEnemy(mj.unit,u.player.player)==true&&IsUnitInGroup(mj.unit,data.g[0])==false){    
                            GroupAddUnit(data.g[0],mj.unit);
                            u.Damage(mj.unit,Damage.Physics,'A051',u.Agi(true)*2.5); 
                            Effect.ToUnit("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",mj.unit, "chest").Destroy();
                            if(fire==1){
                                u.Damage(mj.unit,Damage.Magic,'A051',u.Agi(true)*2.5); 
                                Effect.ToUnit("Environment\\LargeBuildingFire\\LargeBuildingFire1.mdl", mj.unit, "chest").Destroy();
                                Effect.ToUnit("by_wood_effect_yuzhiboyou_fire_fengxianhuo_2.mdl",mj.unit,"chest").Destroy();
                            }
                            if(light==1){
                                u.Damage(mj.unit,Damage.Magic,'A051',u.Agi(true)*2.5); 
                                Buffs.Skill(mj.unit,'A00H',1);
                            }
                            if(dark==1){
                                u.Damage(mj.unit,Damage.Chaos,'A051',u.Agi(true)*2.5); 
                                BigZZ.R1(u.unit,mj.unit);
                            }
                            //Effect.ToUnit("Environment\\LargeBuildingFire\\LargeBuildingFire1.mdl", mj.unit, "chest").Destroy();
                            //Dash.Start(mj.unit,dash.Angle,100+(dash.MaxDis-dash.NowDis),Dash.SUB,40,true,true);
                            //Effect.ToUnit("by_wood_effect_yuzhiboyou_fire_fengxianhuo_2.mdl",mj.unit,"chest").Destroy();
                            
                            //Units.MJ(u.player.player,'e008','A050',0,mj.X(),mj.Y(),GetRandomReal(0,360),1.5,1.5,2,"stand","by_wood_effect_yuzhiboyou_fire_fengxianhuo_2.mdl").SetH(100);
                        }
                    }
                    GroupClear(tmp_group);
                }
            };
            dash.onEnd=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units.Get(dash.Unit);
                Data data1,data2; 
                u.RemoveAbility(Units.MJType_TSW);
                if(u!=data.c[0]){
                    BJDebugMsg("手里剑-回收完毕/"+u.name+"/DASH:"+I2S(dash)+"/DASHUNIT:"+Units.Get(dash.Unit).name+"/RANDOM:"+I2S(data.i[0])+"/DATA:"+I2S(data)+"/U:"+I2S(u)+"/U2:"+I2S(data.c[0]));  
                    BJDebugMsg("这是一条错误提示，如果你愿意请截图并联系作者，同时保存录像发给作者，谢谢~！");
                }
                //-----------------附魔删除处理
                data1=Data(u.Obj);
                if(u.IsAbility('A053')==true){
                    //BJDebugMsg("删除附魔-火焰");
                    data2=Data(data1.c[0]);
                    Effect(data2.c[0]).Destroy();
                    Effect(data2.c[1]).Destroy();
                    Effect(data2.c[2]).Destroy();
                    Effect(data2.c[3]).Destroy();
                    data2.Destroy();
                }  
                if(u.IsAbility('A054')==true){
                    //BJDebugMsg("删除附魔-闪电"); 
                    data2=Data(data1.c[1]);
                    Effect(data2.c[0]).Destroy();
                    Effect(data2.c[1]).Destroy();
                    Effect(data2.c[2]).Destroy();
                    Effect(data2.c[3]).Destroy();
                    data2.Destroy();
                } 
                if(u.IsAbility('A057')==true){
                    //BJDebugMsg("删除附魔-天照"); 
                    data2=Data(data1.c[2]);
                    Effect(data2.c[0]).Destroy(); 
                    data2.Destroy();
                } 
                data1.Destroy();
                //----------------------------------
                //BJDebugMsg(u.name);
                u.Anime("death"); 
                u.Size(0); 
                u.Life(1);
                DestroyGroup(data.g[0]);
                data.g[0]=null;
                data.Destroy();
            };
        }
 
        static method E(Spell e){
            Units u=Units.Get(e.Spell);
            Data data;
            Data data2,data3;
            Dash dash;
            real x,y,f;
            Units mj;
            integer i;
            Buffs b;
            for(0<=i<3){
                x=u.X()+50*CosBJ(e.Angle);
                y=u.Y()+50*SinBJ(e.Angle);
                f=e.Angle-30+(30*i);
                mj=Units.MJ(u.player.player,'e008','A051',0,x,y,f,15,1.5,1,"stand","ShadowHunterMissile_ex.mdl");
                data2=Data.create('A051');//存储附魔状态的数据
                data3=Data.create('A051');//存储附魔状态-火焰的数据
                data2.c[0]=data3;
                //BJDebugMsg("F----ID:"+I2S(data2)+"/U:"+I2S(data2.c[0]));
                data3=Data.create('A051');//存储附魔状态-闪电的数据
                data2.c[1]=data3; 
                //BJDebugMsg("P----ID:"+I2S(data2)+"/U:"+I2S(data2.c[1])+"/ID2:"+I2S(data3));
                data3=Data.create('A051');//存储附魔状态-天照的数据
                data2.c[2]=data3;
                data2.i[4]=i+6;
                mj.SetH(100); 
                mj.Obj=data2;
                mj.SetData(0);//状态， 0 - 扔出 ， 1 - 盘旋 ， 2 -回收中
                mj.AddAbility(Units.MJType_TSW);
                mj.Position(x,y,true);
                Dash.Start(mj.unit,f,300,Dash.SUB,30,true,false);
                data=Data.create('A051');
                data.c[0]=u;
                //BJDebugMsg("G----ID:"+I2S(data)+"/U:"+I2S(data.c[0]));
                data.c[1]=mj;
                data.g[0]=CreateGroup(); 
                data.r[0]=0; 
                dash=Dash.Start(mj.unit,f,1800,Dash.ADD,70,true,false);
                dash.Obj=data;
                dash.onMove=function(Dash dash){
                    Units u=Units.Get(dash.Unit);
                    Data data=Data(dash.Obj);
                    Units mj;
                    integer fire=0,light=0,dark=0;
                    dash.Angle=u.F();
                    if(dash.DashType==Dash.ADD&&dash.Speed>8){
                        dash.MaxSpeed=8;
                        dash.DashType=Dash.NORMAL;
                        
                    }
                    if(u.Data()==2){
                        dash.Stop();
                    }else{
                        if(data.r[0]==0){
                            data.r[0]=0.03;
                            if(u.IsAbility('A053')==true){
                                fire=1;
                            }
                            if(u.IsAbility('A054')==true){
                                light=1;
                            }
                            if(u.IsAbility('A057')==true){
                                dark=1;
                            }
                            GroupEnumUnitsInRange(tmp_group,dash.X,dash.Y,150,function GroupIsAliveNotAloc);     
                            while(FirstOfGroup(tmp_group)!=null){
                                mj=Units.Get(FirstOfGroup(tmp_group));
                                GroupRemoveUnit(tmp_group,mj.unit);
                                if(IsUnitEnemy(mj.unit,u.player.player)==true&&IsUnitInGroup(mj.unit,data.g[0])==false){    
                                    GroupAddUnit(data.g[0],mj.unit);
                                    u.Damage(mj.unit,Damage.Physics,'A051',u.Agi(true)*2.5); 
                                    Effect.ToUnit("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",mj.unit, "chest").Destroy();
                                    if(fire==1){
                                        u.Damage(mj.unit,Damage.Magic,'A051',u.Agi(true)*2.5); 
                                        Effect.ToUnit("Environment\\LargeBuildingFire\\LargeBuildingFire1.mdl", mj.unit, "chest").Destroy();
                                        Effect.ToUnit("by_wood_effect_yuzhiboyou_fire_fengxianhuo_2.mdl",mj.unit,"chest").Destroy();
                                    }
                                    if(light==1){
                                        u.Damage(mj.unit,Damage.Magic,'A051',u.Agi(true)*2.5); 
                                        Buffs.Skill(mj.unit,'A00H',1);
                                    }
                                    if(dark==1){
                                        u.Damage(mj.unit,Damage.Chaos,'A051',u.Agi(true)*2.5); 
                                        BigZZ.R1(u.unit,mj.unit);
                                    }
                                    //Effect.ToUnit("Environment\\LargeBuildingFire\\LargeBuildingFire1.mdl", mj.unit, "chest").Destroy();
                                    //Dash.Start(mj.unit,dash.Angle,100+(dash.MaxDis-dash.NowDis),Dash.SUB,40,true,true);
                                    //Effect.ToUnit("by_wood_effect_yuzhiboyou_fire_fengxianhuo_2.mdl",mj.unit,"chest").Destroy();
                                    
                                    //Units.MJ(u.player.player,'e008','A050',0,mj.X(),mj.Y(),GetRandomReal(0,360),1.5,1.5,2,"stand","by_wood_effect_yuzhiboyou_fire_fengxianhuo_2.mdl").SetH(100);
                                }
                            }
                            GroupClear(tmp_group);
                        }else{
                            data.r[0]-=0.01;
                        }
                    }
                };
                dash.onEnd=function(Dash dash){
                    Data data=Data(dash.Obj);
                    Units u=Units.Get(dash.Unit);
                    Data data1;
                    if(u.Data()==2){//扔出过程就回收了
                        //回收处理 
                        //BJDebugMsg("手里剑-飞行回收");
                        BigZZ.E1(u.unit);
                    }else{
                        //盘旋处理
                        //BJDebugMsg("手里剑-转为盘旋");
                        u.SetData(1);
                        u.AddAbility(Units.MJType_FZW);
                        Dash.Start(u.unit,dash.Angle,300,Dash.SUB,15,true,false);
                        data1=Data.create('A051');
                        data1.c[0]=u;
                        //BJDebugMsg("H----ID:"+I2S(data1)+"/U:"+I2S(data1.c[0]));
                        data1.r[0]=0;
                        Timers.Start(0.01,data1,function(Timers t){
                            Data data=Data(t.Data());
                            Units u=Units(data.c[0]);
                            Units mj;
                            integer fire=0,light=0,dark=0;
                            if(u.Data()==2){
                                //BJDebugMsg("手里剑-盘旋回收");
                                //回收了 
                                BigZZ.E1(u.unit);
                                t.Destroy();
                                data.Destroy();
                            }else{
                                if(data.r[0]==0){
                                    data.r[0]=1;
                                    if(u.IsAbility('A053')==true){
                                        fire=1;
                                    }
                                    if(u.IsAbility('A054')==true){
                                        light=1;
                                    }
                                    if(u.IsAbility('A057')==true){
                                        dark=1;
                                    }
                                    //Util.Range(u.X(),u.Y(),125);
                                    GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),150,function GroupIsAliveNotAloc);     
                                    while(FirstOfGroup(tmp_group)!=null){
                                        mj=Units.Get(FirstOfGroup(tmp_group));
                                        GroupRemoveUnit(tmp_group,mj.unit);
                                        if(IsUnitEnemy(mj.unit,u.player.player)==true){   
                                            u.Damage(mj.unit,Damage.Physics,'A051',u.Agi(true)*1); 
                                            Effect.ToUnit("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",mj.unit, "chest").Destroy();
                                            if(fire==1){
                                                u.Damage(mj.unit,Damage.Magic,'A051',u.Agi(true)*1); 
                                                Effect.ToUnit("Environment\\LargeBuildingFire\\LargeBuildingFire1.mdl", mj.unit, "chest").Destroy();
                                                Effect.ToUnit("by_wood_effect_yuzhiboyou_fire_fengxianhuo_2.mdl",mj.unit,"chest").Destroy();
                                            }
                                            if(light==1){
                                                u.Damage(mj.unit,Damage.Magic,'A051',u.Agi(true)*1); 
                                                Buffs.Skill(mj.unit,'A00H',1);
                                            }
                                            if(dark==1){
                                                u.Damage(mj.unit,Damage.Chaos,'A051',u.Agi(true)*1); 
                                                BigZZ.R1(u.unit,mj.unit);
                                            }
                                            //Effect.ToUnit("Environment\\LargeBuildingFire\\LargeBuildingFire1.mdl", mj.unit, "chest").Destroy();
                                            //Dash.Start(mj.unit,dash.Angle,100+(dash.MaxDis-dash.NowDis),Dash.SUB,40,true,true);
                                            //Effect.ToUnit("by_wood_effect_yuzhiboyou_fire_fengxianhuo_2.mdl",mj.unit,"chest").Destroy();
                                            
                                            //Units.MJ(u.player.player,'e008','A050',0,mj.X(),mj.Y(),GetRandomReal(0,360),1.5,1.5,2,"stand","by_wood_effect_yuzhiboyou_fire_fengxianhuo_2.mdl").SetH(100);
                                        }
                                    }
                                    GroupClear(tmp_group);
                                }else{
                                    data.r[0]-=0.01;
                                }
                            }
                        });
                    }
                    
                    //BJDebugMsg("手里剑-扔出完毕");
                    DestroyGroup(data.g[0]);
                    data.g[0]=null;
                    data.Destroy();
                };
            }
            b=Buffs.Add(u.unit,'A052','B01A',10,false);
            b.onEnd=function(Buffs b){
                Units u=Units.Get(b.Unit);
                Units tmp;
                GroupEnumUnitsInRange(tmp_group,0,0,999999999,function GroupIsTSW); 
                while(FirstOfGroup(tmp_group)!=null){
                    tmp=Units.Get(FirstOfGroup(tmp_group));  
                    GroupRemoveUnit(tmp_group,tmp.unit);
                    if(tmp.player.player==u.player.player){ 
                        if(tmp.aid=='A051'){  
                            tmp.SetData(2);
                        }  
                    }
                }  
                GroupClear(tmp_group); 
            };
            e.Destroy();
        }

        static method W(Spell e){
            Units u=Units.Get(e.Spell);
            Units mj;
            Dash dash;
            Data data;
            real x=u.X()+50*CosBJ(e.Angle),y=u.Y()+50*SinBJ(e.Angle),f=e.Angle;
            u.Pause(true); 
            u.DelayReleaseAnimePause(0.2);
            u.AnimeSpeed(2.5);
            u.AnimeId(4);
            mj=Units.MJ(u.player.player,'e009','A050',0,x,y,f,1.5,1.5,1,"stand","by_wood_effect_yuzhiboyou_fire_babangouyu_2_di__ex.mdl");
            mj.SetH(100); 
            Units.MJ(u.player.player,'e009','A050',0,x,y,f,1.5,4,1,"death","Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl").SetH(100);
            mj=Units.MJ(u.player.player,'e008','A050',0,x+200*CosBJ(f),y+200*SinBJ(f),f,1.5,1,1,"stand",".mdl");
            data=Data.create('A050');
            data.c[0]=u; 
            //BJDebugMsg("I----ID:"+I2S(data)+"/U:"+I2S(data.c[0]));
            data.g[0]=CreateGroup();
            data.r[0]=0;
            dash=Dash.Start(mj.unit,e.Angle,450,Dash.NORMAL,30,true,false); 
            dash.Obj=data;
            dash.onMove=function(Dash dash){ 
                Data data=Data(dash.Obj);
                Units mj;
                Units tmp;
                Units u=Units(data.c[0]);
                Data data1,data2;
                if(data.r[0]==0){
                    data.r[0]=0.04;
                    //Util.Range(dash.X,dash.Y,250);
                    GroupEnumUnitsInRange(tmp_group,dash.X,dash.Y,250,function GroupIsAliveNotAloc);     
                    while(FirstOfGroup(tmp_group)!=null){
                        mj=Units.Get(FirstOfGroup(tmp_group));
                        GroupRemoveUnit(tmp_group,mj.unit);
                        if(IsUnitEnemy(mj.unit,u.player.player)==true&&IsUnitInGroup(mj.unit,data.g[0])==false){    
                            GroupAddUnit(data.g[0],mj.unit);
                            u.Damage(mj.unit,Damage.Magic,'A050',u.Agi(true)*10); 
                            Effect.ToUnit("Environment\\LargeBuildingFire\\LargeBuildingFire1.mdl", mj.unit, "chest").Destroy();
                            Dash.Start(mj.unit,dash.Angle,100+(dash.MaxDis-dash.NowDis),Dash.SUB,40,true,true);
                            Effect.ToUnit("by_wood_effect_yuzhiboyou_fire_fengxianhuo_2.mdl",mj.unit,"chest").Destroy();
                             
                            //Units.MJ(u.player.player,'e008','A050',0,mj.X(),mj.Y(),GetRandomReal(0,360),1.5,1.5,2,"stand","by_wood_effect_yuzhiboyou_fire_fengxianhuo_2.mdl").SetH(100);
                        }
                    }
                    GroupClear(tmp_group);

                    //喷手里剑
                    //---手里剑附魔
                    GroupEnumUnitsInRange(tmp_group,dash.X,dash.Y,250,function GroupIsTSW); 
                    while(FirstOfGroup(tmp_group)!=null){
                        tmp=Units.Get(FirstOfGroup(tmp_group));  
                        GroupRemoveUnit(tmp_group,tmp.unit);
                        if(tmp.aid=='A051'){  
                            if(tmp.IsAbility('A053')==false){
                                //BJDebugMsg("附魔2");
                                tmp.AddAbility('A053'); 
                                data1=Data(tmp.Obj);
                                data2=Data(data1.c[0]);
                                data2.c[0]=Effect.ToUnit("Abilities\\Spells\\Other\\BreathOfFire\\BreathOfFireDamage.mdl",tmp.unit,"weapon");
                                //BJDebugMsg("J----ID:"+I2S(data2)+"/U:"+I2S(data2.c[0]));
                                data2.c[1]=Effect.ToUnit("Abilities\\Spells\\Other\\BreathOfFire\\BreathOfFireDamage.mdl",tmp.unit,"origin");
                                data2.c[2]=Effect.ToUnit("Abilities\\Spells\\Other\\BreathOfFire\\BreathOfFireDamage.mdl",tmp.unit,"head");
                                data2.c[3]=Effect.ToUnit("Abilities\\Spells\\Other\\BreathOfFire\\BreathOfFireDamage.mdl",tmp.unit,"overhead");
                            } 
                        }   
                    }  
                    GroupClear(tmp_group); 
                }else{
                    data.r[0]-=0.01;
                }
            };
            dash.onEnd=function(Dash dash){
                Data data=Data(dash.Obj);
                data.g[0]=null;
                DestroyGroup(data.g[0]);
                data.Destroy();
            };
            e.Destroy();
        }

        static method Death(Units u,Units m){
            if(u.IsAbility('A04U')==true){
                Units.Kill(Units(u.Data()).unit);
            }
        }

        static method Spawn(Units u,Units m){
            if(u.IsAbility('A04U')==true){
                u.SetData(Units.MJ(u.player.player,'e00L','A04U',0,0,0,0,86400,1,1,"two",".mdl"));    
            }
        }

        static method Q_Order(EventArgs e){
            Units u=Units.Get(e.TriggerUnit);
            real x,y,f,tips;
            Units tmp;
            if(u.IsAbility('B019')==true&&e.OrderId==851971){
                if(e.OrderTargetUnit==null){ 
                    f=Util.XYEX(u.X(),u.Y(),e.OrderTargetX,e.OrderTargetY);
                }else{
                    f=Util.XY(u.unit,e.OrderTargetUnit);
                }
                u.Position(u.X(),u.Y(),true);
                u.SetF(f,false);
            }
            if(u.IsAbility('B01A')==true&&e.OrderId==851971){
                if(e.OrderTargetUnit==null){ 
                    f=Util.XYEX(u.X(),u.Y(),e.OrderTargetX,e.OrderTargetY);
                    x=e.OrderTargetX;
                    y=e.OrderTargetY;
                }else{
                    f=Util.XY(u.unit,e.OrderTargetUnit);
                    x=GetUnitX(e.OrderTargetUnit);
                    y=GetUnitY(e.OrderTargetUnit);
                }
                tips=0;
                GroupEnumUnitsInRange(tmp_group,x,y,300,function GroupIsTSW); 
                while(FirstOfGroup(tmp_group)!=null){
                    tmp=Units.Get(FirstOfGroup(tmp_group));  
                    GroupRemoveUnit(tmp_group,tmp.unit);
                    if(tmp.player.player==u.player.player){ 
                        if(tmp.aid=='A051'){  
                            if(tmp.Data()==0){
                                tips=1;
                                tmp.SetF(Util.XYEX(tmp.X(),tmp.Y(),x,y),false); 
                            }
                        }  
                    }
                }  
                GroupClear(tmp_group); 
                if(tips==1){
                    u.Stop();
                    u.FlushAnimeId(11);
                }
            }
        }

        static method Damage(DamageArgs e){
            if(e.TriggerUnit.IsAbility('A04V')==true){
                if(e.DamageType==Damage.Magic){
                    e.Damage-=0.5*e.Damage;
                }
            }
            if(e.TriggerUnit.IsAbility('B01B')==true){
                if(e.DamageType==Damage.Chaos){
                    e.Damage-=0.5*e.Damage;
                }
            }
        }

        static method Q(Spell e){
            Units u=Units.Get(e.Spell); 
            Data data=Data.create('A04U'); 
            Units.Kill(Units(u.Data()).unit);
            u.Pause(true); 
            u.AnimeSpeed(1);
            u.AnimeId(8);
            data.c[0]=u;
            //BJDebugMsg("K----ID:"+I2S(data)+"/U:"+I2S(data.c[0]));
            data.c[1]=e;
            Timers.Start(0.4,data,function(Timers t){
                Data data=Data(t.Data());
                Units u=Units(data.c[0]);
                Units mj;
                Dash dash;
                if(u.Alive()==true){ 
                    Buffs.Add(u.unit,'A04W','B019',10,false);
                    mj=Units.MJ(u.player.player,'e008','A04U',0,u.X(),u.Y(),u.F(),11,u.modelsize,1,"stand",u.model);
                    mj.AddAbility(TeamTips_Ability_Id[u.player.teamid]); 
                    data.c[2]=mj; 
                    u.Alpha(0);
                    u.AddAbility('A04V');
                    u.AddAbility('A04Z');
                    mj.AnimeId(6);
                    mj.AnimeSpeed(2);
                    dash=Dash.Start(u.unit,u.F(),1000,Dash.NORMAL,10,true,false);
                    dash.Obj=data;
                    dash.onMove=function(Dash dash){ 
                        Data data=Data(dash.Obj);
                        Units u=Units.Get(dash.Unit);
                        Units ts=Units(data.c[2]);
                        Units tmp;
                        unit k; 
                        Dash dash1;
                        Data data1,data2;
                        if(u.IsAbility('B019')==true){
                            dash.Angle=u.F();
                            dash.MaxDis+=100;
                            //-------------手里剑附魔
                            GroupEnumUnitsInRange(tmp_group,dash.X,dash.Y,125,function GroupIsTSW); 
                            while(FirstOfGroup(tmp_group)!=null){
                                tmp=Units.Get(FirstOfGroup(tmp_group));  
                                GroupRemoveUnit(tmp_group,tmp.unit);
                                if(tmp.aid=='A051'){  
                                    if(tmp.IsAbility('A054')==false){ 
                                        //BJDebugMsg("闪电附魔");
                                        tmp.AddAbility('A054');  
                                        data1=Data(tmp.Obj);
                                        data2=Data(data1.c[1]);//lei9.mdl
                                        data2.c[0]=Effect.ToUnit("[effect]31_ex.mdl",tmp.unit,"weapon");
                                        //BJDebugMsg("L----ID:"+I2S(data2)+"/U:"+I2S(data2.c[0]));
                                        data2.c[1]=Effect.ToUnit("[effect]31_ex.mdl",tmp.unit,"origin");
                                        data2.c[2]=Effect.ToUnit("[effect]31_ex.mdl",tmp.unit,"head");
                                        data2.c[3]=Effect.ToUnit("[effect]31_ex.mdl",tmp.unit,"overhead");
                                    }
                                }  
                            }   
                            GroupClear(tmp_group); 
                            //----------------------
                            k=GroupFind(u.unit,dash.X+100*CosBJ(dash.Angle),dash.Y+100*SinBJ(dash.Angle),100,true,false);
                            if(k!=null){
                                data.i[0]=1;
                                dash.Stop(); 
                                data.r[0]=0;
                                data.g[0]=CreateGroup();
                                u.Pause(true);
                                u.AnimeId(7);
                                u.AddAbility('A04X');
                                u.SetF(Util.XY(u.unit,k),true);
                                dash1=Dash.Start(u.unit,u.F(),450,Dash.SUB,30,true,false);
                                dash1.Obj=data;
                                dash1.onMove=function(Dash dash){
                                    Data data=Data(dash.Obj);
                                    Units u=Units(data.c[0]);
                                    Units mj;
                                    Data data1,data2;
                                    Units tmp;
                                    if(dash.Speed<4){
                                        dash.Stop();
                                    }else{ 
                                        if(data.r[0]<=0){
                                            data.r[0]=0.04;
                                            Units.MJ(u.player.player,'e008','A04U',0,dash.X,dash.Y,GetRandomReal(0,360),1,1,1,"stand","az_storm_v2_z_5.mdl");
                                            //Units.MJ(u.player.player,'e008','A04U',0,dash.X,dash.Y,GetRandomReal(0,360),0.5,2,1,"death","by_wood_effect_yubanmeiqin_lightning_dianjishanghai.mdl").SetH(75);
                                            GroupEnumUnitsInRange(tmp_group,dash.X,dash.Y,125,function GroupIsAliveNotAloc);     
                                            while(FirstOfGroup(tmp_group)!=null){
                                                mj=Units.Get(FirstOfGroup(tmp_group));
                                                GroupRemoveUnit(tmp_group,mj.unit);
                                                if(IsUnitEnemy(mj.unit,u.player.player)==true&&IsUnitInGroup(mj.unit,data.g[0])==false){    
                                                    GroupAddUnit(data.g[0],mj.unit);
                                                    u.Damage(mj.unit,Damage.Magic,'A04U',u.Agi(true)*5); 
                                                    Units.MJ(u.player.player,'e008','A04U',0,mj.X(),mj.Y(),GetRandomReal(0,360),0.5,2,1,"death","by_wood_effect_yubanmeiqin_lightning_dianjishanghai.mdl").SetH(75);
                                                    //Effect.ToUnit("by_wood_effect_yubanmeiqin_lightning_dianjishanghai.mdl",mj.unit,"chest").Destroy();
                                                    Buffs.Skill(mj.unit,'A04Y',1);
                                                }
                                            }
                                            GroupClear(tmp_group);
                                            //-------------手里剑附魔
                                            GroupEnumUnitsInRange(tmp_group,dash.X,dash.Y,125,function GroupIsTSW); 
                                            while(FirstOfGroup(tmp_group)!=null){
                                                tmp=Units.Get(FirstOfGroup(tmp_group));  
                                                GroupRemoveUnit(tmp_group,tmp.unit);
                                                if(tmp.aid=='A051'){  
                                                    if(tmp.IsAbility('A054')==false){ 
                                                        tmp.AddAbility('A054');  
                                                        data1=Data(tmp.Obj); 
                                                        data2=Data(data1.c[1]);
                                                        //BJDebugMsg("Q----ID:"+I2S(data1)+"/U:"+I2S(data1.c[1])+"/ID2:"+I2S(data2));
                                                        data2.c[0]=Effect.ToUnit("[effect]31_ex.mdl",tmp.unit,"weapon");
                                                        //BJDebugMsg("O----ID:"+I2S(data2)+"/U:"+I2S(data2.c[0]));
                                                        data2.c[1]=Effect.ToUnit("[effect]31_ex.mdl",tmp.unit,"origin");
                                                        data2.c[2]=Effect.ToUnit("[effect]31_ex.mdl",tmp.unit,"head");
                                                        data2.c[3]=Effect.ToUnit("[effect]31_ex.mdl",tmp.unit,"overhead");
                                                    }
                                                }  
                                            }  
                                            GroupClear(tmp_group); 
                                            //----------------------
                                        }else{
                                            data.r[0]-=0.01;
                                        }
                                    }
                                };
                                dash1.onEnd=function(Dash dash){
                                    Data data=Data(dash.Obj);
                                    Units u=Units(data.c[0]);
                                    //BJDebugMsg("千鸟尾巴结束");
                                    u.RemoveAbility('A04X');
                                    u.DelayReleaseAnimePause(0.2); 
                                    Dash.Start(u.unit,dash.Angle,200,Dash.SUB,dash.Speed,true,false);
                                    DestroyGroup(data.g[0]);
                                    data.g[0]=null;
                                    Spell(data.c[1]).Destroy();
                                    data.Destroy();
                                };
                                k=null;
                            }
                        }else{
                            dash.Stop();
                        }
                        ts.Position(dash.X,dash.Y,false);
                        ts.SetF(dash.Angle,true);
                    };
                    dash.onEnd=function(Dash dash){
                        Data data=Data(dash.Obj);
                        Units u=Units(data.c[0]);
                        Units mj=Units(data.c[2]); 
                        if(u.IsAbility('B019')==true){
                            Buffs.Find(u.unit,'B019').Stop();
                        }
                        //BJDebugMsg("千鸟奔跑结束");
                        u.RemoveAbility('A04V'); 
                        u.RemoveAbility('A04Z');
                        u.Alpha(255);
                        u.SetData(Units.MJ(u.player.player,'e00L','A04U',0,0,0,0,86400,1,1,"two",".mdl")); 
                        Dash.Start(u.unit,u.F(),200,Dash.SUB,dash.Speed,true,false);
                        mj.Life(0.3);
                        mj.Alpha(0);
                        if(data.i[0]==0){ 
                            Spell(data.c[1]).Destroy();
                            data.Destroy();
                        }
                    };
                }else{
                    Spell(data.c[1]).Destroy();
                    data.Destroy();
                }  
                u.Pause(false);
                t.Destroy();
            });
        }


        //5 挥手雷电 6 雷电奔跑 7 雷电穿刺 8 搓雷电
        //3 喷火 4 喷火中
        //11 扔手里剑
        static method HERO_START(Spell e){
            Units u=Units.Get(e.Spell);
            if(e.Id=='A04U'){ 
                u.FlushAnimeId(5); 
                e.Destroy();
            }
            if(e.Id=='A050'){
                u.FlushAnimeId(3);
                e.Destroy();
            }
            if(e.Id=='A051'){
                u.FlushAnimeId(11);
                e.Destroy();
            }
            if(e.Id=='A055'){
                u.FlushAnimeId(10); 
                e.Destroy();
            }
        }  

        static method onInit(){ 
            Spell.On(Spell.onSpell,'A055',BigZZ.R); 
            Spell.On(Spell.onSpell,'A051',BigZZ.E); 
            Spell.On(Spell.onSpell,'A050',BigZZ.W); 
            Spell.On(Spell.onSpell,'A04U',BigZZ.Q); 
            Spell.On(Spell.onReady,'A04U',BigZZ.HERO_START);  
            Spell.On(Spell.onReady,'A050',BigZZ.HERO_START);  
            Spell.On(Spell.onReady,'A055',BigZZ.HERO_START);  
            Spell.On(Spell.onReady,'A051',BigZZ.HERO_START); 
            Units.On(Units.onHeroSpawn,BigZZ.Spawn);
            Units.On(Units.onHeroDeath,BigZZ.Death); 
            Events.On(Events.onUnitOrderToUnit,BigZZ.Q_Order);
            Events.On(Events.onUnitOrderToLocation,BigZZ.Q_Order); 
            Damage.On(Damage.onUnitDamage_SubDamage,BigZZ.Damage); 
            Press.OnSnyc(Press.onSnycPressKeyDown,BigZZ.E2);
        }
    }
}