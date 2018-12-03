library OrdinaryWizard requires Units,Spells,Dashs,Buff,Groups{
    //英雄 ‘普通的法师’ 技能
    //R级英雄 
    struct OrdinaryWizard{

        //炎空爆
        static method W(Spell e){
            Units u=Units.Get(e.Spell);
            Units mj;
            timer t=NewTimer(); 
            EXPauseUnit(u.unit,true);
            u.AnimeId(6);
            mj=Units.MJ(u.player.player,'e008','A004',0,u.X(),u.Y(),0,2,1.5,1.5,"birth","fire2.mdx");
            mj.DelayAnime(2,0.8);
            u.PositionEnabled(false);
            SetTimerData(t,e);
            TimerStart(t,0.8,false,function(){
                Spell e=Spell(GetTimerData(GetExpiredTimer()));
                Units u=Units.Get(e.Spell);
                Units mj=Units.MJ(u.player.player,'e008','A004',1,u.X(),u.Y(),0,2,1,1.5,"birth","fire1.mdx");
                mj.SetH(50); 
                DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Other\\Doom\\DoomDeath.mdl", u.X(),u.Y()) );
                DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Other\\Volcano\\VolcanoMissile.mdl",u.X(),u.Y()) );
                GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),250,function GroupIsAliveNotAloc);
                while(FirstOfGroup(tmp_group)!=null){
                    mj=Units.Get(FirstOfGroup(tmp_group));
                    if(IsUnitEnemy(mj.unit,u.player.player)==true){
                        Dash.Start(mj.unit,Util.XY(u.unit,mj.unit),400,Dash.SUB,70,true,true);    
                        u.Damage(mj.unit,Damage.Magic,'A004',u.Int()*10);
                    }
                    GroupRemoveUnit(tmp_group,mj.unit);
                }
                GroupClear(tmp_group); 
                u.PositionEnabled(true);
                EXPauseUnit(u.unit,false);
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
            dash=Dash.Start(mj.unit,f,1300,Dash.ADD,50,true,false);
            dash.Obj=u;             
            dash.NowDis=10;
            dash.onMove=function(Dash d){
                Units u=Units(d.Obj);
                Units tmp=Units(d.Unit); 
                real dis,f;
                if(d.NowDis>200){  
                    if(u.player.lv15!=null){
                        //是否触发E
                        if(u.IsAbility('B000')==false){
                            dis=GetRandomReal(0,150);
                            f=GetRandomReal(0,360);
                            Buffs.Add(u.unit,'A000','B000',0.03,false);
                            Units.MJ(u.player.player,'e008','A005',0,tmp.X()+dis*CosBJ(f),tmp.Y()+dis*SinBJ(f),f,1.5,2.5,1, "stand","Environment\\UndeadBuildingFire\\UndeadLargeBuildingFire1.mdl");
                        }
                    }
                    GroupEnumUnitsInRange(tmp_group,tmp.X(),tmp.Y(),75,function GroupIsAliveNotAloc);
                    while(FirstOfGroup(tmp_group)!=null){
                        tmp=Units.Get(FirstOfGroup(tmp_group));
                        if(IsUnitEnemy(tmp.unit,u.player.player)==true){ 
                            d.Stop();
                            break;
                        }
                        GroupRemoveUnit(tmp_group,tmp.unit);
                    }
                    GroupClear(tmp_group);
                }
            };
            dash.onEnd=function(Dash d){
                integer i;
                Units u=Units(d.Unit); 
                effect e; 
                u.Anime("death");
                GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),250,function GroupIsAliveNotAloc); 
                i=CountUnitsInGroup(tmp_group);
                GroupClear(tmp_group);  
                if(i!=0){  
                    u.Position(u.X()+100*CosBJ(d.Angle),u.Y()+100*SinBJ(d.Angle),false);   
                    DestroyEffect( AddSpecialEffect("Abilities\\Weapons\\FragDriller\\FragDriller.mdl",u.X(),u.Y()) );
                    e=AddSpecialEffect("abilities\\weapons\\DemolisherMissile\\DemolisherMissile.mdl", u.X(),u.Y()) ;
                    EXSetEffectSize( e,2);
                    DestroyEffect(e);
                    e=AddSpecialEffect("Abilities\\Weapons\\DemolisherFireMissile\\DemolisherFireMissile.mdl", u.X(),u.Y());
                    EXSetEffectSize( e,2);
                    EXSetEffectSpeed( e, 2.5 );
                    DestroyEffect(e);
                    e=null;
                    GroupDamage(u,u.X(),u.Y(),250,u.player.hero.Int()*5.0,Damage.Magic,'A002',false);
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
            e.Destroy();
        }

        static method HERO_STOP(Spell e){
            if(e.Id=='A002'){ 
                Units.Get(e.Spell).AnimeSpeed(1);
            }
            e.Destroy();
        }

        //注册技能事件
        static method onInit(){
            Spell.On(Spell.onSpell,'A002',OrdinaryWizard.Q);
            Spell.On(Spell.onSpell,'A004',OrdinaryWizard.W);
            Spell.On(Spell.onStart,'A002',OrdinaryWizard.HERO_START);
            Spell.On(Spell.onStop,'A002',OrdinaryWizard.HERO_STOP);   
        }
    }
}