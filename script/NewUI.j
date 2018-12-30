library NewUI requires KillUi,Util{

    integer MiniMapTopBorder;//迷你地图的上边框
    integer MiniMapLeftLine;//迷你地图的左侧边框
    integer MiniMapRightLine;//迷你地图的左侧边框
    integer MiniMapDownBorder;//迷你地图的底边框
    integer MiniMapBackground;//迷你地图的底图
    integer ChatMessageFixed;//聊天框的重定位
    integer LeftTopButton;//F9的位置，用于显示上方UI
    integer UnitInfoBackground;//单位信息面板的背景图
    integer UnitInfoTopBorder;//单位信息面板上边框
    integer UnitInfoTX;//单位信息面板的头像
    integer UnitInfoName;//单位信息面板的名字
    integer UnitInfoLine;//单位信息面板数据与技能的分割线
    integer GameUI;//游戏UI
    integer LvExp[];//每一级需要的经验;
    unit UISelectUnit;//本地玩家选择的单位

    function Reg(){  
        //隐藏原界面 
        DzFrameHideInterface();
        DzFrameEditBlackBorders( 0, 0 );    
        //重定位左上角按钮
        LeftTopButton=DzCreateFrameByTagName("BACKDROP", "NewUI_LeftTopButton",GameUI, "ShowInfo", 0);
        DzFrameSetTexture( LeftTopButton, "nothing.blp", 0 );
        DzFrameSetSize( LeftTopButton, 0.03, 0.03 );
        DzFrameSetPoint( LeftTopButton,0,GameUI,0, 0.24,0); 
        DzFrameSetAllPoints(DzFrameGetUpperButtonBarButton(0) ,LeftTopButton); 
        //修正击杀框的位置
        KillUi.Move(0.004,-0.024); 
        //系统消息框 
        DzFrameSetPoint( DzFrameGetUnitMessage(), 4,GameUI, 4, -0.145, 0 );
        //玩家聊天框
        ChatMessageFixed=DzCreateFrameByTagName("BACKDROP", "NewUI_ChatMessage",GameUI, "ShowInfo", 0);
        DzFrameSetTexture( ChatMessageFixed, "nothing.blp", 0 );
        DzFrameSetSize( ChatMessageFixed, 0.37, 0.1 );
        DzFrameSetPoint( ChatMessageFixed,4,GameUI,4, -0.013,-0.075);       
        DzFrameSetAllPoints( DzFrameGetChatMessage(), ChatMessageFixed);    
        //禁用黑色阴影
        FogMaskEnableOff();
        //显示小地图 war3mapMap.blp 小地图透明禁用黑色阴影+战争迷雾可完全解决,暂时禁用黑色阴影
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
        //单位信息面板低图
        UnitInfoBackground=DzCreateFrameByTagName("BACKDROP", "NewUI_UnitInfo_Background",GameUI, "ShowInfo", 0);
        DzFrameSetSize( UnitInfoBackground, 0.4, 0.125 );
        DzFrameSetPoint( UnitInfoBackground,4,GameUI,4, 0.00, -0.245);  
        DzFrameSetTexture( UnitInfoBackground, "UI_RightDownPanelLine.blp", 0 );
        //单位信息面板上边框
        UnitInfoTopBorder=DzCreateFrameByTagName("BACKDROP", "NewUI_UnitInfo_Top_Border",UnitInfoBackground, "ShowInfo", 0);
        DzFrameSetTexture( UnitInfoTopBorder, "UI_TopBorder.blp", 0 );
        DzFrameSetSize( UnitInfoTopBorder, 0.4,0.003 );
        DzFrameSetPoint( UnitInfoTopBorder,0,UnitInfoBackground,0, 0.00,0.003); 
        //单位信息面板的头像框
        UnitInfoTX=DzCreateFrameByTagName("BACKDROP", "NewUI_UnitInfo_TX",UnitInfoTopBorder, "ShowInfo", 0);
        DzFrameSetTexture( UnitInfoTX, "nothing.blp", 0 );
        DzFrameSetSize( UnitInfoTX, 0.1,0.12 );
        DzFrameSetPoint( UnitInfoTX,0,UnitInfoTopBorder,0, 0.005,-0.005); 
        //单位信息面板的名字
        UnitInfoName=DzCreateFrameByTagName("TEXT", "NewUI_UnitInfo_NAME",UnitInfoTX, "ShowInfo", 0);
        DzFrameSetSize( UnitInfoName, 0.06,0.1 );
        DzFrameSetPoint( UnitInfoName,0,UnitInfoTX,2, 0.001,-0.01);         
        DzFrameSetText(UnitInfoName, "");    
        //单位信息面板数据技能分割线
        UnitInfoLine=DzCreateFrameByTagName("BACKDROP", "NewUI_UnitInfo_Line",UnitInfoName, "ShowInfo", 0);
        DzFrameSetTexture( UnitInfoLine, "UI_WHITEBLOCK.blp", 0 );
        DzFrameSetSize( UnitInfoLine, 0.002,0.095 );
        DzFrameSetPoint( UnitInfoLine,0,UnitInfoName,2, 0.00,0); 
    }

    function Chat(EventArgs e){
        real r=S2R(e.ChatString);    
    }


    function Select(EventArgs e){
        real exp;
        if(e.TriggerPlayer==Players.localplayer){
            UISelectUnit=e.TriggerUnit;   
            DzFrameSetTexture( UnitInfoTX, Util.GetUnitValue(GetUnitTypeId(UISelectUnit),"Art"), 0 );     
            exp=(GetHeroXP(UISelectUnit)/LvExp[GetHeroLevel(UISelectUnit)])*100;
            DzFrameSetText(UnitInfoName,"等级 "+I2S(GetHeroLevel(UISelectUnit))+"("+I2S(R2I(exp)) +"%)"+"|n攻击 "+I2S(R2I(GetUnitState(GetTriggerUnit(), ConvertUnitState(0x14))))+"~"+I2S(R2I(GetUnitState(GetTriggerUnit(), ConvertUnitState(0x15))))+"|n防御 "+I2S(R2I(GetUnitState(GetTriggerUnit(), ConvertUnitState(0x20))))+"|n力量 "+I2S(GetHeroStr(UISelectUnit,true))+"|n敏捷 "+I2S(GetHeroAgi(UISelectUnit,true))+"|n智力 "+I2S(GetHeroInt(UISelectUnit,true))+"|n移速 "+R2S(GetUnitMoveSpeed(UISelectUnit))+"|n攻速 "+R2S(GetUnitState(UISelectUnit, ConvertUnitState(0x51))));        
        } 
    }

    function Loop(){
        if(UISelectUnit!=null){ 
            if(IsUnitAliveBJ(UISelectUnit)==true){ 
            }else{
                UISelectUnit=null;
            }
        }
    }

    function onInit(){ 
        integer i;
        LvExp[1]=200;
        for(2<=i<=24){
            LvExp[i]=LvExp[i-1]+((i+1)*50); 
        }
        LvExp[25]=LvExp[24];
        GameUI=DzGetGameUI();  
        UISelectUnit=null;
        Reg(); 
        TimerStart(NewTimer(),0.01,true,function Loop);
        Events.On(Events.onPlayerChat,Chat); 
        Events.On(Events.onPlayerSelectUnit,Select);
    }
}