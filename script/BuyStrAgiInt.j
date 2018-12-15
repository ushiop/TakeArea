library BuyStrAgiInt{
    //购买三属性转换的处理
    function Buy(EventArgs e){
        integer id;
        integer add;
        Players p;
        if(GetItemType(e.BuyItem) == ITEM_TYPE_PERMANENT){ 
            id=GetItemTypeId(e.BuyItem);
            p=Units.Get(e.BuyingUnit).player;
            RemoveItem(e.BuyItem); 
            if(id=='I003'||id=='I004'){
                if(p.hero.Str(false)>10){
                    add=10;
                }else{
                    add=0;
                    p.AddMoney(20);
                }
                ModifyHeroStat( bj_HEROSTAT_STR, p.hero.unit, bj_MODIFYMETHOD_SUB, add );
                if(id=='I003'){ 
                    ModifyHeroStat( bj_HEROSTAT_AGI, p.hero.unit, bj_MODIFYMETHOD_ADD, add );
                    DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Items\\AIam\\AIamTarget.mdl",p.hero.X(),p.hero.Y()) );
                }else{ 
                    ModifyHeroStat( bj_HEROSTAT_INT, p.hero.unit, bj_MODIFYMETHOD_ADD, add );
                    DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Items\\AIim\\AIimTarget.mdl",p.hero.X(),p.hero.Y()) );
                }
            }
            if(id=='I005'||id=='I006'){
                if(p.hero.Agi(false)>10){
                    add=10;
                }else{
                    add=0;
                    p.AddMoney(20);
                }
                ModifyHeroStat( bj_HEROSTAT_AGI, p.hero.unit, bj_MODIFYMETHOD_SUB, add );
                if(id=='I005'){ 
                    ModifyHeroStat( bj_HEROSTAT_STR, p.hero.unit, bj_MODIFYMETHOD_ADD, add );
                    DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", p.hero.X(),p.hero.Y()) );
                }else{ 
                    ModifyHeroStat( bj_HEROSTAT_INT, p.hero.unit, bj_MODIFYMETHOD_ADD, add );
                    DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Items\\AIim\\AIimTarget.mdl",p.hero.X(),p.hero.Y()) );
                }
            }
            if(id=='I007'||id=='I008'){
                if(p.hero.Int(false)>10){
                    add=10;
                }else{
                    add=0;
                    p.AddMoney(20);
                }
                ModifyHeroStat( bj_HEROSTAT_INT, p.hero.unit, bj_MODIFYMETHOD_SUB, add );
                if(id=='I007'){ 
                    ModifyHeroStat( bj_HEROSTAT_STR, p.hero.unit, bj_MODIFYMETHOD_ADD, add );
                    DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", p.hero.X(),p.hero.Y()) );
                }else{ 
                    ModifyHeroStat( bj_HEROSTAT_AGI, p.hero.unit, bj_MODIFYMETHOD_ADD, add );
                    DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Items\\AIam\\AIamTarget.mdl",p.hero.X(),p.hero.Y()) );
                }
            }    
            DisplayTimedTextFromPlayer(p.player,0,0,5,"属性转换完成~！现在的属性是: 力量("+I2S(p.hero.Str(true))+")  敏捷("+I2S(p.hero.Agi(true))+")   智力("+I2S(p.hero.Int(true))+")");                    
        }
    }

    function onInit(){
        Events.On(Events.onUnitSellItem,Buy);
    }
}