library NewUI requires KillUi{


    integer MiniMapBackground;//迷你地图的底图
    integer GameUI;//游戏UI


    function Reg(){
        BJDebugMsg("???");
        MiniMapBackground= DzCreateFrameByTagName("BACKDROP", "NewUI_MiniMap_Background",GameUI, "ShowInfo", 0);
        DzFrameSetSize( MiniMapBackground, 0.5, 0.50 );
        DzFrameSetPoint( MiniMapBackground,6,GameUI, 6, 0.00, 0.00 );
        DzFrameHideInterface();
        DzFrameEditBlackBorders( 0, 0 );   
        DzFrameSetAllPoints(DzFrameGetMinimap() ,MiniMapBackground);        
    }

    function onInit(){
        trigger t=CreateTrigger();
        GameUI=DzGetGameUI();
        TriggerAddAction(t,function Reg);
        t=null;
    }
}