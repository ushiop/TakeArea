library OrdinaryWizard requires Units,Spells,Dashs,Buff,Groups{
    //英雄 ‘普通的法师’ 技能
    //R级英雄 
    struct OrdinaryWizard{


        //火球术
        static method Q(Spell e){
            Units u=Units.Get(e.Spell);
            real x=u.X(),y=u.Y(),f=e.Angle;
            Dash dash;
            Units mj=Units.MJ(u.player.player,'e009',x+100*CosBJ(f),y+100*SinBJ(f),f,0.5,2,2, "stand","wind.mdx");
            mj.SetH(200); 
            mj=Units.MJ(u.player.player,'e008',x+100*CosBJ(f),y+100*SinBJ(f),f,2,1.4,1, "stand","dust.mdx");
            mj.SetH(50);
            dash=Dash.Start(mj.unit,f,1600,Dash.SUB,50,true,false);
            dash.Obj=mj; 
            dash.onMove=function(Dash da){
                Units u=Units(da.Obj);
                Units tmp;
                GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),150,function GroupIsAliveAloc);
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
            mj=Units.MJ(u.player.player,'e008',x+100*CosBJ(f),y+100*SinBJ(f),f,1.5,2,1, "stand","Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl");
            mj.SetH(120);      
            dash=Dash.Start(mj.unit,f,1300,Dash.ADD,50,true,false);
            dash.Obj=mj;             
            dash.onMove=function(Dash d){
                Units u=Units(d.Obj);
                Units tmp;
                GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),150,function GroupIsAliveAloc);
                if(d.NowDis>200){
                     
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
                Units u=Units(d.Obj); 
                effect e;
                u.Anime("death");
                GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),150,function GroupIsAliveAloc); 
                i=CountUnitsInGroup(tmp_group);
                GroupClear(tmp_group);  
                if(i!=0){ 
                    u.Position(u.X()+100*CosBJ(d.Angle),u.Y()+100*SinBJ(d.Angle),false); 
                    DestroyEffect( AddSpecialEffect("Abilities\\Weapons\\FragDriller\\FragDriller.mdl",u.X(),u.Y()) );
                    e=AddSpecialEffect("abilities\\weapons\\DemolisherMissile\\DemolisherMissile.mdl", u.X(),u.Y()) ;
                    EXSetEffectSize( e,2);
                    DestroyEffect(e);
                    e=null;
                    DestroyEffect( AddSpecialEffect("Abilities\\Weapons\\DemolisherFireMissile\\DemolisherFireMissile.mdl", u.X(),u.Y()) );
                    GroupDamage(u,u.X(),u.Y(),150,u.player.hero.Int()*5.0,Damage.Magic,'A002',false);
                } 
            };

            u.AnimeSpeed(1); 
            e.Destroy();
        }

        static method HERO_START(Spell e){
            if(e.Id=='A002'){ 
                Units.Get(e.Spell).AnimeSpeed(3);
                Units.Get(e.Spell).FlushAnimeId(10);//5
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
            Spell.On(Spell.onStart,'A002',OrdinaryWizard.HERO_START);
            Spell.On(Spell.onStop,'A002',OrdinaryWizard.HERO_STOP);
        }
    }
}