library Init requires Teams,HeroRare,Winner,Players,Units{
    
    //中央球、阵初始化、杂物初始化类

    public{ 
        unit Origin_Ball,Origin_Magic;//中央球,中央阵
        real Origin_X,Origin_Y;//中央球的原始坐标
        real GameTime=0.0;//游戏时间轴
    }

    function onInit(){
        integer i;
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
            /*
                测试时不随机英雄
            u=HeroRares.GetRandomHero(p.player,20);//目前没有SR、SSR池英雄，随机上限定位R级
            */
            u=Units.Spawn(p.player,'H002',0,0,0);
            p.hero=Units.Get(u);
            SetUnitPosition(u,GetRectCenterX(Teams.GetTeamRect(p.player)),GetRectCenterY(Teams.GetTeamRect(p.player)));
            u=null;
            if(p.teamid==0){
                SetPlayerAllianceStateBJ( Player(9), p.player, bj_ALLIANCE_ALLIED_VISION );
                SetPlayerAllianceStateBJ( p.player,Player(9), bj_ALLIANCE_ALLIED_VISION );
            }else if(p.teamid==1){
                SetPlayerAllianceStateBJ( Player(10), p.player, bj_ALLIANCE_ALLIED_VISION );
                SetPlayerAllianceStateBJ( p.player,Player(10), bj_ALLIANCE_ALLIED_VISION );                
            }else{
                SetPlayerAllianceStateBJ( Player(11), p.player, bj_ALLIANCE_ALLIED_VISION );
                SetPlayerAllianceStateBJ( p.player,Player(11), bj_ALLIANCE_ALLIED_VISION );                     
            }
        }); 


        //测试
        for(0<=i<=5){
            Units.Spawn(Player(PLAYER_NEUTRAL_AGGRESSIVE),'h001',-4464,-3641,0);
        }
    }
}