library SD requires Groups{
    //英雄‘水门’的技能
    //SSR
    struct SD{

        //友军标记
        static method Spawn(Units u,Units m){
            Data data;
            if(u.IsAbility('A03I')==true){
                data=Data.create('A03I');
                data.c[0]=u;
                data.u[0]=null;//W-苦无需求
                data.r[0]=0;//上友军BUFF的间隔
                Buffs.Add(u.unit,'A03L','B00T',86400,false);
                Timers.Start(0.01,data,function(Timers t){
                    Data data=Data(t.Data());
                    Units u=Units(data.c[0]);
                    Units mj;
                    integer x;
                    if(u.Alive()==false){
                        BJDebugMsg("结束了-4D");
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
                    }
                });
            }  
        }
 
        static method W(Spell e){
            Units u=Units.Get(e.Spell);
            Buffs b;
            Units mj;
            if(u.IsAbility('B00T')==true){
                b=Buffs.Find(u.unit,'B00T');
                b.Level-=1;
                if(b.Level<1){
                    b.Stop();
                }
                mj=Units.MJ(u.player.player,'e008','A03K',0,u.X()+75*CosBJ(u.F()),u.Y()+75*SinBJ(u.F()),0,86400,1.5,1, "stand","fls_kw_ex.mdl"); 
                mj.Position(mj.X(),mj.Y(),true);
                mj.AddAbility(Units.MJType_FZW);
                
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
                                    u.Damage(mj.unit,Damage.Magic,'A03M',u.Agi(true)*5.0);        
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
                    mj=Units.MJ(u.player.player,'e008','A03M',0,mj.X(),mj.Y(),mj.F()+90,5,0.7,2, "stand","az_airfloww12_ex.mdl"); 
                    mj.SetH(150);
                    mj.DelayAlpha(255,0,0.5); 
                    data.c[3]=mj;
                    mj=Units(data.c[2]);
                    dash=Dash.Start(mj.unit,mj.F(),600,Dash.SUB,35,true,false);
                    dash.Obj=data.c[3];
                    dash.onMove=function(Dash dash){
                        Units f=Units(dash.Obj);
                        Units tmp;
                        f.Position(dash.X,dash.Y,false);
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
                        Units.MJ(w.player.player,'e008','A03M',0,dash.X,dash.Y,0,2,1,1, "stand","by_wood_effect_yuanbanlin_sand2.mdl").SetH(100);
                        Util.Duang(dash.X,dash.Y,0.8,250,250,-215,0.02,50);
                        GroupEnumUnitsInRange(tmp_group,dash.X,dash.Y,250,function GroupIsAliveNotAloc);     
                        while(FirstOfGroup(tmp_group)!=null){
                            tmp=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,tmp.unit);
                            if(IsUnitEnemy(tmp.unit,w.player.player)==true){   
                                w.Damage(tmp.unit,Damage.Magic,'A03M',w.Agi(true)*5.0);      
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
            Data data=Data.create('A03R');
            real x=u.X(),y=u.Y();
            u.Pause(true);
            u.AnimeId(7);
            //u.AnimeSpeed(0.5);
            u.AddAbility('A03S');
            u.AddAbility('A03T'); 
            u.PositionEnabled(false); 
            data.c[0]=u;
            data.c[1]=e;  
            
            Timers.Start(0.5,data,function(Timers t){
                Data data=Data(t.Data());
                Units u=Units(data.c[0]);  
                Units mj;
                Data data1;
                real x=u.X(),y=u.Y();
                if(u.Alive()==true){  
                    data1=Data.create('A03R');
                    mj=Units.MJ(u.player.player,'e008','A03R',0,x,y,0,1.5,2,2, "stand","az_airfloww12.mdl");
                    mj.DelaySizeEx(1,3,0.38);
                    data1.c[2]=mj;
                    Units.MJ(u.player.player,'e008','A03R',0,x,y,0,1.5,2,1, "stand","boom_ex.mdl").SetH(50);
                    //Units.MJ(u.player.player,'e008','A03R',0,x,y,0,1,0.75,2, "stand","fire-qiquan_y.mdl").SetH(50);
                    
                    mj=Units.MJ(u.player.player,'e008','A03R',0,x,y,0,3,1,2, "stand","rasenganimpact.mdl");
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
                                    u.Damage(tmp.unit,Damage.Chaos,'A03R',u.Agi(true)*15.0);
                                    Buffs.Skill(tmp.unit,'A00F',1);
                                    Dash.Start(tmp.unit,Util.XY(tmp.unit,mj.unit),600,Dash.SUB,40,true,false);
                                    HitFlys.Add(tmp.unit,22.5);             
                                }
                            }  
                            GroupClear(tmp_group);  
                            u.Anime("stand");
                            u.DelayAlpha(0,255,1.2);
                            Units.MJ(u.player.player,'e008','A03R',0,x,y,0,2,2,1, "stand","fire-shanguang-lizi_y.mdl");
                            u.Pause(false); 
                            u.PositionEnabled(true); 
                            Spell(data.c[3]).Destroy();
                            Units.MJ(u.player.player,'e008','A03R',0,x,y,0,2,2,1, "stand","boom1.mdl").SetH(50);
                            Units.MJ(u.player.player,'e008','A03R',0,x,y,0,2,1.25,1, "stand","by_wood_effect_yuanbanlin_sand2.mdl").SetH(100);
                            //Units.MJ(u.player.player,'e008','A03R',0,x,y,0,2,2,1, "stand","by_wood_sand_yuekongji.mdl").SetH(100);
                            Util.Duang(x,y,0.8,250,250,-215,0.02,50); 
                            mj.Life(0.5);
                            mj.Size(0);
                            //mj.DelaySizeEx(6,0.5,0.2); 
                            t.Destroy();
                            data.Destroy();
                        }else{
                            data.r[0]-=0.02;
                            Units.MJ(u.player.player,'e008','A03R',0,x,y,GetRandomReal(0,360),1,1,GetRandomReal(0.8,1.2), "stand","white-qiquan.mdl");
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

        //飞雷神 851971 右键 851983 A键
        static method Q(EventArgs e){
            Units u=Units.Get(e.TriggerUnit);
            real x,y,dis,range,cd;
            integer ft;
            unit target,tmp;
            Buffs b;
            Units mj;
            if(u.IsAbility('A03I')==true&&u.IsAbility('B00V')==false){
                range=100,dis=999999999;//选取范围，最近距离
                ft=-1;//发动的飞雷神类型
                if(e.OrderTargetUnit==null){//点击的地方
                    x=e.OrderTargetX,y=e.OrderTargetY;
                }else{
                    x=GetUnitX(e.OrderTargetUnit),y=GetUnitY(e.OrderTargetUnit);
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
                    //还没做，空着
                }
                if(ft==-1){//找友军标记
                    target=null;
                    dis=999999999;
                    GroupEnumUnitsInRange(tmp_group,x,y,range,function GroupIsAliveNotAloc); 
                    while(FirstOfGroup(tmp_group)!=null){
                        tmp=FirstOfGroup(tmp_group);  
                        GroupRemoveUnit(tmp_group,tmp);
                        if(GetUnitAbilityLevel(tmp,'B00S')==1){  
                            if(Util.XY2EX(x,y,GetUnitX(tmp),GetUnitY(tmp))<dis){
                                target=tmp;
                                dis=Util.XY2EX(x,y,GetUnitX(tmp),GetUnitY(tmp));
                            }
                        }  
                    }  
                    GroupClear(tmp_group); 
                    if(target!=null){//找到符合条件的目标
                        ft=3;//飞雷神-友军标记触发
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
                if(ft!=-1){//可触发飞雷神 ,16 后摇 18 披风
                    if(ft==4){//苦无触发
                        cd=2;
                        Units.Remove(target);
                        if(u.IsAbility('B00T')==false){ 
                            Buffs.Add(u.unit,'A03L','B00T',86400,false);
                        }else{
                            Buffs.Add(u.unit,'A03L','B00T',86400,false).Level+=1;
                        } 
                        x=u.X(),y=u.Y();
                        mj=Units.MJ(u.player.player,'e008','A03I',0,x,y,u.F(),2.5,u.modelsize,0.85, "stand","4d_ex.mdl");
                        mj.AnimeId(18);
                        mj.DelayAlpha(255,0,1.95);
                        Units.MJ(u.player.player,'e008','A03I',0,x,y,0,2,2,1, "stand","fire-shanguang-lizi_y.mdl");
                        u.Position(GetUnitX(target),GetUnitY(target),false);
                        x=u.X(),y=u.Y();
                        Units.MJ(u.player.player,'e008','A03I',0,x,y,0,2,2,1, "stand","fire-lizi-texiao_y.mdl");
                        Units.MJ(u.player.player,'e008','A03I',0,x,y,0,2,1.5,1, "stand","az_pafeathermoon_b.mdl");
                         
                    }

                    //----设置冷却和渐隐
                    Buffs.Add(u.unit,'A03U','B00V',cd,false);
                    if(u.IsAbility('B00W')==false){
                        u.Alpha(0);
                        b=Buffs.Add(u.unit,'A03V','B00W',0.1,false); 
                        b.onEnd=function(Buffs b){
                            Units u=Units.Get(b.Unit);
                            u.DelayAlpha(0,255,0.5); 
                        };
                    }else{
                        Buffs.Add(u.unit,'A03V','B00W',0.1,false);
                    }
                }
            }
        }
   
        static method HERO_START(Spell e){
            Units u=Units.Get(e.Spell);
            Dash dash;
            if(e.Id=='A03K'){
                u.FlushAnimeId(8);
                u.AnimeSpeed(0.5); 
                e.Destroy();
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
            Spell.On(Spell.onSpell,'A03R',SD.R);
            Spell.On(Spell.onSpell,'A03M',SD.E);
            Spell.On(Spell.onSpell,'A03K',SD.W);
            Spell.On(Spell.onReady,'A03K',SD.HERO_START);
            Spell.On(Spell.onStop,'A03K',SD.HERO_STOP);   
            Spell.On(Spell.onReady,'A03M',SD.HERO_START);
            Spell.On(Spell.onStop,'A03M',SD.HERO_STOP);   
            Units.On(Units.onHeroSpawn,SD.Spawn); 
            Events.On(Events.onUnitOrderToUnit,SD.Q);
            Events.On(Events.onUnitOrderToLocation,SD.Q);
        }
    }
}