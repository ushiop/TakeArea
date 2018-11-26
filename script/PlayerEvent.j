library PlayerEvent requires Teams{

    //等待使用事件基类和玩家类重构

    //玩家相关事件处理类
    //使用指令、按键、离开游戏等

    //当玩家离开游戏
   /* private trigger disconnect=CreateTrigger();
    private function onDisconnect(){
        player p=GetTriggerPlayer();
        integer index=GetConvertedPlayerId(p),x;
        unit u=PlayerHero[index]; 
        ReviveHero(u, GetUnitX(u), GetUnitY(u), false );
        SetUnitPosition(u, GetRectCenterX(Teams.GetTeamRect(p)), GetRectCenterY(Teams.GetTeamRect(p)) );
        for(1<=x<=6){
            UnitRemoveItemFromSlotSwapped(x,u);
        }
        HeroRares.AddRandomHero(u);
        x=Teams.GetTeamNumber(p)-1; 
        if(x!=0){
            ForForce(Teams.GetTeamForce(p), function(){
                AdjustPlayerStateBJ(  GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD) / (Teams.GetTeamNumber(GetTriggerPlayer())-1), GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD )  ;          
            });
        } 
        Teams.PlayerRemoveForce(p);
        DisplayTimedTextToForce(Teams.GetAllPlayers(), 5.00, GetPlayerName(p)+" 离开了游戏，金钱将平分给他的队友。"  );
        p=null;
        u=null; 
    }


    function onInit(){ 
        Teams.ActionsForAllPlayer(function(){
            TriggerRegisterPlayerEventLeave(disconnect,GetEnumPlayer());
        });
        TriggerAddAction(disconnect,function onDisconnect);
        disconnect=null;
    }*/
}