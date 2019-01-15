library TR requires Groups{
    //英雄‘桐人’的技能
    //R级

    struct TR{

        static string XBM[];//星爆特效路径
        
        //星爆最后一下终结 
        static method R3(Units u,Units m){ 
            Dash dash;
            real f=Util.XY(u.unit,m.unit);
            timer t=NewTimer();
            u.Pause(true);
            u.AnimeId(3);
            u.AddAbility('A02M');
            u.AnimeSpeed(0.5);
            u.SetF(f,true);
            Effect.ToUnit("supershinythingy.mdl",u.unit,"weapon").Destroy();
            dash=Dash.Start(u.unit,f+180,250,Dash.SUB,25,true,false);
            dash.Obj=0;
            dash.onMove=function(Dash dash){
                if(dash.Speed>20){ 
                    Effect.To("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl",dash.X,dash.Y).Destroy();
                } 
            }; 
            SetTimerData(t,u);
            TimerStart(t,0.6,true,function(){//终结刺击！
                Data data;
                Units u=Units(GetTimerData(GetExpiredTimer()));
                Dash dash;
                Units mj;
                real x=u.X(),y=u.Y(),f=u.F();
                ReleaseTimer(GetExpiredTimer());
                if(u.Alive()==true){
                    u.AnimeId(6);
                    u.AnimeSpeed(0.8);
                    u.DelayAlpha(0,255,0.3); 
                    Util.Duang(x,y,0.4,250,250,-220,0.02,50); 
                    Units.MJ(u.player.player,'e008','A02D',0,x,y,f,1,0.75,1.1, "stand","cf2.mdl").SetH(75);
                    mj=Units.MJ(u.player.player,'e008','A02J',0,x,y,f,2,1,2, "birth","dg.mdl");//birth dg.mdx stand blue-daoguang-new.mdl
                    mj.SetH(100);   
                    data=Data.create('A02J');
                    data.c[0]=u;
                    data.c[1]=mj;
                    data.i[0]=0;
                    data.r[0]=f;
                    data.g[0]=CreateGroup();
                    dash=Dash.Start(u.unit,f,1000,Dash.SUB,60,true,false);
                    dash.Obj=data;
                    dash.onMove=function(Dash dash){
                        Data data=Data(dash.Obj);
                        Units u=Units(data.c[0]);
                        Units mj=Units(data.c[1]); 
                        real f;
                        Effect ef;
                        mj.Position(dash.X,dash.Y,false);
                        mj.SetF(dash.Angle,true);
                        u.SetF(dash.Angle,true);
                        if(dash.Speed>7.5){ 
                            if(data.i[0]==0){ 
                                data.i[0]=1;
                                data.r[0]=GetRandomReal(0,360);
                                
                                mj=Units.MJ(u.player.player,'e008','A02J',0,dash.X+5*CosBJ(data.r[0]),dash.Y+5*SinBJ(data.r[0]),0,1,1,1.5, "attack","ls tong ren.mdl");   
                                mj.AnimeId(5);
                                mj.AnimeSpeed(2); 
                                mj.Color(u.color_alpha,u.color_alpha,u.color_alpha);
                                mj.DelayAlpha(255,0,0.9);  
                                Units.MJ(u.player.player,'e008','A02J',0,dash.X,dash.Y,GetRandomReal(0,360),1,1,1, "stand","dg4.mdl").SetH(75);
                                dash=Dash.Start(mj.unit,Util.XY(u.unit,mj.unit),170,Dash.SUB,8,true,false);
                                dash.Obj=u;
                                dash.onMove=function(Dash dash){
                                    Units u=Units(dash.Obj);
                                    Units m=Units.Get(dash.Unit);
                                    m.SetF(Util.XY(m.unit,u.unit),false); 
                                    if(dash.Speed>2&&dash.Speed<2.2){
                                        Units.MJ(u.player.player,'e008','A02J',0,dash.X,dash.Y,dash.Angle,1,0.75,2, "birth","az_dg01.mdl");
                                    }
                                };
                                dash.onEnd=function(Dash dash){
                                    Units u=Units.Get(dash.Unit); 
                                    u.AnimeSpeed(0);
                                };
                            }else{
                                data.i[0]-=1;
                            }
                        }  
                        
                        GroupEnumUnitsInRange(tmp_group,dash.X,dash.Y,175,function GroupIsAliveNotAloc);     
                        while(FirstOfGroup(tmp_group)!=null){
                            mj=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,mj.unit);
                            if(IsUnitEnemy(mj.unit,u.player.player)==true){ 
                                if(IsUnitInGroup(mj.unit,data.g[0])==false){
                                    GroupAddUnit(data.g[0],mj.unit);
                                    u.Damage(mj.unit,Damage.Chaos,'A02J',u.Agi(true)*5.0);
                                    Effect.ToUnit("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",mj.unit, "chest").Destroy();
                                    ef=Effect.ToUnit("dg4.mdl",mj.unit, "chest");
                                    ef.Size(2);
                                    ef.Destroy();
                                    Dash.Start(mj.unit,dash.Angle,250,Dash.SUB,45,true,true);
                                     
                                }
                            }
                        }
                        GroupClear(tmp_group);  
                    };
                    dash.onEnd=function(Dash dash){
                        Data data=Data(dash.Obj);
                        Units u=Units.Get(dash.Unit);  
                        u.AnimeSpeed(1);
                        u.Alpha(255);
                        u.Pause(false);   
                        u.RemoveAbility('A02M');
                        DestroyGroup(data.g[0]);
                        data.g[0]=null;
                        data.Destroy();
                    };
                }else{
                    u.Pause(false);
                    u.AnimeSpeed(1);
                    u.RemoveAbility('A02M');
                }
            });
            t=null;
        }
        //星爆状态打到人了 3,5
        static method R2(unit ua,unit ma){
            Units u=Units.Get(ua);
            Units m=Units.Get(ma);
            Buffs b=Buffs.Find(u.unit,'B00H');
            Data data=Data(b.Obj);
            Units mj;
            Units tmp;
            real f=Util.XY(u.unit,m.unit),x=u.X(),y=u.Y();
            real f1=GetRandomReal(0,360);
            integer anime,i;
            if(data.i[0]==0){
                data.i[0]=1;
                anime=3;
            }else if(data.i[0]==1){
                data.i[0]=2;
                anime=5;
            }else{
                data.i[0]=0;
                anime=6;
            }  
            if(GameTime>data.r[4]){//连击时间限制
                data.i[4]=0;//连击中断 
            } 
            data.r[4]=GameTime+0.2;//连击限制
            data.i[4]+=1;
            TextAngle(u.unit,I2S(data.i[4])+"Hits!",0.4,10,90);
            Dash.Start(u.unit,f,30,Dash.SUB,5,true,false);
            Dash.Start(m.unit,f,30,Dash.SUB,5,true,true);  
            mj=Units.MJ(u.player.player,'e008','A02J',0,x,y,f,1,1,1.5, "attack","ls tong ren.mdl");   
            mj.AnimeId(anime);
            mj.AnimeSpeed(2.5);
            mj.DelayAnimeSpeed(0,0.3); 
            mj.DelayAlpha(255,0,0.9);  
            if(anime==5){//左边
                Units.MJ(u.player.player,'e00D','A02J',0,x,y,f+180,5,1,1,"stand",XBM[GetRandomInt(0,1)]).SetH(100);
            }else if(anime==3){//右边
                Units.MJ(u.player.player,'e008','A02J',0,x,y,f,5,1,1,"stand",XBM[GetRandomInt(0,1)]);
            }else{//前方
                Units.MJ(u.player.player,'e00B','A02J',0,x,y,f+90,5,1,0.5,"stand","tk knockin' on heaven's door by deckai_nomore.mdl");
            } 
            //Units.MJ(u.player.player,'e00B','A02J',0,x,y,GetRandomReal(0,360),1,2,2, "stand","Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl").SetH(50);
            Units.MJ(u.player.player,'e008','A02J',0,m.X(),m.Y(),GetRandomReal(0,360),1,3,2, "stand","dg4.mdl").SetH(75);
            Effect.ToUnit("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",m.unit, "chest").Destroy();
            mj=Units.MJ(u.player.player,'e008','A02J',0,m.X(),m.Y(),f+GetRandomReal(-45,45),2,1,1,"stand", "blood-2.mdl");
            mj.DelayAlpha(255,0,1.99);
            Units.MJ(u.player.player,'e008','A02J',0,x,y,0,1,0.75,1.25, "stand","white-qiquan.mdl"); 
            if(b.Level==10){
                data.r[4]+=0.3;
                mj=Units.MJ(u.player.player,'e009','A02J',0,x,y,f,2,2.5,2, "stand","wind.mdx");
                mj.SetH(200); 
                Dash.Start(mj.unit,f+180,450,Dash.SUB,60,true,false);   
                Dash.Start(u.unit,f,150,Dash.NORMAL,25,true,false).onMove=function(Dash dash){
                    IssueImmediateOrder(dash.Unit,"stop");
                };        
                //Util.Duang(x,y,0.4,115,115,-520,0.02,50); 
                Units.MJ(u.player.player,'e008','A02J',0,m.X(),m.Y(),GetRandomReal(0,360),2,1.5,1, "stand","blue-daoguang-new.mdl").SetH(150);
                GroupEnumUnitsInRange(tmp_group,x,y,350,function GroupIsAliveNotAloc);     
                while(FirstOfGroup(tmp_group)!=null){
                    tmp=Units.Get(FirstOfGroup(tmp_group));
                    GroupRemoveUnit(tmp_group,tmp.unit);
                    if(IsUnitEnemy(tmp.unit,u.player.player)==true&&tmp.unit!=m.unit){   
                        Dash.Start(tmp.unit,Util.XY(u.unit,tmp.unit),300,Dash.SUB,25,true,false);  
                    }
                }
                GroupClear(tmp_group);               
            } 
            if(b.Level<10){
                //Util.Duang(m.X(),m.Y(),0.4,115,115,-160,0.02,50); 
                for(0<=i<2){
                    mj=Units.MJ(u.player.player,'e008','A02J',0,m.X(),m.Y(),f+180+GetRandomReal(-45,45),2,1,1,"stand", ".mdl");
                    Dash.Start(mj.unit,mj.F(),800,Dash.SUB,GetRandomReal(50,75),true,false).onMove=function(Dash dash){
                        if(dash.Speed>5&&dash.Obj>=3){
                            dash.Obj=0;
                            Effect.To("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl",dash.X,dash.Y).Destroy();
                        }
                        dash.Obj+=1;
                    };
                }
            }
            Units.MJ(u.player.player,'e008','A02J',0,x,y,f+30,1,1.15,2, "birth","az_dg01.mdl");
            Units.MJ(u.player.player,'e008','A02J',0,x,y,f-30,1,1.15,2, "birth","az_dg01.mdl"); 
            GroupEnumUnitsInRange(tmp_group,x,y,350,function GroupIsAliveNotAloc);     
            while(FirstOfGroup(tmp_group)!=null){
                tmp=Units.Get(FirstOfGroup(tmp_group));
                GroupRemoveUnit(tmp_group,tmp.unit);
                if(IsUnitEnemy(tmp.unit,u.player.player)==true){ 
                    if(Util.FAN(u.unit,tmp.unit,f,80)==true){ 
                        u.Damage(tmp.unit,Damage.Physics,'A02J',u.Agi(true)*1.25);
                        Effect.ToUnit("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",tmp.unit, "chest").Destroy();
                        Units.MJ(u.player.player,'e008','A02J',0,tmp.X(),tmp.Y(),GetRandomReal(0,360),1,1,2, "stand","dg4.mdl").SetH(75);   
                        Dash.Start(tmp.unit,f,30,Dash.SUB,5,true,false); 
                    }
                }
            }
            GroupClear(tmp_group);  
            if(b.Level==1&&data.i[4]==16){  
                TR.R3(u,m);
            }
        }

        //星爆状态开始攻击
        static method R1(EventArgs e){
            Units u=Units.Get(e.AttackUnit); 
            if(u.IsAbility('B00H')==true){
                u.Alpha(0);
                Buffs.Add(u.unit,'A02L','B00I',0.05,false).onEnd=function(Buffs b){
                    Units u=Units.Get(b.Unit);
                    u.Alpha(255);
                };
            }
        }
        //开启星爆
        static method R(Spell e){
            Units u=Units.Get(e.Spell);
            Buffs b;
            Data data=Data.create('A02J');
            timer t=NewTimer();
            SetTimerData(t,u);
            TimerStart(t,0,false,function(){
                Units u=Units(GetTimerData(GetExpiredTimer())); 
                if(u.IsAbility('Bbsk')==true){ 
                    u.RemoveAbility('Bbsk');
                }
                ReleaseTimer(GetExpiredTimer());
            });
            t=null;
            Units.MJ(u.player.player,'e008','A02J',0,u.X(),u.Y(),0,3,1,1, "stand","boom.mdl").SetH(100); 
            Units.MJ(u.player.player,'e008','A02J',0,u.X(),u.Y(),0,1,1.15,1.25, "stand","white-qiquan.mdl"); 
            Units.MJ(u.player.player,'e008','A02J',0,u.X(),u.Y(),0,1,2.5,1, "stand","by_wood_gongchengsipai_2.mdl");
            
            data.c[0]=u;
            data.c[1]=e;
            data.i[0]=0;
            data.r[0]=GetUnitState(u.unit, ConvertUnitState(0x25))-0.1; //0.1 
            SetUnitState(u.unit, ConvertUnitState(0x25),GetUnitState(u.unit, ConvertUnitState(0x25)) - data.r[0] );
            b=Buffs.Add(u.unit,'A02K','B00H',10,false);
            b.Level=16;
            b.Obj=data;
            b.onEnd=function(Buffs b){ 
                Data data=Data(b.Obj);
                Units u=Units(data.c[0]); 
                SetUnitState(u.unit, ConvertUnitState(0x25),GetUnitState(u.unit, ConvertUnitState(0x25)) + data.r[0] );
                Spell(data.c[1]).Destroy(); 
                data.Destroy();
            };
        }


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
                        //mj.DelayAlpha(255,155,0.5);
                        mj.AnimeId(5);
                        data.c[0]=mj;
                        dash=Dash.Start(mj.unit,f,600,Dash.PWX,50,true,false);
                        mj=Units.MJ(u.player.player,'e00D','A02F',0,x,y,f+180,666,0.7,1,"stand", "tk knockin' on heaven's door by deckai_darkblue.mdl");
                        mj.SetH(100);
                        mj.AnimeSpeed(0);
                        data.c[1]=mj;
                        /*mj=Units.MJ(u.player.player,'e00D','A02F',0,x,y,f+180,666,0.7,1.5,"stand", "tk knockin' on heaven's door by deckai.mdl");
                        mj.SetH(100);
                        mj.AnimeSpeed(0);
                        data.c[2]=mj;*/
                        data.g[0]=CreateGroup();
                        dash.Obj=data;
                        dash.onMove=function(Dash dash){
                            Data data=Data(dash.Obj);
                            Units mj=Units(data.c[0]);
                            Units dg=Units(data.c[1]);
                            real f;
                            //Units dgs=Units(data.c[2]);
                            Units tmp;
                            if(dash.NowDis>50){ 
                                dash.Angle+=6; //+2
                                dg.AnimeSpeed(0.75);
                                //dgs.AnimeSpeed(2);
                            }
                            if(dash.NowDis>500&&dash.NowDis<530){ 
                                mj.Position(dash.X,dash.Y,true);
                            }
                            mj.SetF(dash.Angle,true);
                            dg.Position(dash.X,dash.Y,false);
                            dg.SetF(dash.Angle+90,true);
                            /*dgs.Position(dash.X,dash.Y,false);
                            dgs.SetF(dash.Angle,true);*/
                            f=Util.XYEX(dash.X,dash.Y,dash.X+100*CosBJ(dash.Angle),dash.Y+100*SinBJ(dash.Angle));
                            GroupEnumUnitsInRange(tmp_group,dash.X,dash.Y,300,function GroupIsAliveNotAloc);     
                            while(FirstOfGroup(tmp_group)!=null){
                                tmp=Units.Get(FirstOfGroup(tmp_group));
                                GroupRemoveUnit(tmp_group,tmp.unit);
                                if(IsUnitEnemy(tmp.unit,mj.player.player)==true){ 
                                    if(Util.FAN(mj.unit,tmp.unit,f,80)==true||dash.NowDis<50){ 
                                        if(IsUnitInGroup(tmp.unit,data.g[0])==false){
                                            GroupAddUnit(data.g[0],tmp.unit);
                                            mj.Damage(tmp.unit,Damage.Physics,'A02F',mj.Agi(true)*5);
                                            Effect.ToUnit("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",tmp.unit, "chest").Destroy();
                                        }
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
                            mj.PositionEnabled(false);
                            mj.Position(dash.X,dash.Y,true); 
                            if(mj.Data()!=-1){
                                t=NewTimer();
                                mj.SetData(100);
                                SetTimerData(t,mj);
                                TimerStart(t,0.05,true,function(){
                                    Units u=Units(GetTimerData(GetExpiredTimer()));
                                    if(u.Data()==-1){ 
                                        ReleaseTimer(GetExpiredTimer());
                                        u.AnimeId(4);
                                        u.AnimeSpeed(1);
                                        u.DelayAlpha(255,0,0.2);
                                        u.Life(0.4);
                                    }else{
                                        u.SetData(u.Data()-1);
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
                            //Units(data.c[2]).Life(5);
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
            if(tp>=2){ 
                u.Pause(true);
                if(tp!=3){ 
                    IssueImmediateOrder(u.unit,"stop");
                }
            }
            u.AnimeId(2);
            if(i==1){  
                u.AnimeSpeed(2.4);
            }else{ 
                u.AnimeSpeed(3);
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
                            if(data.i[3]>=2){ 
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
                    GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),150,function GroupIsAliveNotAloc);     
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
                    if(data.i[3]>=2){ 
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
            /*普攻触发刀光冲击，暂时取消了
            if(e.DamageUnit.IsAbility('B00E')==true&&e.DamageType==Damage.Attack){
                b=Buffs.Find(e.DamageUnit.unit,'B00E'); 
                if(b.NowTime<4.990){ 
                    TR.W2(e.DamageUnit.unit,Util.XY(e.DamageUnit.unit,e.TriggerUnit.unit),b.Level,1);
                    b.Level-=1;
                    if(b.Level<=0){
                        b.Stop();
                    } 
                }     
            }*/
            if(e.DamageUnit.IsAbility('B00H')==true&&e.DamageType==Damage.Attack){
                if(e.DamageUnit.IsAbility('B00I')==true){
                    b=Buffs.Find(e.DamageUnit.unit,'B00H');
                    TR.R2(e.DamageUnit.unit,e.TriggerUnit.unit);
                    b.Level-=1;
                    if(b.Level<=0){
                        b.Stop();
                        Buffs.Find(e.DamageUnit.unit,'B00I').Stop();
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
            
            if(u.IsAbility('B00E')==true&&u.IsAbility('B00G')==false){//刀光冲击
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
            if((e.OrderId==851983||e.OrderId==851986||e.OrderId==851971)&&u.IsAbility('A02F')==true&&u.player.lv15!=null){
                //四方斩残影
                if(e.OrderTargetUnit==null){ 
                    GroupEnumUnitsInRange(tmp_group,e.OrderTargetX,e.OrderTargetY,200,function GroupIsAliveAloc);  
                }else{
                    GroupEnumUnitsInRange(tmp_group,GetUnitX(e.OrderTargetUnit),GetUnitY(e.OrderTargetUnit),200,function GroupIsAliveAloc);  
                }
                while(FirstOfGroup(tmp_group)!=null){
                    mj=Units.Get(FirstOfGroup(tmp_group));
                    GroupRemoveUnit(tmp_group,mj.unit);
                    if(mj.aid=='A02F'&&mj.aidindex==115){ 
                        u.Position(mj.X(),mj.Y(),false);
                        mj.SetData(-1);
                        mj.aidindex=0;  
                        break;
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
            u.AddAbility('A02H');
            b=Buffs.Add(u.unit,'A02E','B00E',5,false);
            b.Level=4;
            b.Obj=e;
            b.onEnd=function(Buffs b){
                timer t=NewTimer();
                Spell(b.Obj).Destroy();
                SetTimerData(t,Units.Get(b.Unit));
                TimerStart(t,0.1,false,function(){
                    Units(GetTimerData(GetExpiredTimer())).RemoveAbility('A02H');
                    ReleaseTimer(GetExpiredTimer());
                });
                t=null;
            };
        }

        static method Q(Spell e){
            Units u=Units.Get(e.Spell);
            Data data=Data.create('A02C');
            Dash dash;
            Buffs.Add(u.unit,'A02I','B00G',0.03,false);
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
            XBM[0]="tk knockin' on heaven's door by deckai_darkblue_nomore.mdl";
            XBM[1]="tk knockin' on heaven's door by deckai_nomore.mdl";
            Spell.On(Spell.onSpell,'A02C',TR.Q);
            Spell.On(Spell.onSpell,'A02D',TR.W);
            Spell.On(Spell.onSpell,'A02F',TR.E);
            Spell.On(Spell.onSpell,'A02J',TR.R);
            Events.On(Events.onUnitOrderToUnit,TR.W1);
            Events.On(Events.onUnitOrderToLocation,TR.W1);
            Damage.On(Damage.onUnitDamage,TR.W3);
            Events.On(Events.onUnitAttack,TR.R1);
        }
    }
}