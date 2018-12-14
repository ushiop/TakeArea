library ZZ requires Groups{
    //英雄‘佐助’的技能
    //R级

    struct ZZ{

        static method R(Spell e){
            Units u=Units.Get(e.Spell);
            integer i;
            real x=u.X()+50*CosBJ(e.Angle),y=u.Y()+50*SinBJ(e.Angle);
            Units mj;
            Dash dash;
            for(0<=i<9){
                mj=Units.MJ(u.player.player,'e008','A00S',0,x,y,e.Angle-30+(i*6.667),5,0.3,1, "birth","az_lxj_blue.mdx"); 
                mj.SetH(100);
                dash=Dash.Start(mj.unit,mj.F(),1800,Dash.SUB,60,true,false);
                dash.onMove=function(Dash dash){
                    Units u=Units.Get(dash.Unit);
                    Dash dash1;
                    Units mj;
                    unit k=null;
                    if(dash.Speed<5&&dash.Speed>4.8&&u.aidindex==0){ 
                        u.aidindex=1;
                        u.DelayModel("Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl",0); 
                        u.Size(0.7);
                        u.AnimeSpeed(GetRandomReal(0.7,1.2));
                        u.Anime("death");
                    }
                    if(u.aidindex==0){
                        k=GroupFind(u.unit,dash.X,dash.Y,50,false);
                        if(k!=null){
                            u.Damage(k,Damage.Magic,'A00S',u.Agi()*15.0);   
                            Buffs.Skill(k,'A00H',1);                             
                            dash.Speed=1;         
                            k=GroupRandomFilter(u.unit,GetUnitX(k),GetUnitY(k),500,k);
                            if(k!=null){  
                                mj=Units.MJ(u.player.player,'e008','A00S',0,dash.X,dash.Y,Util.XY(u.unit,k),50,0.6,1, "birth","az_lxj_blue.mdx"); 
                                mj.SetH(100);
                                dash1=Dash.Start(mj.unit,mj.F(),1800,Dash.SUB,13,true,false);
                                dash1.Obj=Units.Get(k);
                                dash1.onMove=function(Dash dash){ 
                                    Units u=Units.Get(dash.Unit); 
                                    Units k=Units(dash.Obj);
                                    if(k.Alive()==false){
                                        dash.Stop();
                                    }else{
                                        if(Util.XY2(u.unit,k.unit)<25){
                                            u.Damage(k.unit,Damage.Magic,'A00S',u.Agi()*5.0);   
                                            Buffs.Skill(k.unit,'A00H',1);                             
                                            u.DelayModel("Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl",0); 
                                            u.AnimeSpeed(GetRandomReal(0.7,1.2));
                                            u.Anime("death");   
                                            u.Size(0.7);
                                            dash.Stop();
                                        }else{
                                            u.SetF(Util.XY(u.unit,k.unit),true); 
                                            dash.Angle=u.F();
                                            dash.MaxDis+=100;
                                        }
                                    }
                                };
                                dash1.onEnd=function(Dash dash){
                                    Units u=Units.Get(dash.Unit); 
                                    u.DelayModel("Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl",0); 
                                    u.AnimeSpeed(GetRandomReal(0.7,1.2));
                                    u.Size(0.7);
                                    u.Anime("death");  
                                    u.Life(0.5);
                                };
                            }      
                        }
                        k=null;
                    }
                    if(dash.Speed<2){
                        dash.Stop();
                    }
                };
                dash.onEnd=function(Dash dash){
                    Units u=Units.Get(dash.Unit); 
                    if(u.aidindex==0){
                        u.DelayModel("Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl",0); 
                        u.AnimeSpeed(GetRandomReal(0.7,1.2));
                        u.Size(0.7);
                        u.Anime("death");                       
                    }
                    u.Life(0.5);
                };
            }
            e.Destroy();
        }

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
                    if(u.Alive()==false){
                        data.r[0]=0.1;
                    }
                    data.r[0]-=0.05;
                    if(data.r[0]==0.05){  
                        Units.MJ(u.player.player,'e008','A00R',0,u.X(),u.Y(),0,1.2,1,2.5, "death","lei4.mdx");
                    }else if(data.r[0]>0.4){ 
                        Units.MJ(u.player.player,'e008','A00R',0,u.X(),u.Y(),0,0.7,1,2.5, "stand","lei4.mdx");
                    }
                    if(data.r[0]>0.35){
                        mj=Units.MJ(u.player.player,'e008','A00R',0,u.X(),u.Y(),GetRandomReal(0,360),2,2.5,2, "death","lei2.mdx");
                        mj.SetH(100); 
                    }
                    GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),300,function GroupIsAliveNotAloc);                   
                    while(FirstOfGroup(tmp_group)!=null){
                        mj=Units.Get(FirstOfGroup(tmp_group));
                        GroupRemoveUnit(tmp_group,mj.unit);
                        if(IsUnitEnemy(mj.unit,u.player.player)==true){ 
                            u.Damage(mj.unit,Damage.Magic,'A00R',u.Agi()*1.5);   
                            Buffs.Skill(mj.unit,'A00T',1);
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
                        dash.Stop();
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
            if(e.Id=='A00S'){
                u.AnimeSpeed(2);
                u.FlushAnimeId(11);
            }
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
            if(e.Id=='A00O'||e.Id=='A00R'||e.Id=='A00S'){ 
                u.AnimeSpeed(1);
            }
            e.Destroy();
        }

        static method onInit(){ 
            Spell.On(Spell.onSpell,'A00S',ZZ.R);
            Spell.On(Spell.onSpell,'A00R',ZZ.E);
            Spell.On(Spell.onSpell,'A00P',ZZ.W);
            Spell.On(Spell.onSpell,'A00O',ZZ.Q);
            Spell.On(Spell.onStart,'A00O',ZZ.HERO_START);
            Spell.On(Spell.onStop,'A00O',ZZ.HERO_STOP);     
            Spell.On(Spell.onStart,'A00R',ZZ.HERO_START);
            Spell.On(Spell.onStop,'A00R',ZZ.HERO_STOP);     
            Spell.On(Spell.onStart,'A00S',ZZ.HERO_START);
            Spell.On(Spell.onStop,'A00S',ZZ.HERO_STOP);               
        }
    }
}