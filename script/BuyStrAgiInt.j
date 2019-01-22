library BuyStrAgiInt{
    //购买三属性转换的处理
    function Buy(EventArgs e){
        integer id;
        integer add;
        Players p;
        integer bt=0;
        if(GetItemType(e.BuyItem) == ITEM_TYPE_PERMANENT){ 
            id=GetItemTypeId(e.BuyItem);
            p=Units.Get(e.BuyingUnit).player;
            RemoveItem(e.BuyItem); 
            if(id=='I003'||id=='I004'){ 
                if(p.hero.Str(false)>10){
                    bt=1;
                    add=10;
                }else{
                    bt=2;
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
                    bt=1;
                    add=10;
                }else{
                    bt=2;
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
                    bt=1;
                    add=10;
                }else{
                    bt=2;
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
            if(bt==1){
                DisplayTextToPlayer(p.player,0,0,"属性转换完成~！现在的属性是: 力量("+I2S(p.hero.Str(true))+")  敏捷("+I2S(p.hero.Agi(true))+")   智力("+I2S(p.hero.Int(true))+")");                    
            }
            if(bt==2){
                DisplayTextToPlayer(p.player,0,0,"属性转换失败~！想转换的属性不足10点");                    
            }
            if(id=='I00K'){
                p.hero.SetExStr(2); 
                DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", p.hero.X(),p.hero.Y()) );
                DisplayTextToPlayer(p.player,0,0,"属性购买完成~！你现在的力量是"+I2S(p.hero.Str(true))+"(|cff00FF00"+I2S(p.hero.ExStr())+"|r/"+I2S(p.hero.Str(false))+")");   
            }            
            if(id=='I00L'){
                p.hero.SetExAgi(2); 
                DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Items\\AIam\\AIamTarget.mdl",p.hero.X(),p.hero.Y()) );
                DisplayTextToPlayer(p.player,0,0,"属性购买完成~！你现在的敏捷是"+I2S(p.hero.Agi(true))+"(|cff00FF00"+I2S(p.hero.ExAgi())+"|r/"+I2S(p.hero.Agi(false))+")");   
            }            
            if(id=='I00M'){
                p.hero.SetExInt(2); 
                DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Items\\AIim\\AIimTarget.mdl",p.hero.X(),p.hero.Y()) );
                DisplayTextToPlayer(p.player,0,0,"属性购买完成~！你现在的智力是"+I2S(p.hero.Int(true))+"(|cff00FF00"+I2S(p.hero.ExInt())+"|r/"+I2S(p.hero.Int(false))+")");   
            }
            if(id=='I00N'){
                DisplayTextToPlayer(p.player,0,0,"你的属性目前为 力量("+I2S(p.hero.Str(true))+"[|cff00FF00"+I2S(p.hero.ExStr())+"|r/"+I2S(p.hero.Str(false))+"]) 敏捷("+I2S(p.hero.Agi(true))+"[|cff00FF00"+I2S(p.hero.ExAgi())+"|r/"+I2S(p.hero.Agi(false))+"]) 智力("+I2S(p.hero.Int(true))+"[|cff00FF00"+I2S(p.hero.ExInt())+"|r/"+I2S(p.hero.Int(false))+")");   
            }
        }
    }

    function onInit(){
        Events.On(Events.onUnitSellItem,Buy);
    }
}