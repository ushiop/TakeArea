library BuyNextHero requires Events,Players{

    //指定复活英雄
    function Buy(EventArgs e){
        integer id;
        Players p;
        if(GetItemType(e.BuyItem) == ITEM_TYPE_POWERUP){
            id=S2I(GetItemName(e.BuyItem));
            p=Units.Get(e.BuyingUnit).player;
            RemoveItem(e.BuyItem); 
            p.nextherotype=HeroType[id];
            DisplayTextToPlayer(p.player,0,0,"你已指定复活英雄为 '"+Util.GetUnitValue(p.nextherotype,"Name")+" ',请确保死亡时金钱充足~~");
        }
    }

    function onInit(){
        Events.On(Events.onUnitSellItem,Buy);
    }
}