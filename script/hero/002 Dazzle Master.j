library DazzleMaster requires TimerUtils,Groups,Units{
    //英雄'炫纹大师'技能
    //SR级英雄

    public struct DazzleMaster{

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
            if(u.aid=='A008'){
                data=Data(u.Obj);
                GroupRemoveUnit(data.g[0],u.unit);
                u.RemoveObj(); 
            }
        }

        //为指定单位添加一个炫纹
        static method AddDazzle(unit u,integer id){
            Units s=Units.Get(u);
            Data data=Data(s.Obj);
            Units mj=Units.MJ(s.player.player,'e008','A008',id,s.X(),s.Y(),0,15,1.5,1, "stand","Abilities\\Weapons\\BloodElfMissile\\BloodElfMissile.mdl");
            mj.AddObj(data);
            GroupAddUnit(data.g[0],mj.unit); 
        }

        //炫纹大师被创建时触发,绑定炫纹数据开启计时器
        static method Spawn(Units u,Units m){
            timer t;
            Data data;
            if(u.IsAbility('A008')==true){
                t=NewTimer();
                data=Data.create('A008');
                data.c[0]=u;
                data.r[0]=0;//'炫纹发射'带来的移动速度加成总额
                data.r[1]=0;//'炫纹发射'带来的攻击速度加成总额
                data.r[2]=0;//用于计算炫纹上下浮动的值
                data.i[0]=0;//用于计算无属性炫纹的触发
                data.g[0]=CreateGroup();//炫纹单位组
                u.AddObj(data);
                SetTimerData(t,data);
                TimerStart(t,0.01,true,function(){
                    Data data=Data(GetTimerData(GetExpiredTimer()));
                    Units u=Units(data.c[0]);
                    Units tmp;
                    real h=0,x,y,dis,fa,ra;
                    data.r[2]=data.r[2]+1;
                    if(data.r[2]>96) data.r[2]=data.r[2]-96;
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
                        data.g[0]=null;
                        u.RemoveObj();
                        data.Destroy();  
                    }else{
                        x=u.X()+(75+GroupNumber(data.g[0])*5)*CosBJ(u.F()+180);
                        y=u.Y()+(75+GroupNumber(data.g[0])*5)*SinBJ(u.F()+180);
                        GroupAddGroup(data.g[0],tmp_group);  
                        while(FirstOfGroup(tmp_group)!=null){
                            tmp=Units.Get(FirstOfGroup(tmp_group));
                            ra=360.0/GroupNumber(data.g[0])*(h/5);
                            dis=(Util.XY2(tmp.unit,u.unit)/100)+(GroupNumber(data.g[0])*5); 
                            x=x+(dis)*CosBJ(ra);
                            y=y+(dis)*SinBJ(ra);
                            tmp.Position(x,y,false);
                            tmp.SetH(70+(150*Util.GetPwx(3.99,data.r[2]+GetRandomReal(0,10),96)));
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

        static method W(Spell e){
            Units u=Units.Get(e.Spell); 
            Dash dash;
            u.Pause(true);
            Units.MJ(u.player.player,'e008','A00B',0,u.X(),u.Y(),0,2,1,1, "stand","dust1.mdx");
            Units.MJ(u.player.player,'e008','A00B',0,u.X(),u.Y(),e.Angle,2,1.5,2, "stand","dust2.mdx"); 
            Util.Duang(u.X(),u.Y(),0.5,200,200,-82,0.04,100);
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
                    GroupEnumUnitsInRange(tmp_group,x,y,200,function GroupIsAliveNotAloc);
                    if(GroupNumber(tmp_group)!=0){ 
                        while(FirstOfGroup(tmp_group)!=null){
                            tmp=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,tmp.unit);
                            if(IsUnitEnemy(tmp.unit,u.player.player)==true){  
                                s+=1;
                            }
                        }
                        GroupClear(tmp_group); 
                        if(s!=0){ 
                            GroupEnumUnitsInRange(tmp_group,x,y,200,function GroupIsAliveNotAloc);
                            AddDazzle(u.unit,2);           
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
                    }else{ 
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
                        if(dash.NowDis<500){ 
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
        Spell.On(Spell.onSpell,'A009',DazzleMaster.Q);
        Spell.On(Spell.onSpell,'A00B',DazzleMaster.W);
        Spell.On(Spell.onReady,'A009',DazzleMaster.HERO_START);
        Spell.On(Spell.onStop,'A009',DazzleMaster.HERO_STOP);   
        Damage.On(Damage.onHeroDamageed,DazzleMaster.Attack);
        Units.On(Units.onHeroSpawn,DazzleMaster.Spawn);
        Units.On(Units.onAlocDeath,DazzleMaster.Death);
    }
}