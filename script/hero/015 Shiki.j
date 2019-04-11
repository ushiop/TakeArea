library Shiki requires Groups{
    //英雄‘极死·七夜’的技能
    //SR
    /*  35 屈腿 0.4秒
        16 踢腿
        17 上翻 0.433秒 
        20 空踢 
        36 空踢（无前摇-无高度）
        38 上翻 0.433秒 无高度
        39 空踢 无高度*/
    struct Shiki{ 

        static method Q3(Units u,Units m,real f){
            f=f+180;
            u.Pause(true);
            BJDebugMsg("暂停3");
            Buffs.Skill(m.unit,'A00F',1);
            u.Damage(m.unit,Damage.Physics,'A05A',u.Agi(true)*5); 
            u.AnimeId(36);
            HitFlys.Reset(m.unit);
            HitFlys.Add(m.unit,-30).onEnd=function(HitFlys h){
                Units u=Units.Get(h.Unit);
                Effect.To("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl",u.X(),u.Y()).Destroy();
                Util.Duang(u.X(),u.Y(),0.7,175,175,-220,0.02,50);  
                Timers.Start(0.01,u,function(Timers t){
                    Units u=Units(t.Data());
                    HitFlys.Add(u.unit,15).onEnd=function(HitFlys h){
                        Units u=Units.Get(h.Unit);
                        Effect.To("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl",u.X(),u.Y()).Destroy();
                        Util.Duang(u.X(),u.Y(),0.4,175,175,-64,0.02,50);   
                    };
                    t.Destroy();
                });
                              
            };
            HitFlys.Reset(u.unit);
            HitFlys.Add(u.unit,15).onEnd=function(HitFlys h){
                Units u=Units.Get(h.Unit); 
                u.RemoveAbility('A05F'); 
                u.Pause(false);
                BJDebugMsg("暂停3-解除");
            }; 
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
            real x=u.X(),y=u.Y(),f=Util.XY(u.unit,m.unit),x1=m.X(),y1=m.Y(),f1;
            b.Level=0;
            b.Stop(); 
            BJDebugMsg("触发Q2");
            /*
                中断技能，通过结束BUFF来结束技能硬直，每个技能单独判断
                B01F - 踢人(Q)的后半段硬直，可取消
            */
            if(u.IsAbility('B01F')==true){
                Buffs.Find(u.unit,'B01F').Stop();
            }
            u.AddAbility('A05F'); 
            //Units.MJ(u.player.player,'e008','A05A',0,x,y,f,1,1,1,"stand","blink_darkblue.mdl").SetH(u.H());
            Effect.ToUnit("blink_darkblue.mdl",u.unit,"chest").Destroy();
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
                                    if(b.Time<0.31){
                                        ts.SetH(u.H());
                                        ts.Alpha(255);
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
            if(u.IsAbility('A05A')==true){
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
            if(e.Id=='A05A'){
                u.FlushAnimeId(35);
                Dash.Start(u.unit,e.Angle+180,80,Dash.SUB,10,true,false);
            }
            e.Destroy();
        }


        static method onInit(){   
            Press.OnSnyc(Press.onSnycPressKeyDown,Shiki.Press);
            Spell.On(Spell.onReady,'A05A',Shiki.HERO_START); 
            Spell.On(Spell.onSpell,'A05A',Shiki.Q);
            Events.On(Events.onUnitOrderToUnit,Shiki.Order);
            Events.On(Events.onUnitOrderToLocation,Shiki.Order); 
        }
    }
}

         