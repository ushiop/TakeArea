library BlackSaber requires Groups{
    //英雄'黑-saber'的技能
    //SR级
    struct BlackSaber{

        static integer Q_HIT;

        //16
        static method E1(unit u){
            
        }

        static method E(Spell e){
            Units u=Units.Get(e.Spell);
            Data data=Data.create('A00X'); 
            timer t=NewTimer();
            u.Pause(true); 
            u.AnimeId(16);
            u.AnimeSpeed(3.5);
            u.AddAbility('A00Z');
            data.c[0]=u;
            data.c[1]=e;
            data.i[0]=0;
            data.r[0]=0;
            data.r[1]=0;
            data.r[2]=0;
            SetTimerData(t,data);
            Dash.Start(u.unit,u.F(),300,Dash.SUB,10,true,false); 
            Units.MJ(u.player.player,'e008','A00X',0,u.X(),u.Y(),0,2,0.4,1, "stand","white-qiquan.mdl"); 
            TimerStart(t,0.01,true,function(){
                Data data=Data(GetTimerData(GetExpiredTimer()));
                Units u=Units(data.c[0]);
                real x,y;
                Units mj;
                if(u.Alive()==true){
                    data.r[0]+=0.01;
                    if(data.r[0]<0.2){ 
                        u.SetH(u.H()+20);
                    }else{ 
                        u.SetH(u.H()-20);
                    }
                    if(data.r[0]>0.5){ 
                        u.RemoveAbility('A00Z');
                        u.AnimeSpeed(1);
                        u.Pause(false);
                        Spell(data.c[1]).Destroy();
                        data.Destroy();
                        ReleaseTimer(GetExpiredTimer());
                    }else{ 
                        if(data.r[0]<0.3){
                            DestroyEffect( AddSpecialEffectTarget("dark5.mdx", u.unit, "weapon") );   
                            if(data.r[0]<0.2){
                                DestroyEffect( AddSpecialEffectTarget("fire-boom-new-darkblue-2.mdl", u.unit, "weapon") );   
                            } 
                        }
                        if(data.r[1]==0){
                            data.r[1]=0.1; 
                            data.r[2]+=1;
                            x=u.X()+125*CosBJ(u.F());
                            y=u.Y()+125*SinBJ(u.F());
                            GroupEnumUnitsInRange(tmp_group,x,y,150,function GroupIsAliveNotAloc);                   
                            while(FirstOfGroup(tmp_group)!=null){
                                mj=Units.Get(FirstOfGroup(tmp_group));
                                GroupRemoveUnit(tmp_group,mj.unit);
                                if(IsUnitEnemy(mj.unit,u.player.player)==true){ 
                                    if(data.r[2]==1||data.r[2]==5){ 
                                        if(data.r[2]==1){
                                            HitFlys.Add(mj.unit,20);
                                        }
                                        u.Damage(mj.unit,'A00X',Damage.Magic,u.Int(true)*3);
                                        DestroyEffect( AddSpecialEffectTarget("fire-boom-new-darkblue-3.mdl", mj.unit, "chest") );
                                        mj.Position(mj.X()+25*CosBJ(u.F()),mj.Y()+25*SinBJ(u.F()),true);
                                    }
                                    if(data.r[2]>=2&&data.r[2]<=4){
                                        if(mj.H()>10){ 
                                            HitFlys.Add(mj.unit,7);
                                            u.Damage(mj.unit,'A00X',Damage.Chaos,u.Int(true)*3);
                                            DestroyEffect( AddSpecialEffectTarget("fire-boom-new-darkblue-3.mdl", mj.unit, "chest") );
                                            mj.Position(mj.X()+25*CosBJ(u.F()),mj.Y()+25*SinBJ(u.F()),true);
                                        }
                                    } 
                                }
                            }
                            GroupClear(tmp_group);                               
                        }else{
                            data.r[1]-=0.01;
                        }
                    }
                }else{ 
                    u.RemoveAbility('A00Z');
                    u.AnimeSpeed(1);
                    u.Pause(false);
                    Spell(data.c[1]).Destroy();
                    data.Destroy();
                    ReleaseTimer(GetExpiredTimer());
                }
            });
            t=null;

        }

        static method W(Spell e){
            Units u=Units.Get(e.Spell); 
            Units mj;
            Dash dash;
            real x=u.X()+50*CosBJ(e.Angle),y=u.Y()+50*SinBJ(e.Angle);
            u.Pause(true);
            u.AnimeId(14);
            u.Pause(false); 
            mj=Units.MJ(u.player.player,'e008','A00V',0,x,y,e.Angle,10,1,1, "stand","dark4_fast.mdl");  
            //mj.SetH(100);
            dash=Dash.Start(mj.unit,e.Angle,450,Dash.SUB,30,true,false);
            dash.onMove=function(Dash dash){
                Units u=Units.Get(dash.Unit);
                Units mj;
                real dis,a; 
                if(dash.Speed<2){ 
                    GroupEnumUnitsInRange(tmp_group,dash.X,dash.Y,200,function GroupIsAliveNotAloc);                   
                    while(FirstOfGroup(tmp_group)!=null){
                        mj=Units.Get(FirstOfGroup(tmp_group));
                        GroupRemoveUnit(tmp_group,mj.unit);
                        if(IsUnitEnemy(mj.unit,u.player.player)==true){ 
                            u.Damage(mj.unit,'A00V',Damage.Magic,u.Int(true)*10);
                        }
                    }
                    GroupClear(tmp_group);    
                    Units.MJ(u.player.player,'e008','A00V',0,dash.X,dash.Y,0,1,0.2,2, "stand","black_thunderclapcaster.mdl"); 
                    Units.MJ(u.player.player,'e008','A00V',0,dash.X,dash.Y,0,5,0.7,2, "death","fire-boom-new-darkblue.mdl"); 
                    mj=Units.MJ(u.player.player,'e008','A00V',0,dash.X,dash.Y,0,1.3,3,1, "birth","blue-fire.mdl");
                    mj.SetH(125); 
                    mj.DelaySize(5,0.4);
                    mj.DelayAnime(2,0.8);
                    dash.Stop();
                }else{ 
                    dis=GetRandomReal(0,100);
                    a=GetRandomReal(0,360);
                    mj=Units.MJ(u.player.player,'e008','A00V',0,dash.X+dis*CosBJ(a),dash.Y+dis*SinBJ(a),0,0.3,1,1, "stand","blue-fire.mdl");
                    mj.SetH(100);  
                    mj.DelayAnime(2,0.15); 
                    GroupEnumUnitsInRange(tmp_group,dash.X,dash.Y,200,function GroupIsAliveNotAloc);                   
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
                u.Life(5);
                u.Anime("death");
            };
            e.Destroy();
        }

        //3 8
        static method Q(Spell e){
            Units u=Units.Get(e.Spell);
            Dash dash;
            u.Pause(true);
            u.AnimeId(3);
            u.AnimeSpeed(1); 
            dash=Dash.Start(u.unit,e.Angle,1000,Dash.ADD,70,true,false);
            dash.Obj=e;
            dash.onMove=function(Dash dash){
                Units u=Units.Get(dash.Unit);
                real x=u.X()+50*CosBJ(dash.Angle),y=u.Y()+50*SinBJ(dash.Angle);
                unit k=null;  
                Units mj;
                    if(dash.Speed<1.5){
                        DestroyEffect( AddSpecialEffect("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl", dash.X,dash.Y) );
                    }
                    k=GroupFind(u.unit,x,y,70,true,false);
                    if(k!=null){ 
                        dash.Stop();
                        Buffs.Add(u.unit,'A010','B005',0.5,false);
                        u.Pause(true);
                        u.AnimeSpeed(2.5);
                        u.DelayReleaseAnimePause(0.3); 
                        u.Damage(k,Damage.Physics,'A00U',u.Str(true)*5.0);
                        u.SetF(Util.XY(u.unit,k),true);
                        Buffs.Skill(k,'A00W',1);   
                        Units.MJ(u.player.player,'e008','A00U',0,GetUnitX(k),GetUnitY(k),0,2,0.7,2.5, "stand","hit-red.mdl").SetH(100); 
                       
                        DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",k, "chest") );
                        if(dash.NowDis>100){
                            Dash.Start(u.unit,Util.XY(k,u.unit),200*(dash.NowDis/dash.MaxDis),Dash.SUB,20,true,false);
                        }
                        RunSoundOnUnit(BlackSaber.Q_HIT,k); 
 
                    }
                    k=null;
                 
            };
            dash.onEnd=function(Dash dash){
                Units u=Units.Get(dash.Unit);
                Spell(dash.Obj).Destroy(); 
                u.AnimeSpeed(1);
                u.Pause(false);
            };
        } 
        static method HERO_START(Spell e){
            Units u=Units.Get(e.Spell);
            if(e.Id=='A00V'){
                u.AnimeSpeed(1.75);
                u.FlushAnimeId(7); 
                e.Destroy();
            }
            if(e.Id=='A00X'){
                if(u.IsAbility('B005')==false){ 
                    u.FlushAnimeId(15);
                    e.Destroy();
                }else{ 
                    if(u.MP()>=150){
                        if(u.GetAbilityCD('A00X')==0){ 
                            u.SetMP(u.MP()-150);
                            u.SetAbilityCD('A00X',15);
                            BlackSaber.E(e); 
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
            Units u=Units.Get(e.Spell);
            if(e.Id=='A00V'){
                u.AnimeSpeed(1);
            }
            e.Destroy();
        }

        static method onInit(){
            Spell.On(Spell.onSpell,'A00U',BlackSaber.Q); 
            Spell.On(Spell.onSpell,'A00V',BlackSaber.W); 
            Spell.On(Spell.onSpell,'A00X',BlackSaber.E); 
            Spell.On(Spell.onReady,'A00X',BlackSaber.HERO_START);
            Spell.On(Spell.onStop,'A00X',BlackSaber.HERO_STOP);   
            Spell.On(Spell.onReady,'A00V',BlackSaber.HERO_START);
            Spell.On(Spell.onStop,'A00V',BlackSaber.HERO_STOP);   
            
            Q_HIT=DefineSound("resource\\sound_effect_hit_0.wav",1000, false, true);
        }
    }
}