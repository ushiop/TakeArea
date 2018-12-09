library BuyNextHero requires Events,Players{

    function Buy(EventArgs e){
        integer id=S2I(GetItemName(e.BuyItem));
        Players p=Units.Get(e.BuyingUnit).player;
        //RemoveItem(e.BuyItem); 
        p.nextherotype=HeroType[id];
        DisplayTextToPlayer(p.player,0,0,"你已指定复活英雄为'"+Util.GetUnitValue(p.nextherotype,"Name")+"',请确保死亡时金钱充足~~");
    }

    function onInit(){
        Events.On(Events.onUnitSellItem,Buy);
    }
}