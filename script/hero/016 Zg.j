library Zg requires Groups{
    //英雄‘眼镜·七夜’的技能
    //SR
    /*
        27 - Q前摇
        24 - Q动作
        28 - Q2 第一阶段(0.768s蓄力)(0.464s蓄力完毕小踹)
        29 - Q2 第二阶段大踹0.421
        30 - Q2 空中下踹
    */ 
    struct Zg{  

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
                if(dash.Speed>3.25){  
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
                            ts=Units.MJ(u.player.player,'e008','A05X',0,mj.X(),mj.Y(),dash.Angle,2,1,1,"stand", "blood-2.mdl");
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
                u.Pause(false);
                DestroyGroup(data.g[0]);
                data.g[0]=null;
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
            if(e.Id=='A05X'){
                u.FlushAnimeId(27);
            }
            e.Destroy();
        }

        static method onInit(){

            Press.OnSnyc(Press.onSnycPressKeyDown,Zg.Press);
            Spell.On(Spell.onReady,'A05X',Zg.HERO_START); 
            Spell.On(Spell.onSpell,'A05X',Zg.Q);
        }
    }
} 