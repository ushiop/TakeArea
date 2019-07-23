library Init requires Teams,HeroRare,Winner,Players,Units/*,japi*/{
    
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
        SetUnitOwner( Origin_Magic, Player(bj_PLAYER_NEUTRAL_EXTRA), false );
        Origin_X=GetUnitX(Origin_Ball);
        Origin_Y=GetUnitY(Origin_Ball);
        SetUnitTimeScale(Origin_Magic,0);
        Winner.start(); 
        Players.Set(Player(PLAYER_NEUTRAL_PASSIVE));
        Players.Set(Player(PLAYER_NEUTRAL_AGGRESSIVE));
        Players.Set(Player(bj_PLAYER_NEUTRAL_EXTRA));
        Teams.ActionsForAllPlayer(function(){
            unit u;
            Players p=Players.Set(GetEnumPlayer());
            UnitShareVision(Origin_Ball,p.player, true );
            
            //测试时不随机英雄
            //u=Units.Spawn(p.player,'H00K',0,0,0);
            u=HeroRares.GetRandomHero(p.player,p.randomhero); 
            
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
            p.hero.Lock(p.player);
            p.hero.Select(p.player);
        }); 

 
        /*测试

        for(0<=i<=5){
            RemoveGuardPosition(Units.Spawn(Player(PLAYER_NEUTRAL_AGGRESSIVE),'h001',-4464,-3641,0));
            RemoveGuardPosition(Units.Spawn(Player(PLAYER_NEUTRAL_AGGRESSIVE),'h009',-4464,-3641,0));
        } 
 
        //JAPI测试异步 
        BJDebugMsg(GetMapName()+"/"+GetPluginVersion()); 
        open_code_run_logs(true);*/

        SetTimeOfDay(6.0);//设置游戏时间为夜晚
        
        //Cheat("exec-lua:init");
    }
}