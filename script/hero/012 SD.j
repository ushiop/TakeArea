library SD requires Groups{
    //英雄‘水门’的技能
    //SSR
    struct SD{

        
        static integer Q_Sound;

        static method AI(unit ua){
            Units u=Units.Get(ua);
            if(u.player.isai==true){
                Units.Kill(u.unit);
            }else{
                DisplayTextToPlayer(u.player.player,0,0,"抱歉~！这个英雄不支持电脑托管,已自动取消托管模式");
                u.player.pcmode=false;
                u.Position(u.X(),u.Y(),true);
            }
        }

        //友军标记
        static method Spawn(Units u,Units m){
            Data data;
            if(u.IsAbility('A03I')==true){
                u.ai=SD.AI;
                data=Data.create('A03I');
                data.c[0]=u;
                data.u[0]=null;//W-苦无需求
                data.r[0]=0;//上友军BUFF的间隔
                Buffs.Add(u.unit,'A03L','B00T',86400,false).Level=2;
                Timers.Start(0.01,data,function(Timers t){
                    Data data=Data(t.Data());
                    Units u=Units(data.c[0]);
                    Units mj;
                    integer x;
                    if(u.Alive()==false){
                        //BJDebugMsg("结束了-4D");
                        for(0<=x<4){
                            if(data.u[x]!=null){
                                Units.Remove(data.u[x]);
                                data.u[x]=null;
                            }
                        }
                        t.Destroy();
                        data.Destroy();
                    }else{
                        if(data.r[0]<=0){//友军标记 上BUFF
                            data.r[0]=1; 
                            GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),9999999999,function GroupIsAliveNotAloc);     
                            while(FirstOfGroup(tmp_group)!=null){
                                mj=Units.Get(FirstOfGroup(tmp_group));
                                GroupRemoveUnit(tmp_group,mj.unit);
                                if(mj.unit!=u.unit&&mj.isHero==true&&IsUnitAlly(mj.unit,u.player.player)==true){
                                    Buffs.Add(mj.unit,'A03J','B00S',86400,false);
                                }
                            }  
                            GroupClear(tmp_group);  
                        }else{
                            data.r[0]-=0.01;
                        } 
                        if(u.IsAbility('B00T')==true){//放置苦无 需求
                            if(data.u[0]==null){
                                data.u[0]=Units.MJ(u.player.player,'e00I','A03I',5,0,0,0,86400,1,1, "stand",".mdx").unit; 
                            }
                        }else{
                            if(data.u[0]!=null){
                                Units.Remove(data.u[0]); 
                                data.u[0]=null;
                            }
                        }
                        if(u.IsAbility('B00W')==true){//二段 需求
                            if(data.u[1]==null){
                                data.u[1]=Units.MJ(u.player.player,'e00J','A03I',5,0,0,0,86400,1,1, "stand",".mdx").unit; 
                            }
                        }else{
                            if(data.u[1]!=null){
                                Units.Remove(data.u[1]); 
                                data.u[1]=null;
                            }
                        }
                    }
                });
            }  
        }
 
        static method W(Spell e){
            Units u=Units.Get(e.Spell);
            Buffs b;
            Units mj;
            Dash dash;
            Data data;
            if(u.IsAbility('B00T')==true){
                b=Buffs.Find(u.unit,'B00T');
                b.Level-=1;
                if(b.Level<1){
                    b.Stop();
                }
                mj=Units.MJ(u.player.player,'e008','A03K',0,u.X()+75*CosBJ(u.F()),u.Y()+75*SinBJ(u.F()),e.Angle-90,86400,1.5,1, "stand","fls_kw_ex.mdl"); 
                mj.Position(mj.X(),mj.Y(),true);
                mj.AddAbility(Units.MJType_FZW);
                if(e.State==e.SpellState){ 
                    mj.AddAbility(Units.MJType_TSW);
                    mj.AddAbility('A03Y');
                    mj.SetData(1);
                    mj.SetH(100);
                    mj.Anime("one");
                    data=Data.create('A03K');
                    data.c[0]=u;
                    data.g[0]=CreateGroup();
                    dash=Dash.Start(mj.unit,e.Angle,1600,Dash.SUB,30,true,false);
                    dash.Obj=data;
                    dash.onMove=function(Dash dash){
                        Data data=Data(dash.Obj);
                        Units u=Units.Get(dash.Unit);
                        Units mj;
                        if(u.Data()==4){
                            dash.Stop();
                        }else{
                            u.SetH(200*(1-(dash.NowDis/dash.MaxDis)));
                            GroupEnumUnitsInRange(tmp_group,dash.X,dash.Y,100,function GroupIsAliveNotAloc);     
                            while(FirstOfGroup(tmp_group)!=null){
                                mj=Units.Get(FirstOfGroup(tmp_group));
                                GroupRemoveUnit(tmp_group,mj.unit);
                                if(IsUnitEnemy(mj.unit,u.player.player)==true&&IsUnitInGroup(mj.unit,data.g[0])==false){
                                    GroupAddUnit(data.g[0],mj.unit);   
                                    u.Damage(mj.unit,Damage.Physics,'A03K',3.0*u.Agi(true));     
                                    Effect.ToUnit("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",mj.unit,"chest").Destroy();
                                }
                            }  
                            GroupClear(tmp_group); 
                        }
                    };
                    dash.onEnd=function(Dash dash){
                        Data data=Data(dash.Obj);
                        Units u=Units.Get(dash.Unit);
                        DestroyGroup(data.g[0]);
                        data.g[0]=null;
                        data.Destroy();
                        if(u.Data()==4){ 
                            Units.Remove(u.unit);
                        }else{ 
                            Units.MJ(u.player.player,'e008','A03K',0,dash.X,dash.Y,GetRandomReal(0,360),4,1,1, "stand","y_blinkcaster.mdl");
                            //BJDebugMsg("没触发，掉地上了");
                            u.RemoveAbility(Units.MJType_TSW);
                            u.RemoveAbility('A03Y');
                            u.Anime("stand");
                            u.SetData(0);
                            u.SetH(0);
                        }
                    };
                }else{
                    u.Pause(true);
                    u.SetF(u.F(),true);
                    u.FlushAnimeId(8);
                    u.AnimeSpeed(0.6);  
                    u.DelayReleaseAnimePause(0.5);
                }
            }
            e.Destroy();
        }

        //5 前摇  6 平地前推  12 旋转前推  13 输出抖动  14 反冲
        static method E(Spell e){
            Units u=Units.Get(e.Spell);
            Data data=Data.create('A03M');
            Units mj;
            u.Pause(true); 
            u.FlushAnimeId(13);
            u.SetF(u.F(),true);
            u.PositionEnabled(false);
            if(u.IsAbility('B00V')==true){
                Buffs.Find(u.unit,'B00V').Stop();
            }
            data.c[0]=u;
            data.c[1]=e;
            data.i[0]=0;//技能阶段
            data.r[0]=0.3;//输出时间  
            mj=Units.MJ(u.player.player,'e008','A03M',0,u.X()+150*CosBJ(u.F()),u.Y()+150*SinBJ(u.F()),u.F(),5,4,3, "stand","t_lxw.mdl"); 
            mj.SetH(120);
            
            data.c[2]=mj;
            mj=Units.MJ(u.player.player,'e008','A03M',0,mj.X(),mj.Y(),mj.F()+90,5,1,2, "stand","az_airfloww12_ex.mdl"); 
            mj.SetH(150);
            data.c[3]=mj;
            Timers.Start(0.06,data,function(Timers t){
                Data data=Data(t.Data());
                Units u=Units(data.c[0]);
                Units mj; 
                real x,y; 
                Dash dash;
                if(u.Alive()==false){
                    data.i[0]=-1;
                }else{ 
                    if(data.r[0]<=0){
                        data.i[0]=-1; 
                        mj=Units(data.c[3]); 
                        mj.DelayAlpha(255,0,0.3);
                        mj.Life(0.35);
                        u.AnimeId(14);  
                        u.PositionEnabled(true);
                        Dash.Start(u.unit,u.F()+180,200,Dash.SUB,10,true,false);
                        u.DelayReleaseAnimePause(0.3);
                        mj=Units.MJ(u.player.player,'e009','A03M',0,u.X(),u.Y(),u.F()+180,2,2,1.5, "stand","wind.mdx");
                        mj.SetH(200);
                        Dash.Start(mj.unit,mj.F(),200,Dash.SUB,15,true,false);
                        mj=Units(data.c[2]);
                        mj.Anime("stand");  
                        mj.DelaySizeEx(3,1,0.3);
                        mj.Position(mj.X(),mj.Y(),true);
                        mj.AddAbility(Units.MJType_TSW);
                        dash=Dash.Start(mj.unit,mj.F(),600,Dash.SUB,25,true,false);
                        dash.Obj=6;
                        dash.onMove=function(Dash dash){
                            Units u=Units.Get(dash.Unit); 
                            Units mj;
                            if(dash.Obj<=0){
                                dash.Obj=6;
                                Units.MJ(u.player.player,'e008','A03M',0,dash.X,dash.Y,GetRandomReal(0,360),2,1,GetRandomReal(0.5,2), "stand","BlinkCaster.mdl");
                                Units.MJ(u.player.player,'e008','A03M',0,dash.X,dash.Y,GetRandomReal(0,360),2,0.4,1, "stand","white-qiquan.mdl");
                                 
                            }else{
                                dash.Obj-=1;
                            }
                            if(dash.Speed<3){
                                dash.Stop();
                            }else{
                                GroupEnumUnitsInRange(tmp_group,dash.X,dash.Y,150,function GroupIsAliveNotAloc);     
                                while(FirstOfGroup(tmp_group)!=null){
                                    mj=Units.Get(FirstOfGroup(tmp_group));
                                    GroupRemoveUnit(tmp_group,mj.unit);
                                    if(IsUnitEnemy(mj.unit,u.player.player)==true){   
                                        mj.Position(dash.X,dash.Y,true);           
                                    }
                                }  
                                GroupClear(tmp_group); 
                            }

                        };
                        dash.onEnd=function(Dash dash){
                            Units u=Units.Get(dash.Unit);
                            Units mj;
                            u.Life(0.5);
                            u.Anime("death");
                            
                            Units.MJ(u.player.player,'e008','A03M',0,dash.X,dash.Y,0,2,2,1, "stand","boom1.mdl").SetH(150);
                            Units.MJ(u.player.player,'e008','A03M',0,dash.X,dash.Y,0,2,1,1, "stand","by_wood_effect_yuanbanlin_sand2.mdl").SetH(100);
                            Util.Duang(dash.X,dash.Y,0.8,250,250,-128,0.02,50);
                            GroupEnumUnitsInRange(tmp_group,dash.X,dash.Y,250,function GroupIsAliveNotAloc);     
                            while(FirstOfGroup(tmp_group)!=null){
                                mj=Units.Get(FirstOfGroup(tmp_group));
                                GroupRemoveUnit(tmp_group,mj.unit);
                                if(IsUnitEnemy(mj.unit,u.player.player)==true){    
                                    u.Damage(mj.unit,Damage.Magic,'A03M',u.Agi(true)*10.0);        
                                }
                            }  
                            GroupClear(tmp_group); 
                        };
                    }else{ 
                        data.r[0]-=0.06;
                        x=Units(data.c[2]).X();
                        y=Units(data.c[2]).Y();  
                        //Units(data.c[2]).Anime("birth");
                        Units.MJ(u.player.player,'e008','A03M',0,x,y,GetRandomReal(0,360),2,1,GetRandomReal(0.5,2), "stand","BlinkCaster.mdl");
                        //Units.MJ(u.player.player,'e009','A03M',0,x,y,u.F(),2,1+(3*(1-(data.r[0]/0.3))),1, "stand","by_wood_gongchengsipai_2.mdl").SetH(75); 
                        if(data.r[0]==0.24||data.r[0]==0.06){
                            Units.MJ(u.player.player,'e00B','A03M',0,x,y,GetRandomReal(0,360),2,1.5,1, "stand","by_wood_gongchengsipai_3_b.mdl").SetH(150);   
                        }
                        
                        Units.MJ(u.player.player,'e008','A03M',0,x,y,GetRandomReal(0,360),2,2,1, "stand","hiteffect07bluea.mdl").SetH(100);
                        //Units.MJ(u.player.player,'e00B','A03M',0,x,y,u.F()+90,1,1.5,1, "stand","az_airfloww12_ex.mdl").SetH(100);   
                        //Util.Duang(x,y,0.8,250,250,-32,0.02,50);
                        //牵引阶段，5次伤害
                        Util.Duang(x,y,0.3,150,150,-48,0.02,50);
                        GroupEnumUnitsInRange(tmp_group,x,y,250,function GroupIsAliveNotAloc);     
                        while(FirstOfGroup(tmp_group)!=null){
                            mj=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,mj.unit);
                            if(IsUnitEnemy(mj.unit,u.player.player)==true){   
                                if(Util.XY2(mj.unit,Units(data.c[2]).unit)<100){
                                    mj.Position(mj.X(),mj.Y(),true);
                                    u.Damage(mj.unit,Damage.Magic,'A03M',u.Agi(true)*1.0);
                                    Buffs.Add(mj.unit,'A03O','B00U',86400,false).Type=Buffs.TYPE_SUB+Buffs.TYPE_DISPEL_FALSE;
                                }else{ 
                                    Dash.Start(mj.unit,Util.XY(mj.unit,Units(data.c[2]).unit),50,Dash.SUB,10,true,false);
                                }               
                            }
                        }  
                        GroupClear(tmp_group); 
                    } 
                }
                
                if(data.i[0]==-1){ 
                    if(u.Alive()==false){  
                        u.Pause(false); 
                        u.PositionEnabled(true);
                        Units(data.c[2]).Life(0.5);
                        Units(data.c[2]).Anime("death");
                        Units(data.c[3]).Life(0.3);
                        Units(data.c[3]).DelayAlpha(255,0,0.2);
                    }
                    t.Destroy();
                    Spell(data.c[1]).Destroy();
                    data.Destroy();
                }
            });
        }

        //飞雷丸 15
        static method E1(Spell e){
            Units u=Units.Get(e.Spell);
            Data data=Data.create('A03M');
            u.Pause(true);
            u.FlushAnimeId(15);
            u.AddAbility('A03P');
            u.AddAbility('A03Q');
            u.SetF(e.Angle,true);
            if(u.IsAbility('B00V')==true){
                Buffs.Find(u.unit,'B00V').Stop();
            }
            Dash.Start(u.unit,e.Angle,75,Dash.NORMAL,3,true,false);
            data.c[0]=u;
            data.c[1]=e;
            data.r[0]=0.3;
            Timers.Start(0.3,data,function(Timers t){
                Data data=Data(t.Data());
                Units u=Units(data.c[0]);
                Dash dash;
                Units mj,tmp;
                if(u.Alive()==true){
                    u.AnimeId(14);  
                    dash=Dash.Start(u.unit,u.F()+180,100,Dash.SUB,7,true,false); 
                    dash.onEnd=function(Dash dash){
                        Units u=Units.Get(dash.Unit); 
                        u.RemoveAbility('A03P');
                        u.RemoveAbility('A03Q');
                    };
                    u.DelayReleaseAnimePause(0.3);  
                    mj=Units.MJ(u.player.player,'e008','A03M',0,u.X()+75*CosBJ(u.F()),u.Y()+75*SinBJ(u.F()),u.F(),5,1,0.5, "stand","t_lxw_ex_y.mdl"); 
                    mj.SetH(120);
                    mj.DelaySizeEx(1,4,0.2); 
                    mj.Position(mj.X(),mj.Y(),true);
                    mj.AddAbility(Units.MJType_TSW);  
                    GroupEnumUnitsInRange(tmp_group,mj.X(),mj.Y(),125,function GroupIsAliveNotAloc);     
                    while(FirstOfGroup(tmp_group)!=null){
                        tmp=Units.Get(FirstOfGroup(tmp_group));
                        GroupRemoveUnit(tmp_group,tmp.unit);
                        if(IsUnitEnemy(tmp.unit,u.player.player)==true){   
                            u.Damage(tmp.unit,Damage.Magic,'A03M',u.Agi(true)*5.0);
                            Buffs.Add(tmp.unit,'A03O','B00U',86400,false).Type=Buffs.TYPE_SUB+Buffs.TYPE_DISPEL_FALSE;       
                        }
                    }  
                    GroupClear(tmp_group); 
                    Util.Duang(mj.X(),mj.Y(),0.3,150,150,-215,0.02,50);
                    data.c[2]=mj;
                    mj=Units.MJ(u.player.player,'e008','A03M',0,mj.X(),mj.Y(),mj.F()+90,5,0.7,1, "stand","az_airfloww12_ex.mdl"); 
                    mj.SetH(150);
                    mj.DelayAlpha(255,0,0.5); 
                    mj.SetData(2);
                    data.c[3]=mj;
                    mj=Units(data.c[2]);
                    dash=Dash.Start(mj.unit,mj.F(),600,Dash.SUB,35,true,false);
                    dash.Obj=data.c[3];
                    dash.onMove=function(Dash dash){
                        Units f=Units(dash.Obj);
                        Units tmp;
                        f.Position(dash.X,dash.Y,false);
                        if(f.Data()==0){
                            f.SetData(2);
                            tmp=Units.MJ(f.player.player,'e008','A03M',0,dash.X,dash.Y,dash.Angle+90,0.5,0.7,GetRandomReal(1,3), "stand","az_airfloww12_ex.mdl"); 
                            tmp.SetH(150);
                            tmp.DelayAlpha(255,0,0.45);
                            tmp.DelaySizeEx(0.7,1.2,0.4);
                        }else{
                            f.SetData(f.Data()-1);
                        }
                        GroupEnumUnitsInRange(tmp_group,dash.X,dash.Y,175,function GroupIsAliveNotAloc);     
                        while(FirstOfGroup(tmp_group)!=null){
                            tmp=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,tmp.unit);
                            if(IsUnitEnemy(tmp.unit,f.player.player)==true){   
                                tmp.Position(dash.X,dash.Y,true);
                            }
                        }  
                        GroupClear(tmp_group); 
                        if(dash.Speed<4){
                            dash.Stop();
                        }
                    }; 
                    dash.onEnd=function(Dash dash){
                        Units w=Units.Get(dash.Unit);
                        Units f=Units(dash.Obj);
                        Units tmp;
                        f.Life(0.5);
                        w.Life(0.5);
                        w.Anime("death");
                        Units.MJ(w.player.player,'e008','A03M',0,dash.X,dash.Y,0,0.4,4,1, "birth","t_lxw_ex.mdl").SetH(250);
                        Units.MJ(w.player.player,'e008','A03M',0,dash.X,dash.Y,0,2,2,1, "stand","boom1.mdl").SetH(150);
                        Units.MJ(w.player.player,'e008','A03M',0,dash.X,dash.Y,0,2,2,0.5, "stand","boom_ex.mdl").SetH(150);
                        
                        Units.MJ(w.player.player,'e008','A03M',0,dash.X,dash.Y,0,2,1,1, "stand","by_wood_effect_yuanbanlin_sand2.mdl").SetH(100);
                        Util.Duang(dash.X,dash.Y,0.8,250,250,-215,0.02,50);
                        GroupEnumUnitsInRange(tmp_group,dash.X,dash.Y,250,function GroupIsAliveNotAloc);     
                        while(FirstOfGroup(tmp_group)!=null){
                            tmp=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,tmp.unit);
                            if(IsUnitEnemy(tmp.unit,w.player.player)==true){   
                                w.Damage(tmp.unit,Damage.Magic,'A03M',w.Agi(true)*10.0);      
                            }
                        }  
                        GroupClear(tmp_group); 
                    };

            
                }else{ 
                    u.Pause(false); 
                    u.RemoveAbility('A03P');
                    u.RemoveAbility('A03Q');
                } 
                Spell(data.c[1]).Destroy();
                t.Destroy();
                data.Destroy();
            });
        }

        //二段 7
        static method R(Spell e){
            Units u=Units.Get(e.Spell);
            Data data=Data.create('A03W');
            real x=u.X(),y=u.Y();
            u.Pause(true);
            u.AnimeId(7);
            u.SetF(0,true);
            //u.AnimeSpeed(0.5);
            u.AddAbility('A03S');
            u.AddAbility('A03T'); 
            u.PositionEnabled(false); 
            if(u.IsAbility('B00V')==true){
                Buffs.Find(u.unit,'B00V').Stop();
            }
            data.c[0]=u;
            data.c[1]=e;  
            
            Timers.Start(0.5,data,function(Timers t){
                Data data=Data(t.Data());
                Units u=Units(data.c[0]);  
                Units mj;
                Data data1;
                real x=u.X(),y=u.Y();
                if(u.Alive()==true){  
                    data1=Data.create('A03W');
                    mj=Units.MJ(u.player.player,'e008','A03W',0,x,y,0,1.5,2,2, "stand","az_airfloww12.mdl");
                    mj.DelaySizeEx(1,3,0.38);
                    data1.c[2]=mj;
                    Units.MJ(u.player.player,'e008','A03W',0,x,y,0,1.5,2,1, "stand","boom_ex.mdl").SetH(50);
                    //Units.MJ(u.player.player,'e008','A03W',0,x,y,0,1,0.75,2, "stand","fire-qiquan_y.mdl").SetH(50);
                    
                    mj=Units.MJ(u.player.player,'e008','A03W',0,x,y,0,3,1,2, "stand","rasenganimpact.mdl");
                    mj.SetH(50);
                    mj.DelaySizeEx(1,6,0.3); 
                    data1.r[0]=0.4;
                    data1.c[0]=u;
                    data1.c[1]=mj;
                    data1.c[3]=data.c[1];
                    Timers.Start(0.02,data1,function(Timers t){
                        Data data=Data(t.Data());
                        Units u=Units(data.c[0]);
                        Units mj=Units(data.c[1]);
                        Units tmp;
                        real x=mj.X(),y=mj.Y(); 
                        if(data.r[0]<=0){ 
                            GroupEnumUnitsInRange(tmp_group,x,y,450,function GroupIsAliveNotAloc);     
                            while(FirstOfGroup(tmp_group)!=null){
                                tmp=Units.Get(FirstOfGroup(tmp_group));
                                GroupRemoveUnit(tmp_group,tmp.unit);
                                if(IsUnitEnemy(tmp.unit,u.player.player)==true){   
                                    u.Damage(tmp.unit,Damage.Chaos,'A03W',u.Agi(true)*15.0);
                                    Buffs.Skill(tmp.unit,'A00F',1);
                                    Dash.Start(tmp.unit,Util.XY(tmp.unit,mj.unit),600,Dash.SUB,40,true,false);
                                    HitFlys.Add(tmp.unit,22.5);             
                                }
                            }  
                            GroupClear(tmp_group);  
                            u.Anime("stand");
                            u.DelayAlpha(0,255,1.2);
                            Units.MJ(u.player.player,'e008','A03W',0,x,y,0,2,2,1, "stand","fire-shanguang-lizi_y.mdl");
                            u.PositionEnabled(true); 
                            u.Position(u.X(),u.Y(),true);
                            u.Pause(false); 
                            Spell(data.c[3]).Destroy();
                            Units.MJ(u.player.player,'e008','A03W',0,x,y,0,2,2,1, "stand","boom1.mdl").SetH(50);
                            Units.MJ(u.player.player,'e008','A03W',0,x,y,0,2,1.25,1, "stand","by_wood_effect_yuanbanlin_sand2.mdl").SetH(100);
                            //Units.MJ(u.player.player,'e008','A03W',0,x,y,0,2,2,1, "stand","by_wood_sand_yuekongji.mdl").SetH(100);
                            Util.Duang(x,y,0.8,250,250,-215,0.02,50); 
                            mj.Life(0.5);
                            mj.Size(0);
                            //mj.DelaySizeEx(6,0.5,0.2); 
                            t.Destroy();
                            data.Destroy();
                        }else{
                            data.r[0]-=0.02;
                            Units.MJ(u.player.player,'e008','A03W',0,x,y,GetRandomReal(0,360),1,1,GetRandomReal(0.8,1.2), "stand","white-qiquan.mdl");
                            //Util.Duang(x,y,0.8,250,250,-16,0.02,50);
                            if(data.r[0]==0.22){
                                mj=Units(data.c[2]);  
                                mj.Life(0.5);
                                mj.DelayAlpha(255,0,0.45);
                            } 
                            GroupEnumUnitsInRange(tmp_group,x,y,450,function GroupIsAliveNotAloc);     
                            while(FirstOfGroup(tmp_group)!=null){
                                tmp=Units.Get(FirstOfGroup(tmp_group));
                                GroupRemoveUnit(tmp_group,tmp.unit);
                                if(IsUnitEnemy(tmp.unit,u.player.player)==true){   
                                    Dash.Start(tmp.unit,Util.XY(tmp.unit,mj.unit),70,Dash.SUB,5,true,false);          
                                }
                            }  
                            GroupClear(tmp_group);  
                        }
                    });
                }else{ 
                    u.Pause(false); 
                    u.PositionEnabled(true); 
                    Spell(data.c[1]).Destroy();
                } 
                u.AnimeSpeed(1);
                u.RemoveAbility('A03S');
                u.RemoveAbility('A03T');  
                t.Destroy();
                data.Destroy(); 
            });
        }

        //飞雷神 851971 右键
        static method Q(EventArgs e){
            Units u=Units.Get(e.TriggerUnit);
            real x,y,dis,range,cd,f;
            integer ft;
            unit target,tmp;
            Buffs b;
            Units mj,tmp1;
            group g;
            boolean team;
            real x1,y1;
            Data data,data1;
            Dash dash;
            if(e.OrderId==851971){ 
                if(u.IsAbility('A03I')==true&&u.IsAbility('B00V')==false){
                    range=150,dis=999999999;//选取范围，最近距离
                    ft=-1;//发动的飞雷神类型
                    if(e.OrderTargetUnit==null){//点击的地方
                        x=e.OrderTargetX,y=e.OrderTargetY;
                        f=Util.XYEX(u.X(),u.Y(),x,y);
                    }else{
                        x=GetUnitX(e.OrderTargetUnit),y=GetUnitY(e.OrderTargetUnit);
                        f=Util.XY(u.unit,e.OrderTargetUnit);
                    }
                    if(ft==-1){//优先找螺旋丸标记
                        target=null;
                        GroupEnumUnitsInRange(tmp_group,x,y,range,function GroupIsAliveNotAloc); 
                        while(FirstOfGroup(tmp_group)!=null){
                            tmp=FirstOfGroup(tmp_group);  
                            GroupRemoveUnit(tmp_group,tmp);
                            if(GetUnitAbilityLevel(tmp,'B00U')==1){  
                                if(Util.XY2EX(x,y,GetUnitX(tmp),GetUnitY(tmp))<dis){
                                    target=tmp;
                                    dis=Util.XY2EX(x,y,GetUnitX(tmp),GetUnitY(tmp));
                                }
                            }  
                        }   
                        GroupClear(tmp_group); 
                        if(target!=null){//找到符合条件的目标
                            ft=1;//飞雷神-螺旋丸触发
                        }    
                    }
                    if(ft==-1){//找爆破苦无
                        target=null;
                        dis=999999999;
                        GroupEnumUnitsInRange(tmp_group,x,y,range,function GroupIsFZW); 
                        while(FirstOfGroup(tmp_group)!=null){
                            tmp=FirstOfGroup(tmp_group);  
                            GroupRemoveUnit(tmp_group,tmp);
                            if(Units.Get(tmp).aid=='A03Z'){  
                                if(Util.XY2EX(x,y,GetUnitX(tmp),GetUnitY(tmp))<dis){
                                    target=tmp;
                                    dis=Util.XY2EX(x,y,GetUnitX(tmp),GetUnitY(tmp));
                                }
                            }  
                        }  
                        GroupClear(tmp_group); 
                        if(target!=null){//找到符合条件的目标
                            ft=2;//飞雷神-爆破苦无触发
                        }            
                    }
                    if(ft==-1){//找友军标记
                        target=null;
                        dis=999999999;
                        GroupEnumUnitsInRange(tmp_group,x,y,range,function GroupIsAliveNotAloc); 
                        while(FirstOfGroup(tmp_group)!=null){
                            tmp=FirstOfGroup(tmp_group);  
                            GroupRemoveUnit(tmp_group,tmp);
                            if(GetUnitAbilityLevel(tmp,'B00S')==1&&tmp!=u.unit){  
                                if(Util.XY2EX(x,y,GetUnitX(tmp),GetUnitY(tmp))<dis){
                                    target=tmp;
                                    dis=Util.XY2EX(x,y,GetUnitX(tmp),GetUnitY(tmp));
                                }
                            }  
                        }  
                        GroupClear(tmp_group); 
                        if(target!=null){//找到符合条件的目标
                            ft=3;    
                        }                        
                    }
                    if(ft==-1){//找苦无
                        target=null;
                        dis=999999999;
                        GroupEnumUnitsInRange(tmp_group,x,y,range,function GroupIsFZW); 
                        while(FirstOfGroup(tmp_group)!=null){
                            tmp=FirstOfGroup(tmp_group);  
                            GroupRemoveUnit(tmp_group,tmp);
                            if(Units.Get(tmp).aid=='A03K'){  
                                if(Util.XY2EX(x,y,GetUnitX(tmp),GetUnitY(tmp))<dis){
                                    target=tmp;
                                    dis=Util.XY2EX(x,y,GetUnitX(tmp),GetUnitY(tmp));
                                }
                            }  
                        }  
                        GroupClear(tmp_group); 
                        if(target!=null){//找到符合条件的目标
                            ft=4;//飞雷神-苦无触发
                        }                        
                    }
                    if(ft!=-1){//可触发飞雷神 ,16 后摇 18 披风 B00X 时空转移BUFF
                        RunSoundOnUnit(Q_Sound,u.unit); 
                        u.SetAbilityCD('A03R',u.GetAbilityCD('A03R')-1);
                        x=u.X(),y=u.Y();  
                        x1=GetUnitX(target),y1=GetUnitY(target);
                        if(u.IsAbility('B00X')==true){//时空转移
                            if(Buffs.Find(u.unit,'B00X').Obj==1){ 
                                b=Buffs.Find(u.unit,'B00X');
                                b.Obj=0;
                                b.Delay(0.75);
                                g=CreateGroup();
                                team=false;
                                if(u.player.press.D==true){
                                    team=true; 
                                } 
                                GroupEnumUnitsInRange(tmp_group,x,y,325,function GroupIsAliveNotAloc);     
                                while(FirstOfGroup(tmp_group)!=null){
                                    mj=Units.Get(FirstOfGroup(tmp_group));
                                    GroupRemoveUnit(tmp_group,mj.unit);
                                    if(IsUnitEnemy(mj.unit,u.player.player)==team&&mj.unit!=u.unit){    
                                        if(mj.move==true){ 
                                            Units.MJ(u.player.player,'e008','A03I',0,mj.X(),mj.Y(),0,2,2,1, "stand","ss1.mdl").SetH(50);
                                            mj.Position(x1,y1,true);
                                            //Units.MJ(u.player.player,'e008','A03I',0,mj.X(),mj.Y(),0,2,1.5,1, "stand","y_blinkcaster.mdl").SetH(50);
                                            if(team==true){
                                                Buffs.Skill(mj.unit,'A00F',1);
                                            }else{
                                                u.SetMP(u.MP()-25);
                                            }
                                        }
                                    }
                                }  
                                GroupClear(tmp_group);   
                                DestroyGroup(g);
                                g=null; 
                            }
                        }


                        Units.MJ(u.player.player,'e008','A03I',0,x,y,0,2,2,1, "stand","fire-shanguang-lizi_y.mdl");
                        if(ft==1){//螺旋丸触发
                            cd=0.5;
                            Buffs.Find(target,'B00U').Stop();
                            u.SetF(f,true);
                            u.Position(x1,y1,false); 
                            x=u.X(),y=u.Y();
                            Units.MJ(u.player.player,'e008','A03I',0,x,y,0,2,1,1, "stand","boom_ex.mdl");
                            GroupEnumUnitsInRange(tmp_group,x,y,250,function GroupIsAliveNotAloc);     
                            while(FirstOfGroup(tmp_group)!=null){
                                mj=Units.Get(FirstOfGroup(tmp_group));
                                GroupRemoveUnit(tmp_group,mj.unit);
                                if(IsUnitEnemy(mj.unit,u.player.player)==true){   
                                    u.Damage(mj.unit,Damage.Physics,'A03I',u.Agi(true)*5.0); 
                                    Buffs.Skill(mj.unit,'A00F',1);  
                                    Effect.ToUnit("hiteffect10white_ex.mdl",mj.unit,"origin").Destroy();
                                }
                            }  
                            GroupClear(tmp_group);   
                        }
                        if(ft==3){//飞雷神标记触发
                            cd=2; 
                            Buffs.Find(target,'B00S').Stop();
                            u.SetF(f,true);
                            u.Position(x1,y1,false); 
                            x=u.X(),y=u.Y();
                            if(IsUnitEnemy(target,u.player.player)==true){//是敌人触发
                                GroupEnumUnitsInRange(tmp_group,x,y,250,function GroupIsAliveNotAloc);     
                                while(FirstOfGroup(tmp_group)!=null){
                                    mj=Units.Get(FirstOfGroup(tmp_group));
                                    GroupRemoveUnit(tmp_group,mj.unit);
                                    if(IsUnitEnemy(mj.unit,u.player.player)==true){   
                                        u.Damage(mj.unit,Damage.Physics,'A03I',u.Agi(true)*10.0); 
                                        Buffs.Skill(mj.unit,'A00W',1);  
                                        Effect.ToUnit("hiteffect10white_ex.mdl",mj.unit,"origin").Destroy();
                                        Dash.Start(mj.unit,Util.XY(target,mj.unit),450,Dash.SUB,30,true,false);
                                    }
                                }  
                                GroupClear(tmp_group);   
                            }else{//是友军触发
                                //伤害 
                                Units.MJ(u.player.player,'e008','A03I',0,x,y,0,4,1,1, "stand","kc4.mdl");
                                GroupEnumUnitsInRange(tmp_group,x,y,250,function GroupIsAliveNotAloc);     
                                while(FirstOfGroup(tmp_group)!=null){
                                    mj=Units.Get(FirstOfGroup(tmp_group));
                                    GroupRemoveUnit(tmp_group,mj.unit);
                                    if(IsUnitEnemy(mj.unit,u.player.player)==true){   
                                        u.Damage(mj.unit,Damage.Chaos,'A03I',u.Agi(true)*5.0);  
                                        Effect.ToUnit("hiteffect10white_ex.mdl",mj.unit,"origin").Destroy();
                                        Dash.Start(mj.unit,Util.XY(target,mj.unit),300,Dash.SUB,25,true,true);
                                    }
                                }  
                                GroupClear(tmp_group);
                                //击退投射物
                                GroupEnumUnitsInRange(tmp_group,x,y,500,function GroupIsTSW);     
                                while(FirstOfGroup(tmp_group)!=null){
                                    mj=Units.Get(FirstOfGroup(tmp_group));
                                    GroupRemoveUnit(tmp_group,mj.unit);  
                                    Dash.Start(mj.unit,Util.XY(target,mj.unit),800,Dash.SUB,40,true,false); 
                                }  
                                GroupClear(tmp_group);  
                            }
                        }
                        if(ft==2){//爆破苦无触发
                            cd=0.0; 
                            u.Position(x1,y1,false); 
                            x=u.X(),y=u.Y(); 
                            mj=Units.Get(target);
                            data=Data(mj.Obj);
                            Units.MJ(u.player.player,'e008','A03I',0,x1,y1,0,4,1,1, "stand","kc4.mdl");
                            GroupEnumUnitsInRange(tmp_group,x1,y1,250,function GroupIsAliveNotAloc);     
                            while(FirstOfGroup(tmp_group)!=null){
                                tmp=FirstOfGroup(tmp_group);
                                GroupRemoveUnit(tmp_group,tmp);
                                if(GetUnitAbilityLevel(tmp,'A03I')==0){      
                                    Dash.Start(tmp,Util.XYEX(GetUnitX(tmp),GetUnitY(tmp),data.r[0],data.r[1]),600,Dash.SUB,40,true,true);
                                    Effect.ToUnit("hiteffect10white_ex.mdl",tmp,"origin").Destroy();
                                }
                            }  
                            GroupClear(tmp_group);
                            if(Util.XY2(data.u[0],mj.unit)>400&&data.u[0]!=null){
                                data1=Data.create('A03Z');
                                data1.g[0]=CreateGroup();
                                tmp1=Units.MJ(mj.player.player,'e008','A03I',0,x1,y1,0,4,1,1, "stand","t_tai.mdl");
                                dash=Dash.Start(tmp1.unit,Util.XY(mj.unit,data.u[0]),Util.XY2(mj.unit,data.u[0]),Dash.NORMAL,40,true,false);
                                dash.Obj=data1;
                                dash.onMove=function(Dash dash){
                                    Data data=Data(dash.Obj);
                                    Units u=Units.Get(dash.Unit);
                                    unit tmp;
                                    GroupEnumUnitsInRange(tmp_group,dash.X,dash.Y,125,function GroupIsAliveNotAloc);        
                                    while(FirstOfGroup(tmp_group)!=null){
                                        tmp=FirstOfGroup(tmp_group);
                                        GroupRemoveUnit(tmp_group,tmp);
                                        if(GetUnitAbilityLevel(tmp,'A03I')==0&&IsUnitInGroup(tmp,data.g[0])==false){      
                                             GroupAddUnit(data.g[0],tmp);
                                             u.Damage(tmp,Damage.Chaos,'A03Z',4.0*u.Agi(true));
                                             Effect.To("abilities\\weapons\\catapult\\catapultmissile.mdl",GetUnitX(tmp),GetUnitY(tmp)).Destroy();
                                        }
                                    }  
                                    GroupClear(tmp_group);
                                };
                                dash.onEnd=function(Dash dash){
                                    Data data=Data(dash.Obj);
                                    Units u=Units.Get(dash.Unit);
                                    u.Life(0.5);
                                    u.Anime("death");
                                    DestroyGroup(data.g[0]);
                                    data.g[0]=null;
                                    data.Destroy();
                                };
                            }
                            data.u[0]=mj.unit;  
                        }
                        if(ft==4){//苦无触发
                            cd=0.5;
                            mj=Units.Get(target);
                            if(mj.Data()==0){//等于0表示掉地上了
                                Units.Remove(target);
                            }else{//仍在飞行
                                mj.SetData(4);
                            }
                            if(u.IsAbility('B00T')==false){ 
                                Buffs.Add(u.unit,'A03L','B00T',86400,false);
                            }else{
                                Buffs.Add(u.unit,'A03L','B00T',86400,false).Level+=1;
                            } 
                            
                            u.SetF(f,true);
                            u.Position(x1,y1,false); 
                            x=u.X(),y=u.Y(); 
                            GroupEnumUnitsInRange(tmp_group,x,y,250,function GroupIsAliveNotAloc);     
                            while(FirstOfGroup(tmp_group)!=null){
                                mj=Units.Get(FirstOfGroup(tmp_group));
                                GroupRemoveUnit(tmp_group,mj.unit);
                                if(IsUnitEnemy(mj.unit,u.player.player)==true){   
                                    u.Damage(mj.unit,Damage.Physics,'A03I',u.Agi(true)*3.0); 
                                    Effect.ToUnit("hiteffect10white_ex.mdl",mj.unit,"origin").Destroy();
                                }
                            }  
                            GroupClear(tmp_group);   
                        }
                        Util.Duang(x,y,0.4,250,250,-96,0.02,50); 
                        Units.MJ(u.player.player,'e008','A03I',0,x,y,0,2,2,1, "stand","fire-lizi-texiao_y.mdl");
                        Units.MJ(u.player.player,'e008','A03I',0,x,y,0,3,1.5,0.75, "stand","az_pafeathermoon_b.mdl");
                        Units.MJ(u.player.player,'e008','A03I',0,x,y,0,3,1.5,0.75, "stand","az_pafeathermoon_b.mdl");
                        Units.MJ(u.player.player,'e008','A03I',0,x,y,0,3,1.5,0.75, "stand","az_pafeathermoon_b.mdl");
                        Units.MJ(u.player.player,'e008','A03I',0,x,y,GetRandomReal(0,360),2,0.5,1, "stand","white-qiquan.mdl");
                        //Units.MJ(u.player.player,'e008','A03I',0,x,y,0,2,0.75,1, "stand","ThunderClapCaster_ex.mdl");
                        
                        //----设置冷却和渐隐
                        Buffs.Add(u.unit,'A03U','B00V',cd,false); 
                        if(u.IsAbility('B00W')==false){
                            u.Alpha(0);
                            b=Buffs.Add(u.unit,'A03V','B00W',0.2,false); 
                            b.onEnd=function(Buffs b){
                                Units u=Units.Get(b.Unit);
                                u.DelayAlpha(0,255,0.5); 
                            };
                        }else{
                            Buffs.Add(u.unit,'A03V','B00W',0.2,false);
                        }
                    }
                }
            }
        }

        static method D(Spell e){
            Units u=Units.Get(e.Spell);
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
            Buffs.Add(u.unit,'A03X','B00X',10,false).Obj=1;
            e.Destroy();
        }

        // 0 施法 18 披风
        static method F(Spell e){
            Units u=Units.Get(e.Spell);
            Data data=Data.create('A03Z');
            real x=u.X(),y=u.Y();
            u.Pause(true);
            u.AnimeId(0);
            u.AnimeSpeed(0.5);
            Units.MJ(u.player.player,'e008','A03Z',0,x,y,GetRandomReal(0,360),2,0.5,1, "stand","kc12.mdl").SetH(100);
            Util.Duang(x,y,1,250,250,-32,0.02,50);   
            data.c[0]=u;
            data.c[1]=e;
            data.i[0]=16;//剩余次数
            data.i[1]=-1;//角度系数 
            data.i[2]=0;//是否已删除丝带
            data.r[0]=x;//X
            data.r[1]=y;//Y
            data.g[0]=CreateGroup();
            data.u[0]=null;//上一个被触发的爆破苦无
            Timers.Start(0.3,data,function(Timers t){
                Data data=Data(t.Data());
                Units u=Units(data.c[0]);
                Units mj;
                if(u.Alive()==true){
                    Units.MJ(u.player.player,'e008','A03Z',0,data.r[0],data.r[1],GetRandomReal(0,360),2,1,1, "stand","t_ss.mdl").SetH(150);
                    Units.MJ(u.player.player,'e008','A03Z',0,data.r[0],data.r[1],GetRandomReal(0,360),2,0.7,1, "stand","white-qiquan.mdl");
                    Util.Duang(data.r[0],data.r[1],1,250,250,-196,0.02,50);   
                    mj=Units.MJ(u.player.player,'e008','A03Z',0,data.r[0],data.r[1],u.F(),2.5,u.modelsize,0.3, "stand","4d_ex.mdl");
                    mj.SetH(75);
                    mj.AnimeId(18);
                    data.c[3]=mj;
                    u.AddAbility('A040');
                    u.Alpha(0); 
                    Timers.Start(0.04,data,function(Timers t){
                        Data data=Data(t.Data());
                        Units u=Units(data.c[0]);
                        Units mj;
                        real x=data.r[0],y=data.r[1];
                        group g;
                        if(u.Alive()==true&&data.i[0]>0){
                            if(ModuloInteger(data.i[0],4)==0){
                                data.i[1]+=1;
                            }
                            x=x+600*CosBJ((22.5*data.i[1])+(90*ModuloInteger(data.i[0],4)));
                            y=y+600*SinBJ((22.5*data.i[1])+(90*ModuloInteger(data.i[0],4)));
                            u.Position(x,y,false);
                            //BJDebugMsg(I2S(data.i[0]));
                            mj=Units.MJ(u.player.player,'e008','A03Z',data.i[0],x,y,0,86400,1.5,1, "stand","fls_kw.mdl"); 
                            GroupAddUnit(data.g[0],mj.unit);
                            data.i[0]-=1; 
                        }else{//
                            if(u.Alive()==false){
                                g=CreateGroup();
                                GroupAddGroup(data.g[0],g);
                                while(FirstOfGroup(g)!=null){
                                    mj=Units.Get(FirstOfGroup(g));
                                    GroupRemoveUnit(g,mj.unit);
                                    mj.Life(0.5); 
                                    mj.DelayAlpha(255,0,0.45);
                                }  
                                DestroyGroup(g);
                                g=null; 
                                u.Pause(false);
                                u.RemoveAbility('A040');
                                u.Alpha(255); 
                                DestroyGroup(data.g[0]);
                                data.g[0]=null;
                                Spell(data.c[1]).Destroy();
                                t.Destroy();
                                data.Destroy();
                            }else{
                                t.Destroy();
                                Spell(data.c[1]).Destroy();
                                KillCDJ(x,y); 
                                Units.MJ(u.player.player,'e008','A03Z',0,data.r[0],data.r[1],0,2,3.5,1, "stand","fire-qiquan_y.mdl"); 
                                Units.MJ(u.player.player,'e008','A03Z',0,data.r[0],data.r[1],GetRandomReal(0,360),2,1,1, "stand","t_ss.mdl").SetH(150);
                                u.AnimeSpeed(1);
                                u.Position(data.r[0],data.r[1],false);
                                u.SetH(200);
                                HitFlys.Add(u.unit,0.01);
                                u.SetF(45,true);
                                u.Alpha(255);
                                u.AnimeId(17);
                                u.DelayReleaseAnimePause(0.5);
                                Units(data.c[3]).Life(0.01);
                                mj=Units.MJ(u.player.player,'e008','A03Z',0,x,y,0,25,2.5,1, "stand",".mdl"); 
                                mj.SetData(1000);//持续10秒 (10/0.01)
                                mj.Position(x,y,true);//可选取
                                mj.AddAbility(Units.MJType_CDW);//添加场地技标记
                                data.c[3]=mj;
                                g=CreateGroup();
                                GroupAddGroup(data.g[0],g);
                                while(FirstOfGroup(g)!=null){
                                    mj=Units.Get(FirstOfGroup(g));
                                    GroupRemoveUnit(g,mj.unit);
                                    mj.Position(mj.X(),mj.Y(),true);
                                    mj.AddAbility(Units.MJType_FZW);
                                    mj.AddObj(data);
                                }  
                                DestroyGroup(g);
                                g=null;
                                Timers.Start(0.01,data,function(Timers t){
                                    Data data=Data(t.Data());
                                    Units cd=Units(data.c[3]);
                                    Units mj;
                                    group g;
                                    if(cd.Data()<=0){
                                        if(data.i[2]==0){ 
                                            Units(data.c[0]).RemoveAbility('A040');
                                        }
                                        cd.RemoveAbility(Units.MJType_CDW);
                                        g=CreateGroup();
                                        GroupAddGroup(data.g[0],g);
                                        while(FirstOfGroup(g)!=null){
                                            mj=Units.Get(FirstOfGroup(g));
                                            GroupRemoveUnit(g,mj.unit);
                                            mj.Life(0.5);
                                            mj.RemoveAbility(Units.MJType_FZW);
                                            mj.DelayAlpha(255,0,0.45);
                                        }  
                                        DestroyGroup(g);
                                        g=null;
                                        DestroyGroup(data.g[0]);
                                        data.g[0]=null;
                                        data.u[0]=null;
                                        t.Destroy();
                                        data.Destroy();
                                    }else{ 
                                        if(cd.Data()<900&&data.i[2]==0){
                                            data.i[2]=1;
                                            Units(data.c[0]).RemoveAbility('A040');
                                        }
                                        cd.SetData(cd.Data()-1);
                                    }
                                });
                            }
                        }
                    });
                    t.Destroy();
                }else{
                    u.Pause(false);
                    u.AnimeSpeed(1);
                    Spell(data.c[1]).Destroy();
                    t.Destroy();
                    data.Destroy();
                }
            });
        }
   
        static method HERO_START(Spell e){
            Units u=Units.Get(e.Spell);
            Dash dash;
            if(e.Id=='A03K'){
                if(e.Dis>200){ 
                    u.FlushAnimeId(2);
                    u.AnimeSpeed(1.25);  
                    e.Destroy();
                }else{  
                    u.SetAbilityCD('A03K',1); 
                    u.SetMP(u.MP()-50);
                    SD.W(e);
                } 
            } 
            if(e.Id=='A03M'){
                if(u.IsAbility('B00W')==false){//普通螺旋丸
                    u.FlushAnimeId(12);
                    u.AnimeSpeed(1.7);
                    u.AddAbility('A03N');
                    dash=Dash.Start(u.unit,e.Angle,150,Dash.NORMAL,u.MoveSpeed()/100,true,false);
                    dash.onMove=function(Dash dash){
                        Units u=Units.Get(dash.Unit);
                        if(u.IsAbility('A03N')==false){
                            dash.Stop();
                        }
                    }; 
                    e.Destroy();
                }else{//飞雷丸
                    SpellNameText(u.unit,"! 螺旋丸 !",3,10);
                    u.SetAbilityCD('A03M',10);
                    u.SetMP(u.MP()-150);
                    SD.E1(e);
                } 
            } 
        }
 
        static method HERO_STOP(Spell e){
            Units u=Units.Get(e.Spell);
            u.FlushAnimeId(1);
            u.AnimeSpeed(1);
            if(e.Id=='A03M'){
                u.RemoveAbility('A03N');
            }
            e.Destroy();
        }

        static method onInit(){   
            Spell.On(Spell.onSpell,'A03Z',SD.F);
            Spell.On(Spell.onSpell,'A03R',SD.D);
            Spell.On(Spell.onSpell,'A03W',SD.R);
            Spell.On(Spell.onSpell,'A03M',SD.E);
            Spell.On(Spell.onSpell,'A03K',SD.W);  
            Spell.On(Spell.onReady,'A03K',SD.HERO_START);
            Spell.On(Spell.onStop,'A03K',SD.HERO_STOP);   
            Spell.On(Spell.onReady,'A03M',SD.HERO_START);
            Spell.On(Spell.onStop,'A03M',SD.HERO_STOP);   
            Units.On(Units.onHeroSpawn,SD.Spawn); 
            Events.On(Events.onUnitOrderToUnit,SD.Q);
            Events.On(Events.onUnitOrderToLocation,SD.Q);
            Q_Sound=DefineSound("resource\\sound_effect_sd_fls.wav",1000, false, true);
        }
    }
}