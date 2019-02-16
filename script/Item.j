library Item{
    //物品效果

    //跳刀的受伤冷却
    function Item_Damage(DamageArgs e){
        if(e.TriggerUnit.IsAbility('A02B')==true){//跳刀冷却
            if(e.TriggerUnit.GetAbilityCD('A02B')>2||e.TriggerUnit.GetAbilityCD('A02B')==0){
                e.TriggerUnit.SetAbilityCD('A02B',10);
            }
        }
        if(e.TriggerUnit.IsAbility('B00Y')==true){//自杀球停止自杀
            Buffs.Find(e.TriggerUnit.unit,'B00Y').Stop();
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
 
    function onInit(){
        Damage.On(Damage.onItemDamage_EndDamage,Item_Damage);
        Spell.On(Spell.onSpell,'A041',ZiShaQiu);
    }
}