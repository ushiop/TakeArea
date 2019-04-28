library SwordMaster requires Groups{
    //英雄‘剑圣’的技能
    //R级英雄
    struct SwordMaster{

        static method R(Spell e){
            Units u=Units.Get(e.Spell);
            Data data=Data.create('A01F');
            timer t=NewTimer();
            u.Pause(true); 
            u.AnimeId(10);
            data.c[0]=u;
            data.c[1]=e;
            data.r[0]=45;
            data.r[1]=0;
            data.r[2]=0;
            DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIvi\\AIviTarget.mdl", u.unit, "hand right") );
            SetTimerData(t,data);
            TimerStart(t,1,false,function(){
                Data data=Data(GetTimerData(GetExpiredTimer()));
                Units u=Units(data.c[0]); 
                u.Pause(false);
                if(u.Alive()==true){
                    Buffs.Add(u.unit,'A01G','B009',10,false);
                    u.AddAbility('A01H');
                    u.AddAbility('A01J');
                    TimerStart(GetExpiredTimer(),0.01,true,function(){ 
                        Data data=Data(GetTimerData(GetExpiredTimer()));
                        Units u=Units(data.c[0]);
                        Units mj;
                        if(u.IsTimeStop()==false){     
                            if(data.r[1]==1){
                                u.RemoveAbility('A01J');
                                u.RemoveAbility('A01H');
                                u.SetH(0);
                                Spell(data.c[1]).Destroy();
                                data.Destroy();
                                ReleaseTimer(GetExpiredTimer());
                            }else{
                                if(data.r[2]==0){
                                    if(u.Alive()==false||u.IsAbility('B009')==false){
                                        data.r[1]=1;
                                    }else{ 
                                        data.r[0]=25; 
                                        data.r[2]=1;  
                                        Util.Duang(u.X(),u.Y(),0.3,150,150,-256,0.02,50);
                                        Dash.Start(u.unit,u.F(),300,Dash.SUB,10,true,false).onMove=function(Dash dash){
                                            dash.Angle=Units.Get(dash.Unit).F();
                                        };
                                        DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl",u.X(),u.Y()) );
                                        GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),200,function GroupIsAliveNotAloc);                   
                                        while(FirstOfGroup(tmp_group)!=null){
                                            mj=Units.Get(FirstOfGroup(tmp_group));
                                            GroupRemoveUnit(tmp_group,mj.unit);
                                            if(IsUnitEnemy(mj.unit,u.player.player)==true){
                                                //DestroyEffect( AddSpecialEffectTarget("qqqqq.mdl", mj.unit, "chest") );
                                                u.Damage(mj.unit,Damage.Physics,'A01F',u.Agi(true)*5.0);  
                                                HitFlys.Add(mj.unit,25);
                                                Buffs.Add(mj.unit,'A01I','B00A',2,false).Type=Buffs.TYPE_SUB+Buffs.TYPE_DISPEL_TRUE;
                                            }
                                        }
                                        GroupClear(tmp_group);   
                                    }
                                }else{
                                    u.SetH(u.H()+data.r[0]);
                                    if(u.H()<=20){
                                        data.r[2]=0;
                                    }
                                    data.r[0]-=0.98;
                                }
                            }
                        }
                    });
                }else{
                    Spell(data.c[1]).Destroy();
                    data.Destroy();
                    ReleaseTimer(GetExpiredTimer());
                }
            });
            t=null;
        }

        //10
        static method E(Spell e){
            Units u=Units.Get(e.Spell);
            Data data=Data.create('A01D');
            Dash dash;
            u.Pause(true);
            u.AnimeId(10);
            u.AnimeSpeed(1.5);
            data.c[0]=u; 
            data.c[1]=e;
            data.g[0]=CreateGroup();
            data.i[0]=0;
            DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIvi\\AIviTarget.mdl", u.unit, "hand right") );
            HitFlys.Add(u.unit,25); 
            dash=Dash.Start(u.unit,u.F(),1200,Dash.SUB,45,true,false);
            dash.Obj=data;
            dash.onMove=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units(data.c[0]);
                Units mj;
                dash.Angle=u.F();
                if(dash.Speed<2){
                    dash.Stop();
                }else{
                    GroupEnumUnitsInRange(tmp_group,dash.X,dash.Y,150,function GroupIsAliveNotAloc);                   
                    while(FirstOfGroup(tmp_group)!=null){
                        mj=Units.Get(FirstOfGroup(tmp_group));
                        GroupRemoveUnit(tmp_group,mj.unit);
                        if(IsUnitEnemy(mj.unit,u.player.player)==true){
                            if(IsUnitInGroup(mj.unit,data.g[0])!=true){ 
                                GroupAddUnit(data.g[0],mj.unit);  
                                DestroyEffect( AddSpecialEffectTarget("qqqqq.mdl", mj.unit, "chest") );
                                u.Damage(mj.unit,Damage.Physics,'A01D',u.Agi(true)*15.0);  
                                HitFlys.Add(mj.unit,25);
                            }
                        }
                    }
                    GroupClear(tmp_group);   
                    if(dash.Speed<10){
                        if(data.i[0]==0){
                            data.i[0]=1;
                            u.Pause(false);
                        }
                    }
                }
            };
            dash.onEnd=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units(data.c[0]);
                DestroyGroup(data.g[0]);
                data.g[0]=null;
                u.AnimeSpeed(1);
                if(data.i[0]==0){ 
                    u.Pause(false);
                }
                Spell(data.c[1]).Destroy();
                data.Destroy();
            };

        } 


        //13
        static method W(Spell e){
            Units u=Units.Get(e.Spell);
            timer t=NewTimer();
            Data data=Data.create('A01E');  
            u.Pause(true);
            u.Pause(false); 
            u.SetMoveSpeed(100);
            u.Alpha(0); 
            data.c[0]=u;
            data.c[1]=e;
            data.g[0]=CreateGroup();
            u=Units.MJ(u.player.player,'e008','A01E',0,u.X(),u.Y(),0,10,1.15,2, "stand","units\\orc\\HeroBladeMaster\\HeroBladeMaster.mdl"); 
            u.AnimeId(13);
            data.c[2]=u;
            data.r[0]=1;
            SetTimerData(t,data);
            TimerStart(t,0.02,true,function(){
                Data data=Data(GetTimerData(GetExpiredTimer()));
                Units u=Units(data.c[0]);
                Units mj=Units(data.c[2]);
                Dash dash;
                real x=u.X(),y=u.Y();
                if(u.IsTimeStop()==false){ 
                    if(u.IsAbility('B009')==true){
                        if(u.GetAbilityCD('A01E')>1){ 
                            u.SetAbilityCD('A01E',1);
                            u.SetMP(u.MP()+75); 
                        }
                    }
                    if(u.Alive()==false||data.r[0]<=0){
                        DestroyGroup(data.g[0]);
                        data.g[0]=null;
                        mj.Alpha(0);
                        mj.Anime("stand");
                        mj.Life(2);
                        u.SetMoveSpeed(-100);
                        u.Alpha(255);
                        Spell(data.c[1]).Destroy();
                        data.Destroy();
                        ReleaseTimer(GetExpiredTimer());
                    }else{
                        mj.SetH(u.H());
                        mj.Position(x,y,false); 
                        GroupEnumUnitsInRange(tmp_group,x,y,300,function GroupIsAliveNotAloc);                   
                        while(FirstOfGroup(tmp_group)!=null){
                            mj=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,mj.unit);
                            if(IsUnitEnemy(mj.unit,u.player.player)==true){
                                if(IsUnitInGroup(mj.unit,data.g[0])!=true){ 
                                    GroupAddUnit(data.g[0],mj.unit);  
                                    DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl", mj.unit, "origin") );
                                    if(u.IsAbility('B009')==true){
                                        HitFlys.Add(mj.unit,20);
                                        u.Damage(mj.unit,Damage.Physics,'A01E',u.Agi(true)*2.0);  
                                    }else{ 
                                        u.Damage(mj.unit,Damage.Physics,'A01E',u.Agi(true)*10.0);  
                                    }
                                    dash=Dash.Start(mj.unit,Util.XY(u.unit,mj.unit)-45,600,Dash.PWX,25,true,true);
                                    dash.Obj=3;
                                    dash.onMove=function(Dash dash){ 
                                        dash.Angle+=4;
                                        if(dash.Obj==0){
                                            dash.Obj=3;
                                            DestroyEffect( AddSpecialEffect("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl", dash.X,dash.Y) );
                                        }else{
                                            dash.Obj-=1;
                                        }
                                    }; 
                                }
                                mj.Position(mj.X()+10*CosBJ(Util.XY(u.unit,mj.unit)),mj.Y()+10*SinBJ(Util.XY(u.unit,mj.unit)),true);
                            }
                        }
                        GroupClear(tmp_group);    
                        data.r[0]-=0.02;
                    }
                }
            });
            t=null;

        }


        static method AI(unit ua){
            Units u=Units.Get(ua);
            unit target,no;
            real x=u.X(),y=u.Y();
            real x1,y1;
            target=GroupFind(u.unit,x,y,1000,true,false);
            if(target!=null){
                x1=GetUnitX(target);
                y1=GetUnitY(target);

                no=GroupFind(u.unit,x,y,300,true,false);
                if(no!=null){ 
                    u.SetF(Util.XY(u.unit,no),true); 
                    IssueImmediateOrder( u.unit, "fanofknives" );//快乐风暴
                }  
 
                IssueImmediateOrder( u.unit, "hex" );//快乐蹦迪
                
                IssueImmediateOrder( u.unit, "heal" );//快乐冲刺
            }
            target=null;
            no=null;
        }
 

        //绑定AI施法
        static method Spawn(Units u,Units m){
            if(u.IsAbility('A01F')==true){
                u.ai=SwordMaster.AI;
            }
        }

        static method Damage(DamageArgs e){
            if(e.DamageType==Damage.Attack&&e.DamageUnit.IsAbility('A01E')==true&&e.TriggerUnit.IsAbility('B00J')==true){
                HitFlys.Add(e.TriggerUnit.unit,15);              
            }
        }

        static method onInit(){
            Spell.On(Spell.onSpell,'A01E',SwordMaster.W); 
            Spell.On(Spell.onSpell,'A01D',SwordMaster.E);  
            Spell.On(Spell.onSpell,'A01F',SwordMaster.R);   
            Units.On(Units.onHeroSpawn,SwordMaster.Spawn);
            Damage.On(Damage.onUnitDamage_EndDamage,SwordMaster.Damage);
        }
    }
}