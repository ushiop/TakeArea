library Init requires Teams,HeroRare,Winner,Players{
    
    //中央球、阵初始化、杂物初始化类

    public{ 
        unit Origin_Ball,Origin_Magic;//中央球,中央阵
        real Origin_X,Origin_Y;//中央球的原始坐标
    }

    function onInit(){
        Origin_Ball=gg_unit_e000_0010;
        Origin_Magic=gg_unit_e001_0011;
        Origin_X=GetUnitX(Origin_Ball);
        Origin_Y=GetUnitY(Origin_Ball);
        SetUnitTimeScale(Origin_Magic,0);
        Winner.start(); 
        Players.Set(Player(PLAYER_NEUTRAL_PASSIVE));
        Teams.ActionsForAllPlayer(function(){
            unit u;
            Players p=Players.Set(GetEnumPlayer());
            UnitShareVision(Origin_Ball,p.player, true );
            u=HeroRares.GetRandomHero(p.player,20);//目前没有SR、SSR池英雄，随机上限定位R级
            p.hero=Units.Get(u);
            SetUnitPosition(u,GetRectCenterX(Teams.GetTeamRect(p.player)),GetRectCenterY(Teams.GetTeamRect(p.player)));
            u=null;
        }); 
    }
}