library Init requires Teams,HeroRare,Winner{
    
    //中央球、阵初始化、杂物初始化类

    public{
        unit PlayerHero[];//玩家英雄
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
        Teams.ActionsForAllPlayer(function(){
            unit u;
            UnitShareVision(Origin_Ball, GetEnumPlayer(), true );
            u=HeroRares.GetRandomHero(GetEnumPlayer(),20);//目前没有SR、SSR池英雄，随机上限定位R级
            PlayerHero[GetConvertedPlayerId(GetEnumPlayer())]=u;
            SetUnitPosition(u,GetRectCenterX(Teams.GetTeamRect(GetEnumPlayer())),GetRectCenterY(Teams.GetTeamRect(GetEnumPlayer())));
            u=null;
        }); 
    }
}