library ZZ requires Groups{
    //英雄‘佐助’的技能
    //R级

    struct ZZ{


        //15
        static method E(Spell e){
            Units u=Units.Get(e.Spell); 
            Data data=Data.create('A00R');
            timer t=NewTimer();
            integer i;
            u.Pause(true);
            u.AnimeId(15);
            u.PositionEnabled(false);
            for(0<=i<5){ 
                Units.MJ(u.player.player,'e008','A00R',0,u.X(),u.Y(),GetRandomReal(0,360),2,2,2, "stand","lei1.mdx"); 
            }
            data.c[0]=u;
            data.c[1]=e;
            data.r[0]=0.5;
            SetTimerData(t,data); 
            TimerStart(t,0.05,true,function(){
                Data data=Data(GetTimerData(GetExpiredTimer()));
                Units u=Units(data.c[0]); 
                Units mj;
                if(data.r[0]==0){ 
                    Spell(data.c[1]).Destroy();
                    data.Destroy();
                    ReleaseTimer(GetExpiredTimer());
                    u.PositionEnabled(true);
                    u.Pause(false);
                }else{ 
                    data.r[0]-=0.05;
                    if(data.r[0]==0.05){ 
                        Units.MJ(u.player.player,'e008','A00R',0,u.X(),u.Y(),0,1.2,1,2.5, "death","lei4.mdx");
                    }else if(data.r[0]>0.4){ 
                        Units.MJ(u.player.player,'e008','A00R',0,u.X(),u.Y(),0,0.7,1,2.5, "stand","lei4.mdx");
                    }
                    GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),200,function GroupIsAliveNotAloc);                   
                    while(FirstOfGroup(tmp_group)!=null){
                        mj=Units.Get(FirstOfGroup(tmp_group));
                        GroupRemoveUnit(tmp_group,mj.unit);
                        if(IsUnitEnemy(mj.unit,u.player.player)==true){ 
                            u.Damage(mj.unit,Damage.Magic,'A00R',u.Agi()*1.5);   
                            Buffs.Skill(mj.unit,'A00H',1);
                        }
                    }
                    GroupClear(tmp_group);  
                }
            });
            t=null;
        }

        //9
        static method W(Spell e){
            Units u=Units.Get(e.Spell);
            Dash dash; 
            u.Pause(true);
            u.AddAbility('A00Q');
            u.AnimeId(9);
            dash=Dash.Start(u.unit,e.Angle,1000,Dash.ADD,70,true,false); 
            dash.Obj=e;
            dash.onMove=function(Dash dash){ 
                Units u=Units.Get(dash.Unit);
                Units mj;
                unit k;
                timer t; 
                real x=dash.X+75*CosBJ(dash.Angle),y=dash.Y+75*SinBJ(dash.Angle);
                if(dash.Speed<2){
                    DestroyEffect( AddSpecialEffectTarget("Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl",u.unit, "hand,left") );
                }else{
                    k=GroupFind(u.unit,x,y,80,false);
                    if(k!=null){
                        dash.Stop();
                        mj=Units.MJ(u.player.player,'e008','A00P',0,x,y,0,2,1.5,2, "death","lei2.mdx");
                        mj.SetH(100);
                        mj=Units.MJ(u.player.player,'e008','A00P',0,x,y,0,2,1.75,1.75, "death","lei2.mdx");
                        mj.SetH(100);
                        mj=Units.MJ(u.player.player,'e008','A00P',0,x,y,0,2,2,1.5, "death","lei2.mdx");
                        mj.SetH(100);
                        x=x+50*CosBJ(dash.Angle);
                        y=y+50*SinBJ(dash.Angle); 
                        GroupEnumUnitsInRange(tmp_group,x,y,200,function GroupIsAliveNotAloc);                   
                        while(FirstOfGroup(tmp_group)!=null){
                            mj=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,mj.unit);
                            if(IsUnitEnemy(mj.unit,u.player.player)==true){ 
                                u.Damage(mj.unit,Damage.Magic,'A00P',u.Agi()*10.0);   
                                Buffs.Skill(mj.unit,'A00H',1);
                            }
                        }
                        GroupClear(tmp_group); 
                        u.Pause(true); 
                        u.AnimeSpeed(3.5);
                        t=NewTimer();
                        SetTimerData(t,u);
                        TimerStart(t,0.2,false,function(){
                            Units u=Units(GetTimerData(GetExpiredTimer()));
                            ReleaseTimer(GetExpiredTimer());
                            u.AnimeSpeed(1);
                            u.Pause(false);
                        });
                        t=null;
                    }
                    k=null;
                }
            };
            dash.onEnd=function(Dash dash){
                Units u=Units.Get(dash.Unit);
                Spell(dash.Obj).Destroy();
                u.RemoveAbility('A00Q');
                u.Pause(false);
            };
        }

        static method Q(Spell e){
            Units u=Units.Get(e.Spell);
            Units mj;
            real x=u.X()+25*CosBJ(e.Angle),y=u.Y()+25*SinBJ(e.Angle);
            integer i; 
            u.AnimeSpeed(1); 
            mj=Units.MJ(u.player.player,'e008','A00O',0,x,y,e.Angle,4,0.75,2, "stand","AZ_HYHX.mdx");
            //-30 右边 +30 左边  650
            GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),650,function GroupIsAliveNotAloc);                   
            while(FirstOfGroup(tmp_group)!=null){
                mj=Units.Get(FirstOfGroup(tmp_group));
                GroupRemoveUnit(tmp_group,mj.unit);
                if(IsUnitEnemy(mj.unit,u.player.player)==true){ 
                    if(Util.XY(u.unit,mj.unit)>e.Angle-30&&Util.XY(u.unit,mj.unit)<e.Angle+30){ 
                        u.Damage(mj.unit,Damage.Magic,'A00O',u.Int()*5.0);  
                        DestroyEffect( AddSpecialEffectTarget("Environment\\LargeBuildingFire\\LargeBuildingFire1.mdl", mj.unit, "chest") );
                        Dash.Start(mj.unit,e.Angle,700.0-Util.XY2(u.unit,mj.unit),Dash.SUB,40,true,true);
                    }
                }
            }
            GroupClear(tmp_group);             
            e.Destroy();
        }

        static method HERO_START(Spell e){
            Units u=Units.Get(e.Spell);
            if(e.Id=='A00O'){
                u.AnimeSpeed(1.7);
                u.FlushAnimeId(6);
            }
            if(e.Id=='A00R'){
                u.AnimeSpeed(2);
                u.FlushAnimeId(14);
            }
            e.Destroy();
        }

        static method HERO_STOP(Spell e){
            Units u=Units.Get(e.Spell);
            if(e.Id=='A00O'||e.Id=='A00R'){ 
                u.AnimeSpeed(1);
            }
            e.Destroy();
        }

        static method onInit(){ 
            Spell.On(Spell.onSpell,'A00R',ZZ.E);
            Spell.On(Spell.onSpell,'A00P',ZZ.W);
            Spell.On(Spell.onSpell,'A00O',ZZ.Q);
            Spell.On(Spell.onStart,'A00O',ZZ.HERO_START);
            Spell.On(Spell.onStop,'A00O',ZZ.HERO_STOP);     
            Spell.On(Spell.onStart,'A00R',ZZ.HERO_START);
            Spell.On(Spell.onStop,'A00R',ZZ.HERO_STOP);              
        }
    }
}