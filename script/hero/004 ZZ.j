library ZZ requires Groups{
    //英雄‘佐助’的技能
    //R级

    struct ZZ{

        static method Q(Spell e){
            Units u=Units.Get(e.Spell);
            Units mj;
            real x=u.X()+25*CosBJ(e.Angle),y=u.Y()+25*SinBJ(e.Angle);
            integer i;
            mj=Units.MJ(u.player.player,'e008','A00O',0,x,y,e.Angle,4,0.75,2, "stand","AZ_HYHX.mdx");
            //-30 右边 +30 左边  650
            GroupEnumUnitsInRange(tmp_group,x,y,650,function GroupIsAliveNotAloc);                   
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
                u.AnimeSpeed(2);
                u.FlushAnimeId(6);
            }
            e.Destroy();
        }

        static method HERO_STOP(Spell e){
            Units u=Units.Get(e.Spell);
            if(e.Id=='A00O'){ 
                u.AnimeSpeed(1);
            }
            e.Destroy();
        }

        static method onInit(){ 
            Spell.On(Spell.onSpell,'A00O',ZZ.Q);
            Spell.On(Spell.onStart,'A00O',ZZ.HERO_START);
            Spell.On(Spell.onStop,'A00O',ZZ.HERO_STOP);               
        }
    }
}