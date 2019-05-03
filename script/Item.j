library Item requires Groups{
    //物品效果

    //物品增伤效果
    function Item_AddDamage(DamageArgs e){
        if(e.TriggerUnit.IsAbility('A04F')==true){//低力石
            if((e.TriggerUnit.HP()/e.TriggerUnit.MaxHP())<=0.3){//生命值低于30%增伤17%
                e.Damage+=e.Damage*0.17;
            }
        }
    }

    //物品减伤效果
    function  Item_SubDamage(DamageArgs e){
        if(e.TriggerUnit.IsAbility('BPSE')==true){//血法的大护盾 有眩晕则减伤物理/魔法
            if(e.TriggerUnit.IsAbility('A04E')==true){//
                if(e.DamageType==Damage.Attack||e.DamageType==Damage.Magic||e.DamageType==Damage.Physics){
                    e.Damage-=e.Damage*0.4;
                    Effect.ToUnit("Abilities\\Spells\\Items\\SpellShieldAmulet\\SpellShieldCaster.mdl",e.TriggerUnit.unit,"origin").Destroy();
                }
            }
        }
    }

    //物品受伤效果
    function Item_Damage(DamageArgs e){
        if(e.TriggerUnit.IsAbility('A02B')==true&&e.DamageUnit.isHero==true){//跳刀冷却
            if(e.TriggerUnit.GetAbilityCD('A02B')>2||e.TriggerUnit.GetAbilityCD('A02B')==0){
                e.TriggerUnit.SetAbilityCD('A02B',10);
            }
        }
        if(e.TriggerUnit.IsAbility('B00Y')==true){//自杀球受伤停止自杀
            Buffs.Find(e.TriggerUnit.unit,'B00Y').Stop();
        }
        if(e.DamageUnit.IsAbility('B00Y')==true){//自杀球造成伤害停止自杀
            Buffs.Find(e.DamageUnit.unit,'B00Y').Stop();
        }
    }
 
    //自杀球的使用
    function ZiShaQiu(Spell e){
        Buffs.Add(e.Spell,'A042','B00Y',5,false).onEnd=function(Buffs b){
             if(b.Time>=4.9){
                 Units.Kill(b.Unit);
             }
        };
        e.Destroy();
    }

    //太阳石
    function TaiYangShi(Spell e){
        SetTimeOfDay(6);
        e.Destroy();
    }

    //月亮石
    function YueLiangShi(Spell e){
        SetTimeOfDay(18);
        e.Destroy();
    }

    function TuiTuiBang(Spell e){
        Units u=Units.Get(e.Spell);
        Dash.Start(u.unit,u.F(),1000,Dash.PWX,30,true,false).onMove=function(Dash dash){
            if(dash.Speed>5){ 
                if(dash.Obj==0){
                    dash.Obj=2;
                    Effect.To("Abilities\\Weapons\\GlaiveMissile\\GlaiveMissile.mdl",dash.X,dash.Y).Destroy();
                }else{
                    dash.Obj-=1;
                }
            }
        };
        e.Destroy();
    }

    function ShanQiuZhiChui(Spell e){
        Units u=Units.Get(e.Spell);
        Dash dash;
        Units mj=Units.MJ(u.player.player,'e008','A04D',0,u.X(),u.Y(),e.Angle,5,1.5,1,"birth","Abilities\\Spells\\Human\\StormBolt\\StormBoltMissile.mdl");
        mj.SetH(100); 
        mj.AddAbility(Units.MJType_TSW);
        mj.Position(mj.X(),mj.Y(),true);
        dash=Dash.Start(mj.unit,mj.F(),1600,Dash.SUB,30,true,false);
        dash.onMove=function(Dash dash){
            unit k=null;
            if(dash.Speed<3.5){
                dash.Stop();
            }else{ 
                if(dash.Obj==0){
                    dash.Obj=1;
                    k=GroupFind(dash.Unit,dash.X+50*CosBJ(dash.Angle),dash.Y+50*SinBJ(dash.Angle),125,true,false);
                    if(k!=null){ 
                        Units.Get(dash.Unit).SetData(1);
                        k=null;
                        dash.Stop();
                    }
                }else{
                    dash.Obj-=1;
                } 
            }
        };
        dash.onEnd=function(Dash dash){
            Units u=Units.Get(dash.Unit);
            Units mj;
            u.Life(0.75);
            u.Anime("death");
            if(u.Data()==0){
                BJDebugMsg("锤子没打到人");
                Dash.Start(u.unit,u.F(),200,Dash.SUB,10,true,false);
            }else{
                BJDebugMsg("锤子打到人了");
                GroupEnumUnitsInRange(tmp_group,dash.X,dash.Y,150,function GroupIsAliveNotAloc);     
                while(FirstOfGroup(tmp_group)!=null){
                    mj=Units.Get(FirstOfGroup(tmp_group));
                    GroupRemoveUnit(tmp_group,mj.unit);
                    if(IsUnitEnemy(mj.unit,u.player.player)==true){    
                        Buffs.Skill(mj.unit,'A00F',1);   
                        BJDebugMsg("锤子打到人了-眩晕:"+mj.name);
                    }
                }  
                GroupClear(tmp_group);
            }
        };
        e.Destroy();
    }
 
    function onInit(){
        Damage.On(Damage.onItemDamage_AddDamage,Item_AddDamage);
        Damage.On(Damage.onItemDamage_SubDamage,Item_SubDamage);
        Damage.On(Damage.onItemDamage_EndDamage,Item_Damage);
        Spell.On(Spell.onSpell,'A041',ZiShaQiu);
        Spell.On(Spell.onSpell,'A043',TaiYangShi);
        Spell.On(Spell.onSpell,'A044',YueLiangShi);
        Spell.On(Spell.onSpell,'A04C',TuiTuiBang);
        Spell.On(Spell.onSpell,'A04D',ShanQiuZhiChui);
    }
}