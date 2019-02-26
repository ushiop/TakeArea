library Item{
    //物品效果

    //跳刀的受伤冷却
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
 
    function onInit(){
        Damage.On(Damage.onItemDamage_EndDamage,Item_Damage);
        Spell.On(Spell.onSpell,'A041',ZiShaQiu);
        Spell.On(Spell.onSpell,'A043',TaiYangShi);
        Spell.On(Spell.onSpell,'A044',YueLiangShi);
        Spell.On(Spell.onSpell,'A04C',TuiTuiBang);
    }
}