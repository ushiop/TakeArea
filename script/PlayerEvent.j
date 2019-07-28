library Disconnect requires Teams,Players{

    private Players tmp;

    //玩家相关事件处理类
    //使用指令、按键、离开游戏等

    //当玩家离开游戏 
    private function onDisconnect(EventArgs e){ 
        integer x;
        unit u;
        timer t;
        tmp=Players.Get(e.TriggerPlayer); 
        u=tmp.hero.unit; 
        tmp.hero=0;
        ReviveHero(u, GetUnitX(u), GetUnitY(u), false );
        SetUnitPosition(u, GetRectCenterX(Teams.GetTeamRect(tmp.player)), GetRectCenterY(Teams.GetTeamRect(tmp.player)) );
        for(0<=x<=5){ 
            UnitRemoveItemFromSlot(u, x);
        } 
        Units.Kill(u);
        t=NewTimer();
        SetTimerData(t,Units.Get(u));
        TimerStart(t,3,false,function(){
            Units u=Units(GetTimerData(GetExpiredTimer()));
            HeroRares.AddRandomHero(u.unit);
            ReleaseTimer(GetExpiredTimer());
        });
        t=null;
        x=Teams.GetTeamNumber(tmp.player)-1; 
        if(x!=0){
            ForForce(Teams.GetTeamForce(tmp.player), function(){
                Players p=Players.Get(GetEnumPlayer());
                p.AddMoney(  GetPlayerState(tmp.player, PLAYER_STATE_RESOURCE_GOLD) / (Teams.GetTeamNumber(tmp.player)-1) )  ;          
            });
        } 
        Teams.PlayerRemoveForce(tmp.player);
        DisplayTextToForce(Teams.GetAllPlayers(),tmp.name+" 离开了游戏，金钱将平分给他的队友。"  );
        tmp.isonline=false;
        KillUi.FlushPlayerData(tmp.player);
        if(Admin==tmp.player){
            Admin=null;
            Teams.ActionsForAllPlayer(function(){
                Players p=Players.Get(GetEnumPlayer());
                if(Admin==null&&p.isai==false){
                    Admin=p.player;
                    if(Winner.GetKillStart()==false){
                        DisplayTextToForce(Teams.GetAllPlayers(), "如果需要调整胜利所需的杀敌数，请玩家["+GetPlayerName(Admin)+"]输入 -KX (X为所需的人数)进行调整，如-K5即为5杀胜利" );
                    } 
                }
            });
        }
        u=null; 
    }


    function onInit(){ 
        Events.On(Events.onPlayerDisconnect,onDisconnect);
    } 
}