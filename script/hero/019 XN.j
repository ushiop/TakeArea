library XN requires Groups{
    //英雄‘傻娜’的技能
    //SSR
    struct XN{ 

        /* 
            16 火碎前摇
            17 火碎释放
            18 火碎结束
        */
        
        static integer Sound;

        static method F(Spell e){
            Units u=Units.Get(e.Spell); 
            Data data=Data.create('A07I');
            real x=u.X(),y=u.Y();
            Units mj;
            u.Pause(true);
            u.AnimeId(17);
            GroupEnumUnitsInRange(tmp_group,x,y,500,function GroupIsFZW);     
            while(FirstOfGroup(tmp_group)!=null){
                mj=Units.Get(FirstOfGroup(tmp_group));
                GroupRemoveUnit(tmp_group,mj.unit);
                if(mj.aid=='A07B'&&mj.aidindex==666){
                    mj.aidindex=0;
                    mj.SetData(mj.Data()+200);
                } 
            }
            GroupClear(tmp_group); 
            /*
                火阵强化 
            */  
            Units.MJ(u.player.player,'e008','A07I',0,x,y,0,3,1,1, "stand","by_wood_effect_yuzhiboyou_fire_babangouyu_1_kong.mdl").SetH(150);
            Units.MJ(u.player.player,'e008','A07I',0,x,y,0,3,2.5,1, "stand","chushou_by_wood_effect_fire_flamecrack.mdl");
            Units.MJ(u.player.player,'e008','A07I',0,x,y,0,3,1,1, "stand","boom-huo.mdl");
            GroupEnumUnitsInRange(tmp_group,x,y,500,function GroupIsAliveNotAloc);     
            while(FirstOfGroup(tmp_group)!=null){
                mj=Units.Get(FirstOfGroup(tmp_group));
                GroupRemoveUnit(tmp_group,mj.unit);
                if(IsUnitEnemy(mj.unit,u.player.player)==true){  
                    Effect.ToUnit("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",mj.unit,"chest").Destroy();
                    Buffs.Add(mj.unit,'A07J','B02J',3,false).Type=Buffs.TYPE_SUB+Buffs.TYPE_DISPEL_TRUE;        
                    u.Damage(mj.unit,Damage.Magic,'A07I',u.Agi(true)*20);     
                    XN.FIRE_BOOM(u.unit,mj.unit);
                } 
            }
            GroupClear(tmp_group); 
            data.c[0]=u;
            data.c[1]=e;
            data.r[0]=3;//地面火焰的持续时间
            data.r[1]=0;//按住F的持续时间
            data.r[2]=x;//中心点
            data.r[3]=y;//中心点
            data.r[4]=0;//伤害/特效间隔 0.3s
            data.r[5]=0;//特效旋转角度
            data.i[0]=1;//处于第一次硬直
            Timers.Start(0.01,data,function(Timers t){
                Data data=Data(t.Data());
                Units u=Units(data.c[0]);
                integer xy=0,i;
                real x=data.r[2],y=data.r[3];
                Units mj;
                if(data.r[0]<=0){
                    //BJDebugMsg("火碎-地面结束");
                    if(data.i[0]==1){
                        
                        //BJDebugMsg("火碎-眩晕至结束");
                        u.AnimeId(18);
                        u.DelayReleaseAnimePause(0.3);
                    }
                    data.Destroy();
                    t.Destroy();
                }else{
                    data.r[0]-=0.01;
                    data.r[1]+=0.01;
                    if(u.player.press.F==true){
                        if(data.i[0]==1){//没松开过F 
                            if(u.IsTimeStop()==false){ 
                                xy=1;//按住了F，眩晕
                            }
                        }
                    }else{
                        if(data.i[0]==1){
                            //BJDebugMsg("松开F");
                            u.AnimeId(18);
                            u.DelayReleaseAnimePause(0.3);
                            data.i[0]=0;
                            if(data.r[1]<=0.3){
                                //BJDebugMsg("小于0.3秒，提前结束火碎");
                                data.r[0]=0;
                                Units.MJ(u.player.player,'e008','A07I',0,x,y,0,3,1.5,1, "death","Abilities\\Spells\\Other\\Doom\\DoomDeath.mdl");                  
                                Util.Duang(x,y,0.5,500,500,-120,0.05,100);    
                                GroupEnumUnitsInRange(tmp_group,x,y,500,function GroupIsAliveNotAloc);     
                                while(FirstOfGroup(tmp_group)!=null){
                                    mj=Units.Get(FirstOfGroup(tmp_group));
                                    GroupRemoveUnit(tmp_group,mj.unit);
                                    if(IsUnitEnemy(mj.unit,u.player.player)==true){  
                                        Buffs.Skill(mj.unit,'A075',1);
                                        HitFlys.Add(mj.unit,25);
                                        Dash.Start(mj.unit,Util.XYEX(x,y,mj.X(),mj.Y()),600-Util.XY2EX(x,y,mj.X(),mj.Y()),Dash.SUB,30,true,false); 
                                        Effect.ToUnit("orboffire.mdl",mj.unit,"chest").Destroy(); 
                                        u.Damage(mj.unit,Damage.Chaos,'A07I',u.Agi(true)*3);     
                                         
                                    } 
                                }
                                GroupClear(tmp_group); 
                            }
                        } 
                    }
                    if(data.r[4]<=0){
                        data.r[4]=0.3; 
                        /*
                            地面灼烧伤害
                        */
                        GroupEnumUnitsInRange(tmp_group,x,y,500,function GroupIsAliveNotAloc);     
                        while(FirstOfGroup(tmp_group)!=null){
                            mj=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,mj.unit);
                            if(IsUnitEnemy(mj.unit,u.player.player)==true){  
                                if(xy==1){ 
                                    Buffs.Skill(mj.unit,'A00W',1);
                                    if(Util.XY2EX(x,y,mj.X(),mj.Y())<200){
                                        Dash.Start(mj.unit,Util.XYEX(x,y,mj.X(),mj.Y()),300,Dash.SUB,20,true,false); 
                                    }else{
                                        Dash.Start(mj.unit,Util.XYEX(mj.X(),mj.Y(),x,y),300,Dash.SUB,20,true,false); 
                                    }
                                    if(data.r[1]>=2){
                                        XN.FIRE_ADD(mj.unit);
                                    }
                                }  
                                Effect.ToUnit("orboffire.mdl",mj.unit,"chest").Destroy(); 
                                u.Damage(mj.unit,Damage.Chaos,'A07I',u.Agi(true)*1);      
                            } 
                        }
                        GroupClear(tmp_group); 
                        for(0<i<=4){
                            mj=Units.MJ(u.player.player,'e008','A07I',0,x+50*CosBJ(i*90+data.r[5]),y+50*SinBJ(i*90+data.r[5]),i*90+data.r[5],3,GetRandomReal(2.5,3.5),1, "death","orboffire.mdl");
                            mj.SetH(50);
                            Dash.Start(mj.unit,mj.F(),600,Dash.SUB,25,true,false).onMove=function(Dash dash){
                                dash.Angle+=GetRandomReal(5,7);
                                Units.Get(dash.Unit).SetF(dash.Angle,true);
                            }; 
                        }
                        Units.MJ(u.player.player,'e008','A07I',0,x,y,0,3,1.4,1, "stand","chushou_by_wood_effect_fire_flamecrack.mdl"); 
                        data.r[5]+=15; 
                    }else{
                        data.r[4]-=0.01;
                    }
                    
                }
            });
        }

        static method R(Spell e){
            Units u=Units.Get(e.Spell);
            Data data=Data.create('A07F');
            HitFlys h;
            Units mj;
            u.Pause(true);
            u.AnimeId(13);
            u.AnimeSpeed(2);
            Units.MJ(u.player.player,'e008','A07F',0,u.X()+50*CosBJ(e.Angle),u.Y()+50*SinBJ(e.Angle),0,3,1,1, "death","orboffire.mdl").SetH(50);
            //Util.Range(u.X()+100*CosBJ(e.Angle),u.Y()+100*SinBJ(e.Angle),100);
            GroupEnumUnitsInRange(tmp_group,u.X()+150*CosBJ(e.Angle),u.Y()+150*SinBJ(e.Angle),175,function GroupIsAliveNotAloc);     
            while(FirstOfGroup(tmp_group)!=null){
                mj=Units.Get(FirstOfGroup(tmp_group));
                GroupRemoveUnit(tmp_group,mj.unit);
                if(IsUnitEnemy(mj.unit,u.player.player)==true){  
                    Buffs.Skill(mj.unit,'A075',1);
                    Dash.Start(mj.unit,e.Angle,350,Dash.SUB,30,true,false); 
                    HitFlys.Add(mj.unit,45);
                    Effect.ToUnit("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",mj.unit,"chest").Destroy();
                                
                    XN.FIRE_ADD(mj.unit);
                } 
            }
            GroupClear(tmp_group); 
            data.c[0]=u;
            data.c[1]=e;
            data.c[2]=Effect.ToUnit("orboffire.mdl",u.unit,"weapon"); 
            data.r[0]=0.317;//0.634 2倍速 空中判定的时间
            data.i[0]=0;
            Dash.Start(u.unit,e.Angle,300,Dash.SUB,30,true,false); 
            h=HitFlys.Add(u.unit,40);
            h.Obj=data;
            HitFlys.Lister(h,HitFlys.onRemove,function(HitFlys h){
                Data data=Data(h.Obj);
                Units u=Units(data.c[0]);
                if(data.i[0]==0){ 
                    Timers.Start(0.1,u,function(Timers t){ 
                        HitFlys.Add(Units(t.Data()).unit,-10); 
                        t.Destroy();
                    });
                    u.AnimeId(3);
                    u.DelayReleaseAnimePause(0.5);
                    Spell(data.c[1]).Destroy();
                    Effect(data.c[2]).Destroy(); 
                    data.Destroy();
                }
            });
            HitFlys.Lister(h,HitFlys.onDown,function(HitFlys h){
                Data data=Data(h.Obj);
                Units u=Units(data.c[0]);
                if(u.Alive()==true){
                    data.i[0]=1;
                    HitFlys.Remove(u.unit);
                    HitFlys.Add(u.unit,10); 
                    Dash.Start(u.unit,u.F(),100,Dash.SUB,10,true,false); 
                    u.AnimeId(14);
                    u.AddAbility('A07G');
                    Timers.Start(0.01,data,function(Timers t){
                        Data data=Data(t.Data());
                        Units u=Units(data.c[0]);
                        Units mj;
                        HitFlys h;
                        real x,y;
                        if(u.Alive()==true){
                            if(u.IsTimeStop()==false){
                                if(data.r[0]<=0){//未中断，登龙！
                                    u.RemoveAbility('A07G');
                                    x=u.X()+75*CosBJ(u.F());
                                    y=u.Y()+75*SinBJ(u.F());
                                    Units.MJ(u.player.player,'e009','A07F',0,x,y,0,3,3,1.5, "birth","dg1.mdl").SetH(850);
                                    Units.MJ(u.player.player,'e00D','A07F',0,x,y,0,3,1,2, "death","Abilities\\Spells\\Other\\Doom\\DoomDeath.mdl").SetH(1100);   
                                    mj=Units.MJ(u.player.player,'e008','A07F',0,x,y,0,3,2,1, "birth","orboffire.mdl");
                                    mj.SetH(650);
                                    h=HitFlys.Add(mj.unit,-30);
                                    HitFlys.Lister(h,HitFlys.onEnd,function(HitFlys h){//掉地上出判定
                                        Units u=Units.Get(h.Unit);
                                        integer i,s;
                                        Units mj;
                                        real x=u.X(),y=u.Y(),f=u.player.hero.F();
                                    
                                        if(u.player.hero.Alive()==true){
                                            s=0;
                                            //Util.Range(x,y,150);
                                            GroupEnumUnitsInRange(tmp_group,x,y,150,function GroupIsAliveNotAloc);     
                                            while(FirstOfGroup(tmp_group)!=null){
                                                mj=Units.Get(FirstOfGroup(tmp_group));
                                                GroupRemoveUnit(tmp_group,mj.unit);
                                                if(IsUnitEnemy(mj.unit,u.player.player)==true){  
                                                    u.Damage(mj.unit,Damage.Chaos,'A07F',u.Agi(true)*15);     
                                                    Dash.Start(mj.unit,f,150,Dash.SUB,20,true,false);
                                                    Effect.ToUnit("orboffire.mdl",mj.unit,"chest").Destroy(); 
                                                    //XN.FIRE_BOOM(u.unit,mj.unit);
                                                    Buffs.Skill(mj.unit,'A00W',1);
                                                    s+=1;
                                                } 
                                            }
                                            GroupClear(tmp_group); 
                                            if(s!=0){
                                                for(1<=i<=9){
                                                    Units.MJ(u.player.player,'e008','A07F',0,x,y,60*i,2,2.5,1, "stand","fire-hit-kulouwang.mdl").SetH(i*100);
                                                }
                                            } 
                                        } 
                                        u.Anime("death");
                                    });
                                    HitFlys.Remove(u.unit);
                                    HitFlys.Lister(HitFlys.Add(u.unit,-50),HitFlys.onEnd,function(HitFlys h){
                                        Units u=Units.Get(h.Unit);
                                        u.DelayReleaseAnimePause(0.5);
                                    });
                                    
                           
                                    Spell(data.c[1]).Destroy();
                                    Effect(data.c[2]).Destroy();
                                    data.Destroy();
                                    t.Destroy();
                                }else{ 
                                    if(u.IsAbility('A07G')==false){//中断，转为火碎
                                        /*
                                            火碎处理
                                        */
                                        x=u.X(),y=u.Y();
                                        Units.MJ(u.player.player,'e008','A07I',0,x,y,0,3,1.5,1, "stand","az_kaer_t1.mdl"); 
                                         
                                        HitFlys.Add(u.unit,-50);
                                        GroupEnumUnitsInRange(tmp_group,x,y,500,function GroupIsAliveNotAloc);     
                                        while(FirstOfGroup(tmp_group)!=null){
                                            mj=Units.Get(FirstOfGroup(tmp_group));
                                            GroupRemoveUnit(tmp_group,mj.unit);
                                            if(IsUnitEnemy(mj.unit,u.player.player)==true){  
                                                Buffs.Skill(mj.unit,'A075',1);  
                                                u.Damage(mj.unit,Damage.Chaos,'A07I',u.Agi(true)*7);   
                                                Dash.Start(mj.unit,Util.XY(mj.unit,u.unit),Util.XY2(mj.unit,u.unit),Dash.SUB,25,true,false);   
                                            } 
                                        }
                                        GroupClear(tmp_group); 
                            
                                        u.SetAbilityCD('A07F',u.GetAbilityCD('A07F')*0.3);
                                        u.Pause(false);
                                        u.AnimeSpeed(1);
                                        Spell(data.c[1]).Destroy();
                                        Effect(data.c[2]).Destroy();
                                        t.Destroy();
                                        data.Destroy();
                                    }else{ 
                                        data.r[0]-=0.01;
                                    }
                                }
                            }
                        }else{
                            
                            //BJDebugMsg("蓄力结束");
                            HitFlys.Add(u.unit,-10); 
                            u.Pause(false);
                            u.AnimeSpeed(1);
                            Spell(data.c[1]).Destroy();
                            Effect(data.c[2]).Destroy();
                            t.Destroy();
                            data.Destroy();
                        }
                    });
                }else{
                    //BJDebugMsg("上挑结束");
                    u.Pause(false);
                    u.AnimeSpeed(1);
                    Spell(data.c[1]).Destroy();
                    Effect(data.c[2]).Destroy();
                    data.Destroy();
                }
                
            });
        }

        static method Attack(DamageArgs e){
            if(e.DamageType==Damage.Attack){
                if(e.DamageUnit.IsAbility('B02G')==true){
                    Dash.Start(e.TriggerUnit.unit,Util.XY(e.DamageUnit.unit,e.TriggerUnit.unit),50,Dash.SUB,20,true,true);
                    Effect.ToUnit("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",e.TriggerUnit.unit,"chest").Destroy();
                                
                }
            }
        }

        static method E1(Units u){
            Buffs b;
            Units mj;
            if(u.IsAbility('B02H')==true){ 
                SpellNameText(u.unit,"! 火阵引爆 !",3,15); 
                b=Buffs.Find(u.unit,'B02H');
                b.Level=0;
                mj=Units(b.Obj); 
                b.Stop();
                u.Pause(true);
                u.AnimeId(11);
                u.AnimeSpeed(2);
                u.DelayReleaseAnimePause(0.4);
                u.SetF(Util.XY(u.unit,mj.unit),true);
                mj.SetData(-10);
            }
        }

        static method E(Spell e){
            Units u=Units.Get(e.Spell);
            Data data=Data.create('A07B');
            Units mj;
            real x=u.X(),y=u.Y();
            u.FlushAnimeId(5); 
            Units.MJ(u.player.player,'e008','A07B',0,e.X,e.Y,0,3,1,1, "stand","!huobao.mdl");
            mj=Units.MJ(u.player.player,'e008','A07B',666,e.X,e.Y,0,86400,1,1, "stand",".mdl");
            mj.SetData(500);//5/0.01,5秒    
            mj.Position(e.X,e.Y,true);
            mj.AddAbility(Units.MJType_FZW);
            Buffs.Add(u.unit,'A07E','B02H',3,false).Obj=mj;
            data.c[0]=u;
            data.c[1]=e;
            data.c[2]=mj;//火阵本体
            mj=Units.MJ(u.player.player,'e008','A07B',0,e.X,e.Y,0,86400,1,3, "stand","orboffire.mdl");
            mj.SetH(100);
            mj.Alpha(0);
            data.c[3]=mj;//外圈环绕
            mj=Units.MJ(u.player.player,'e008','A07B',0,e.X,e.Y,0,86400,1,3, "stand","orboffire.mdl");
            mj.SetH(100);
            mj.Alpha(0);
            data.c[4]=mj;//内圈环绕
            mj=Units.MJ(u.player.player,'e008','A07B',0,e.X+500*CosBJ(0),e.Y+500*SinBJ(0),0,86400,1,1, "stand","orboffire.mdl");
            mj.SetH(100);
            mj.Alpha(0);
            data.c[5]=mj;//五角星环绕
            data.r[0]=0.5;//伤害/减速间隔
            data.r[1]=0.07;//五角星间隔
            data.r[2]=0;//五角星角度
            data.r[3]=0;//五角星旋转角度
            Timers.Start(0.01,data,function(Timers t){
                Data data=Data(t.Data());
                Units u=Units(data.c[0]);
                Units fz=Units(data.c[2]);
                Units mj; 
                integer i;
                real x=fz.X(),y=fz.Y();
                if(fz.Data()<=0){
                    if(fz.Data()==-10){//被引爆了
                        //Units.MJ(u.player.player,'e008','A07B',0,x,y,0,3,2,1, "stand","Abilities\\Spells\\Other\\Doom\\DoomDeath.mdl");   
                        Units.MJ(u.player.player,'e008','A07B',0,x,y,0,3,2,1, "stand","fire-boom-new.mdl");   
                        Units.MJ(u.player.player,'e008','A07B',0,x,y,GetRandomReal(0,360),3,2.5,1, "stand","chushou_by_wood_effect_fire_flamecrack.mdl");   
                        GroupEnumUnitsInRange(tmp_group,x,y,500,function GroupIsAliveNotAloc);     
                        while(FirstOfGroup(tmp_group)!=null){
                            mj=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,mj.unit);
                            if(IsUnitEnemy(mj.unit,u.player.player)==true){  
                                Buffs.Skill(mj.unit,'A07K',1);
                                u.Damage(mj.unit,Damage.Chaos,'A07B',u.Agi(true)*10);    
                                Dash.Start(mj.unit,Util.XYEX(x,y,mj.X(),mj.Y()),600-Util.XY2EX(x,y,mj.X(),mj.Y()),Dash.SUB,30,true,false); 
                                HitFlys.Add(mj.unit,15);
                                Effect.ToUnit("orboffire.mdl",mj.unit,"chest").Destroy(); 
                                XN.FIRE_BOOM(u.unit,mj.unit);
                            } 
                        }
                        GroupClear(tmp_group); 
                        Util.Duang(x,y,0.3,500,500,-168,0.1,250);
                        if(u.GetAbilityCD('A07B')!=0){//火阵冷却-50%
                            u.SetAbilityCD('A07B',u.GetAbilityCD('A07B')*0.5);
                        }
                        if(u.GetAbilityCD('A07I')!=0){//火碎冷却-50%
                            u.SetAbilityCD('A07I',u.GetAbilityCD('A07I')*0.5);
                        } 
                    } 
                    fz.Anime("death");
                    fz.Life(5);
                    Units.MJ(u.player.player,'e008','A07B',0,x,y,0,3,3,1, "death","orboffire.mdl").SetH(50); 
                    Units.MJ(u.player.player,'e008','A07B',0,x,y,120,3,3,1, "death","orboffire.mdl").SetH(50); 
                    Units.MJ(u.player.player,'e008','A07B',0,x,y,240,3,3,1, "death","orboffire.mdl").SetH(50);
            
                    Units(data.c[3]).Anime("death");
                    Units(data.c[3]).Life(5); 
                    Units(data.c[3]).Position(x,y,false);
                    Units(data.c[4]).Anime("death");
                    Units(data.c[4]).Life(5);   
                    Units(data.c[4]).Position(x,y,false);
                    Units(data.c[5]).Anime("death");
                    Units(data.c[5]).Life(5);  
                    Units(data.c[5]).Position(x,y,false);
                    Spell(data.c[1]).Destroy();
                    data.Destroy();
                    t.Destroy();
                }else{
                    fz.SetData(fz.Data()-1);
                    mj=Units(data.c[3]);
                    mj.Position(x+500*CosBJ(Util.XY(fz.unit,mj.unit)+7),y+500*SinBJ(Util.XY(fz.unit,mj.unit)+7),false);
                    mj=Units(data.c[4]);
                    mj.Position(x+500*CosBJ(Util.XY(fz.unit,mj.unit)-7),y+500*SinBJ(Util.XY(fz.unit,mj.unit)-7),false);
                    mj=Units(data.c[5]); 
                    mj.Position(x+500*CosBJ(data.r[2]+data.r[3]),y+500*SinBJ(data.r[2]+data.r[3]),false);
                    data.r[1]-=0.01;
                    data.r[0]-=0.01;
                    data.r[3]+=0.3; 
                    if(data.r[0]<=0){//减速/伤害间隔
                        data.r[0]=0.5;
                        GroupEnumUnitsInRange(tmp_group,x,y,500,function GroupIsAliveNotAloc);     
                        while(FirstOfGroup(tmp_group)!=null){
                            mj=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,mj.unit);
                            if(IsUnitEnemy(mj.unit,u.player.player)==true){  
                                Buffs.Add(mj.unit,'A07C','B02F',0.5,false).Type=Buffs.TYPE_SUB+Buffs.TYPE_DISPEL_TRUE;
                                if(fz.aidindex==0){
                                    u.Damage(mj.unit,Damage.Magic,'A07B',mj.MaxHP()*0.005);    
                                    Effect.ToUnit("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",mj.unit,"chest").Destroy(); 
                                   
                                }
                            }
                            if(mj.IsAbility('A07B')==true){
                                Buffs.Add(mj.unit,'A07D','B02G',0.5,false);
                            }
                        }
                        GroupClear(tmp_group);
                        
                    }
                    if(data.r[1]<=0){
                        if(fz.aidindex==0){ 
                            for(0<i<=10){
                                Effect.To("Abilities\\Spells\\Orc\\LiquidFire\\Liquidfire.mdl",x+GetRandomReal(0,450)*CosBJ(GetRandomReal(0,360)),y+GetRandomReal(0,450)*SinBJ(GetRandomReal(0,360))).Delay(0.2);
                            }
                        }
                        data.r[1]=0.07;
                        data.r[2]+=144;
                    }
                }
            });
        }

        static method W(Spell e){
            Units u=Units.Get(e.Spell);
            Data data=Data.create('A077');
            Dash dash;
            Units mj;
            real x=u.X(),y=u.Y();
            data.c[0]=u;
            data.c[1]=e;
            if(u.player.press.W==false){//咿呀!
            
                u.Pause(true);
                u.AnimeId(23);
                Units.MJ(u.player.player,'e009','A077',0,x+200*CosBJ(e.Angle),y+200*SinBJ(e.Angle),e.Angle,3,1.5,1, "death","Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl").SetH(100);               
                Units.MJ(u.player.player,'e009','A077',0,x+200*CosBJ(e.Angle),y+200*SinBJ(e.Angle),e.Angle+180,3,1,3.5, "stand","white-qiquan-new.mdl").SetH(100);               
                Units.MJ(u.player.player,'e009','A077',0,x+150*CosBJ(e.Angle),y+150*SinBJ(e.Angle),e.Angle,3,0.75,1, "stand","red-lizi-zhendi-fast_ex.mdl").SetH(100);               
                dash=Dash.Start(u.unit,e.Angle,100,Dash.NORMAL,7.69,true,false);
                dash.Obj=data;
                data.i[0]=0;//判定标记
                data.i[1]=0;//是否戳到人
                dash.onMove=function(Dash dash){
                    Data data=Data(dash.Obj);
                    Units u=Units(data.c[0]);
                    Units mj;
                    if(data.i[0]==0){
                        data.i[0]=1; 
                        //-------近处判定2
                        //Util.Range(dash.X+75*CosBJ(dash.Angle),dash.Y+75*SinBJ(dash.Angle),100);
                        GroupEnumUnitsInRange(tmp_group,dash.X+75*CosBJ(dash.Angle),dash.Y+75*SinBJ(dash.Angle),100,function GroupIsAliveNotAloc);     
                        while(FirstOfGroup(tmp_group)!=null){
                            mj=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,mj.unit);
                            if(IsUnitEnemy(mj.unit,u.player.player)==true){  
                                u.Damage(mj.unit,Damage.Chaos,'A077',u.Agi(true)*10);  
                                Dash.Start(mj.unit,dash.Angle,200,Dash.SUB,15,true,false); 
                                Buffs.Skill(mj.unit,'A00W',1);
                                Effect.ToUnit("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",mj.unit,"chest").Destroy(); 
                                Effect.ToUnit("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",mj.unit,"chest").Destroy();
                                XN.FIRE_ADD(mj.unit);
                                data.i[1]+=1;
                            }  
                        }
                        GroupClear(tmp_group);
                        //------远处判定 
                        //Util.Range(dash.X+250*CosBJ(dash.Angle),dash.Y+250*SinBJ(dash.Angle),75);
                        GroupEnumUnitsInRange(tmp_group,dash.X+250*CosBJ(dash.Angle),dash.Y+250*SinBJ(dash.Angle),75,function GroupIsAliveNotAloc);     
                        while(FirstOfGroup(tmp_group)!=null){
                            mj=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,mj.unit);
                            if(IsUnitEnemy(mj.unit,u.player.player)==true){  
                                u.Damage(mj.unit,Damage.Chaos,'A077',u.Agi(true)*10);  
                                Dash.Start(mj.unit,dash.Angle,100,Dash.SUB,10,true,false); 
                                Buffs.Skill(mj.unit,'A00W',1);
                                Effect.ToUnit("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",mj.unit,"chest").Destroy();
                                
                                Effect.ToUnit("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",mj.unit,"chest").Destroy(); 
                                XN.FIRE_ADD(mj.unit);
                                data.i[1]+=1;
                            }  
                        }
                        GroupClear(tmp_group); 
                    }
                };
                dash.onEnd=function(Dash dash){ 
                    Data data=Data(dash.Obj);
                    Units u=Units(data.c[0]);
                    if(data.i[1]!=0){ 
                        Buffs.Add(u.unit,'A07H','B02I',0.3,false);
                    }
                    u.DelayReleaseAnimePause(0.3);
                    Spell(data.c[1]).Destroy();
                    data.Destroy();
                };
            }else{//咿——呀！
                mj=Units.MJ(u.player.player,'e008','A077',0,x,y,e.Angle,86400,u.modelsize,1, "stand",u.model);
                mj.AnimeId(19);
                mj.AddAbility(TeamTips_Ability_Id[u.player.teamid]);  
                data.c[2]=mj;
                data.c[3]=Effect.ToUnit("buff_fire.mdl",u.unit,"weapon");
                data.r[0]=0.1;//特效间隔
                data.i[0]=0;//是否戳到人
                u.Alpha(0); 
                u.AddAbility('A078');
                SetUnitTurnSpeed(u.unit,0.1);
                dash=Dash.Start(u.unit,u.F(),2400,Dash.NORMAL,15,true,false);                               
                dash.Obj=data;
                dash.onMove=function(Dash dash){
                    Data data=Data(dash.Obj);
                    Units u=Units(data.c[0]);
                    Units ts=Units(data.c[2]);
                    unit k;
                    dash.Angle=u.F();
                    ts.SetF(dash.Angle,true);
                    ts.Position(dash.X,dash.Y,false);
                    if(u.player.press.W==false||u.IsAbility('BPSE')==true){
                        dash.Stop();
                    }else{
                        //戳人判定
                        k=GroupFind(u.unit,dash.X+75*CosBJ(dash.Angle),dash.Y+75*SinBJ(dash.Angle),75,true,false);
                        if(k!=null){
                            data.i[0]=1;
                            k=null;
                            dash.Stop();
                        }
                    }
                    if(data.r[0]<=0){
                        data.r[0]=0.1;
                        Effect.To("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl",dash.X,dash.Y).Destroy();
                    }else{
                        data.r[0]-=0.01;
                    }
                };
                dash.onEnd=function(Dash dash){
                    Data data=Data(dash.Obj);
                    Units u=Units(data.c[0]); 
                    Dash dash1;
                    u.Pause(true);
                    u.AnimeId(23); 
                    u.Alpha(255);  
                    u.RemoveAbility('A078');
                    SetUnitTurnSpeed(u.unit,0.5);
                    Order.To(u.unit,"stop"); 
                    Effect(data.c[3]).Destroy();
                    Units(data.c[2]).Alpha(0);
                    Units(data.c[2]).Life(0.1);
                    Spell(data.c[1]).Destroy();
                    if(data.i[0]==1){//如果戳到人
                        data.r[0]=0;//戳人判定的间隔,0.2
                        data.i[0]=0;//第1次和第4次分开判断
                        Buffs.Add(u.unit,'A07H','B02I',0.8,false);
                        dash1=Dash.Start(u.unit,u.F(),500,Dash.NORMAL,5,true,false);
                        dash1.Obj=data;
                        dash1.onMove=function(Dash dash){
                            Data data=Data(dash.Obj);
                            Units u=Units(data.c[0]);
                            Units mj;
                            real x,y;
                            if(data.i[0]<4){
                                if(data.r[0]<=0){//判定
                                    data.r[0]=0.2;
                                    data.i[0]+=1;
                                    //BJDebugMsg(I2S(data.i[0])+"/WW");
                                    /*
                                        4次判定
                                    */
                                    x=dash.X+75*CosBJ(dash.Angle);
                                    y=dash.Y+75*SinBJ(dash.Angle);
                                    if(data.i[0]<4){ 
                                        if(u.IsAbility('B02I')==true){ 
                                            if(data.i[0]==1){//第一次判定 
                                            
                                                Units.MJ(u.player.player,'e009','A077',0,x,y,dash.Angle,3,1,2, "death","Abilities\\Spells\\Other\\Doom\\DoomDeath.mdl").SetH(100);   
                                                    
                                                GroupEnumUnitsInRange(tmp_group,x,y,100,function GroupIsAliveNotAloc);     
                                                while(FirstOfGroup(tmp_group)!=null){
                                                    mj=Units.Get(FirstOfGroup(tmp_group));
                                                    GroupRemoveUnit(tmp_group,mj.unit);
                                                    if(IsUnitEnemy(mj.unit,u.player.player)==true){  
                                                        u.Damage(mj.unit,Damage.Chaos,'A077',u.Agi(true)*2);  
                                                        Dash.Start(mj.unit,dash.Angle,200,Dash.SUB,20,true,false); 
                                                        Buffs.Skill(mj.unit,'A075',1);
                                                        Effect.ToUnit("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",mj.unit,"chest").Destroy(); 
                                                        Effect.ToUnit("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",mj.unit,"chest").Destroy();
                                                        //XN.FIRE_ADD(mj.unit);
                                                    }  
                                                }
                                                GroupClear(tmp_group);
                                            }   
                                            if(data.i[0]==2){ 
                                                u.AnimeSpeed(0.5);
                                                mj=Units.MJ(u.player.player,'e008','A077',0,x,y,dash.Angle,3,1.5,1, "birth","az_lina_d1.mdl");
                                                mj.SetH(50);
                                                Dash.Start(mj.unit,dash.Angle,100,Dash.NORMAL,10,true,false).onEnd=function(Dash dash){
                                                    Units u=Units.Get(dash.Unit);
                                                    u.Anime("death");
                                                };
                                                dash.MaxSpeed=3;
                                                GroupEnumUnitsInRange(tmp_group,x,y,100,function GroupIsAliveNotAloc);     
                                                while(FirstOfGroup(tmp_group)!=null){
                                                    mj=Units.Get(FirstOfGroup(tmp_group));
                                                    GroupRemoveUnit(tmp_group,mj.unit);
                                                    if(IsUnitEnemy(mj.unit,u.player.player)==true){  
                                                        u.Damage(mj.unit,Damage.Chaos,'A077',u.Agi(true)*2);  
                                                        Dash.Start(mj.unit,dash.Angle,100,Dash.SUB,10,true,false); 
                                                        Buffs.Skill(mj.unit,'A075',1);
                                                        Effect.ToUnit("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",mj.unit,"chest").Destroy(); 
                                                        Effect.ToUnit("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",mj.unit,"chest").Destroy();
                                                        
                                                    }  
                                                }
                                                GroupClear(tmp_group);
                                            }
                                            if(data.i[0]==3){
                                                Units.MJ(u.player.player,'e009','A077',0,dash.X+145*CosBJ(dash.Angle),dash.Y+145*SinBJ(dash.Angle),dash.Angle,3,2.5,1, "death","orboffire.mdl");               
                                                dash.MaxSpeed=1;
                                                GroupEnumUnitsInRange(tmp_group,x,y,100,function GroupIsAliveNotAloc);     
                                                while(FirstOfGroup(tmp_group)!=null){
                                                    mj=Units.Get(FirstOfGroup(tmp_group));
                                                    GroupRemoveUnit(tmp_group,mj.unit);
                                                    if(IsUnitEnemy(mj.unit,u.player.player)==true){  
                                                        u.Damage(mj.unit,Damage.Chaos,'A077',u.Agi(true)*2);  
                                                        Dash.Start(mj.unit,dash.Angle,100,Dash.SUB,10,true,false); 
                                                        Buffs.Skill(mj.unit,'A075',1);
                                                        Effect.ToUnit("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",mj.unit,"chest").Destroy(); 
                                                        Effect.ToUnit("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",mj.unit,"chest").Destroy();
                                                        XN.FIRE_ADD(mj.unit);
                                                    }  
                                                }
                                                GroupClear(tmp_group);
                                                
                                                Buffs.Find(u.unit,'B02I').Level=0;
                                                Buffs.Find(u.unit,'B02I').Stop();
                                            }
                                        }
                                        else{
                                            dash.Stop();
                                        }
                                    }
                                    if(data.i[0]==4){      
                                        Units.MJ(u.player.player,'e009','A077',0,x,y,dash.Angle,3,8,1, "death","Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl").SetH(100);               
                                        mj=Units.MJ(u.player.player,'e008','A077',0,x,y,dash.Angle,3,1.5,2.5, "birth","dg1.mdl");
                                        mj.SetH(100);               
                                        Dash.Start(mj.unit,dash.Angle,300,Dash.SUB,60,true,false);
                                        mj=Units.MJ(u.player.player,'e009','A077',0,x,y,dash.Angle+180,3,1,3.5, "stand","white-qiquan-new.mdl");
                                        mj.SetH(100);
                                        Dash.Start(mj.unit,dash.Angle,500,Dash.SUB,40,true,false);        
                                        Dash.Start(u.unit,dash.Angle,400,Dash.SUB,60,true,false);
                                        GroupEnumUnitsInRange(tmp_group,x+35*CosBJ(dash.Angle),y+35*SinBJ(dash.Angle),130,function GroupIsAliveNotAloc);     
                                        while(FirstOfGroup(tmp_group)!=null){
                                            mj=Units.Get(FirstOfGroup(tmp_group));
                                            GroupRemoveUnit(tmp_group,mj.unit);
                                            if(IsUnitEnemy(mj.unit,u.player.player)==true){  
                                                u.Damage(mj.unit,Damage.Chaos,'A077',u.Agi(true)*2);  
                                                Dash.Start(mj.unit,dash.Angle,400,Dash.SUB,30,true,false); 
                                                HitFlys.Add(mj.unit,19);
                                                Buffs.Skill(mj.unit,'A075',1);
                                                Effect.ToUnit("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",mj.unit,"chest").Destroy(); 
                                                Effect.ToUnit("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",mj.unit,"chest").Destroy();
                                                XN.FIRE_BOOM(u.unit,mj.unit);  
                                            }  
                                        }
                                        GroupClear(tmp_group); 
                                    }
                                }else{
                                    data.r[0]-=0.01;
                                }
                            }else{
                                dash.Stop();
                            }
                        };
                        dash1.onEnd=function(Dash dash){
                            Data data=Data(dash.Obj);
                            Units u=Units(data.c[0]);
                     
                            u.DelayReleaseAnimePause(0.3);
                            Dash.Start(u.unit,dash.Angle,150,Dash.SUB,3.75,true,false); 
                            data.Destroy();
                        };
                    }else{//如果没戳到人 
                        u.DelayReleaseAnimePause(1);
                        Dash.Start(u.unit,u.F(),300,Dash.SUB,15,true,false); 
                        data.Destroy();
                    } 
                };
            }
        }

        static method Q1(Units u){//一文字
            /*
                11 - 一文字
                0.933 前冲
                0.167 判定
            */ 
            Buffs b=Buffs.Find(u.unit,'B02C');
            Data data=Data.create('A074');
            
            SpellNameText(u.unit,"! 一文字 !",3,15); 
            b.Level=0;
            b.Stop();
            u.Pause(true);
            u.AnimeId(12);
            u.AnimeSpeed(2);
            u.SetF(u.F(),true);
            Order.To(u.unit,"stop");
            data.c[0]=u;
            data.c[1]=Effect.ToUnit("buff_fire.mdl",u.unit,"weapon");
            data.r[0]=0.46;//0.93
            data.r[1]=0.16;
            data.i[0]=0;//阶段
            Timers.Start(0.01,data,function(Timers t){
                Data data=Data(t.Data());
                Units u=Units(data.c[0]);
                real x=u.X(),y=u.Y(),f=u.F(),x1,y1;
                integer i,o;
                Units mj;
                if(u.Alive()==false){
                    Effect(data.c[1]).Destroy();
                    u.AnimeSpeed(1);
                    u.Pause(false);
                    t.Destroy();
                    data.Destroy();
                }else{ 
                    if(u.IsTimeStop()==false){
                        if(data.i[0]==0){
                            if(data.r[0]<=0){
                                //前冲
                                data.i[0]=1;
                                u.AnimeSpeed(1);
                                Dash.Start(u.unit,f,100,Dash.SUB,25,true,false);
                                Units.MJ(u.player.player,'e008','A074',0,x+50*CosBJ(f),y+50*SinBJ(f),f,2.5,1.75,1, "stand","az-xiapi_chengse.mdl");
                                GroupEnumUnitsInRange(tmp_group,x+200*CosBJ(f),y+200*SinBJ(f),225,function GroupIsAliveNotAloc);     
                                while(FirstOfGroup(tmp_group)!=null){
                                    mj=Units.Get(FirstOfGroup(tmp_group));
                                    GroupRemoveUnit(tmp_group,mj.unit);
                                    if(IsUnitEnemy(mj.unit,u.player.player)==true){  
                                        u.Damage(mj.unit,Damage.Chaos,'A074',u.Agi(true)*2);  
                                        Dash.Start(mj.unit,f,200,Dash.SUB,40,true,false); 
                                        
                                        Effect.ToUnit("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",mj.unit,"chest").Destroy(); 
                                        XN.FIRE_BOOM(u.unit,mj.unit);  
                                    }  
                                }
                                GroupClear(tmp_group);
                                //判定 
                                //az_lina_d2.mdl
                                for(1<=i<4){
                                    for(1<=o<3){
                                        x1=x+(100*i)*CosBJ(f);
                                        y1=y+(100*i)*SinBJ(f);
                                        Units.MJ(u.player.player,'e009','A074',0,x1+(o*20)*CosBJ(f-60),y1+(o*20)*SinBJ(f-60),f-60,2.5,2,1, "death","Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl").SetH(100);
                                        Units.MJ(u.player.player,'e009','A074',0,x1+(o*20)*CosBJ(f+60),y1+(o*20)*SinBJ(f+60),f+60,2.5,2,1, "death","Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl").SetH(100);
                                
                                    }
                                }  
                            }else{
                                data.r[0]-=0.01;
                            }
                        }else{
                            if(data.r[1]<=0){ 
                                
                                u.DelayReleaseAnimePause(0.4);
                                Effect(data.c[1]).Destroy();
                                t.Destroy();
                                data.Destroy();
                            }else{
                                data.r[1]-=0.01;
                            }
                        }
                    }
                }
            });
        }

        static method Press(player ps,string k){
            Players p=Players.Get(ps);
            Spell e;
            if(k=="Q"){ 
                if(p.hero.IsAbility('B02C')==true&&p.hero.IsPause()==false&&p.hero.IsAbility('BPSE')==false&&p.hero.IsAbility('A078')==false){
                    if(Buffs.Find(p.hero.unit,'B02C').Level==1){ 
                        XN.Q1(p.hero);
                    }
                }
            } 
            if(k=="E"){
                if(p.hero.IsAbility('B02H')==true&&p.hero.IsPause()==false&&p.hero.IsAbility('BPSE')==false&&p.hero.IsTimeStop()==false&&p.hero.IsAbility('A078')==false){
                    if(Buffs.Find(p.hero.unit,'B02H').Level==1){
                        XN.E1(p.hero);
                    }
                }
            }
            if(k=="R"){
                if(p.hero.IsAbility('B02I')==true&&p.hero.IsAbility('BPSE')==false){
                    if(Buffs.Find(p.hero.unit,'B02I').Level==1){
                        if(p.hero.GetAbilityCD('A07F')==0){
                            Buffs.Find(p.hero.unit,'B02I').Level=0;
                            Buffs.Find(p.hero.unit,'B02I').Stop();
                            p.hero.SetAbilityCD('A07F',20);
                            e=Spell.UseSpell(p.hero.unit,'A07F',Spell.SpellState);
                            e.Angle=p.hero.F();
                            XN.R(e);
                        }
                        
                    }
                }
            } 
            if(k=="F"){
                if(p.hero.IsAbility('A07G')==true&&p.hero.IsAbility('BPSE')==false){
                    if(p.hero.GetAbilityCD('A07I')==0){
                        p.hero.RemoveAbility('A07G');
                        p.hero.SetMP(p.hero.MP()-300);
                        p.hero.SetAbilityCD('A07I',30);
                        e=Spell.UseSpell(p.hero.unit,'A07I',Spell.SpellState);
                        XN.F(e);
                    }
                }
            }
        } 

        static method Q(Spell e){
            Units u=Units.Get(e.Spell);
            Data data=Data.create('A074');
            Dash dash;
            u.Pause(true);
            u.AnimeId(22);
            data.c[0]=u;
            data.c[1]=e;
            data.r[0]=0.34;//判定帧
            data.g[0]=CreateGroup();
            //HitFlys.Add(u.unit,10);
            if(u.player.press.D==true){
                XN.D2(u,e.Angle);
            } 
            RunSoundOnUnit(XN.Sound,u.unit);
            Effect.ToUnit("buff_fire.mdl",u.unit,"weapon").Destroy();
            Buffs.Add(u.unit,'A076','B02C',5,false).Level=1;
            dash=Dash.Start(u.unit,e.Angle,150,Dash.SUB,30,true,false);
            dash.Obj=data;
            dash.onMove=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units(data.c[0]); 
                Units mj;
                if(data.r[0]>0){
                    
                    GroupEnumUnitsInRange(tmp_group,dash.X+80*CosBJ(dash.Angle),dash.Y+80*SinBJ(dash.Angle),80,function GroupIsAliveNotAloc);     
                    while(FirstOfGroup(tmp_group)!=null){
                        mj=Units.Get(FirstOfGroup(tmp_group));
                        GroupRemoveUnit(tmp_group,mj.unit);
                        if(IsUnitEnemy(mj.unit,u.player.player)==true){ 
                            if(IsUnitInGroup(mj.unit,data.g[0])==false){ 
                                u.Damage(mj.unit,Damage.Magic,'A074',u.Agi(true)*3);
                                GroupAddUnit(data.g[0],mj.unit);
                                HitFlys.Add(mj.unit,16);
                                Dash.Start(mj.unit,dash.Angle,150,Dash.SUB,10,true,false); 
                                Effect.ToUnit("Abilities\\Weapons\\LordofFlameMissile\\LordofFlameMissile.mdl",mj.unit,"chest").Destroy();
                                Effect.ToUnit("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",mj.unit,"chest").Destroy();
                                XN.FIRE_ADD(mj.unit);
                            } 
                            Buffs.Skill(mj.unit,'A075',1); 
                        }  
                    }
                    GroupClear(tmp_group);
                }
                data.r[0]-=0.01;
            };
            dash.onEnd=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units(data.c[0]); 
                Spell(data.c[1]).Destroy();
                u.DelayReleaseAnimePause(0.15);
                DestroyGroup(data.g[0]);
                data.g[0]=null;
                data.Destroy(); 
            };
        }

        static method FIRE_BOOM(unit ua,unit ma){//由U引爆M身上的火种
            Buffs b;
            Units u=Units.Get(ua),m=Units.Get(ma);  
            Data data;
            if(m.IsAbility('B02B')==true){
                b=Buffs.Find(m.unit,'B02B');
                data=Data.create('A073');
                data.c[0]=u;
                data.c[1]=m;
                data.i[0]=b.Level;
                data.r[0]=10;//击飞高度
                data.r[1]=0.3;//爆炸间隔
                b.Stop();
                Timers.Start(0.1,data,function(Timers t){
                    Data data=Data(t.Data());
                    Units u=Units(data.c[0]);
                    Units m=Units(data.c[1]);
                    if(m.Alive()==false||data.i[0]<=0){
                        t.Destroy();
                        data.Destroy();
                    }else{
                        t.SetTime(data.r[1]);
                        data.i[0]-=1;
                        Buffs.Skill(m.unit,'A00A',1); 
                        u.Damage(m.unit,Damage.Chaos,'A073',u.Agi(true)*2); 
                        if(u.GetAbilityCD('A074')!=0){//减少上挑冷却
                            u.SetAbilityCD('A074',u.GetAbilityCD('A074')-1);
                        }
                        if(u.GetAbilityCD('A077')!=0){//减少咿呀冷却
                            u.SetAbilityCD('A077',u.GetAbilityCD('A077')-1);
                        }
                        if(u.GetAbilityCD('A07F')!=0){//减少飞焰冷却
                            u.SetAbilityCD('A07F',u.GetAbilityCD('A07F')-1);
                        }
                        if(u.GetAbilityCD('A07I')!=0){//减少火碎冷却
                            u.SetAbilityCD('A07I',u.GetAbilityCD('A07I')-1);
                        }
                        //视觉效果
                        HitFlys.Add(m.unit,data.r[0]);
                        //Dash.Start(m.unit,GetRandomReal(0,360),100,Dash.SUB,10,true,false);
                        Effect.ToUnit("Abilities\\Spells\\Items\\AIfb\\AIfbSpecialArt.mdl",m.unit,"chest").Destroy();
                        Effect.ToUnit("by_wood_effect_yuzhiboyou_fire_fengxianhuo_2.mdl",m.unit,"chest").Destroy();
                        
                        data.r[0]+=10;
                        data.r[1]+=0.15;
                    }
                });
            }
        }

        //'A073','B02B' 火种
        static method FIRE_ADD(unit u){//给目标单位添加火种
            Buffs b;
            b=Buffs.Add(u,'A073','B02B',86400,false);
            b.Type=Buffs.TYPE_SUB+Buffs.TYPE_DISPEL_TRUE;
            b.onFlush=function(Buffs b){
                if(b.Level<3){ 
                    b.Level+=1;
                }
            };
                            
        }

        static method D2(Units u,real angle){
            Data data=Data(u.Obj);
            Units mj;
            Dash dash;
            Units tmp;
            if(GroupNumber(data.g[0])!=0){
                mj=Units.Get(GroupFirst(data.g[0])); 
                GroupRemoveUnit(data.g[0],mj.unit);  
                SpellNameText(u.unit,"红莲之爆炎",3,10); 
                mj.Position(u.X(),u.Y(),true);
                mj.AddAbility(Units.MJType_TSW);
                mj.Model("by_wood_effect_yuzhiboyou_fire_haohuoqiu.mdl");
                mj.Anime("birth");
                mj.SetF(angle,true); 
                /*
                    击退判定
                */
                //Util.Range(u.X()+170*CosBJ(angle),u.Y()+170*SinBJ(angle),200);
                GroupEnumUnitsInRange(tmp_group,u.X()+170*CosBJ(angle),u.Y()+170*SinBJ(angle),200,function GroupIsAliveNotAloc);     
                while(FirstOfGroup(tmp_group)!=null){
                    tmp=Units.Get(FirstOfGroup(tmp_group));
                    GroupRemoveUnit(tmp_group,tmp.unit);
                    if(IsUnitEnemy(tmp.unit,u.player.player)==true){  
                        HitFlys.Add(tmp.unit,12.5);
                        Dash.Start(tmp.unit,angle,950,Dash.SUB,30,true,true);  
                        Effect.ToUnit("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",tmp.unit,"chest").Destroy();

                    }  
                }
                GroupClear(tmp_group);
                HitFlys.Add(mj.unit,20);
                dash=Dash.Start(mj.unit,angle,1100,Dash.SUB,75,true,false);
                dash.onMove=function(Dash dash){
                    Units u=Units.Get(dash.Unit);
                    if(u.H()<=50){
                        dash.Stop();
                    }
                };  
                dash.onEnd=function(Dash dash){
                    Units u=Units.Get(dash.Unit);
                    Units tmp;
                    /*
                        伤害判定
                    */
                    //Units.MJ(u.player.player,'e008','A072',0,dash.X,dash.Y,dash.Angle,3,0.7,1, "death","by_wood_effect_yuzhiboyou_fire_babangouyu_2_di__ex.mdl");
                    //Util.Range(u.X(),u.Y(),325);
                    GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),300,function GroupIsAliveNotAloc);     
                    while(FirstOfGroup(tmp_group)!=null){
                        tmp=Units.Get(FirstOfGroup(tmp_group));
                        GroupRemoveUnit(tmp_group,tmp.unit);
                        if(IsUnitEnemy(tmp.unit,u.player.player)==true){  
                            Effect.ToUnit("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",tmp.unit,"chest").Destroy();
                            Buffs.Skill(tmp.unit,'A075',1);
                            u.Damage(tmp.unit,Damage.Magic,'A072',u.Agi(true)*5);
                            HitFlys.Add(tmp.unit,25);
                            Dash.Start(tmp.unit,Util.XY(u.unit,tmp.unit),200,Dash.SUB,55,true,false);  
                        }  
                    }
                    GroupClear(tmp_group);
                    Units.MJ(u.player.player,'e008','A072',0,dash.X,dash.Y,dash.Angle,5,2,2, "stand","chushou_by_wood_effect_flame_explosion_2.mdl");
                    u.Anime("death");
                    u.Life(10);
                };
            } 
        }

        static method D1(Units u,real disx,real disy){
            Data data=Data(u.Obj);
            Units mj;
            real f,dis,x=u.X()+disy*CosBJ(disx),y=u.Y()+disy*SinBJ(disx);
            Dash dash;
            if(GroupNumber(data.g[0])!=0){
                
                SpellNameText(u.unit,"飞炎",3,10); 
                mj=Units.Get(GroupFirst(data.g[0]));
                GroupRemoveUnit(data.g[0],mj.unit);
                mj.Position(mj.X(),mj.Y(),true);
                mj.AddAbility(Units.MJType_TSW);
                f=Util.XYEX(mj.X(),mj.Y(),x,y);
                dis=Util.XY2EX(mj.X(),mj.Y(),x,y);
                dash=Dash.Start(mj.unit,f,dis+200,Dash.SUB,60,true,false);
                dash.onMove=function(Dash dash){
                    Units u=Units.Get(dash.Unit);
                    unit k=null; 
                    Buffs b;
                    if(dash.Speed<3){
                        dash.Stop();
                        Units.MJ(u.player.player,'e009','A072',0,dash.X,dash.Y,dash.Angle,2.5,1.5,1, "death","Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl").SetH(100);
                    
                    }else{
                        k=GroupFind(u.unit,dash.X+25*CosBJ(dash.Angle),dash.Y+25*SinBJ(dash.Angle),100,true,false);
                        if(k!=null){
                            u.Damage(k,Damage.Chaos,'A072',u.Agi(true)*2);
                            Dash.Start(k,dash.Angle,100,Dash.SUB,10,true,true);
                            XN.FIRE_ADD(k);
                            Units.MJ(u.player.player,'e008','A072',0,dash.X,dash.Y,dash.Angle,2,2.5,1, "stand","fire-hit-kulouwang.mdl");
                            k=null; 
                            dash.Stop();
                        }
                    }
                };
                dash.onEnd=function(Dash dash){
                    Units u=Units.Get(dash.Unit);
                                        
                    u.Anime("death"); 
                    u.Life(1.5);
                };
            }
        }

        static method Spawn(Units u,Units m){
            Data data;
            if(u.IsAbility('A072')==true){
                //是傻娜
                data=Data.create('A072');
                data.c[0]=u;
                data.g[0]=CreateGroup();//红莲单位组
                data.r[0]=5;//红莲刷新间隔
                data.r[1]=0;//旋转角度
                u.Obj=data;
                //BJDebugMsg("来了");
                Timers.Start(0.01,data,function(Timers t){
                    Data data=Data(t.Data());
                    Units u=Units(data.c[0]);
                    Units mj;
                    real x=u.X(),y=u.Y(),f,a=0;
                    if(u.Alive()==true){
                        if(u.IsAbility('A078')==true){
                            if(data.u[0]!=null){ 
                                Units.Kill(data.u[0]); 
                                data.u[0]=null; 
                            }
                        }else{
                            if(data.u[0]==null){
                                data.u[0]=Units.MJ(u.player.player,'e00P','A072',0,0,0,0,86400,1,1,"two",".mdl").unit;
                            }
                        }
                        if(data.r[0]<=0){ 
                            data.r[0]=5; 
                            if(GroupNumber(data.g[0])<2){
                                mj=Units.MJ(u.player.player,'e008','A072',0,u.X(),u.Y(),0,86400,1.25,1, "stand","Abilities\\Weapons\\LordofFlameMissile\\LordofFlameMissile.mdl");
                                mj.SetH(100);
                                mj.Alpha(0);
                                GroupAddUnit(data.g[0],mj.unit);
                            } 
                        }else{
                            if(u.IsTimeStop()==false){
                                data.r[0]-=0.01; 
                                data.r[1]+=3;
                                if(data.r[1]>360){
                                    data.r[1]=0;
                                }
                            }
                        }
                        GroupAddGroup(data.g[0],tmp_group);  
                        while(FirstOfGroup(tmp_group)!=null){
                            mj=Units.Get(FirstOfGroup(tmp_group));  
                            GroupRemoveUnit(tmp_group,mj.unit);  
                            mj.Position(x+150*CosBJ(a+data.r[1]),y+150*SinBJ(a+data.r[1]),false); 
                            mj.SetF(Util.XY(mj.unit,u.unit),true);
                            mj.SetH(u.H()+75);
                            a+=180;
                        }
                        GroupClear(tmp_group);
                    }else{
                        //BJDebugMsg("没了");
                        if(data.u[0]!=null){
                            Units.Kill(data.u[0]);
                            data.u[0]=null;
                        }
                        GroupAddGroup(data.g[0],tmp_group);  
                        while(FirstOfGroup(tmp_group)!=null){
                            mj=Units.Get(FirstOfGroup(tmp_group));   
                            GroupRemoveUnit(tmp_group,mj.unit); 
                            mj.Anime("death");
                            mj.Life(2.5);
                        }
                        u.Obj=0;
                        GroupClear(tmp_group);
                        DestroyGroup(data.g[0]);
                        data.g[0]=null;
                        data.Destroy();
                        t.Destroy();
                    }
                });
            }
        }

        static method Order(EventArgs e){
            Units u=Units.Get(e.TriggerUnit);   
            if(e.OrderId==Order.Attack){//是A键  
                if(u.IsAbility('A072')==true){//是夏娜 
                    if(u.IsAbility('BPSE')==false){//没眩晕 
                        XN.D1(u,e.OrderAngle,e.OrderDis);  
                    }
                }
            }   
        }

        static method HERO_START(Spell e){
            Units u=Units.Get(e.Spell);
            if(e.Id=='A074'){
                u.FlushAnimeId(21);
            }
            if(e.Id=='A077'){
                u.FlushAnimeId(20);
            }
            if(e.Id=='A07F'){
                u.FlushAnimeId(25);
            } 
            if(e.Id=='A07I'){
                u.FlushAnimeId(16);
            }
            if(e.Id=='A07B'){
                u.FlushAnimeId(9);
                u.AnimeSpeed(0.5);
            }
            e.Destroy();
        } 

        static method HERO_STOP(Spell e){
            Units u=Units.Get(e.Spell);
            if(e.Id=='A07B'){
                u.AnimeSpeed(1);
            }
            e.Destroy();
        }

        static method onInit(){
            Units.On(Units.onHeroSpawn,XN.Spawn);
            XN.Sound= DefineSound("resource\\sound_effect_misc_28.wav",1000, false, true);//Q的攻击
            
            Events.On(Events.onUnitOrderToUnit,XN.Order);
            Events.On(Events.onUnitOrderToLocation,XN.Order); 

            Damage.On(Damage.onUnitDamage_EndDamage,XN.Attack); 
            Press.OnSnyc(Press.onSnycPressKeyDown,XN.Press);
            Spell.On(Spell.onSpell,'A07I',XN.F);    
            Spell.On(Spell.onSpell,'A07F',XN.R);    
            Spell.On(Spell.onSpell,'A07B',XN.E);    
            Spell.On(Spell.onSpell,'A074',XN.Q);    
            Spell.On(Spell.onSpell,'A077',XN.W);    
            Spell.On(Spell.onReady,'A07I',XN.HERO_START); 
            Spell.On(Spell.onReady,'A07F',XN.HERO_START); 
            Spell.On(Spell.onReady,'A074',XN.HERO_START); 
            Spell.On(Spell.onReady,'A077',XN.HERO_START); 
            Spell.On(Spell.onReady,'A07B',XN.HERO_START); 
            Spell.On(Spell.onStop,'A07B',XN.HERO_STOP);  
        }
    }
}