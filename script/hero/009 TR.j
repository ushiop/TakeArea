library TR requires Groups{
    //英雄‘桐人’的技能
    //R级

    struct TR{

        //E 3
        static method E(Spell e){
            Units u=Units.Get(e.Spell);
            timer t=NewTimer();
            u.Pause(true);
            u.AnimeSpeed(2.5);
            u.AnimeId(3);
            SetTimerData(t,e);
            TimerStart(t,0.3,false,function(){
                Spell e=Spell(GetTimerData(GetExpiredTimer()));
                Units u=Units.Get(e.Spell);
                integer i;
                Data data;
                Dash dash;
                Units mj;
                real x=u.X(),y=u.Y(),f;
                u.AnimeSpeed(1);
                u.Pause(false);
                e.Destroy();
                ReleaseTimer(GetExpiredTimer());
                if(u.Alive()==true){
                    //5
                    Units.MJ(u.player.player,'e008','A02F',0,x,y,0,1,1.5,1, "stand","white-qiquan.mdl");
                    for(0<=i<4){
                        data=Data.create('A02F');
                        f=u.F()+(i*90.0);
                        mj=Units.MJ(u.player.player,'e008','A02F',115,x,y,f,666,1,1.4, "stand","ls tong ren.mdl");
                        mj.DelayAlpha(255,155,0.5);
                        mj.AnimeId(5);
                        data.c[0]=mj;
                        dash=Dash.Start(mj.unit,f,600,Dash.PWX,50,true,false);
                        mj=Units.MJ(u.player.player,'e00D','A02F',0,x,y,f+180,666,0.7,1,"stand", "tk knockin' on heaven's door by deckai.mdl");
                        mj.SetH(100);
                        mj.AnimeSpeed(0);
                        data.c[1]=mj;
                        data.g[0]=CreateGroup();
                        dash.Obj=data;
                        dash.onMove=function(Dash dash){
                            Data data=Data(dash.Obj);
                            Units mj=Units(data.c[0]);
                            Units dg=Units(data.c[1]);
                            Units tmp;
                            if(dash.NowDis>50){ 
                                dash.Angle+=2;
                                dg.AnimeSpeed(1.5);
                            }
                            if(dash.NowDis>500&&dash.NowDis<530){ 
                                mj.Position(dash.X,dash.Y,true);
                            }
                            mj.SetF(dash.Angle,true);
                            dg.Position(dash.X,dash.Y,false);
                            dg.SetF(dash.Angle,true);
                            GroupEnumUnitsInRange(tmp_group,dash.X,dash.Y,100,function GroupIsAliveNotAloc);     
                            while(FirstOfGroup(tmp_group)!=null){
                                tmp=Units.Get(FirstOfGroup(tmp_group));
                                GroupRemoveUnit(tmp_group,tmp.unit);
                                if(IsUnitEnemy(tmp.unit,mj.player.player)==true){ 
                                    if(IsUnitInGroup(tmp.unit,data.g[0])==false){
                                        GroupAddUnit(data.g[0],tmp.unit);
                                        mj.Damage(tmp.unit,Damage.Physics,'A02F',mj.Agi(true)*5);
                                        Effect.ToUnit("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",tmp.unit, "chest").Destroy();
                                    }
                                }
                            }
                            GroupClear(tmp_group);   
                        };
                        dash.onEnd=function(Dash dash){
                            Data data=Data(dash.Obj);
                            Units mj=Units(data.c[0]); 
                            timer t;
                            mj.AnimeSpeed(0);
                            mj.Position(dash.X,dash.Y,true);
                            if(mj.Obj!=-1){
                                t=NewTimer();
                                mj.Obj=100;
                                SetTimerData(t,mj);
                                TimerStart(t,0.05,true,function(){
                                    Units u=Units(GetTimerData(GetExpiredTimer()));
                                    if(u.Obj==-1){
                                        BJDebugMsg("滚");
                                        ReleaseTimer(GetExpiredTimer());
                                        u.AnimeId(4);
                                        u.AnimeSpeed(1);
                                        u.DelayAlpha(155,0,0.2);
                                        u.Life(0.4);
                                    }else{
                                        u.Obj-=1;
                                    }
                                });
                                t=null;
                            }else{
                                mj.AnimeId(4);
                                mj.AnimeSpeed(1);
                                mj.DelayAlpha(155,0,0.2);
                                mj.Life(0.4);
                            }
                            Units(data.c[1]).Life(5);
                            DestroyGroup(data.g[0]);
                            data.g[0]=null;
                            data.Destroy();
                        };
                    }
                }
            });
            t=null;
        }


        //发动刀光冲击的实际效果 2
        static method W2(unit ua,real f,integer i,integer tp){
            Units u=Units.Get(ua);
            Dash dash;
            real x=u.X(),y=u.Y(); 
            Data data=Data.create('A02D');
            Units mj;
            if(tp==2){ 
                u.Pause(true);
                IssueImmediateOrder(u.unit,"stop");
            }
            u.AnimeId(2);
            if(i==1){ 
                u.AnimeSpeed(1.75);
            }else{ 
                u.AnimeSpeed(2.25);
            }
            u.SetF(f,true);
            Util.Duang(x,y,0.4,100,100,-320,0.02,50); 
            Units.MJ(u.player.player,'e008','A02D',0,x,y,f,1,0.5,1.1, "stand","cf2.mdl").SetH(75);
            Units.MJ(u.player.player,'e008','A02D',0,x,y,f,1,1.25,2, "stand","dust2.mdl");
            Units.MJ(u.player.player,'e008','A02D',0,x,y,f,2,1,0.5, "stand","chongfeng2.mdl");
            mj=Units.MJ(u.player.player,'e008','A02D',0,x,y,f,2,2.5,1, "birth","az_lxj_blue.mdl");
            mj.SetH(75); 
            data.c[1]=mj;
            data.c[0]=u;
            data.i[0]=i; 
            data.i[1]=0; 
            data.i[2]=1;
            data.i[3]=tp;
            data.g[0]=CreateGroup();
            dash=Dash.Start(u.unit,f,400,Dash.SUB,80,true,false); 
            dash.Obj=data;
            dash.onMove=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units.Get(dash.Unit);
                Units mj=Units(data.c[1]);
                real x=dash.X+85*CosBJ(dash.Angle),y=dash.Y+85*SinBJ(dash.Angle);
                u.SetF(dash.Angle,true);
                mj.Position(x,y,false);
                mj.SetF(dash.Angle,true);  
                if(dash.NowDis>200){
                    if(data.i[0]!=1){
                        if(data.i[1]==0){   
                            mj.Life(0.5);
                            data.i[1]=1;
                            if(data.i[3]==2){ 
                                u.Pause(false);  
                            }
                        }
                    }
                }
                if(dash.Speed<5){
                    mj.Anime("death");
                }else{
                    if(data.i[2]==0){
                        data.i[2]=1;
                        Units.MJ(u.player.player,'e008','A02D',0,dash.X,dash.Y,GetRandomReal(0,360),1,1,1, "stand","dg4.mdl").SetH(75);
                    }else{
                        data.i[2]-=1;
                    }
                }
                if(data.i[0]==1&&dash.Speed<1.5){
                    dash.Stop();
                }else{
                    GroupEnumUnitsInRange(tmp_group,x,y,150,function GroupIsAliveNotAloc);     
                    while(FirstOfGroup(tmp_group)!=null){
                        mj=Units.Get(FirstOfGroup(tmp_group));
                        GroupRemoveUnit(tmp_group,mj.unit);
                        if(IsUnitEnemy(mj.unit,u.player.player)==true){ 
                            if(IsUnitInGroup(mj.unit,data.g[0])==false){
                                GroupAddUnit(data.g[0],mj.unit);
                                u.Damage(mj.unit,Damage.Physics,'A02D',u.Agi(true)*3);
                                Effect.ToUnit("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",mj.unit, "chest").Destroy();
                                Dash.Start(mj.unit,dash.Angle,400-dash.NowDis,Dash.SUB,45,true,true);
                                Buffs.Add(mj.unit,'A02G','B00F',3,false).Type=Buffs.TYPE_SUB+Buffs.TYPE_DISPEL_TRUE;
                            }
                        }
                    }
                    GroupClear(tmp_group);   
                }

            };
            dash.onEnd=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units.Get(dash.Unit);  
                Units mj=Units(data.c[1]);
                if(data.i[0]==1||(data.i[0]!=1&&data.i[1]==0)){  
                    u.AnimeSpeed(1);
                    if(data.i[3]==2){ 
                        u.Pause(false);  
                    }
                }
                mj.Life(0.5);
                mj.Anime("death");
                DestroyGroup(data.g[0]);
                data.g[0]=null;
                data.Destroy();
            };
        }
        //伤害触发刀光冲击
        static method W3(DamageArgs e){
            Buffs b;
            if(e.DamageUnit.IsAbility('B00E')==true&&e.DamageType==Damage.Attack){
                b=Buffs.Find(e.DamageUnit.unit,'B00E'); 
                if(b.NowTime<4.990){ 
                    TR.W2(e.DamageUnit.unit,Util.XY(e.DamageUnit.unit,e.TriggerUnit.unit),b.Level,1);
                    b.Level-=1;
                    if(b.Level<=0){
                        b.Stop();
                    } 
                }                
            }
        }
        //命令触发刀光冲击
        static method W1(EventArgs e){ 
            Units u=Units.Get(e.TriggerUnit);
            real f;
            Buffs b; 
            Units mj;
            if(u.IsAbility('B00E')==true){//刀光冲击
                if(e.OrderId==851983||e.OrderId==851986||e.OrderId==851971){
                    if(e.OrderTargetUnit==null){ 
                        f=Util.XYEX(u.X(),u.Y(),e.OrderTargetX,e.OrderTargetY);
                    }else{
                        f=Util.XY(u.unit,e.OrderTargetUnit);
                    }
                    b=Buffs.Find(u.unit,'B00E'); 
                    if(b.NowTime<4.990){ 
                        TR.W2(u.unit,f,b.Level,2);
                        b.Level-=1;
                        if(b.Level<=0){
                            b.Stop();
                        } 
                    }
                }  
            }
            if(e.OrderId==851971&&u.IsAbility('A02F')==true&&u.player.lv15!=null){
                //四方斩残影
                if(e.OrderTargetUnit==null){ 
                    GroupEnumUnitsInRange(tmp_group,e.OrderTargetX,e.OrderTargetY,150,function GroupIsAliveAloc);  
                }else{
                    GroupEnumUnitsInRange(tmp_group,GetUnitX(e.OrderTargetUnit),GetUnitY(e.OrderTargetUnit),150,function GroupIsAliveAloc);  
                }
                while(FirstOfGroup(tmp_group)!=null){
                    mj=Units.Get(FirstOfGroup(tmp_group));
                    GroupRemoveUnit(tmp_group,mj.unit);
                    if(mj.aid=='A02F'&&mj.aidindex==115){ 
                        u.Position(mj.X(),mj.Y(),false);
                        mj.Obj=-1;
                        mj.aidindex=0;  
                    }
                }
                GroupClear(tmp_group);                   
            }
        }
        //获得刀光BUFF
        static method W(Spell e){ 
            Units u=Units.Get(e.Spell);
            timer t=NewTimer();
            Buffs b;
            u.Pause(true);
            u.Pause(false);
            //删除咆哮BUFF
            SetTimerData(t,u);
            TimerStart(t,0,false,function(){
                Units u=Units(GetTimerData(GetExpiredTimer())); 
                if(u.IsAbility('Broa')==true){
                    u.RemoveAbility('Broa');
                }
                ReleaseTimer(GetExpiredTimer());
            });
            t=null;
            b=Buffs.Add(u.unit,'A02E','B00E',5,false);
            b.Level=4;
            b.Obj=e;
            b.onEnd=function(Buffs b){
                Spell(b.Obj).Destroy();
            };
        }

        static method Q(Spell e){
            Units u=Units.Get(e.Spell);
            Data data=Data.create('A02C');
            Dash dash;
            u.Pause(true);
            u.Pause(false);
            data.c[0]=u;
            data.c[1]=e;
            data.i[0]=0;
            Units.MJ(u.player.player,'e008','A02C',0,u.X(),u.Y(),u.F(),1,1,1.5, "stand","dust2.mdl"); 
            dash=Dash.Start(u.unit,u.F(),400,Dash.SUB,30,true,false);
            dash.Obj=data;
            dash.onMove=function(Dash dash){ 
                Data data=Data(dash.Obj);
                Units u=Units(data.c[0]);
                unit k;
                if(data.i[0]==0){ 
                    k=GroupFind(u.unit,dash.X,dash.Y,110,true,false);
                    if(k!=null){
                        data.i[0]=1;
                        if((dash.MaxDis-dash.NowDis)>150){
                            dash.MaxDis-=150;
                        }
                        k=null;
                    }
                }
                if(dash.Speed>7){
                    Effect.To("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl",dash.X,dash.Y).Destroy();
                }
            };
            dash.onEnd=function(Dash dash){
                Data data=Data(dash.Obj);
                Spell(data.c[1]).Destroy();
                data.Destroy();
            };
        }


        static method onInit(){
            Spell.On(Spell.onSpell,'A02C',TR.Q);
            Spell.On(Spell.onSpell,'A02D',TR.W);
            Spell.On(Spell.onSpell,'A02F',TR.E);
            Events.On(Events.onUnitOrderToUnit,TR.W1);
            Events.On(Events.onUnitOrderToLocation,TR.W1);
            Damage.On(Damage.onUnitDamage,TR.W3);
        }
    }
}