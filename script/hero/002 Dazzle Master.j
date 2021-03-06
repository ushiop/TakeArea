library DazzleMaster requires TimerUtils,Groups,Units{
    //英雄'炫纹大师'技能
    //SR级英雄

    struct DazzleMaster{

        static string DazzlePath[5];
        static string DazzleName[5]; 
        static integer E_sound[4];

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
            target=GroupFind(u.unit,x,y,1000,true,false);
            if(target!=null){
                x1=GetUnitX(target);
                y1=GetUnitY(target);


                no=GroupFind(u.unit,x,y,200,true,false);
                if(no!=null){  
                    u.SetF(Util.XY(u.unit,no),true);        
                    IssueImmediateOrder( u.unit, "inferno" );//落花
                }    


                no=GroupFind(u.unit,x,y,200,true,false);
                if(no!=null){ 
                    u.SetF(Util.XY(u.unit,no),true); 
                    IssueImmediateOrder( u.unit, "impale" );//圆舞棍
                }                

                
                no=GroupFind(u.unit,x,y,300,true,false);
                if(no!=null){ 
                    x1=GetUnitX(no);
                    y1=GetUnitY(no); 
                    IssuePointOrder(u.unit, "channel",x1,y1);//龙牙
                }
                
                no=GroupFind(u.unit,x,y,600,true,false);
                if(no!=null){ 
                    x1=GetUnitX(no);
                    y1=GetUnitY(no); 
                    IssuePointOrder(u.unit, "dispel",x1,y1);//天击
                }

                
                IssuePointOrder(u.unit, "curse",x1,y1);//炫纹发射
            }
            target=null;
            no=null;
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
                    real h=0,x,y,dis,fa,ra,b1,b2,x1,y1;
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
                        //x=u.X()+(75+GroupNumber(data.g[0])*7)*CosBJ(u.F()+180);
                        //y=u.Y()+(75+GroupNumber(data.g[0])*7)*SinBJ(u.F()+180);
                        x1=u.X();
                        y1=u.Y();
                        b1=0;
                        b2=0; 
                        GroupAddGroup(data.g[0],tmp_group);  
                        while(FirstOfGroup(tmp_group)!=null){
                            tmp=Units.Get(FirstOfGroup(tmp_group)); 
                            dis=75+(Util.XY2(tmp.unit,u.unit)/600)+(b2*30);
                            ra=u.F()+180+(30-(b2*5))+(b1*-(30-(b2*5)));
                            b1+=1;
                            if(b1==3){
                                b2+=1;
                                b1=0;
                            }
                            
                            x=x1+(dis)*CosBJ(ra);
                            y=y1+(dis)*SinBJ(ra);
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
            Units u=Units.Get(e.Spell);
            if(e.Id=='A009'){ 
                if(u.IsAbility('B006')==false){ 
                    u.FlushAnimeId(2);
                    e.Destroy();
                }else{
                    if(u.MP()>=100){
                        if(u.GetAbilityCD('A009')==0){ 
                            SpellNameText(u.unit,"! 龙牙击 !",3,15);
                            u.SetMP(u.MP()-100);
                            u.SetAbilityCD('A009',10);
                            DazzleMaster.Q(e); 
                        }else{
                            e.Destroy();
                        }
                    }else{
                        e.Destroy();
                    }
                } 
            }
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
            integer id=first.aidindex;          
            Buffs b;
            if(GroupNumber(data.g[0])==0){
                //BJDebugMsg(first.name+R2S(x)+"/"+R2S(y)+":::"+R2S(e.X)+"/"+R2S(e.Y)+"/类型："+I2S(id)+"/炫纹组："+I2S(GroupNumber(data.g[0]))+"/A:"+Util.B2S(first.Alive())+"/AID:"+I2S(first.aid)+"/AID2:"+I2S(first.aidindex));
                //BJDebugMsg("---这是一条错误提示,如果看到了这条提示且你愿意,请保存录像并联系作者");
                e.Destroy();
                return;
            } 
            Units.Kill(first.unit); 
            TextForPlayer(u.player.player,u.unit,DazzleMaster.DazzleName[first.aidindex]+"!",0.8,14,300); 
            b=Buffs.Add(u.unit,'A00G','B002',5,false);
            b.onEnd=function(Buffs b){
                Data data=Data(Units.Get(b.Unit).Obj);  
                Units.Get(b.Unit).SetMoveSpeed(-data.r[0] );
                SetUnitState(b.Unit, ConvertUnitState(0x51), GetUnitState(b.Unit, ConvertUnitState(0x51))-data.r[1] );
                data.r[0]=0;
                data.r[1]=0;
            }; 
            b.onFlush=function(Buffs b){
                if(b.Level<4){
                    b.Level+=1;
                }
            };
            if(data.r[0]<80){
                data.r[0]+=20;    
                u.SetMoveSpeed(20);
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
            Units.MJ(u.player.player,'e008','A008',id+10,x,y,0,0.5,0.5,1, "birth",DazzlePath[id]).SetH(h);
            Units.MJ(u.player.player,'e008','A008',id+10,x,y,0,0.5,0.5,1, "birth",DazzlePath[id]).SetH(h);
            first=Units.MJ(u.player.player,'e008','A008',id+10,x,y,0,15,1.5,1, "stand",DazzlePath[id]);
            first.SetH(h);
            first.Position(x,y,true); 
            first.AddAbility(Units.MJType_TSW);
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
                real dmg=(u.player.hero.Str(true)*0.4)+(u.player.hero.Int(true)*0.8); 
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
                    
                    if(GroupFind(u.unit,x,y,200,false,false)!=null){
                        tmp=Units.MJ(u.player.player,'e008','A008',66,x,y,0,4,1.5,1.3, "death","OrbOfLightning.mdx");
                        tmp.SetH(50);  
                        GroupEnumUnitsInRange(tmp_group,x,y,200,function GroupIsAliveNotAloc);                   
                        while(FirstOfGroup(tmp_group)!=null){
                            tmp=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,tmp.unit);
                            if(IsUnitEnemy(tmp.unit,u.player.player)==true){ 
                                Buffs.Skill(tmp.unit,'A00W',1);
                                u.Damage(tmp.unit,Damage.Chaos,'A008',dmg); 
                                HitFlys.Add(tmp.unit,10);
                                Buffs.Skill(tmp.unit,'A00T',1);
                                Buffs.AllRemove(tmp.unit,Buffs.TYPE_ADD+Buffs.TYPE_DISPEL_TRUE);
                            }
                        }
                        GroupClear(tmp_group); 
                    } 
                    
                }
                if(id==2){//冰
                    Units.MJ(u.player.player,'e008','A008',66,x,y,0,2,1,2, "stand","ball_ice_kc.mdx"); 
                    
                    if(GroupFind(u.unit,x,y,150,false,false)!=null){
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
                                Buffs.Skill(tmp.unit,'A00C',1);
                                Buffs.Add(tmp.unit,'A00I','B003',3,false).Type=Buffs.TYPE_SUB+Buffs.TYPE_DISPEL_TRUE;
                                DestroyEffect( AddSpecialEffectTarget("Abilities\\Weapons\\ZigguratFrostMissile\\ZigguratFrostMissile.mdl", tmp.unit, "chest") );
                            }
                        }
                        GroupClear(tmp_group); 
                    } 
                }
                if(id==3){//火
                    Units.MJ(u.player.player,'e008','A008',66,x,y,0,2,1,2, "stand","ball_fire_kc.mdx"); 
                     
                    if(GroupFind(u.unit,x,y,200,false,false)!=null){
                        tmp=Units.MJ(u.player.player,'e008','A008',66,x,y,0,2,2.5,1, "death","Abilities\\Weapons\\LordofFlameMissile\\LordofFlameMissile.mdl");
                        tmp.SetH(50); 
                        tmp=Units.MJ(u.player.player,'e008','A008',66,x,y,0,2,2,1, "death","Abilities\\Weapons\\RedDragonBreath\\RedDragonMissile.mdl");
                        tmp.SetH(50);    
                        tmp=Units.MJ(u.player.player,'e008','A008',66,x,y,0,2,1.5,2, "death","Abilities\\Weapons\\FragDriller\\FragDriller.mdl");
                        tmp.SetH(50);                    
                        GroupEnumUnitsInRange(tmp_group,x,y,200,function GroupIsAliveNotAloc);      
                        while(FirstOfGroup(tmp_group)!=null){
                            tmp=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,tmp.unit); 
                            if(IsUnitEnemy(tmp.unit,u.player.player)==true){ 
                                u.Damage(tmp.unit,Damage.Magic,'A008',dmg);  
                                Buffs.Skill(tmp.unit,'A00W',1);
                                DestroyEffect( AddSpecialEffectTarget("Environment\\NightElfBuildingFire\\ElfLargeBuildingFire1.mdl", tmp.unit, "chest") );
                                Dash.Start(tmp.unit,Util.XYEX(x,y,tmp.X(),tmp.Y()),350-Util.XY2EX(x,y,tmp.X(),tmp.Y()),Dash.SUB,30,true,false);
                            } 
                        }
                        GroupClear(tmp_group); 
                    }                     

                }
                if(id==4){//暗
                    Units.MJ(u.player.player,'e008','A008',66,x,y,0,2,1,2, "stand","ball_dark_kc.mdx"); 
                    if(GroupFind(u.unit,x,y,300,false,false)!=null){
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
                                Buffs.Skill(tmp.unit,'A00C',1);
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

        //18 刺 19 砸
        static method R(Spell e){
            Units u=Units.Get(e.Spell);  
            Data data=Data.create('A00E');
            //Util.Range(x,y,150);
            u.Pause(true);
            u.PositionEnabled(false);   
            u.AnimeId(12);
            data.c[0]=u;
            data.c[1]=e;
            data.r[0]=0.25;
            data.r[1]=0.15;
            Units.MJ(u.player.player,'e008','A00E',0,u.X(),u.Y(),0,2,0.5,0.75, "stand","white-qiquan.mdl"); 
            Timers.Start(0.01,data,function(Timers t){
                Data data=Data(t.Data());
                Units u=Units(data.c[0]);
                real x=u.X()+200*CosBJ(u.F()),y=u.Y()+200*SinBJ(u.F());            
                Units tmp;
                Dash dash; 
                integer s=0;  
                if(data.r[0]==0){   
                    if(u.Alive()==true){
                        tmp=Units.MJ(u.player.player,'e009','A00E',0,x,y,u.F(),2,1.1,1.5, "stand","by_wood_gongchengsipai_2.mdl");
                        tmp.SetH(110);
                        Dash.Start(tmp.unit,u.F()+180,50,Dash.SUB,10,true,false);
                        tmp=Units.MJ(u.player.player,'e009','A00E',0,x,y,u.F(),2,0.5,1.5, "stand","white-qiquan.mdl");
                        tmp.SetH(100);
                        Dash.Start(tmp.unit,u.F()+180,100,Dash.SUB,20,true,false);
                            
                        if(GroupFind(u.unit,x,y,150,false,false)!=null){
                            Units.MJ(u.player.player,'e008','A00E',0,x,y,0,2,1.25,1, "stand","ThunderClapCaster.mdx");
                            AddDazzle(u.unit,4);
                            GroupEnumUnitsInRange(tmp_group,x,y,150,function GroupIsAliveNotAloc);                   
                            while(FirstOfGroup(tmp_group)!=null){
                                tmp=Units.Get(FirstOfGroup(tmp_group));
                                GroupRemoveUnit(tmp_group,tmp.unit);
                                if(IsUnitEnemy(tmp.unit,u.player.player)==true){ 
                                    HitFlys.Add(tmp.unit,10);
                                    Dash.Start(tmp.unit,u.F(),50,Dash.SUB,10,true,true);    
                                    u.Damage(tmp.unit,Damage.Physics,'A00E',u.Agi(true)*4.0);
                                    DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl", tmp.unit, "chest") );
                                    Buffs.Skill(tmp.unit,'A00C',1); 
                                }
                            } 
                            GroupClear(tmp_group); 
                            Timers.Start(0.01,data,function(Timers t){
                                Data data=Data(t.Data());
                                Units u=Units(data.c[0]); 
                                Units tmp; 
                                real x=u.X()+200*CosBJ(u.F()),y=u.Y()+200*SinBJ(u.F());  
                                if(data.r[1]==0){ 
                                    if(u.Alive()==true){
                                        Units.MJ(u.player.player,'e00B','A00E',0,u.X(),u.Y(),u.F()-90,2,0.5,2, "stand","daoguang-blue-hengsao.mdl").SetH(100);
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
                                        if(GroupNumber(data.g[0])!=0){ 
                                            data.r[0]=0.1;         
                                            Timers.Start(0.02,data,function(Timers t){
                                                Data data=Data(t.Data());
                                                Units u=Units(data.c[0]);
                                                Units tmp;
                                                Dash dash;
                                                real x,y;
                                                if(data.r[0]>0){
                                                    if(u.IsTimeStop()==false){
                                                        data.r[0]-=0.02;
                                                    } 
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
                                                        DestroyGroup(data.g[0]);
                                                        Spell(data.c[1]).Destroy();
                                                        data.g[0]=null; 
                                                        data.Destroy();
                                                        u.PositionEnabled(true); 
                                                        u.Pause(false);     
                                                        t.Destroy();                               
                                                    }                      
                                                }else{
                                                    u.AnimeId(13); 
                                                    data.i[0]=0;
                                                    if(u.player.press.R==true){ 
                                                        x=u.X()+200*CosBJ(u.F()),y=u.Y()+200*SinBJ(u.F());
                                                        Units.MJ(u.player.player,'e009','A00E',0,u.X(),u.Y(),u.F()-90,2,0.75,1, "stand","daoguang-blue-hengsao.mdl").SetH(100);
                                            
                                                    }else{ 
                                                        x=u.X()+200*CosBJ(u.F()+180),y=u.Y()+200*SinBJ(u.F()+180);
                                                        Units.MJ(u.player.player,'e009','A00E',0,u.X(),u.Y(),u.F()-270,2,0.75,1, "stand","daoguang-blue-hengsao.mdl").SetH(100);
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
                                                            u.Damage(tmp.unit,Damage.Physics,'A00E',u.Str(true)*18.0);  
                                                            if(data.i[0]==0){
                                                                data.i[0]=1;
                                                                Units.MJ(u.player.player,'e008','A00E',0,data.r[1],data.r[2],0,2,1,1, "stand","tx.mdx");
                                                                Util.Duang(data.r[1],data.r[2],0.5,200,200,-75,0.02,50);
                                                            }
                                                            if(data.i[1]==0){ 
                                                                Spell(data.c[1]).Destroy();
                                                                data.Destroy(); 
                                                                u.PositionEnabled(true); 
                                                                u.DelayReleaseAnimePause(0.2);
                                                            }
                                                        };
                                                    }   
                                                    GroupClear(tmp_group);
                                                    DestroyGroup(data.g[0]);
                                                    data.g[0]=null;  
                                                    if(data.i[1]==0){
                                                        Spell(data.c[1]).Destroy();
                                                        data.Destroy();   
                                                        u.PositionEnabled(true); 
                                                        u.Pause(false);  
                                                    } 
                                                    t.Destroy();
                                                }  
                                            });
                                        }else{ 
                                            DestroyGroup(data.g[0]);
                                            Spell(data.c[1]).Destroy();
                                            data.g[0]=null; 
                                            data.Destroy();
                                            u.PositionEnabled(true); 
                                            u.Pause(false);     
                                            t.Destroy();     
                                        }
                                    }else{
                                        Spell(data.c[1]).Destroy();
                                        data.Destroy();
                                        u.PositionEnabled(true); 
                                        u.Pause(false);   
                                    }
                                    t.Destroy();   
                                }else{
                                    if(u.IsTimeStop()==false){
                                        data.r[1]-=0.01;
                                    }
                                }
                            }); 
                        }else{    
                            u.PositionEnabled(true); 
                            u.Pause(false);  
                            Spell(data.c[1]).Destroy();   
                            data.Destroy();
                        }
                        t.Destroy(); 
                    }else{ 
                        u.PositionEnabled(true); 
                        u.Pause(false);  
                        Spell(data.c[1]).Destroy();   
                        data.Destroy();
                        t.Destroy();           
                    }
                }else{
                    if(u.IsTimeStop()==false){ 
                        data.r[0]-=0.01;
                    }
                }
                
            }); 
        }

        //  9 后摇 11戳 10前摇 8蓄力
        static method E(Spell e){
            Units u=Units.Get(e.Spell);
            Data data=Data.create('A00D');
            timer t=NewTimer();
            u.Pause(true);
            u.AnimeId(10);
            data.c[0]=u;
            data.c[2]=e;
            data.r[0]=0;//蓄力时间 
            data.r[1]=e.Angle;//角度
            data.i[3]=2; 
            if(u.IsAbility('B006')==true){ 
                SpellNameText(u.unit,"! 龙落击 !",3,15);
                data.r[0]=1;
            } 
            SetTimerData(t,data);  
            TimerStart(t,0.1,true,function(){
                Data data=Data(GetTimerData(GetExpiredTimer()));
                Units mj;
                Units u=Units(data.c[0]);
                Dash dash; 
                boolean pr=true;
                if(data.r[0]>=0.1){
                    pr=u.player.press.E;
                }
                if(pr==true&&data.r[0]<=2&&u.IsAbility('BPSE')==false&&u.Alive()==true){ 
                    if(u.IsTimeStop()==false){ 
                        data.r[0]+=0.1;
                        if(data.r[0]==0.2){
                            u.AnimeId(8);
                            u.AnimeSpeed(2); 
                            RunSoundOnUnit(DazzleMaster.E_sound[0], u.unit); 
                        } 
                        
                        if(data.r[0]==0.8){
                            RunSoundOnUnit(DazzleMaster.E_sound[1], u.unit); 
                        }
                        if(data.r[0]==1.3){
                            
                            RunSoundOnUnit(DazzleMaster.E_sound[2], u.unit); 
                        }
                        if(data.r[0]==1.8){ 
                            RunSoundOnUnit(DazzleMaster.E_sound[3], u.unit); 
                        }
                        if(data.r[0]==0.5||data.r[0]==1||data.r[0]==1.5||data.r[0]==2){
                            TextForPlayer(u.player.player,u.unit,R2S((data.r[0]/2)*100.0)+"%",0.4,12,45);     
                        } 
                        if(data.i[3]==0){
                            data.i[3]=2;
                            Units.MJ(u.player.player,'e008','A00D',0,u.X(),u.Y(),GetRandomReal(0,360),2,0.2,1.5, "stand","kc12.mdx"); 
                        }else{
                            data.i[3]-=1;
                        }
                    }
                    /*if(data.r[0]>=0.5){
                        u.SetF(Util.XYEX(u.X(),u.Y(),u.player.press.MouseX,u.player.press.MouseY),false);
                    }*/
                }else{ 
                    ReleaseTimer(GetExpiredTimer()); 
                    if(data.r[0]>2){
                        data.r[0]=2;
                    }
                    if(u.Alive()==false){
                        data.r[0]=0;
                    }else{ 
                        u.SetF(data.r[1],true);
                        mj=Units.MJ(u.player.player,'e008','A00D',0,u.X(),u.Y(),u.F(),0.6,0.8,1.5, "birth","dg_fire.mdx");
                        mj.SetH(100);
                        Dash.Start(mj.unit,u.F(),350+(data.r[0]*250),Dash.ADD,80,true,false);
                    }
                    if(data.r[0]!=0){ 
                        TextForPlayer(u.player.player,u.unit,R2S((data.r[0]/2)*100)+"%落花!",0.8,14,300);
                    }
                    if(data.r[0]>1.5){
                        mj=Units.MJ(u.player.player,'e009','A00D',0,u.X(),u.Y(),u.F(),2,1.5,2, "stand","wind.mdx");
                        mj.SetH(200); 
                        Dash.Start(mj.unit,u.F(),200,Dash.ADD,60,true,false);
                    }
                    u.AnimeSpeed(3);
                    u.AnimeId(11);//突刺换为转转,突刺：11，转转：16
                    mj=Units.MJ(u.player.player,'e008','A00D',0,u.X(),u.Y(),u.F(),3600,0.9,1, "birth","bimuyu_fire.mdx");
                    mj.SetH(100);
                    data.c[1]=mj;
                    data.i[0]=0;
                    data.i[1]=0;//是否播放过后摇
                    data.g[0]=CreateGroup();
                    
                    Units.MJ(u.player.player,'e008','A00D',0,u.X(),u.Y(),0,2,1,1, "stand","ThunderClapCaster_fire.mdx").Alpha(200);
                    Util.Duang(u.X(),u.Y(),0.4,200,200,-(data.r[0]*51.2),0.04,100);
                    dash=Dash.Start(u.unit,u.F(),350+(data.r[0]*250),Dash.SUB,80,true,false);
                    dash.Obj=data; 
                    dash.onMove=function(Dash dash){
                        Data data=Data(dash.Obj);
                        Units u=Units(data.c[0]);
                        Units mj=Units(data.c[1]);
                        Units tmp; 
                        u.SetF(dash.Angle,true);
                        mj.Position(dash.X+150*CosBJ(dash.Angle+180),dash.LastY+150*SinBJ(dash.Angle+180),false);
                        mj.SetF(dash.Angle,true);
                        if(data.i[1]==0){
                            if(dash.Speed<3){
                                data.i[1]=1;
                                u.AnimeSpeed(1);
                                u.AnimeId(9);
                            }
                        } 
                        //枪头判定
                        GroupEnumUnitsInRange(tmp_group,dash.X+160*CosBJ(dash.Angle),dash.Y+160*SinBJ(dash.Angle),100,function GroupIsAliveNotAloc);
                        while(FirstOfGroup(tmp_group)!=null){
                            tmp=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,tmp.unit);
                            if(IsUnitEnemy(tmp.unit,u.player.player)==true&&IsUnitInGroup(tmp.unit,data.g[0])==false){ 
                                GroupAddUnit(data.g[0],tmp.unit);   
                                u.Damage(tmp.unit,Damage.Chaos,'A00D',u.Agi(true)*(12+(data.r[0]*2.5)));
                                DestroyEffect( AddSpecialEffectTarget("hit_b.mdx", tmp.unit, "chest") );
                                DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl", tmp.X(),tmp.Y()) );
                                Dash.Start(tmp.unit,dash.Angle,350+(data.r[0]*2)*50,Dash.SUB,15+(15*data.r[0]),true,true);
                                if(data.i[0]==0){
                                    data.i[0]=1;
                                    AddDazzle(u.unit,3);
                                } 
                            }
                        }
                        GroupClear(tmp_group);
                        //身周判定
                        GroupEnumUnitsInRange(tmp_group,dash.X+80*CosBJ(dash.Angle),dash.Y+80*SinBJ(dash.Angle),100,function GroupIsAliveNotAloc);
                        while(FirstOfGroup(tmp_group)!=null){
                            tmp=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,tmp.unit);
                            if(IsUnitEnemy(tmp.unit,u.player.player)==true&&IsUnitInGroup(tmp.unit,data.g[0])==false){ 
                                GroupAddUnit(data.g[0],tmp.unit);   
                                u.Damage(tmp.unit,Damage.Chaos,'A00D',u.Agi(true)*(12+(data.r[0]*2.5)));
                                DestroyEffect( AddSpecialEffectTarget("hit_b.mdx", tmp.unit, "chest") );
                                DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl", tmp.X(),tmp.Y()) );
                                Dash.Start(tmp.unit,dash.Angle,350+(data.r[0]*2)*50,Dash.SUB,15+(15*data.r[0]),true,true);
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
                        u.SetF(dash.Angle,true);
                        mj.Anime("death");
                        mj.Life(1);
                        GroupClear(data.g[0]);
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
            Data data=Data.create('A00B');
            u.Pause(true);
            //刀光特效版取消的特效
            //Units.MJ(u.player.player,'e008','A00B',0,u.X(),u.Y(),0,2,1,1, "stand","dust1.mdx");
            Units.MJ(u.player.player,'e008','A00B',0,u.X(),u.Y(),e.Angle,2,1.5,2, "stand","dust2.mdx");
            //刀光特效改动，原版:0.8,-120 
            Util.Duang(u.X(),u.Y(),0.3,200,200,-48,0.04,100);
            data.c[0]=u;
            data.c[1]=e;
            data.i[0]=0;
            dash=Dash.Start(u.unit,e.Angle,250,Dash.SUB,40,true,false);
            dash.Obj=data;
            dash.onMove=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units.Get(dash.Unit);
                Units mj;
                Units tmp;
                integer s=0;
                real x,y;
                if(dash.NowDis>100&&dash.NowDis<115){ 
                    u.SetF(dash.Angle,true); 
                    u.AnimeId(7);                    
                    
                    mj=Units.MJ(u.player.player,'e009','A00B',0,u.X(),u.Y(),dash.Angle,2,0.7,2, "death","wind1.mdx");
                    mj.SetH(150);
                    Dash.Start(mj.unit,dash.Angle,250,Dash.SUB,10,true,false);                    
                    mj=Units.MJ(u.player.player,'e009','A00B',0,u.X(),u.Y(),dash.Angle,2,1,1.5, "death","wind1.mdx");
                    mj.SetH(200);
                    Dash.Start(mj.unit,dash.Angle,350,Dash.SUB,15,true,false);
                    x=dash.X+100*CosBJ(dash.Angle);
                    y=dash.Y+100*SinBJ(dash.Angle);
         
                        if(GroupFind(u.unit,x,y,250,false,false)!=null){ 
                            if(data.i[0]==0){
                                data.i[0]=1;
                                u.Pause(false);
                            }
                            Buffs.Add(u.unit,'A011','B006',0.5,false);
                            AddDazzle(u.unit,2); 
                            //刀光特效版          
                            mj=Units.MJ(u.player.player,'e008','A00B',0,u.X(),u.Y(),dash.Angle,0.6,0.8,1.5, "birth","dg.mdx");
                            mj.SetH(100);
                            Dash.Start(mj.unit,dash.Angle,200,Dash.ADD,80,true,false);
                            //---
                            tmp=Units.MJ(u.player.player,'e009','A002',0,dash.X,dash.Y,dash.Angle,2,2.5,2, "stand","wind.mdx");
                            tmp.SetH(200); 
                            Dash.Start(tmp.unit,dash.Angle+180,450,Dash.SUB,60,true,false);
                            
                            GroupEnumUnitsInRange(tmp_group,x,y,250,function GroupIsAliveNotAloc);
                            while(FirstOfGroup(tmp_group)!=null){
                                tmp=Units.Get(FirstOfGroup(tmp_group));
                                GroupRemoveUnit(tmp_group,tmp.unit);
                                if(IsUnitEnemy(tmp.unit,u.player.player)==true){  
                                    Buffs.Skill(tmp.unit,'A00C',1); 
                                    u.Damage(tmp.unit,Damage.Physics,'A00B',u.Agi(true)*6+u.Str(true)*6);
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
                Data data=Data(dash.Obj);
                Units u=Units.Get(dash.Unit); 
                if(data.i[0]==0){ 
                    u.Pause(false);
                }
                u.Alpha(255);
                Spell(data.c[1]).Destroy();
                data.Destroy();
            }; 
        }

        static method Q(Spell e){
            Units u=Units.Get(e.Spell);
            Dash dash;
            Data data=Data.create('A009');
            Units ts;
            u.Pause(true);
            u.Alpha(0);
            u.AnimeId(3);
            data.c[0]=u;
            data.c[1]=e;
            data.i[0]=0;
            data.g[0]=CreateGroup();    
            ts=Units.MJ(u.player.player,'e008','A00B',0,u.X(),u.Y(),e.Angle,10,1,0.7, "stand","kiyohime_lancer.mdl");  
            ts.AnimeId(3); 
            ts.AnimeSpeed(0.7);
            data.c[2]=ts;
            data.i[1]=0;
            Units.MJ(u.player.player,'e008','A00B',0,u.X(),u.Y(),e.Angle,4,1,2.5, "stand","dust2.mdx"); 
            dash=Dash.Start(ts.unit,e.Angle,600,Dash.SUB,60,true,false);
            dash.Obj=data;
            dash.onMove=function(Dash dash){
                Data data=Data(dash.Obj);
                Units du=Units.Get(dash.Unit);
                Units u=Units(data.c[0]);
                Units tmp; 
                u.Position(du.X(),du.Y(),false);
                GroupEnumUnitsInRange(tmp_group,u.X()+100*CosBJ(dash.Angle),u.Y()+100*SinBJ(dash.Angle),90,function GroupIsAliveNotAloc);
                while(FirstOfGroup(tmp_group)!=null){
                    tmp=Units.Get(FirstOfGroup(tmp_group));
                    GroupRemoveUnit(tmp_group,tmp.unit);
                    if(IsUnitEnemy(tmp.unit,u.player.player)==true&&IsUnitInGroup(tmp.unit,data.g[0])==false){ 
                        GroupAddUnit(data.g[0],tmp.unit);
                        Buffs.Skill(tmp.unit,'A00A',1);
                        HitFlys.Add(tmp.unit,25);
                        u.Damage(tmp.unit,Damage.Magic,'A009',u.Agi(true)*3+u.Str(true)*4);
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
                    if(data.i[1]==0){
                        data.i[1]=1; 
                        u.Pause(false);  
                    }
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
                Units.Remove(Units(data.c[2]).unit);
                Spell(data.c[1]).Destroy();
                u.Alpha(255);
                if(data.i[1]==0){ 
                    u.Pause(false);  
                }
                data.Destroy();
            };
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
        Damage.On(Damage.onUnitDamage_EndDamage,DazzleMaster.Attack);
        Units.On(Units.onHeroSpawn,DazzleMaster.Spawn);
        Units.On(Units.onAlocDeath,DazzleMaster.Death);
        DazzleMaster.DazzlePath[0]="ball_nothing_ex.mdx";
        DazzleMaster.DazzleName[0]="无属性";
        DazzleMaster.DazzlePath[1]="ball_light_ex.mdx";
        DazzleMaster.DazzleName[1]="光属性";
        DazzleMaster.DazzlePath[2]="ball_ice_ex.mdx";
        DazzleMaster.DazzleName[2]="冰属性";
        DazzleMaster.DazzlePath[3]="ball_fire_ex.mdx";
        DazzleMaster.DazzleName[3]="火属性";
        DazzleMaster.DazzlePath[4]="ball_dark_ex.mdx";
        DazzleMaster.DazzleName[4]="暗属性";
        DazzleMaster.E_sound[0] = DefineSound("resource\\sound_effect_xuanwendashi_e_0.wav",1000, false, true);
        DazzleMaster.E_sound[1] = DefineSound("resource\\sound_effect_xuanwendashi_e_1.wav",1000, false, true);
        DazzleMaster.E_sound[2] = DefineSound("resource\\sound_effect_xuanwendashi_e_2.wav",1000, false, true);
        DazzleMaster.E_sound[3] = DefineSound("resource\\sound_effect_xuanwendashi_e_3.wav",1000, false, true);
 
    }
}