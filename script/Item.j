library Item{
    //物品效果

    //跳刀的受伤冷却
    function TiaoDao(DamageArgs e){
        if(e.TriggerUnit.IsAbility('A02B')==true){
            if(e.TriggerUnit.GetAbilityCD('A02B')>2||e.TriggerUnit.GetAbilityCD('A02B')==0){
                e.TriggerUnit.SetAbilityCD('A02B',10);
            }
        }
    }

    function onInit(){
        Damage.On(Damage.onItemDamage_EndDamage,TiaoDao);
    }
}