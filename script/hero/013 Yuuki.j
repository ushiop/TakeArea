library Yuuki requires Groups{
    //英雄‘优纪’的技能
    //R级
    struct Yuuki{


        static method E1(unit ua){
            Units u=Units.Get(ua);
            Dash dash;
            Data data=Data.create('A04N');
            Units mj;
            u.Pause(true);
            u.AnimeId(6); 
            u.DelayAlpha(0,255,1.2); 
            data.c[4]=u;
            data.r[0]=u.X();
            data.r[1]=u.Y();
            data.r[2]=u.F();
            data.i[0]=0;
            data.i[1]=0;
            mj=Units.MJ(u.player.player,'e008','A04N',0,data.r[0]+150*CosBJ(data.r[2]),data.r[1]+150*SinBJ(data.r[2]),data.r[2],10,1,1,"stand","slash_flareadditive195_2.mdl");
            mj.SetH(75);   
            mj.DelayAnimeSpeed(0,0.25);
            data.c[0]=mj;
            dash=Dash.Start(u.unit,data.r[2],200,Dash.NORMAL,40,true,false);
            dash.Obj=data; 
            dash.onEnd=function(Dash dash){
                Data data=Data(dash.Obj);
                Dash dash1;
                Units u=Units.Get(dash.Unit);
                Units mj;
                integer i;
                data.i[0]+=1; 
                if(data.i[0]<4){
                    if(data.i[0]==3){ 
                        dash1=Dash.Start(u.unit,data.r[2]+90*data.i[0],250,Dash.SUB,40,true,false);
                        dash1.onMove=function(Dash dash){
                            Units mj;
                            integer i;
                            real x,y;
                            Data data=Data(dash.Obj);
                            Dash dash1;
                            if(data.i[1]==0){
                                if(dash.Speed<4){
                                    data.i[1]=1;
                                    x=data.r[0]+125*CosBJ(data.r[2]);
                                    y=data.r[1]+125*SinBJ(data.r[2]);
                                    x=x+125*CosBJ(data.r[2]+90);
                                    y=y+125*SinBJ(data.r[2]+90); 
                                    for(0<=i<4){
                                        mj=Units(data.c[i]);
                                        mj.Life(0.4);
                                        mj.DelayAlpha(255,0,0.2);
                                        mj.DelaySizeEx(1,3,0.38);
                                        dash1=Dash.Start(mj.unit,Util.XYEX(x,y,mj.X(),mj.Y()),200,Dash.ADD,50,true,false);
                                    }
                                }
                            } 
                        };
                    }else{  
                        dash1=Dash.Start(u.unit,data.r[2]+90*data.i[0],200,Dash.NORMAL,40,true,false);
                    }
                    dash1.Obj=data; 
                    dash1.onEnd=dash.onEnd;
                    mj=Units.MJ(u.player.player,'e008','A04N',0,dash.X+125*CosBJ(dash.Angle+90),dash.Y+125*SinBJ(dash.Angle+90),dash.Angle+90,10,1,1,"stand","slash_flareadditive195_2.mdl");
                    mj.SetH(75);
                    mj.DelayAnimeSpeed(0,0.25);
                    data.c[data.i[0]]=mj; 
                }else{ 
                    u.Pause(false); 
                    Dash.Start(u.unit,dash.Angle,100,Dash.SUB,2,true,false); 
                    data.Destroy();
                }
            };
        }

        static method E(Spell e){
            Units u=Units.Get(e.Spell);
            Data data;
            Dash dash;
            integer i;
            real x=u.X(),y=u.Y(),f=u.F();
            Units mj;
            u.Pause(true);
            u.DelayAlpha(0,255,1.5); 
            u.DelayReleaseAnimePause(0.25);
            Buffs.Add(u.unit,'A04O','B015',0.75,false);//衔接R
            Buffs.Add(u.unit,'A04P','B016',5.25,false);//二段
            Units.MJ(u.player.player,'e008','A04N',0,x,y,f,1,1,1,"stand","blink_zi.mdl");   
            f=e.Angle;
            for(0<=i<4){ 
                data=Data.create('A04N');
                Units.MJ(u.player.player,'e009','A04N',0,x+115*CosBJ(f+90*i),y+115*SinBJ(f+90*i),f+90*i,2,1,1.5,"stand","wind.mdl");
                Units.MJ(u.player.player,'e008','A04N',0,x,y,f+90*i,2,1,1.25,"stand","dust2.mdl");
                mj=Units.MJ(u.player.player,'e008','A04N',0,x,y,f+90*i,1,u.modelsize,0.7,"stand",u.model);
                mj.AnimeId(8);
                mj.Alpha(200);
                data.c[0]=mj; 
                data.r[0]=x;
                data.r[1]=y;
                data.g[0]=CreateGroup();
                dash=Dash.Start(mj.unit,mj.F(),500,Dash.SUB,25,true,false);
                dash.Obj=data;
                dash.onMove=function(Dash dash){
                    Data data=Data(dash.Obj);
                    Units u=Units.Get(dash.Unit);
                    Units mj;
                    if(dash.Speed<2.5){
                        dash.Stop();
                    }else{
                        GroupEnumUnitsInRange(tmp_group,dash.X,dash.Y,100,function GroupIsAliveNotAloc);     
                        while(FirstOfGroup(tmp_group)!=null){
                            mj=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,mj.unit);
                            if(IsUnitEnemy(mj.unit,u.player.player)==true&&IsUnitInGroup(mj.unit,data.g[0])==false){   
                                GroupAddUnit(data.g[0],mj.unit);
                                u.Damage(mj.unit,Damage.Physics,'A04N',u.Agi(true)*2.5);
                                Effect.ToUnit("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",mj.unit, "chest").Destroy();
                                Effect.ToUnit("hiteffect08purplea.mdl",mj.unit,"chest").Destroy();
                            }
                        }
                        GroupClear(tmp_group);
                    }
                };
                dash.onEnd=function(Dash dash){
                    Data data=Data(dash.Obj);
                    Units u=Units.Get(dash.Unit);
                    Units mj;
                    real f=Util.XYEX(dash.X,dash.Y,data.r[0],data.r[1]),dis=Util.XY2EX(dash.X,dash.Y,data.r[0],data.r[1]);
 
                    u.Alpha(0);     
                    Units.MJ(u.player.player,'e008','A04N',0,dash.X,dash.Y,0,2,1.5,1,"stand","az-ziwu-yumao.mdl");
                    Units.MJ(u.player.player,'e008','A04N',0,dash.X+250*CosBJ(f),dash.Y+250*SinBJ(f),f,2,2,1,"stand","slash_flareadditive195_2.mdl").SetH(75);      
                    DestroyGroup(data.g[0]);
                    data.g[0]=null;
                    data.Destroy(); 
                    mj=Units.MJ(u.player.player,'e008','A04N',0,dash.X,dash.Y,0,2,1.5,1,"stand",".mdl");
                    dash=Dash.Start(mj.unit,f,dis,Dash.NORMAL,20,true,false);
                    dash.onMove=function(Dash dash){
                        Units u=Units.Get(dash.Unit);
                        Units mj;
                        GroupEnumUnitsInRange(tmp_group,dash.X,dash.Y,200,function GroupIsAliveNotAloc);     
                        while(FirstOfGroup(tmp_group)!=null){
                            mj=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,mj.unit);
                            if(IsUnitEnemy(mj.unit,u.player.player)==true){   
                                mj.Position(dash.X,dash.Y,true);
                            }
                        }
                        GroupClear(tmp_group);
                    };
                };
            }
            e.Destroy();
        }
 
        //4 走路  9 飞行
        static method W(Spell e){
            Units u=Units.Get(e.Spell);
            Data data=Data.create('A04K');
            Dash dash;
            u.Pause(true);
            u.AnimeSpeed(3);
            u.AddAbility('A04L');
            u.AnimeId(9);
            u.SetF(e.Angle,true);
            Units.MJ(u.player.player,'e008','A04K',0,u.X(),u.Y(),e.Angle,1,0.8,1,"stand","cf2.mdl"); 
            Units.MJ(u.player.player,'e00C','A04K',0,u.X(),u.Y(),e.Angle,1,1,1,"stand","warstompcaster.mdl");
            data.c[0]=u;
            data.c[1]=e;
            data.i[0]=0;
            dash=Dash.Start(u.unit,e.Angle,1400,Dash.SUB,40,true,false);
            dash.Obj=data;
            dash.onMove=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units.Get(dash.Unit);
                Units mj;
                unit k; 
                real f;
                if(dash.Speed>4){
                    k=GroupFind(u.unit,dash.X+60*CosBJ(dash.Angle),dash.Y+60*SinBJ(dash.Angle),80,true,false);
                    if(k!=null){
                        data.i[0]=1;
                        dash.Stop();
                        u.Pause(true); 
                        data.u[0]=k; 
                        u.DelayAlpha(255,0,0.2);
                        f=Util.XY(u.unit,k);
                        Units.MJ(u.player.player,'e008','A04K',0,dash.X,dash.Y,dash.Angle,1,1,1,"stand","blink_zi.mdl"); 
                        mj=Units.MJ(u.player.player,'e008','A04K',0,dash.X,dash.Y,dash.Angle,1,u.modelsize,1.5,"attack",u.model); 
                        mj.DelayAlpha(255,0,0.3);
                        data.c[2]=mj;
                        Dash.Start(mj.unit,f+90,400,Dash.SUB,20,true,false);
                        mj=Units.MJ(u.player.player,'e008','A04K',0,dash.X,dash.Y,dash.Angle,1,u.modelsize,1.5,"attack",u.model); 
                        mj.DelayAlpha(255,0,0.3);
                        data.c[3]=mj; 
                        Dash.Start(mj.unit,f-90,400,Dash.SUB,20,true,false);
                        Dash.Start(data.u[0],f,200,Dash.SUB,15,true,true);
                        Effect.ToUnit("hiteffect08purplea.mdl",k,"chest").Destroy(); 
                        Effect.ToUnit("hiteffect08purplea.mdl",k,"chest").Destroy(); 
                        Effect.ToUnit("hiteffect08purplea.mdl",k,"chest").Destroy(); 
                        Effect.ToUnit("hiteffect08purplea.mdl",k,"chest").Destroy(); 
                        HitFlys.Add(data.u[0],15);
                        u.Damage(k,Damage.Physics,'A04K',u.Agi(true)*5);
                        Timers.Start(0.3,data,function(Timers t){
                            Data data=Data(t.Data());
                            Units u=Units(data.c[0]);
                            Units m=Units.Get(data.u[0]);
                            Units mj;
                            real x=m.X(),y=m.Y(),f=Util.XY(u.unit,m.unit);
                            if(u.Alive()==true&&m.Alive()==true){
                                x=x+200*CosBJ(f);
                                y=y+200*SinBJ(f);
                                Units.MJ(u.player.player,'e008','A04K',0,x,y,f,1,1,1,"stand","blink_zi.mdl"); 
                                mj=Units.MJ(u.player.player,'e008','A04K',0,x+400*CosBJ(f+90),y+400*SinBJ(f+90),f+180,0.3,u.modelsize,1,"two",u.model); 
                                mj.DelayAlpha(0,255,0.2);
                                Dash.Start(mj.unit,f-90,460,Dash.SUB,50,true,false);
                                mj=Units.MJ(u.player.player,'e008','A04K',0,x+400*CosBJ(f-90),y+400*SinBJ(f-90),f+180,0.3,u.modelsize,1,"two",u.model); 
                                mj.DelayAlpha(0,255,0.2);
                                Dash.Start(mj.unit,f+90,460,Dash.SUB,50,true,false);
                                u.DelayAlpha(0,255,0.2);
                                u.Position(x,y,false);
                                Units(data.c[3]).Position(x,y,false);
                                Units(data.c[3]).SetF(f+180,true);
                                Units(data.c[2]).Position(x,y,false);
                                Units(data.c[2]).SetF(f+180,true);
                                u.SetF(f+180,true);
                                Timers.Start(0.2,data,function(Timers t){
                                    Data data=Data(t.Data());
                                    Units u=Units(data.c[0]);
                                    Units mj; 
                                    real x=u.X(),y=u.Y(),f=u.F();
                                    if(u.Alive()==true){
                                        mj=Units.MJ(u.player.player,'e008','A04K',0,x,y,f,2,2,2,"stand","zzmxcl_tuci_zise.mdl");
                                        mj.SetH(150); 
                                        Dash.Start(mj.unit,f,400,Dash.SUB,30,true,false);
                                        mj=Units.MJ(u.player.player,'e008','A04K',0,x+100*CosBJ(f),y+100*SinBJ(f),f,2,1.25,1,"stand","zise-shoot_ex.mdl");
                                        mj.SetH(100);  
                                        Dash.Start(mj.unit,f,180,Dash.NORMAL,30,true,false);
                                        //Util.Range(x+150*CosBJ(f),y+150*SinBJ(f),150);
                                        GroupEnumUnitsInRange(tmp_group,x+150*CosBJ(f),y+150*SinBJ(f),150,function GroupIsAliveNotAloc);     
                                        while(FirstOfGroup(tmp_group)!=null){
                                            mj=Units.Get(FirstOfGroup(tmp_group));
                                            GroupRemoveUnit(tmp_group,mj.unit);
                                            if(IsUnitEnemy(mj.unit,u.player.player)==true){    
                                                Dash.Start(mj.unit,f,300,Dash.SUB,60,true,true);  
                                                u.Damage(mj.unit,Damage.Physics,'A04K',u.Agi(true)*5);
                                                Effect.ToUnit("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",mj.unit, "chest").Destroy();
                                                Effect.ToUnit("hiteffect08purplea.mdl",mj.unit,"chest").Destroy();
                                                Buffs.Add(mj.unit,'A04M','B014',4,false).Type=Buffs.TYPE_SUB+Buffs.TYPE_DISPEL_TRUE;
                                            }
                                        }
                                        GroupClear(tmp_group);
                                        u.AnimeId(8); 
                                        Dash.Start(u.unit,f,200,Dash.NORMAL,20,true,false);
                                    }
                                    u.DelayReleaseAnimePause(0.2);
                                    Spell(data.c[1]).Destroy();
                                    data.u[0]=null;
                                    data.Destroy();
                                    t.Destroy();
                                }); 
                            }else{
                                u.Pause(false);
                                Spell(data.c[1]).Destroy();
                                data.u[0]=null;
                                data.Destroy();
                            }
                            t.Destroy();
                        });
                        k=null;
                    }
                }else{
                   u.Anime("stand");
                   dash.Stop();
                }
            };
            dash.onEnd=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units.Get(dash.Unit);
                Timers.Start(0.2,u,function(Timers t){
                    Units(t.Data()).RemoveAbility('A04L');
                    t.Destroy();
                });
                u.Pause(false);
                u.AnimeSpeed(1);
                if(data.i[0]==0){ 
                    Dash.Start(u.unit,dash.Angle,200,Dash.SUB,dash.Speed,true,false);
                    Spell(data.c[1]).Destroy();
                    data.Destroy(); 
                }
            };
        }

        static method Damage(DamageArgs e){
            if(e.TriggerUnit.IsAbility('A04J')==true||e.TriggerUnit.IsAbility('A04L')==true){ 
                if(e.DamageType==Damage.Attack||e.DamageType==Damage.Physics){
                    e.Damage-=e.Damage*0.85;
                }
            }

        } 

        static method Q1(player ps,string k){
            Players p=Players.Get(ps);
            Buffs b;
            Data data;
            Units mj;
            if(k=="Q"){ 
                if(p.hero.IsAbility('B013')==true&&p.hero.IsPause()==false){
                    b=Buffs.Find(p.hero.unit,'B013'); 
                    if(b.Level==1){ 
                        data=Data(b.Obj); 
                        Units.MJ(p.player,'e008','A04H',0,p.hero.X(),p.hero.Y(),0,2,1.5,1,"death","lizi_zi1.mdl"); 
                        Units.MJ(p.player,'e008','A04H',0,p.hero.X(),p.hero.Y(),0,2,2,1,"stand","hiteffect08purplea.mdl").SetH(100); 
                        mj=Units.MJ(p.player,'e008','A04H',0,p.hero.X(),p.hero.Y(),0,2,p.hero.modelsize,2,"attack",p.hero.model); 
                        mj.Alpha(0);
                        mj.SetF(Util.XY(mj.unit,p.hero.unit),true);
                        p.hero.Position(Units(data.c[2]).X(),Units(data.c[2]).Y(),false);
                        data=Data.create('A04H');
                        data.c[0]=mj;
                        data.r[0]=p.hero.X();
                        data.r[1]=p.hero.Y();
                        Timers.Start(0.2,data,function(Timers t){
                            Data data=Data(t.Data());
                            Units(data.c[0]).Position(data.r[0],data.r[1],false);
                            t.Destroy();
                            data.Destroy();
                        }); 
                        b.Level-=1;
                        b.Stop();
                    }
                }
            }
            if(k=="E"){
                if(p.hero.IsAbility('B016')==true&&p.hero.IsPause()==false){
                    b=Buffs.Find(p.hero.unit,'B016');
                    Yuuki.E1(p.hero.unit);
                    b.Stop();
                }
            }
        }

        static method Q(Spell e){
            Units u=Units.Get(e.Spell);
            Buffs b;
            real f=e.Angle,x,y;
            Dash dash;
            Data data;
            Units mj;
            if(u.IsAbility('B013')==false){//第一次用
                data=Data.create('A04H');
                data.c[0]=u;
                data.c[1]=e;
                mj=Units.MJ(u.player.player,'e008','A04H',0,u.X(),u.Y(),0,6,1,1,"stand","bowen_zi.mdl");
                data.c[2]=mj;
                b=Buffs.Add(u.unit,'A04I','B013',5,false);
                b.Level=2;
                b.Obj=data;
                b.onEnd=function(Buffs b){
                    Data data=Data(b.Obj);
                    Units(data.c[0]).SetAbilityCD('A04H',10-b.Time);
                    Spell(data.c[1]).Destroy();
                    Units(data.c[2]).Anime("death");
                    data.Destroy();
                };
            }else{//后续使用
                b=Buffs.Find(u.unit,'B013');
                b.Level-=1;
                e.Destroy();
            }
            if(b.Level>0){  
                u.Pause(true);
                u.SetF(f,true);
                u.AnimeId(8); 
                x=u.X();
                y=u.Y();
                if(b.Level==1){  
                    mj=Units.MJ(u.player.player,'e009','A04H',0,x,y,f,2,1,1.5,"stand","tx_white2.mdl");
                    mj.SetH(75);
                    mj.DelaySizeEx(1,2,1.5);
                    Dash.Start(mj.unit,f,600,Dash.PWX,70,true,false);
                }else{ 
                    u.Position(x,y,true);
                    u.RemoveAbility('A04H');
                    u.AddAbility('A04H');
                }
                u.AddAbility('A04J');
                u.DelayAlpha(0,255,0.6);
                data=Data.create('A04H');
                Units.MJ(u.player.player,'e008','A04H',0,x,y,f,1,0.6,1,"stand","cf2.mdl"); 
                mj=Units.MJ(u.player.player,'e009','A04H',0,x,y,f,2,1,3,"stand","white-qiquan-new.mdl");
                mj.SetH(75);
                mj.DelaySizeEx(1,2,1.5);
                Dash.Start(mj.unit,f,600,Dash.ADD,70,true,false);
                mj=Units.MJ(u.player.player,'e008','A04H',0,x,y,f,2,0.6,1,"stand","akiha claw_zi.mdl");
                mj.SetH(100); 
                data.c[0]=u;
                data.c[1]=mj;
                data.i[0]=0;
                data.g[0]=CreateGroup();
                dash=Dash.Start(u.unit,f,700,Dash.SUB,40,true,false);
                dash.Obj=data;
                dash.onMove=function(Dash dash){
                    Data data=Data(dash.Obj);
                    Units u=Units.Get(dash.Unit);
                    Units mj;
                    if(dash.Speed>6){
                        if(data.i[0]==0){
                            data.i[0]=2;
                            Effect.To("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl",dash.X,dash.Y).Destroy();
                        }else{
                            data.i[0]-=1;
                        }
                        Units(data.c[1]).Position(dash.X+100*CosBJ(dash.Angle),dash.Y+100*SinBJ(dash.Angle),false);
                    }
                    
                    if(dash.Speed<2.3){
                        dash.Stop();
                    }else{
                        GroupEnumUnitsInRange(tmp_group,dash.X+150*CosBJ(dash.Angle),dash.Y+150*SinBJ(dash.Angle),200,function GroupIsAliveNotAloc);     
                        while(FirstOfGroup(tmp_group)!=null){
                            mj=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,mj.unit);
                            if(IsUnitEnemy(mj.unit,u.player.player)==true&&IsUnitInGroup(mj.unit,data.g[0])==false){   
                                GroupAddUnit(data.g[0],mj.unit);
                                Dash.Start(mj.unit,dash.Angle,500-dash.NowDis,Dash.ADD,50,true,true);  
                                u.Damage(mj.unit,Damage.Physics,'A04H',u.Agi(true)*5);
                                Effect.ToUnit("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",mj.unit, "chest").Destroy();
                                Effect.ToUnit("hiteffect08purplea.mdl",mj.unit,"chest").Destroy();
                            }
                        }
                        GroupClear(tmp_group);
                    }
                };
                dash.onEnd=function(Dash dash){
                    Data data=Data(dash.Obj);
                    Units u=Units.Get(dash.Unit); 
                    u.RemoveAbility('A04J');
                    u.Pause(false);
                    DestroyGroup(data.g[0]);
                    data.g[0]=null;
                    data.Destroy();
                };
            } 
        }


        static method HERO_START(Spell e){
            Units u=Units.Get(e.Spell);
            if(e.Id=='A04H'){
                u.FlushAnimeId(7);
            }
            e.Destroy();
        }

         

        static method onInit(){
            Spell.On(Spell.onSpell,'A04N',Yuuki.E); 
            Spell.On(Spell.onSpell,'A04K',Yuuki.W); 
            Spell.On(Spell.onSpell,'A04H',Yuuki.Q); 
            Spell.On(Spell.onReady,'A04H',Yuuki.HERO_START); 
            Damage.On(Damage.onUnitDamage_SubDamage,Yuuki.Damage);
            Press.OnSnyc(Press.onSnycPressKeyDown,Yuuki.Q1);
            //Spell.On(Spell.onStop,'A04H',Yuuki.HERO_STOP);   
        }
    }
}