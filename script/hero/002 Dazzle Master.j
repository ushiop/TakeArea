library DazzleMaster requires TimerUtils,Groups,Units{
    //英雄'炫纹大师'技能
    //SR级英雄

    struct DazzleMaster{

        static string DazzlePath[5];
        static string DazzleName[5];

        //攻击3次获得一个无属性炫纹
        static method Attack(DamageArgs e){
            Data data; 
            if(e.DamageUnit.IsAbility('A008')==true&&e.DamageType==Damage.Attack){
                data=Data(e.DamageUnit.Obj); 
                if(data.i[0]==2){
                    data.i[0]=0;
                    DazzleMaster.AddDazzle(e.DamageUnit.unit,0);
                }else{
                    data.i[0]+=1;
                }
            }
        }

        //炫纹死亡
        static method Death(Units u,Units m){
            Data data;
            if(u.aid=='A008'&&u.aidindex>=0&&u.aidindex<=4){
                data=Data(u.Obj);
                GroupRemoveUnit(data.g[0],u.unit); 
                u.RemoveObj(); 
            }
        }

        //为指定单位添加一个炫纹
        static method AddDazzle(unit u,integer id){
            Units s=Units.Get(u);
            Data data=Data(s.Obj);
            Units mj=Units.MJ(s.player.player,'e008','A008',id,s.X(),s.Y(),0,15,1.5,1, "stand",DazzlePath[id]);
            mj.AddObj(data);
            GroupAddUnit(data.g[0],mj.unit); 
        }

        //炫纹大师的AI施法机制
        static method AI(unit ua){
            Units u=Units.Get(ua);
            unit target,no;
            real x=u.X(),y=u.Y();
            real x1,y1;
            target=GroupFind(u.unit,x,y,1000,true);
            if(target!=null){
                x1=GetUnitX(target);
                y1=GetUnitY(target);

                no=GroupFind(u.unit,x,y,200,true);
                if(no!=null){  
                    u.SetF(Util.XY(u.unit,no),true);
                    IssueImmediateOrder( u.unit, "doom" );//落花
                }    


                no=GroupFind(u.unit,x,y,200,true);
                if(no!=null){ 
                    u.SetF(Util.XY(u.unit,no),true);
                    IssueImmediateOrder( u.unit, "charm" );//圆舞棍
                }                

                
                no=GroupFind(u.unit,x,y,300,true);
                if(no!=null){ 
                    x1=GetUnitX(no);
                    y1=GetUnitY(no); 
                    IssuePointOrder(u.unit, "channel",x1,y1);//天击
                }
                
                no=GroupFind(u.unit,x,y,600,true);
                if(no!=null){ 
                    x1=GetUnitX(no);
                    y1=GetUnitY(no); 
                    IssuePointOrder(u.unit, "dispel",x1,y1);//天击
                }
                IssuePointOrder(u.unit, "curse",x1,y1);//炫纹发射
            }
        }

        //炫纹大师被创建时触发,绑定炫纹数据开启计时器
        static method Spawn(Units u,Units m){
            timer t;
            Data data;
            if(u.IsAbility('A008')==true){
                u.ai=DazzleMaster.AI;
                t=NewTimer();
                data=Data.create('A008');
                data.c[0]=u;
                data.r[0]=0;//'炫纹发射'带来的移动速度加成总额
                data.r[1]=0;//'炫纹发射'带来的攻击速度加成总额
                data.r[2]=0;//用于计算炫纹上下浮动的值
                data.i[0]=0;//用于计算无属性炫纹的触发
                data.g[0]=CreateGroup();//炫纹单位组
                data.u[0]=null;//炫纹发射的需求单位
                u.AddObj(data);
                SetTimerData(t,data);
                TimerStart(t,0.01,true,function(){
                    Data data=Data(GetTimerData(GetExpiredTimer()));
                    Units u=Units(data.c[0]);
                    Units tmp;
                    real h=0,x,y,dis,fa,ra;
                    data.r[2]=data.r[2]+1;
                    if(data.r[2]>96) data.r[2]=data.r[2]-96;
                    if(GroupNumber(data.g[0])!=0){
                        if(data.u[0]==null){ 
                            data.u[0]=Units.MJ(u.player.player,'e00A','A008',65,0,0,0,86400,1,1, "stand",".mdx").unit; 
                        }
                    }else{
                        if(data.u[0]!=null){
                            Units.Remove(data.u[0]); 
                            data.u[0]=null;
                        }
                    }
                    if(u.Alive()==false){                    
                        GroupAddGroup(data.g[0],tmp_group);
                        while(FirstOfGroup(tmp_group)!=null){
                            tmp=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,tmp.unit);
                            Units.Kill(tmp.unit);
                        }
                        GroupClear(tmp_group);
                        ReleaseTimer(GetExpiredTimer());
                        DestroyGroup(data.g[0]);
                        Units.Remove(data.u[0]);
                        data.g[0]=null;
                        data.u[0]=null;
                        u.RemoveObj();
                        data.Destroy();  
                    }else{
                        x=u.X()+(75+GroupNumber(data.g[0])*7)*CosBJ(u.F()+180);
                        y=u.Y()+(75+GroupNumber(data.g[0])*7)*SinBJ(u.F()+180);
                        GroupAddGroup(data.g[0],tmp_group);  
                        while(FirstOfGroup(tmp_group)!=null){
                            tmp=Units.Get(FirstOfGroup(tmp_group));
                            ra=360.0/GroupNumber(data.g[0])*(h/5);
                            dis=(Util.XY2(tmp.unit,u.unit)/100)+(GroupNumber(data.g[0])*7); 
                            x=x+(dis)*CosBJ(ra);
                            y=y+(dis)*SinBJ(ra);
                            tmp.Position(x,y,false);
                            tmp.SetH(70+(150*Util.GetPwx(3.99,data.r[2]+GetRandomReal(0,10),96)));
                            tmp.SetF(Util.XY(tmp.unit,u.unit),true);
                            GroupRemoveUnit(tmp_group,tmp.unit);
                            h=h+5; 
                        }
                        GroupClear(tmp_group);
                    }
                });
                t=null;
            }
            
        }

        static method HERO_START(Spell e){
            if(e.Id=='A009'){ 
                Units.Get(e.Spell).FlushAnimeId(5); 
            }
            e.Destroy();
        }

        static method HERO_STOP(Spell e){  
            e.Destroy();
        }

 
        static method D(Spell e){
            Units u=Units.Get(e.Spell);
            Data data=Data(u.Obj);
            Units first=Units.Get(GroupFirst(data.g[0]));
            Dash dash;
            real cd,x=first.X(),y=first.Y(),h=first.H();
            integer id;             
            id=first.aidindex;
            Units.Kill(first.unit);
            TextForPlayer(u.player.player,u.unit,DazzleMaster.DazzleName[first.aidindex]+"!",0.8,14,300); 
            Buffs.Add(u.unit,'A00G','B002',5,false).onEnd=function(Buffs b){
                Data data=Data(Units.Get(b.Unit).Obj); 
                SetUnitMoveSpeed(b.Unit, GetUnitMoveSpeed(b.Unit)-data.r[0] );
                SetUnitState(b.Unit, ConvertUnitState(0x51), GetUnitState(b.Unit, ConvertUnitState(0x51))-data.r[1] );
                data.r[0]=0;
                data.r[1]=0;
            }; 
            if(data.r[0]<80){
                data.r[0]+=20;    
                SetUnitMoveSpeed(u.unit, GetUnitMoveSpeed(u.unit)+20 );
            }
            if(data.r[1]<1.2){
                data.r[1]+=0.3;
                SetUnitState(u.unit, ConvertUnitState(0x51), GetUnitState(u.unit, ConvertUnitState(0x51))+0.3 );
            } 
            cd=data.r[0]/20;
            YDWESetUnitAbilityState( u.unit, 'A009', 1, YDWEGetUnitAbilityState(u.unit,'A009', 1)-cd );
            YDWESetUnitAbilityState( u.unit, 'A00B', 1, YDWEGetUnitAbilityState(u.unit,'A00B', 1)-cd  );
            YDWESetUnitAbilityState( u.unit, 'A00D', 1, YDWEGetUnitAbilityState(u.unit,'A00D', 1)-cd );
            YDWESetUnitAbilityState( u.unit, 'A00E', 1, YDWEGetUnitAbilityState(u.unit,'A00E', 1)-cd  );

            first=Units.MJ(u.player.player,'e008','A008',id+10,x,y,0,15,1.5,1, "stand",DazzlePath[id]);
            first.SetH(h);
            first.Position(x,y,true);
            id=Dash.ADD;
            dash=Dash.Start(first.unit,Util.XYEX(first.X(),first.Y(),e.X,e.Y),Util.XY2EX(first.X(),first.Y(),e.X,e.Y),id,50,true,false);
            dash.Obj=R2I(first.H());
            dash.onMove=function(Dash dash){
                Units u=Units.Get(dash.Unit);
                u.SetH(50+(R2I(dash.Obj)*(1-Util.GetPwx(3.99,dash.NowDis/2,dash.MaxDis))));   
            };
            dash.onEnd=function(Dash dash){
                Units u=Units.Get(dash.Unit);
                Units tmp;
                real x=u.X(),y=u.Y();
                real dmg=(u.player.hero.Str()*0.4)+(u.player.hero.Int()*0.8); 
                integer id=u.aidindex-10;
                //Util.Range(u.X(),u.Y(),150);
                u.Life(1);
                u.AnimeSpeed(2);
                u.Anime("death");
                if(id==0){//无
                    Units.MJ(u.player.player,'e008','A008',66,x,y,0,2,1,2, "stand","ball_nothing_kc.mdx"); 
                    GroupEnumUnitsInRange(tmp_group,x,y,150,function GroupIsAliveNotAloc);                   
                    while(FirstOfGroup(tmp_group)!=null){
                        tmp=Units.Get(FirstOfGroup(tmp_group));
                        GroupRemoveUnit(tmp_group,tmp.unit);
                        if(IsUnitEnemy(tmp.unit,u.player.player)==true){ 
                            DestroyEffect( AddSpecialEffectTarget("Abilities\\Weapons\\GlaiveMissile\\GlaiveMissile.mdl", tmp.unit, "chest") );
                            u.Damage(tmp.unit,Damage.Magic,'A008',dmg);
                        }
                    }
                    GroupClear(tmp_group); 
                }
                if(id==1){//光
                    Units.MJ(u.player.player,'e008','A008',66,x,y,0,2,1,2, "stand","ball_light_kc.mdx"); 
                    
                    if(GroupFind(u.unit,x,y,200,false)!=null){
                        tmp=Units.MJ(u.player.player,'e008','A008',66,x,y,0,4,1.5,1.15, "death","OrbOfLightning.mdx");
                        tmp.SetH(50);  
                        GroupEnumUnitsInRange(tmp_group,x,y,200,function GroupIsAliveNotAloc);                   
                        while(FirstOfGroup(tmp_group)!=null){
                            tmp=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,tmp.unit);
                            if(IsUnitEnemy(tmp.unit,u.player.player)==true){ 
                                u.Damage(tmp.unit,Damage.Chaos,'A008',dmg); 
                                Buffs.Skill(tmp.unit,'A00H',1);
                                Buffs.AllRemove(tmp.unit,Buffs.TYPE_ADD+Buffs.TYPE_DISPEL_TRUE);
                            }
                        }
                        GroupClear(tmp_group); 
                    } 
                    
                }
                if(id==2){//冰
                    Units.MJ(u.player.player,'e008','A008',66,x,y,0,2,1,2, "stand","ball_ice_kc.mdx"); 
                    
                    if(GroupFind(u.unit,x,y,150,false)!=null){
                        tmp=Units.MJ(u.player.player,'e008','A008',66,x,y,0,2,2,1, "death","Abilities\\Weapons\\FrostWyrmMissile\\FrostWyrmMissile.mdl");
                        tmp.SetH(50); 
                        tmp=Units.MJ(u.player.player,'e008','A008',66,x,y,0,2,2,1, "death","Abilities\\Weapons\\LichMissile\\LichMissile.mdl");
                        tmp.SetH(50);                        
                        GroupEnumUnitsInRange(tmp_group,x,y,150,function GroupIsAliveNotAloc);                   
                        while(FirstOfGroup(tmp_group)!=null){
                            tmp=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,tmp.unit);
                            if(IsUnitEnemy(tmp.unit,u.player.player)==true){ 
                                u.Damage(tmp.unit,Damage.Magic,'A008',dmg);  
                                Buffs.Add(tmp.unit,'A00I','B003',2,false).Type=Buffs.TYPE_SUB+Buffs.TYPE_DISPEL_TRUE;
                                DestroyEffect( AddSpecialEffectTarget("Abilities\\Weapons\\ZigguratFrostMissile\\ZigguratFrostMissile.mdl", tmp.unit, "chest") );
                            }
                        }
                        GroupClear(tmp_group); 
                    } 
                }
                if(id==3){//火
                    Units.MJ(u.player.player,'e008','A008',66,x,y,0,2,1,2, "stand","ball_fire_kc.mdx"); 
                     
                    if(GroupFind(u.unit,x,y,200,false)!=null){
                        tmp=Units.MJ(u.player.player,'e008','A008',66,x,y,0,2,2.5,1, "death","Abilities\\Weapons\\LordofFlameMissile\\LordofFlameMissile.mdl");
                        tmp.SetH(50); 
                        tmp=Units.MJ(u.player.player,'e008','A008',66,x,y,0,2,2,1, "death","Abilities\\Weapons\\RedDragonBreath\\RedDragonMissile.mdl");
                        tmp.SetH(50);                    
                        GroupEnumUnitsInRange(tmp_group,x,y,200,function GroupIsAliveNotAloc);                   
                        while(FirstOfGroup(tmp_group)!=null){
                            tmp=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,tmp.unit);
                            if(IsUnitEnemy(tmp.unit,u.player.player)==true){ 
                                u.Damage(tmp.unit,Damage.Magic,'A008',dmg);  
                                DestroyEffect( AddSpecialEffectTarget("Environment\\NightElfBuildingFire\\ElfLargeBuildingFire1.mdl", tmp.unit, "chest") );
                                Dash.Start(tmp.unit,Util.XYEX(x,y,tmp.X(),tmp.Y()),300-Util.XY2EX(x,y,tmp.X(),tmp.Y()),Dash.SUB,40,true,true);

                            }
                        }
                        GroupClear(tmp_group); 
                    }                     

                }
                if(id==4){//暗
                    Units.MJ(u.player.player,'e008','A008',66,x,y,0,2,1,2, "stand","ball_dark_kc.mdx"); 
                    if(GroupFind(u.unit,x,y,300,false)!=null){
                        tmp=Units.MJ(u.player.player,'e008','A008',66,x,y,0,0.42,2.5,1.75, "death","dark.mdx");
                        tmp.SetH(50);
                        u.SetH(150);
                        //tmp=Units.MJ(u.player.player,'e008','A008',66,x,y,0,0.4,1.5,2, "stand","dark1.mdx");
                        GroupEnumUnitsInRange(tmp_group,x,y,300,function GroupIsAliveNotAloc);                   
                        while(FirstOfGroup(tmp_group)!=null){
                            tmp=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,tmp.unit);
                            if(IsUnitEnemy(tmp.unit,u.player.player)==true){ 
                                DestroyEffect( AddSpecialEffectTarget("Abilities\\Weapons\\AvengerMissile\\AvengerMissile.mdl", tmp.unit, "chest") );
                                u.Damage(tmp.unit,Damage.Chaos,'A008',dmg);
                                HitFlys.Add(tmp.unit,20);
                                Dash.Start(tmp.unit,Util.XY(tmp.unit,u.unit),Util.XY2(tmp.unit,u.unit),Dash.ADD,40,true,false);
                            }
                        }
                        GroupClear(tmp_group); 
                    } 
                }
            };

            e.Destroy();
        }

        static method R(Spell e){
            Units u=Units.Get(e.Spell);
            Units tmp;
            Dash dash;
            integer s=0;
            timer t;
            Data data;
            real x=u.X()+200*CosBJ(u.F()),y=u.Y()+200*SinBJ(u.F());
            //Util.Range(x,y,150);
            u.Pause(true);
            u.PositionEnabled(false);   
            if(GroupFind(u.unit,x,y,150,false)!=null){
                Units.MJ(u.player.player,'e008','A00E',0,x,y,0,2,1.25,1, "stand","ThunderClapCaster.mdx");
                AddDazzle(u.unit,4);
                GroupEnumUnitsInRange(tmp_group,x,y,150,function GroupIsAliveNotAloc);                   
                while(FirstOfGroup(tmp_group)!=null){
                    tmp=Units.Get(FirstOfGroup(tmp_group));
                    GroupRemoveUnit(tmp_group,tmp.unit);
                    if(IsUnitEnemy(tmp.unit,u.player.player)==true){ 
                        HitFlys.Add(tmp.unit,10);
                        Dash.Start(tmp.unit,u.F(),100,Dash.SUB,45,true,true);    
                        u.Damage(tmp.unit,Damage.Physics,'A00E',u.Agi()*4.0);
                        DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl", tmp.unit, "chest") );
                        Buffs.Skill(tmp.unit,'A00C',1); 
                    }
                }
                GroupClear(tmp_group);
                t=NewTimer();
                data=Data.create('A00E');
                data.c[0]=u;
                data.c[1]=e;
                SetTimerData(t,data);
                TimerStart(t,0.2,false,function(){
                    Data data=Data(GetTimerData(GetExpiredTimer()));
                    Units u=Units(data.c[0]);
                    Units tmp;
                    real x=u.X()+200*CosBJ(u.F()),y=u.Y()+200*SinBJ(u.F());
                    if(u.Alive()==true){
                        data.g[0]=CreateGroup();
                        GroupEnumUnitsInRange(tmp_group,x,y,150,function GroupIsAliveNotAloc);                   
                        while(FirstOfGroup(tmp_group)!=null){
                            tmp=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,tmp.unit);
                            if(IsUnitEnemy(tmp.unit,u.player.player)==true){ 
                                GroupAddUnit(data.g[0],tmp.unit);
                                Buffs.Skill(tmp.unit,'A00C',1);   
                                HitFlys.Remove(tmp.unit);
                                Dash.Start(tmp.unit,Util.XY(tmp.unit,u.unit),Util.XY2(tmp.unit,u.unit),Dash.NORMAL,Util.XY2(tmp.unit,u.unit)/4,true,false).onMove=function(Dash dash){
                                    Units u=Units.Get(dash.Unit);
                                    u.SetH(200*(dash.NowDis/dash.MaxDis));
                                };   
                                DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl", tmp.unit, "chest") ); 
                            }
                        }
                        GroupClear(tmp_group);     
                        data.r[0]=0.2;              
                        TimerStart(GetExpiredTimer(),0.02,true,function(){
                            Data data=Data(GetTimerData(GetExpiredTimer()));
                            Units u=Units(data.c[0]);
                            Units tmp;
                            Dash dash;
                            real x,y;
                            if(data.r[0]>0){
                                data.r[0]-=0.02;
                                GroupAddGroup(data.g[0],tmp_group);  
                                while(FirstOfGroup(tmp_group)!=null){
                                    tmp=Units.Get(FirstOfGroup(tmp_group));
                                    GroupRemoveUnit(tmp_group,tmp.unit);
                                    tmp.Position(u.X(),u.Y(),false);
                                    if(u.Alive()==false){
                                        HitFlys.Add(tmp.unit,0.1);
                                    }
                                }
                                GroupClear(tmp_group);         
                                if(u.Alive()==false){
                                    ReleaseTimer(GetExpiredTimer());
                                    DestroyGroup(data.g[0]);
                                    Spell(data.c[1]).Destroy();
                                    data.g[0]=null; 
                                    data.Destroy();
                                    u.PositionEnabled(true); 
                                    u.Pause(false);                                     
                                }                      
                            }else{
                                data.i[0]=0;
                                if(u.player.press.R==true){ 
                                    x=u.X()+200*CosBJ(u.F()),y=u.Y()+200*SinBJ(u.F());
                                }else{ 
                                    x=u.X()+200*CosBJ(u.F()+180),y=u.Y()+200*SinBJ(u.F()+180);
                                }
                                data.r[1]=x;
                                data.r[2]=y;
                                data.r[3]=u.X();
                                data.r[4]=u.Y();
                                u.SetF(Util.XYEX(u.X(),u.Y(),x,y),true);
                                GroupAddGroup(data.g[0],tmp_group);  
                                while(FirstOfGroup(tmp_group)!=null){
                                    tmp=Units.Get(FirstOfGroup(tmp_group));
                                    GroupRemoveUnit(tmp_group,tmp.unit);
                                    data.i[1]+=1; 
                                    dash=Dash.Start(tmp.unit,Util.XYEX(tmp.X(),tmp.Y(),x,y),Util.XY2EX(tmp.X(),tmp.Y(),x,y),Dash.NORMAL,20,true,false);
                                    dash.Obj=data;
                                    dash.onMove=function(Dash dash){
                                        Data data=Data(dash.Obj);
                                        Units u=Units.Get(dash.Unit);
                                        Units(data.c[0]).Position(data.r[3],data.r[4],false);
                                        u.SetH(200*(1-(dash.NowDis/dash.MaxDis)));
                                    };         
                                    dash.onEnd=function(Dash dash){
                                        Data data=Data(dash.Obj);
                                        Units u=Units(data.c[0]); 
                                        Units tmp=Units.Get(dash.Unit);
                                        tmp.SetH(0);
                                        data.i[1]-=1;  
                                        Buffs.Skill(tmp.unit,'A00F',1);  
                                        u.Damage(tmp.unit,Damage.Physics,'A00E',u.Str()*18.0);  
                                        if(data.i[0]==0){
                                            data.i[0]=1;
                                            Units.MJ(u.player.player,'e008','A00E',0,data.r[1],data.r[2],0,2,1,1, "stand","tx.mdx");
                                            Util.Duang(data.r[1],data.r[2],0.5,200,200,-75,0.02,50);
                                        }
                                        if(data.i[1]==0){
                                            data.Destroy(); 
                                        }
                                    };
                                }   
                                GroupClear(tmp_group);
                                ReleaseTimer(GetExpiredTimer());
                                Spell(data.c[1]).Destroy();
                                DestroyGroup(data.g[0]);
                                data.g[0]=null;  
                                u.PositionEnabled(true); 
                                u.Pause(false); 
                            } 
                        });
                    }else{
                        Spell(data.c[1]).Destroy();
                        data.Destroy();
                        u.PositionEnabled(true); 
                        u.Pause(false);                
                    }
                    
                });
                t=null;
            }else{   
                u.PositionEnabled(true); 
                u.Pause(false);  
                e.Destroy();
            }
        }

        // 14 转圈(蓄力)    15 收尾  16前摇 17前冲
        static method E(Spell e){
            Units u=Units.Get(e.Spell);
            Data data=Data.create('A00D');
            timer t=NewTimer();
            u.Pause(true);
            u.AnimeId(16);
            data.c[0]=u;
            data.c[2]=e;
            data.r[0]=0;//蓄力时间
            data.i[3]=2;
            if(u.player.isai==true){
                data.r[0]=2.5;
            }
            SetTimerData(t,data); 
            TimerStart(t,0.1,true,function(){
                Data data=Data(GetTimerData(GetExpiredTimer()));
                Units mj;
                Units u=Units(data.c[0]);
                Dash dash;
                if(u.player.press.E==true&&data.r[0]<=2.5&&u.IsAbility('BPSE')==false&&u.Alive()==true){ 
                    data.r[0]+=0.1;
                    if(data.r[0]==0.2){
                        u.AnimeId(14);
                    }
                    if(data.r[0]==0.5||data.r[0]==1||data.r[0]==1.5||data.r[0]==2||data.r[0]==2.5){
                        TextForPlayer(u.player.player,u.unit,R2S((data.r[0]/2.5)*100.0)+"%",0.4,12,45);     
                    } 
                    if(data.i[3]==0){
                        data.i[3]=2;
                        Units.MJ(u.player.player,'e008','A00D',0,u.X(),u.Y(),GetRandomReal(0,360),2,0.2,1.5, "stand","kc12.mdx"); 
                    }else{
                        data.i[3]-=1;
                    }
                    if(data.r[0]>=0.5){
                        u.SetF(Util.XYEX(u.X(),u.Y(),u.player.press.MouseX,u.player.press.MouseY),false);
                    }
                }else{ 
                    ReleaseTimer(GetExpiredTimer()); 
                    if(u.Alive()==false){
                        data.r[0]=0;
                    }  
                    if(data.r[0]>2.5){
                        data.r[0]=2.5;
                    }
                    if(data.r[0]!=0){ 
                        TextForPlayer(u.player.player,u.unit,R2S(data.r[0]*100)+"%落花!",0.8,14,300);
                    }
                    if(data.r[0]>2){
                        mj=Units.MJ(u.player.player,'e009','A00D',0,u.X(),u.Y(),u.F(),2,1.5,2, "stand","wind.mdx");
                        mj.SetH(200); 
                        Dash.Start(mj.unit,u.F(),200,Dash.ADD,60,true,false);
                    }
                    u.AnimeSpeed(2);
                    u.AnimeId(17);
                    mj=Units.MJ(u.player.player,'e008','A00D',0,u.X(),u.Y(),u.F(),3600,0.9,1, "birth","bimuyu.mdx");
                    mj.SetH(100);
                    data.c[1]=mj;
                    data.i[0]=0;
                    data.g[0]=CreateGroup();
                    dash=Dash.Start(u.unit,u.F(),300+(data.r[0]*100),Dash.SUB,80,true,false);
                    dash.Obj=data; 
                    dash.onMove=function(Dash dash){
                        Data data=Data(dash.Obj);
                        Units u=Units(data.c[0]);
                        Units mj=Units(data.c[1]);
                        Units tmp;
                        Buffs bf;
                        dash.Angle=u.F(); 
                        mj.Position(dash.X+150*CosBJ(dash.Angle+180),dash.LastY+150*SinBJ(dash.Angle+180),false);
                        mj.SetF(dash.Angle,true);
                        GroupEnumUnitsInRange(tmp_group,dash.X,dash.Y,100,function GroupIsAliveNotAloc);
                        while(FirstOfGroup(tmp_group)!=null){
                            tmp=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,tmp.unit);
                            if(IsUnitEnemy(tmp.unit,u.player.player)==true&&IsUnitInGroup(tmp.unit,data.g[0])==false){ 
                                GroupAddUnit(data.g[0],tmp.unit);  
                                u.Damage(tmp.unit,Damage.Chaos,'A00D',u.Agi()*(12*(data.r[0]*2.5)));
                                DestroyEffect( AddSpecialEffectTarget("hit_b.mdx", tmp.unit, "chest") );
                                DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl", tmp.X(),tmp.Y()) );
                                Dash.Start(tmp.unit,dash.Angle,300+(data.r[0]*2)*50,Dash.SUB,30*data.r[0],true,true);
                                if(data.i[0]==0){
                                    data.i[0]=1;
                                    AddDazzle(u.unit,3);
                                } 
                            }
                        }
                        GroupClear(tmp_group);
                    };
                    dash.onEnd=function(Dash dash){
                        Data data=Data(dash.Obj);
                        Units u=Units(data.c[0]);
                        Units mj=Units(data.c[1]);  
                        Spell(data.c[2]).Destroy();
                        mj.Anime("death");
                        mj.Life(1);
                        DestroyGroup(data.g[0]);
                        data.g[0]=null;
                        u.AnimeSpeed(1); 
                        u.Pause(false);
                        data.Destroy();
                    };

                }
            });
            t=null; 
        }

        static method W(Spell e){
            Units u=Units.Get(e.Spell); 
            Dash dash;
            u.Pause(true);
            //刀光特效版取消的特效
            //Units.MJ(u.player.player,'e008','A00B',0,u.X(),u.Y(),0,2,1,1, "stand","dust1.mdx");
            Units.MJ(u.player.player,'e008','A00B',0,u.X(),u.Y(),e.Angle,2,1.5,2, "stand","dust2.mdx");
            //刀光特效改动，原版:0.8,-120 
            Util.Duang(u.X(),u.Y(),0.3,200,200,-48,0.04,100);
            dash=Dash.Start(u.unit,e.Angle,250,Dash.SUB,40,true,false);
            dash.onMove=function(Dash dash){
                Units u=Units.Get(dash.Unit);
                Units mj;
                Units tmp;
                integer s=0;
                real x,y;
                if(dash.NowDis>100&&dash.NowDis<115){ 
                    u.SetF(dash.Angle,true); 
                    u.AnimeId(13);                    
                    
                    mj=Units.MJ(u.player.player,'e009','A00B',0,u.X(),u.Y(),dash.Angle,2,0.7,2, "death","wind1.mdx");
                    mj.SetH(150);
                    Dash.Start(mj.unit,dash.Angle,250,Dash.SUB,10,true,false);                    
                    mj=Units.MJ(u.player.player,'e009','A00B',0,u.X(),u.Y(),dash.Angle,2,1,1.5, "death","wind1.mdx");
                    mj.SetH(200);
                    Dash.Start(mj.unit,dash.Angle,350,Dash.SUB,15,true,false);
                    x=dash.X+100*CosBJ(dash.Angle);
                    y=dash.Y+100*SinBJ(dash.Angle);
         
                        if(GroupFind(u.unit,x,y,200,false)!=null){ 
                            GroupEnumUnitsInRange(tmp_group,x,y,200,function GroupIsAliveNotAloc);
                            AddDazzle(u.unit,2); 
                            //刀光特效版          
                            mj=Units.MJ(u.player.player,'e008','A00B',0,u.X(),u.Y(),dash.Angle,0.6,0.8,1.5, "birth","dg.mdx");
                            mj.SetH(100);
                            Dash.Start(mj.unit,dash.Angle,200,Dash.ADD,80,true,false);
                            //---
                            tmp=Units.MJ(u.player.player,'e009','A002',0,dash.X,dash.Y,dash.Angle,2,2.5,2, "stand","wind.mdx");
                            tmp.SetH(200); 
                            Dash.Start(tmp.unit,dash.Angle+180,450,Dash.SUB,60,true,false);
                            while(FirstOfGroup(tmp_group)!=null){
                                tmp=Units.Get(FirstOfGroup(tmp_group));
                                GroupRemoveUnit(tmp_group,tmp.unit);
                                if(IsUnitEnemy(tmp.unit,u.player.player)==true){  
                                    Buffs.Skill(tmp.unit,'A00C',1); 
                                    u.Damage(tmp.unit,Damage.Physics,'A00B',u.Agi()*6+u.Str()*6);
                                    Dash.Start(tmp.unit,dash.Angle,300,Dash.SUB,90,true,true);   
                                    DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl", tmp.unit, "chest") );
                                }
                            } 
                            GroupClear(tmp_group);   
                        } 
                      
                }
                if(dash.NowDis>180){
                    DestroyEffect( AddSpecialEffect("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl",dash.X,dash.Y) );
                     
                    if(dash.NowDis<197){ 
                        u.Alpha(255);
                    }else{ 
                        u.Alpha(0); 
                    }
                }else{
                    u.Alpha(0);
                }
            };
            dash.onEnd=function(Dash dash){
                Units u=Units.Get(dash.Unit); 
                u.Pause(false);
                u.Alpha(255);
            };
            e.Destroy();
            
        }

        static method Q(Spell e){
            Units u=Units.Get(e.Spell);
            Dash dash;
            Data data=Data.create('A009');
            u.Pause(true);
            u.AnimeId(6); 
            u.AnimeSpeed(0.7);
            data.c[0]=u;
            data.i[0]=0;
            data.g[0]=CreateGroup();  
            Units.MJ(u.player.player,'e008','A00B',0,u.X(),u.Y(),e.Angle,4,1,2.5, "stand","dust2.mdx"); 
            dash=Dash.Start(u.unit,e.Angle,600,Dash.SUB,60,true,false);
            dash.Obj=data;
            dash.onMove=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units(data.c[0]);
                Units tmp; 
                GroupEnumUnitsInRange(tmp_group,u.X()+100*CosBJ(dash.Angle),u.Y()+100*SinBJ(dash.Angle),90,function GroupIsAliveNotAloc);
                while(FirstOfGroup(tmp_group)!=null){
                    tmp=Units.Get(FirstOfGroup(tmp_group));
                    GroupRemoveUnit(tmp_group,tmp.unit);
                    if(IsUnitEnemy(tmp.unit,u.player.player)==true&&IsUnitInGroup(tmp.unit,data.g[0])==false){ 
                        GroupAddUnit(data.g[0],tmp.unit);
                        Buffs.Skill(tmp.unit,'A00A',1);
                        HitFlys.Add(tmp.unit,25);
                        u.Damage(tmp.unit,Damage.Magic,'A009',u.Agi()*3+u.Str()*4);
                        DestroyEffect( AddSpecialEffectTarget("bd2d2.mdx", tmp.unit, "chest") );
                                
                        if(dash.NowDis<400){ 
                            Dash.Start(tmp.unit,dash.Angle,500-dash.NowDis,Dash.SUB,90,true,true);
                        }
                        if(data.i[0]==0){
                            data.i[0]=1;
                            AddDazzle(u.unit,1);
                        }
                    }
                }
                GroupClear(tmp_group); 
                if(dash.Speed>15&&dash.Speed<40){ 
                    DestroyEffect( AddSpecialEffect("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl",dash.X,dash.Y) );
                } 
                if(dash.Speed<1.5){
                    dash.Stop();
                }
            };
            dash.onEnd=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units(data.c[0]);
                DestroyGroup(data.g[0]);
                data.g[0]=null;
                u.Pause(false); 
                u.AnimeSpeed(1);
                data.Destroy();
            };
            e.Destroy();
        }
    }

    function onInit(){
        Spell.On(Spell.onSpell,'A008',DazzleMaster.D);
        Spell.On(Spell.onSpell,'A009',DazzleMaster.Q);
        Spell.On(Spell.onSpell,'A00B',DazzleMaster.W);
        Spell.On(Spell.onSpell,'A00D',DazzleMaster.E);
        Spell.On(Spell.onSpell,'A00E',DazzleMaster.R);
        Spell.On(Spell.onReady,'A009',DazzleMaster.HERO_START);
        Spell.On(Spell.onStop,'A009',DazzleMaster.HERO_STOP);   
        Spell.On(Spell.onReady,'A00D',DazzleMaster.HERO_START);
        Spell.On(Spell.onStop,'A00D',DazzleMaster.HERO_STOP);   
        Damage.On(Damage.onHeroDamageed,DazzleMaster.Attack);
        Units.On(Units.onHeroSpawn,DazzleMaster.Spawn);
        Units.On(Units.onAlocDeath,DazzleMaster.Death);
        DazzleMaster.DazzlePath[0]="ball_nothing.mdx";
        DazzleMaster.DazzleName[0]="无属性";
        DazzleMaster.DazzlePath[1]="ball_light.mdx";
        DazzleMaster.DazzleName[1]="光属性";
        DazzleMaster.DazzlePath[2]="ball_ice.mdx";
        DazzleMaster.DazzleName[2]="冰属性";
        DazzleMaster.DazzlePath[3]="ball_fire.mdx";
        DazzleMaster.DazzleName[3]="火属性";
        DazzleMaster.DazzlePath[4]="ball_dark.mdx";
        DazzleMaster.DazzleName[4]="暗属性";
    }
}