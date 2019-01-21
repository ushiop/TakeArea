library OrdinaryWizard requires Units,Spells,Dashs,Buff,Groups{
    //英雄 ‘普通的法师’ 技能
    //R级英雄 
    struct OrdinaryWizard{

        static method R(Spell e){
            integer i;
            Units u=Units.Get(e.Spell);
            Dash dash;
            Data data;
            u.Pause(true);
            Units.MJ(u.player.player,'e008','A006',0,u.X(),u.Y(),e.Angle,2,2.5,1,"death","Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile.mdl");
            for(0<=i<2){
                DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Human\\MarkOfChaos\\MarkOfChaosTarget.mdl", u.X(),u.Y()) );
            } 
            u.DelayModel("units\\human\\phoenix\\phoenix.mdx",0); 
            data=Data.create('A006');
            data.c[0]=e;
            data.r[0]=0;
            dash=Dash.Start(u.unit,e.Angle,3500,Dash.PWX,90,true,false);
            dash.Obj=data;
            dash.onMove=function(Dash dash){
                Data data=Data(dash.Obj);
                Spell e=Spell(data.c[0]);
                Units u=Units.Get(e.Spell); 
                if(dash.DashType==Dash.PWX){
                    if(data.r[0]<700){
                        data.r[0]=data.r[0]+8;
                        dash.Angle=dash.Angle+8;
                        if(data.r[0]>300){ 
                            u.SetH(1000*Util.GetPwx(3.99,data.r[0]-400,1400));
                            u.SetF(dash.Angle,true);
                        } 
                    }else{ 
                        dash.Angle=Util.XYEX(dash.X,dash.Y,e.X,e.Y);
                        data.r[1]=Util.XY2EX(dash.X,dash.Y,e.X,e.Y);
                        dash.NowDis=0;
                        dash.MaxDis=data.r[1];
                        dash.MaxSpeed=130;
                        dash.DashType=Dash.ADD;
                        u.SetF(dash.Angle,false);
                        u.Anime("attack"); 
                         
                    }
                }else{
                    u.SetH(1000*(1-Util.GetPwx(3.99,dash.NowDis/2,dash.MaxDis)));  
                    if(dash.MaxDis-dash.NowDis<200){
                        data.r[2]=1;
                        dash.Stop();
                    }
                }

            };
            dash.onEnd=function(Dash dash){
                Data data=Data(dash.Obj);
                Spell e=Spell(data.c[0]);
                Units u=Units.Get(e.Spell);
                Units mj;
                real x=u.X(),y=u.Y();
                integer i;
                if(data.r[2]==1){
                    Units.MJ(u.player.player,'e008','A006',0,x,y,0,4,1.75,0.5,"stand","Abilities\\Spells\\Other\\Doom\\DoomDeath.mdl");
                    Units.MJ(u.player.player,'e008','A006',0,x,y,0,3.5,1.25,2,"birth","Abilities\\Spells\\Human\\FlameStrike\\FlameStrike.mdl");
                    Units.MJ(u.player.player,'e008','A006',0,x,y,0,3.5,2,1.5,"death","Abilities\\Spells\\Other\\Volcano\\VolcanoMissile.mdl");
                    
                    u.DelayModel("units\\human\\HeroBloodElf\\HeroBloodElf.mdx",0.3); 
                    GroupDamage(u, x,y,300,u.player.hero.Int(true)*20.0,Damage.Magic,'A006',false);                     
                    if(u.player.lv10!=null){
                    //是否触发E
                        Units.MJ(u.player.player,'e008','A006',0,x,y,0,5,1,1.5,"death","fire3.mdx");
                            for(0<=i<12){
                                mj=Units.MJ(u.player.player,'e008','A005',0,x,y,I2R(i)*30,1.5,2.5,1, "stand","Environment\\UndeadBuildingFire\\UndeadLargeBuildingFire1.mdl");
                                Dash.Start(mj.unit,mj.F(),600,Dash.SUB,40,true,false);
                            }
                        } 
                }else{
                    Units.MJ(u.player.player,'e008','A006',0,u.X(),u.Y(),e.Angle,2,2.5,1,"death","Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile.mdl");
                    DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Human\\MarkOfChaos\\MarkOfChaosTarget.mdl", u.X(),u.Y()) );
                    DzSetUnitModel(u.unit, "units\\human\\HeroBloodElf\\HeroBloodElf.mdx" ); 
                    if(u.Alive()==false){
                        u.Anime("death");
                    }
                }
                u.SetH(0); 
                u.AnimeSpeed(1); 
                u.Pause(false);
                e.Destroy();
                data.Destroy();
            };
        }

        //凤凰火焰
        static method E(Units u,Units m){ 
            if(u.aid=='A005'&&u.aidindex==0){
                DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Other\\Doom\\DoomDeath.mdl", u.X(),u.Y()) );
                DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Other\\Incinerate\\FireLordDeathExplode.mdl", u.X(),u.Y()) );
                GroupDamage(u, u.X(),u.Y(),150,u.player.hero.Int(true)*2.0,Damage.Magic,0,false); 
            }
        }

        //炎空爆
        static method W(Spell e){
            Units u=Units.Get(e.Spell);
            Units mj;
            timer t=NewTimer(); 
            u.Pause(true);
            u.AnimeId(6);
            u.AnimeSpeed(2);
            mj=Units.MJ(u.player.player,'e008','A004',0,u.X(),u.Y(),0,2,1.5,1.5,"birth","fire2.mdx");
            mj.DelayAnime(2,0.4);
            u.PositionEnabled(false);
            SetTimerData(t,e);
            GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),300,function GroupIsAliveNotAloc);
            while(FirstOfGroup(tmp_group)!=null){
                mj=Units.Get(FirstOfGroup(tmp_group));
                if(IsUnitEnemy(mj.unit,u.player.player)==true){ 
                    Buffs.Add(mj.unit,'A007','B001',1.5,false).Type=Buffs.TYPE_SUB+Buffs.TYPE_DISPEL_TRUE;
                }
                GroupRemoveUnit(tmp_group,mj.unit);
            }
            GroupClear(tmp_group); 
            TimerStart(t,0.4,false,function(){
                integer i;
                Spell e=Spell(GetTimerData(GetExpiredTimer()));
                Units u=Units.Get(e.Spell);
                Units mj;
                if(u.Alive()==true){ 
                    Util.Duang(u.X(),u.Y(),0.8,300,300,-140,0.05,75);
                    mj=Units.MJ(u.player.player,'e008','A004',1,u.X(),u.Y(),0,2,1,1.5,"birth","fire1.mdx");
                    mj.SetH(50); 
                    DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Other\\Doom\\DoomDeath.mdl", u.X(),u.Y()) );
                    DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Other\\Volcano\\VolcanoMissile.mdl",u.X(),u.Y()) );
                    GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),300,function GroupIsAliveNotAloc);
                    while(FirstOfGroup(tmp_group)!=null){
                        mj=Units.Get(FirstOfGroup(tmp_group));
                        if(IsUnitEnemy(mj.unit,u.player.player)==true){
                            Dash.Start(mj.unit,Util.XY(u.unit,mj.unit),400,Dash.SUB,70,true,true);    
                            u.Damage(mj.unit,Damage.Magic,'A004',u.Int(true)*10);
                        }
                        GroupRemoveUnit(tmp_group,mj.unit);
                    }
                    GroupClear(tmp_group); 
                    if(u.player.lv10!=null){
                        //是否触发E
                            for(0<=i<6){
                                mj=Units.MJ(u.player.player,'e008','A005',0,u.X(),u.Y(),I2R(i)*60,1.5,2.5,1, "stand","Environment\\UndeadBuildingFire\\UndeadLargeBuildingFire1.mdl");
                                Dash.Start(mj.unit,mj.F(),300,Dash.PWX,20,true,false);
                            }
                        } 
                } 
                u.AnimeSpeed(1);
                u.PositionEnabled(true);
                u.Pause(false);
                e.Destroy();
                ReleaseTimer(GetExpiredTimer());
            });
            t=null;
        }

        //火球术
        static method Q(Spell e){
            Units u=Units.Get(e.Spell);
            real x=u.X(),y=u.Y(),f=e.Angle;
            Dash dash;
            //气旋
            Units mj=Units.MJ(u.player.player,'e009','A002',0,x+100*CosBJ(f),y+100*SinBJ(f),f,2,2,1.5, "stand","wind.mdx");
            mj.SetH(200); 
            dash=Dash.Start(mj.unit,f,450,Dash.SUB,60,true,false);
            //气旋结束
            //地裂
            mj=Units.MJ(u.player.player,'e008','A002',1,x+100*CosBJ(f),y+100*SinBJ(f),f,2,1.4,1, "stand","dust.mdx");
            mj.SetH(50);
            dash=Dash.Start(mj.unit,f,1600,Dash.SUB,70,true,false);
            dash.Obj=mj; 
            dash.onEnd=function(Dash da){ Units.Get(da.Unit).Anime("death");};
            dash.onMove=function(Dash da){
                Units u=Units(da.Obj); 
                Units tmp;
                GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),150,function GroupIsAliveNotAloc);
                while(FirstOfGroup(tmp_group)!=null){
                    tmp=Units.Get(FirstOfGroup(tmp_group));
                    if(IsUnitEnemy(tmp.unit,u.player.player)==true){
                        tmp.Position(u.X(),u.Y(),true);
                    }
                    GroupRemoveUnit(tmp_group,tmp.unit);
                }
                GroupClear(tmp_group);
                if(da.Speed<3){ 
                    da.Stop();
                    u.Anime("death"); 
                }
            };
            //地裂结束
            //火球
            DestroyEffect( AddSpecialEffect("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",x+100*CosBJ(f),y+100*SinBJ(f) ));
            DestroyEffect( AddSpecialEffectTarget("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl", u.unit, "hand right") );
            mj=Units.MJ(u.player.player,'e008','A002',2,x+100*CosBJ(f),y+100*SinBJ(f),f,1.5,2,1, "stand","Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl");
            mj.SetH(120);      
            SetUnitPosition(mj.unit,mj.X(),mj.Y());
            mj.AddAbility('A02O');
            dash=Dash.Start(mj.unit,f,1300,Dash.ADD,50,true,false);
            dash.Obj=u;             
            dash.NowDis=10;
            dash.onMove=function(Dash d){
                Units u=Units(d.Obj);
                Units tmp=Units.Get(d.Unit); 
                real dis,f;
                if(d.NowDis>200){  
                    if(u.player.lv10!=null){
                        //是否触发E
                        if(u.IsAbility('B000')==false){
                            dis=GetRandomReal(0,150);
                            f=GetRandomReal(0,360);
                            Buffs.Add(u.unit,'A000','B000',0.03,false);
                            Units.MJ(u.player.player,'e008','A005',0,tmp.X()+dis*CosBJ(f),tmp.Y()+dis*SinBJ(f),f,1.5,2.5,1, "stand","Environment\\UndeadBuildingFire\\UndeadLargeBuildingFire1.mdl");
                        }
                    } 
                    if(GroupFind(u.unit,tmp.X(),tmp.Y(),75,false,false)!=null){
                        d.Stop();
                    } 
                }
            };
            dash.onEnd=function(Dash d){
                integer i;
                Units u=Units.Get(d.Unit),tmp; 
                real x,y;
                effect e; 
                u.Anime("death");
                GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),250,function GroupIsAliveNotAloc); 
                i=CountUnitsInGroup(tmp_group);
                GroupClear(tmp_group);  
                if(i!=0){  
                    u.Position(u.X()+100*CosBJ(d.Angle),u.Y()+100*SinBJ(d.Angle),false);   
                    x=u.X();
                    y=u.Y();
                    DestroyEffect( AddSpecialEffect("Abilities\\Weapons\\FragDriller\\FragDriller.mdl",x,y) );
                    e=AddSpecialEffect("abilities\\weapons\\DemolisherMissile\\DemolisherMissile.mdl", x,y) ;
                    EXSetEffectSize( e,2);
                    DestroyEffect(e);
                    e=AddSpecialEffect("Abilities\\Weapons\\DemolisherFireMissile\\DemolisherFireMissile.mdl", x,y);
                    EXSetEffectSize( e,2);
                    EXSetEffectSpeed( e, 2.5 );
                    DestroyEffect(e);
                    e=null;
                    GroupDamage(u,x,y,250,u.player.hero.Int(true)*5.0,Damage.Magic,'A002',false); 
                    u=Units(d.Obj);
                    if(u.player.lv10!=null){
                        //是否触发E
                            for(0<=i<4){
                                tmp=Units.MJ(u.player.player,'e008','A005',0,x,y,I2R(i)*90,1.5,2.5,1, "stand","Environment\\UndeadBuildingFire\\UndeadLargeBuildingFire1.mdl");
                                Dash.Start(tmp.unit,tmp.F(),300,Dash.ADD,30,true,false);
                            }
                    }
                } 
            };
            //火球结束
            u.AnimeSpeed(1); 
            e.Destroy();
        }

        static method HERO_START(Spell e){
            if(e.Id=='A002'){ 
                Units.Get(e.Spell).AnimeSpeed(2.5);
                Units.Get(e.Spell).FlushAnimeId(5); 
            } 
            if(e.Id=='A006'){
                Units.Get(e.Spell).FlushAnimeId(3);
                Units.Get(e.Spell).AnimeSpeed(1.5);
            }
            e.Destroy();
        }

        static method HERO_STOP(Spell e){
            Units.Get(e.Spell).AnimeSpeed(1);
            e.Destroy();
        }

        //注册技能事件
        static method onInit(){
            Spell.On(Spell.onSpell,'A002',OrdinaryWizard.Q);
            Spell.On(Spell.onSpell,'A004',OrdinaryWizard.W); 
            Spell.On(Spell.onSpell,'A006',OrdinaryWizard.R);
            Spell.On(Spell.onStart,'A002',OrdinaryWizard.HERO_START);
            Spell.On(Spell.onStop,'A002',OrdinaryWizard.HERO_STOP);   
            Spell.On(Spell.onStart,'A006',OrdinaryWizard.HERO_START);
            Spell.On(Spell.onStop,'A006',OrdinaryWizard.HERO_STOP);   
            Units.On(Units.onAlocDeath,OrdinaryWizard.E);
        }
    }
}