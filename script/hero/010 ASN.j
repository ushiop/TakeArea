library ASN requires Groups{
    //英雄‘亚斯娜’的技能
    //R级
    //12 13 -戳  14-前摇
    struct ASN{

        static method Spawn(Units u,Units m){
            timer t;
            if(u.IsAbility('A02R')==true){
                t=NewTimer();
                SetTimerData(t,u);
                TimerStart(t,0.1,true,function(){
                    Units u=Units(GetTimerData(GetExpiredTimer()));
                    if(u.Alive()==false){
                        BJDebugMsg("结束");
                        ReleaseTimer(GetExpiredTimer());
                    }else{
                        if(u.MoveSpeed()>500){ 
                            if(u.Data()==0){ 
                                AddUnitAnimationProperties(u.unit, "fast", true );
                                u.SetData(1);
                            }
                        }else{
                            if(u.Data()==1){
                                u.SetData(0);
                                AddUnitAnimationProperties(u.unit, "fast", false );
                            }
                        }
                    }
                });
                t=null;
            }
        }

        static method Q(Spell e){
            Units u=Units.Get(e.Spell);
            Dash dash;
            Data data=Data.create('A02R');
            real x=u.X(),y=u.Y(),f=e.Angle; 
            Units mj=Units.MJ(u.player.player,'e008','A02R',0,x+100*CosBJ(f),y+100*SinBJ(f),f,1,0.9,4,"birth", "dg1.mdl");//akiha claw.mdl
            mj.SetH(100); 
            data.c[2]=mj;
            Units.MJ(u.player.player,'e008','A02R',0,x,y,f,1,1,1.25,"stand", "dust2_white.mdl");
            Util.Duang(x,y,0.4,100,100,-115,0.02,50);
            u.Pause(true);
            u.AnimeId(12);
            u.SetF(e.Angle,true);
            mj=Units.MJ(u.player.player,'e008','A02R',0,x,y,GetRandomReal(0,360),3,3,5,"stand", "arcdirve02b1.mdl");
            mj.SetH(75);     
            data.c[0]=u;
            data.c[1]=e;
            data.c[3]=mj; 
            data.g[0]=CreateGroup();
            data.r[0]=0;
            dash=Dash.Start(u.unit,f,300,Dash.SUB,100,true,false);
            dash.Obj=data;
            dash.onMove=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units(data.c[0]);
                Units mj; 
                real x=dash.X,y=dash.Y,dis=50,f=dash.Angle+180;
                if(dash.NowDis>130&&dash.NowDis<145){ 
                    mj=Units.MJ(u.player.player,'e008','A02R',0,x+dis*CosBJ(f),y+dis*SinBJ(f),f,1.5,2,0.75,"birth", "az_lxj_blue_ex.mdl");
                    mj.SetH(75);
                    Dash.Start(mj.unit,dash.Angle,250,Dash.SUB,100,true,false);
                } 
                Units(data.c[2]).Position(dash.X,dash.Y,false);
                Units(data.c[3]).Position(dash.X,dash.Y,false);
                Units(data.c[3]).SetF(Units(data.c[3]).F()+3,true);
                if(dash.Speed>5){ 
                    if(data.r[0]<=0){
                        data.r[0]=0.05; 
                        //剑尖
                        GroupEnumUnitsInRange(tmp_group,dash.X+125*CosBJ(dash.Angle),dash.Y+125*SinBJ(dash.Angle),100,function GroupIsAliveNotAloc);     
                        while(FirstOfGroup(tmp_group)!=null){
                            mj=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,mj.unit);
                            if(IsUnitEnemy(mj.unit,u.player.player)==true){  
                                if(IsUnitInGroup(mj.unit,data.g[0])==false){
                                    GroupAddUnit(data.g[0],mj.unit); 
                                    u.Damage(mj.unit,Damage.Physics,'A02R',u.Agi(true)*5);
                                    Effect.ToUnit("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",mj.unit, "chest").Destroy();
                                    Dash.Start(mj.unit,dash.Angle,200,Dash.SUB,75,true,true);
                                }
                            }
                        }
                        GroupClear(tmp_group);  
                        //身体周围
                        GroupEnumUnitsInRange(tmp_group,dash.X,dash.Y,100,function GroupIsAliveNotAloc);     
                        while(FirstOfGroup(tmp_group)!=null){
                            mj=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,mj.unit);
                            if(IsUnitEnemy(mj.unit,u.player.player)==true){  
                                if(IsUnitInGroup(mj.unit,data.g[0])==false){
                                    GroupAddUnit(data.g[0],mj.unit); 
                                    u.Damage(mj.unit,Damage.Physics,'A02R',u.Agi(true)*5);
                                    Effect.ToUnit("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",mj.unit, "chest").Destroy();
                                    Dash.Start(mj.unit,dash.Angle,300,Dash.SUB,75,true,true);
                                }
                            }
                        }
                        GroupClear(tmp_group);  
                    }else{
                        data.r[0]-=0.01;
                    }  
                }
            };
            dash.onEnd=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units(data.c[0]);
                u.Pause(false);
                DestroyGroup(data.g[0]);
                data.g[0]=null;
                Spell(data.c[1]).Destroy();
                data.Destroy();
            };
        }

        static method HERO_START(Spell e){
            Units u=Units.Get(e.Spell);
            u.FlushAnimeId(14);
            e.Destroy();
        }

        static method onInit(){ 
            Spell.On(Spell.onSpell,'A02R',ASN.Q);
            Spell.On(Spell.onReady,'A02R',ASN.HERO_START);
            Units.On(Units.onHeroSpawn,ASN.Spawn);
        }
    }
}