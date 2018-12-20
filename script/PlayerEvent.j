library Disconnect requires Teams,Players{

    private Players tmp;

    //玩家相关事件处理类
    //使用指令、按键、离开游戏等

    //当玩家离开游戏 
    private function onDisconnect(EventArgs e){ 
        integer x;
        unit u;
        tmp=Players.Get(e.TriggerPlayer); 
        u=tmp.hero.unit; 
        ReviveHero(u, GetUnitX(u), GetUnitY(u), false );
        SetUnitPosition(u, GetRectCenterX(Teams.GetTeamRect(tmp.player)), GetRectCenterY(Teams.GetTeamRect(tmp.player)) );
        for(1<=x<=6){
            UnitRemoveItemFromSlotSwapped(x,u);
        } 
        Units.Kill(u);
        HeroRares.AddRandomHero(u);
        x=Teams.GetTeamNumber(tmp.player)-1; 
        if(x!=0){
            ForForce(Teams.GetTeamForce(tmp.player), function(){
                AdjustPlayerStateBJ(  GetPlayerState(tmp.player, PLAYER_STATE_RESOURCE_GOLD) / (Teams.GetTeamNumber(tmp.player)-1), GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD )  ;          
            });
        } 
        Teams.PlayerRemoveForce(tmp.player);
        DisplayTimedTextToForce(Teams.GetAllPlayers(), 5.00,tmp.name+" 离开了游戏，金钱将平分给他的队友。"  );
        tmp.isonline=false;
        KillUi.FlushPlayerData(tmp.player);
        u=null; 
    }


    function onInit(){ 
        Events.On(Events.onPlayerDisconnect,onDisconnect);
    } 
}