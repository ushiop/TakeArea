library NewUI requires KillUi{

    integer MiniMapTopBorder;//迷你地图的上边框
    integer MiniMapLeftLine;//迷你地图的左侧边框
    integer MiniMapRightLine;//迷你地图的左侧边框
    integer MiniMapDownBorder;//迷你地图的底边框
    integer MiniMapBackground;//迷你地图的底图
    integer LeftTopButton;//F9的位置，用于显示上方UI
    integer GameUI;//游戏UI


    function Reg(){  
        integer tmp;
        //隐藏原界面 
        DzFrameHideInterface();
        DzFrameEditBlackBorders( 0, 0 );    
        //重定位左上角按钮
        LeftTopButton=DzCreateFrameByTagName("BACKDROP", "NewUI_LeftTopButton",GameUI, "ShowInfo", 0);
        DzFrameSetTexture( LeftTopButton, "nothing.blp", 0 );
        DzFrameSetSize( LeftTopButton, 0.03, 0.03 );
        DzFrameSetPoint( LeftTopButton,0,GameUI,0, 0.02,0); 
        DzFrameSetAllPoints(DzFrameGetUpperButtonBarButton(0) ,LeftTopButton); 
        //修正击杀框的位置
        KillUi.Move(0.378); 
        //消息框
        DzFrameSetPoint( DzFrameGetUnitMessage(), 4,GameUI, 4, 0, 0 );
        //显示小地图 war3mapMap.blp 小地图透明问题暂时解决不了
        MiniMapBackground= DzCreateFrameByTagName("BACKDROP", "NewUI_MiniMap_Background",GameUI, "ShowInfo", 0);
        DzFrameSetSize( MiniMapBackground, 0.15, 0.15 );
        DzFrameSetPoint( MiniMapBackground,6,GameUI, 6, 0.00, 0.005 );  
        DzFrameSetTexture( MiniMapBackground, "nothing.blp", 0 );
        DzFrameSetAllPoints(DzFrameGetMinimap() ,MiniMapBackground);  
        //小地图的上边框
        MiniMapTopBorder=DzCreateFrameByTagName("BACKDROP", "NewUI_MiniMap_Top_Border",MiniMapBackground, "ShowInfo", 0);
        DzFrameSetTexture( MiniMapTopBorder, "UI_TopBorder.blp", 0 );
        DzFrameSetSize( MiniMapTopBorder, 0.152,0.003 );
        DzFrameSetPoint( MiniMapTopBorder,0,MiniMapBackground,0, 0.00,0.003); 
        //小地图的左边框
        MiniMapLeftLine=DzCreateFrameByTagName("BACKDROP", "NewUI_MiniMap_Line",MiniMapTopBorder, "ShowInfo", 0);
        DzFrameSetTexture( MiniMapLeftLine, "UI_LineBorder.blp", 0 );
        DzFrameSetSize( MiniMapLeftLine, 0.002,0.15);
        DzFrameSetPoint( MiniMapLeftLine,0,MiniMapBackground,0, 0.00,0 );    
        //小地图的右边框
        MiniMapRightLine=DzCreateFrameByTagName("BACKDROP", "NewUI_MiniMap_RightLine",MiniMapTopBorder, "ShowInfo", 0);
        DzFrameSetTexture( MiniMapRightLine, "UI_LineBorder.blp", 0 );
        DzFrameSetSize( MiniMapRightLine, 0.002,0.15);
        DzFrameSetPoint( MiniMapRightLine,2,MiniMapBackground,2,0.002,0 );   
        //小地图的低框
        MiniMapDownBorder=DzCreateFrameByTagName("BACKDROP", "NewUI_MiniMap_Down_Border",MiniMapBackground, "ShowInfo", 0);
        DzFrameSetTexture( MiniMapDownBorder, "UI_RightDownPanelBorder.blp", 0 );
        DzFrameSetSize( MiniMapDownBorder, 0.152,0.003 );
        DzFrameSetPoint( MiniMapDownBorder,0,MiniMapBackground,6, 0.00,0 );             
    }

    function Chat(EventArgs e){
        real r=S2R(e.ChatString);
   
    }

    function onInit(){ 
        GameUI=DzGetGameUI();  
        Reg();
        
        Events.On(Events.onPlayerChat,Chat);
    }
}