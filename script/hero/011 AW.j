library AW requires Groups{
    //英雄‘阿伟’的技能
    //SR英雄
    struct AW{

        //死灵法师出生，绑定数据
        static method Spawn(Units u,Units m){
            timer t;
            Data data;
            if(u.IsAbility('A03A')==true){
                t=NewTimer();
                data=Data.create('A03A');
                data.c[0]=u;
                SetTimerData(t,data);
                TimerStart(t,0.1,true,function(){
                    integer x;
                    Data data=Data(GetTimerData(GetExpiredTimer()));
                    Units u=Units(data.c[0]);
                    Buffs b;
                    if(u.Alive()==false){
                        BJDebugMsg("结束了");
                        for(0<=x<4){
                            if(data.u[x]!=null){
                                Units.Remove(data.u[x]);
                                data.u[x]=null;
                            }
                        }
                        ReleaseTimer(GetExpiredTimer());
                        data.Destroy();
                    }else{
                        if(u.IsAbility('B00Q')==true){
                            b=Buffs.Find(u.unit,'B00Q');
                            if(b.Level>=5){//5层尸体
                                if(data.u[0]==null){
                                    data.u[0]=Units.MJ(u.player.player,'e00F','A03A',5,0,0,0,86400,1,1, "stand",".mdx").unit; 
                                }
                            }else{ 
                                if(data.u[0]!=null){
                                    Units.Remove(data.u[0]); 
                                    data.u[0]=null;
                                }
                            }                            
                            if(b.Level>=10){//10层尸体
                                if(data.u[1]==null){
                                    data.u[1]=Units.MJ(u.player.player,'e00G','A03A',10,0,0,0,86400,1,1, "stand",".mdx").unit; 
                                }
                            }else{ 
                                if(data.u[1]!=null){
                                    Units.Remove(data.u[1]); 
                                    data.u[1]=null;
                                }
                            }
                            if(b.Level<=0){
                                b.Stop();
                            }
                        }else{
                            for(0<=x<4){
                                if(data.u[x]!=null){
                                    Units.Remove(data.u[x]);
                                    data.u[x]=null;
                                }
                            }   
                        }
                    }
                });
                t=null;
            }
        }

        //任意单位死亡时增加900码内死灵法师的尸体层数
        static method Death(Units u,Units m){
            Units mj;
            integer s=0;
            GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),900,function GroupIsAliveNotAloc);     
            while(FirstOfGroup(tmp_group)!=null){
                mj=Units.Get(FirstOfGroup(tmp_group));
                GroupRemoveUnit(tmp_group,mj.unit);
                if(mj.IsAbility('A03A')==true){   
                    if(s==0){
                        s=1;
                        Effect.To("Abilities\\Spells\\Undead\\RaiseSkeletonWarrior\\RaiseSkeleton.mdl",u.X(),u.Y()).Destroy(); 
                    }
                    Buffs.Add(mj.unit,'A03B','B00Q',86400,false).onFlush=function(Buffs b){
                        b.Level+=1;
                    }; 
                    Effect.ToUnit("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdl",mj.unit,"chest");
                }
            }
            GroupClear(tmp_group);   
        }

        //Q被动增伤
        static method Damage_Add(DamageArgs e){
            if(e.TriggerUnit.IsAbility('A03A')==true){
                if(e.DamageType==Damage.Attack||e.DamageType==Damage.Physics){
                    //物理伤害则翻倍
                    e.Damage+=e.Damage;
                }
            }
        }

        //Q被动减伤
        static method Damage_Sub(DamageArgs e){
            Buffs b;
            if(e.TriggerUnit.IsAbility('B00Q')==true){
                b=Buffs.Find(e.TriggerUnit.unit,'B00Q');
                if(b.Level>=100){
                    e.Damage=0;
                }else{ 
                    e.Damage-=e.Damage*(b.Level*0.01);
                }
            }
        }

        //4
        static method W(Spell e){
            Units u=Units.Get(e.Spell); 
            Buffs b;
            Units mj;
            Dash dash;
            Data data;
            Effect ef;
            u.AnimeSpeed(1);
            //降低尸体层数
            if(u.IsAbility('B00Q')==true){
                b=Buffs.Find(u.unit,'B00Q');
                if(b.Level>=5){
                    b.Level-=5;
                }
            }
            mj=Units.MJ(u.player.player,'e008','A03C',0,u.X()+125*CosBJ(e.Angle+180),u.Y()+125*SinBJ(e.Angle+180),e.Angle,10,1.1,1, "attack","units\\undead\\Abomination\\Abomination.mdl"); 
            mj.AnimeId(2);
            //mj.DelayAnimeSpeed(0,0.2);
            ef=Effect.To("Abilities\\Spells\\Undead\\RaiseSkeletonWarrior\\RaiseSkeleton.mdl",mj.X(),mj.Y());
            ef.Size(1.5);
            ef.Destroy();
            data=Data.create('A03C');
            data.c[0]=u;
            data.c[1]=mj;
            mj=Units.MJ(u.player.player,'e008','A03C',0,mj.X(),mj.Y(),e.Angle,10,2.5,1, "attack","Abilities\\Weapons\\WardenMissile\\WardenMissile.mdl"); 
            mj.SetH(75);
            mj.Position(mj.X(),mj.Y(),true);
            mj.AddAbility(Units.MJType_TSW);
            data.c[2]=mj; 
            data.i[0]=0;
            dash=Dash.Start(mj.unit,e.Angle,2000,Dash.SUB,80,true,false);           
            mj=Units.MJ(u.player.player,'e008','A03C',0,mj.X(),mj.Y(),e.Angle,10,2.5,1, "attack","Abilities\\Weapons\\WardenMissile\\WardenMissile.mdl"); 
            mj.SetH(75);
            mj.Alpha(0);
            data.c[3]=mj;
            dash.Obj=data; 
            dash.onMove=function(Dash dash){
                Data data=Data(dash.Obj);
                Units mj=Units(data.c[3]);
                Effect e;
                unit k; 
                if(data.i[0]==0){
                    data.i[0]=2;
                    mj.Position(Units(data.c[1]).X()+100*CosBJ(dash.Angle),Units(data.c[1]).Y()+100*SinBJ(dash.Angle),false);
                }else{
                    data.i[0]-=1;
                    mj.Position(dash.X,dash.Y,false);
                }
                if(dash.Speed<4){
                    dash.Stop();
                }else{
                    k=GroupFind(dash.Unit,dash.X,dash.Y,80,true,false);
                    if(k!=null){
                        e=Effect.ToUnit("Abilities\\Spells\\Undead\\DeathCoil\\DeathCoilSpecialArt.mdl",k,"origin");
                        e.AnimeSpeed(4);
                        e.Destroy();
                        data.u[0]=k;
                        k=null;
                        dash.Stop();
                    }
                }
            };
            dash.onEnd=function(Dash dash){
                Data data=Data(dash.Obj);
                Dash dash1;
                dash1=Dash.Start(dash.Unit,0,1000,Dash.NORMAL,70,true,false);
                dash1.Obj=data;
                dash1.onMove=function(Dash dash){
                    Data data=Data(dash.Obj);
                    Units tf=Units(data.c[1]);
                    Units gz=Units(data.c[2]);
                    Units t;
                    if(data.u[0]!=null){
                        t=Units.Get(data.u[0]);
                        if(t.Alive()==true){
                            t.Position(dash.X,dash.Y,true);
                        }else{
                            data.u[0]=null;
                        }
                    }
                    if(Util.XY2(tf.unit,gz.unit)<150){
                        dash.Stop();
                    }else{
                        dash.MaxDis+=100;
                        dash.Angle=Util.XY(gz.unit,tf.unit);
                    }
                    
                };
                dash1.onEnd=function(Dash dash){
                    Data data=Data(dash.Obj);
                    Units u=Units(data.c[0]);
                    Units tf=Units(data.c[1]);
                    Units gz=Units(data.c[2]);
                    Units gz1=Units(data.c[3]);
                    gz1.Life(0.6);
                    gz1.Anime("death");
                    gz.Life(0.6);
                    gz.Anime("death");
                    tf.AnimeSpeed(2.25);
                    tf.AnimeId(4);
                    tf.Life(0.7);
                    tf.DelayAlpha(255,0,0.65);
                    if(data.u[0]!=null){
                        Buffs.Skill(data.u[0],'A00F',1);
                        u.Damage(data.u[0],Damage.Physics,'A03C',u.Int(true)*10);
                    }
                    data.u[0]=null;
                    data.Destroy();
                };
            };
            e.Destroy();
        }

        static method E(Spell e){
            Units u=Units.Get(e.Spell);
            Data data=Data.create('A03D');
            timer t=NewTimer();
            Units mj;
            Buffs b;
            //降低尸体层数
            if(u.IsAbility('B00Q')==true){
                b=Buffs.Find(u.unit,'B00Q');
                if(b.Level>=10){
                    b.Level-=10;
                }
            }
            Units.MJ(u.player.player,'e008','A03D',0,e.X,e.Y,e.Angle,3,2,1, "stand","Abilities\\Spells\\Undead\\DarkRitual\\DarkRitualTarget.mdl"); 
            mj=Units.MJ(u.player.player,'e008','A03D',0,e.X,e.Y,45,4,2.5,4.5, "stand","Abilities\\Spells\\Items\\AIso\\AIsoTarget.mdl"); 
            data.c[0]=u;
            data.c[1]=mj;
            data.i[0]=4;
            data.i[1]=0;//阶段
            data.i[2]=2;//阶段2的计时
            data.r[0]=e.X;
            data.r[1]=e.Y;
            SetTimerData(t,data);
            TimerStart(t,0.1,true,function(){
                Data data=Data(GetTimerData(GetExpiredTimer()));
                Units mj;
                Units u=Units(data.c[0]);
                Units shou=Units(data.c[1]);
                real x=data.r[0],y=data.r[1];
                if(data.i[0]==0){ 
                    if(data.i[1]==0){//抓人阶段
                        shou.AnimeSpeed(1); 
                        Util.Range(x,y,100);
                        GroupEnumUnitsInRange(tmp_group,x,y,100,function GroupIsAliveNotAloc);   
                        if(GroupNumber(tmp_group)==0){//没抓到人
                            BJDebugMsg("结束了");
                            GroupClear(tmp_group); 
                            ReleaseTimer(GetExpiredTimer());
                            data.Destroy();
                        }else{
                            
                            //Units.MJ(u.player.player,'e008','A03D',0,x,y,0,3,1.5,1.5, "stand","blood1.mdl"); 
                            while(FirstOfGroup(tmp_group)!=null){
                                mj=Units.Get(FirstOfGroup(tmp_group));
                                GroupRemoveUnit(tmp_group,mj.unit);
                                if(IsUnitEnemy(mj.unit,u.player.player)==true){    
                                    Buffs.Skill(mj.unit,'A00F',1);
                                    u.Damage(mj.unit,Damage.Physics,'A03D',u.Int(true)*15);     
                                }
                            }  
                            GroupClear(tmp_group); 
                            data.i[1]=1; 
                        }
                    }else{
                        if(data.i[2]==0){//抓爆阶段
                            BJDebugMsg("结束了");
                            Units.MJ(u.player.player,'e008','A03D',0,x,y,0,5,1.5,1, "stand","bloodex.mdl").SetH(100); 
                            
                            GroupEnumUnitsInRange(tmp_group,x,y,100,function GroupIsAliveNotAloc);   
                            while(FirstOfGroup(tmp_group)!=null){
                                mj=Units.Get(FirstOfGroup(tmp_group));
                                GroupRemoveUnit(tmp_group,mj.unit);
                                if(IsUnitEnemy(mj.unit,u.player.player)==true){     
                                    u.Damage(mj.unit,Damage.Chaos,'A03D',mj.MaxHP()*0.04);     
                                }
                            }  
                            GroupClear(tmp_group); 
                            shou.AnimeSpeed(1);
                            ReleaseTimer(GetExpiredTimer());
                            data.Destroy();
                        }else{
                            if(data.i[2]==2){
                                Units.MJ(u.player.player,'e008','A03D',0,x,y,0,1,5,1, "stand","Abilities\\Spells\\NightElf\\shadowstrike\\shadowstrike.mdl").SetH(250);
                                shou.AnimeSpeed(0);
                            }
                            data.i[2]-=1;
                        }

                    }
                    
                }else{
                    data.i[0]-=1;
                    GroupEnumUnitsInRange(tmp_group,x,y,250,function GroupIsAliveNotAloc);     
                    while(FirstOfGroup(tmp_group)!=null){
                        mj=Units.Get(FirstOfGroup(tmp_group));
                        GroupRemoveUnit(tmp_group,mj.unit);
                        if(IsUnitEnemy(mj.unit,u.player.player)==true){    
                            Dash.Start(mj.unit,Util.XY(mj.unit,shou.unit),25,Dash.SUB,10,true,false);               
                        }
                    }  
                    GroupClear(tmp_group); 
                }
            });
            t=null;
            e.Destroy();
            
        }

        static method HERO_START(Spell e){
            Units u=Units.Get(e.Spell);
            if(e.Id=='A03C'||e.Id=='A03D'){ 
                u.FlushAnimeId(4);
                u.AnimeSpeed(1.3);
            }
            e.Destroy();
        }

        static method HERO_STOP(Spell e){
            Units u=Units.Get(e.Spell);
            u.AnimeSpeed(1);
            e.Destroy();
        }


        static method onInit(){
            Spell.On(Spell.onSpell,'A03D',AW.E); 
            Spell.On(Spell.onSpell,'A03C',AW.W); 
            Spell.On(Spell.onReady,'A03C',AW.HERO_START);
            Spell.On(Spell.onStop,'A03C',AW.HERO_STOP);   
            Spell.On(Spell.onReady,'A03D',AW.HERO_START);
            Spell.On(Spell.onStop,'A03D',AW.HERO_STOP);  
            Damage.On(Damage.onUnitDamage_AddDamage,AW.Damage_Add);
            Damage.On(Damage.onUnitDamage_SubDamage,AW.Damage_Sub);
            Units.On(Units.onHeroDeath,AW.Death);
            Units.On(Units.onUnitDeath,AW.Death);
            Units.On(Units.onHeroSpawn,AW.Spawn);
        }
    }
}