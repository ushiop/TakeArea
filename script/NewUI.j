library NewUI requires TakeUi,KillUi,Util,BuffUI{

    integer MiniMapTopBorder;//迷你地图的上边框
    integer MiniMapLeftLine;//迷你地图的左侧边框
    integer MiniMapRightLine;//迷你地图的左侧边框
    integer MiniMapDownBorder;//迷你地图的底边框
    integer MiniMapBackground;//迷你地图的底图
    integer ChatMessageFixed;//聊天框的重定位
    integer LeftTopButton;//F9的位置，用于显示上方UI
    integer UnitInfoBackground;//单位信息面板的背景图
    integer UnitInfoLeftLineBackground;//单位信息面板左侧的底图
    integer UnitInfoTopBorder;//单位信息面板上边框
    integer UnitInfoTX;//单位信息面板的头像
    integer UnitInfoName;//单位信息面板的名字
    integer UnitInfoLine;//单位信息面板数据与技能的分割线
    integer UnitInfoHPBar;//血条框框
    integer UnitInfoHP;//血条
    integer UnitInfoHPText;//血条文字
    integer UnitInfoMPBar;//血条框框
    integer UnitInfoMP;//血条
    integer UnitInfoMPText;//血条文字
    integer UnitInfoBarBackground;//血蓝条的背景图
    integer War3ToolTip;//魔兽提示框的底图
    integer MoneyBackground;//金币背景图
    integer MoneyRightBackground;//金币背景图的右侧
    integer MoneyText;//金币
    integer BagItemBackground[];//物品栏没有物品时的图标
    integer GameUI;//游戏UI
    integer LvExp[];//每一级需要的经验;
    integer Logo[];//LOGO低图;
    public unit UISelectUnit;//本地玩家选择的单位
    integer UIType;//目前显示的UI类型
 
    function Reg(){  
        integer i;
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
        //修正争夺条的背景图
        TakeUi.ChangeTexture("UI_LeftUpperBackgroundNew.blp");
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
        DzFrameSetSize( MiniMapBackground, 0.12, 0.15 );
        DzFrameSetPoint( MiniMapBackground,6,GameUI, 6, 0.00, 0.005 );  
        DzFrameSetTexture( MiniMapBackground, "nothing.blp", 0 );
        DzFrameSetAllPoints(DzFrameGetMinimap() ,MiniMapBackground);  
        //小地图的上边框
        MiniMapTopBorder=DzCreateFrameByTagName("BACKDROP", "NewUI_MiniMap_Top_Border",MiniMapBackground, "ShowInfo", 0);
        DzFrameSetTexture( MiniMapTopBorder, "UI_TopBorder.blp", 0 );
        DzFrameSetSize( MiniMapTopBorder, 0.122,0.003 );
        DzFrameSetPoint( MiniMapTopBorder,0,MiniMapBackground,0, 0.00,0.003); 
        //小地图的左边框
        MiniMapLeftLine=DzCreateFrameByTagName("BACKDROP", "NewUI_MiniMap_Line",MiniMapTopBorder, "ShowInfo", 0);
        DzFrameSetTexture( MiniMapLeftLine, "UI_LineBorder.blp", 0 );
        DzFrameSetSize( MiniMapLeftLine, 0.002,0.152);
        DzFrameSetPoint( MiniMapLeftLine,0,MiniMapBackground,0, 0.00,0 );    
        //小地图的右边框
        MiniMapRightLine=DzCreateFrameByTagName("BACKDROP", "NewUI_MiniMap_RightLine",MiniMapTopBorder, "ShowInfo", 0);
        DzFrameSetTexture( MiniMapRightLine, "UI_LineBorder.blp", 0 );
        DzFrameSetSize( MiniMapRightLine, 0.002,0.152);
        DzFrameSetPoint( MiniMapRightLine,2,MiniMapBackground,2,0.002,0 );   
        //小地图的低框
        MiniMapDownBorder=DzCreateFrameByTagName("BACKDROP", "NewUI_MiniMap_Down_Border",MiniMapBackground, "ShowInfo", 0);
        DzFrameSetTexture( MiniMapDownBorder, "UI_RightDownPanelBorder.blp", 0 );
        DzFrameSetSize( MiniMapDownBorder, 0.122,0.003 );
        DzFrameSetPoint( MiniMapDownBorder,0,MiniMapBackground,6, 0.00,0 );  

        
        //单位信息面板低图
        UnitInfoBackground=DzCreateFrameByTagName("BACKDROP", "NewUI_UnitInfo_Background",GameUI, "ShowInfo", 0);
        DzFrameSetSize( UnitInfoBackground, 0.4, 0.125 );
        DzFrameSetPoint( UnitInfoBackground,4,GameUI,4, -0.03, -0.245);  
        DzFrameSetTexture( UnitInfoBackground, "nothing.blp", 0 );
        //单位信息面板上边框
        UnitInfoTopBorder=DzCreateFrameByTagName("BACKDROP", "NewUI_UnitInfo_Top_Border",UnitInfoBackground, "ShowInfo", 0);
        DzFrameSetTexture( UnitInfoTopBorder, "nothing.blp", 0 );
        DzFrameSetSize( UnitInfoTopBorder, 0.4,0.003 );
        DzFrameSetPoint( UnitInfoTopBorder,0,UnitInfoBackground,0, 0.00,0.003); 
        //单位信息面板的头像低图
        UnitInfoLeftLineBackground=DzCreateFrameByTagName("BACKDROP", "NewUI_UnitInfo_Background_Left",UnitInfoTopBorder, "ShowInfo", 0);
        DzFrameSetSize( UnitInfoLeftLineBackground, 0.164, 0.122 );
        DzFrameSetPoint( UnitInfoLeftLineBackground,0,UnitInfoTopBorder,0, 0.005, -0.005);  
        DzFrameSetTexture( UnitInfoLeftLineBackground, "UI_RightDownPanelLine.blp", 0 );
        //单位信息面板的头像框
        UnitInfoTX=DzCreateFrameByTagName("BACKDROP", "NewUI_UnitInfo_TX",UnitInfoTopBorder, "ShowInfo", 0);
        DzFrameSetTexture( UnitInfoTX, "nothing.blp", 0 );
        DzFrameSetSize( UnitInfoTX, 0.1,0.12 );
        DzFrameSetPoint( UnitInfoTX,0,UnitInfoTopBorder,0, 0.005,-0.005); 
        //单位信息面板的数据
        UnitInfoName=DzCreateFrameByTagName("TEXT", "NewUI_UnitInfo_NAME",UnitInfoTX, "ShowInfo", 0);
        DzFrameSetSize( UnitInfoName, 0.06,0.1 );
        DzFrameSetPoint( UnitInfoName,0,UnitInfoTX,2, 0.001,-0.01);         
        DzFrameSetText(UnitInfoName, "");    
        //单位信息面板数据技能分割线
        UnitInfoLine=DzCreateFrameByTagName("BACKDROP", "NewUI_UnitInfo_Line",UnitInfoName, "ShowInfo", 0);
        DzFrameSetTexture( UnitInfoLine, "nothing.blp", 0 );
        DzFrameSetSize( UnitInfoLine, 0.001,0.103 );
        DzFrameSetPoint( UnitInfoLine,0,UnitInfoName,2, 0.00,0); 
        
        //血蓝条背景图
        UnitInfoBarBackground=DzCreateFrameByTagName("BACKDROP", "NewUI_UnitInfo_HPMP_Background",UnitInfoLine, "ShowInfo", 0);
        DzFrameSetTexture( UnitInfoBarBackground, "UI_LeftUpperBackgroundNew.blp", 0 );
        DzFrameSetSize( UnitInfoBarBackground, 0.256,0.047);//0.228
        DzFrameSetPoint( UnitInfoBarBackground,0,UnitInfoLine,2, 0.002,-0.057);    
        //单位信息面板的血条框
        UnitInfoHPBar=DzCreateFrameByTagName("BACKDROP", "NewUI_UnitInfo_HPBar",UnitInfoBarBackground, "ShowInfo", 0);
        DzFrameSetTexture( UnitInfoHPBar, "UI_LeftUpperBackgroundNew.blp", 0 );
        DzFrameSetSize( UnitInfoHPBar, 0.255,0.02 );
        DzFrameSetPoint( UnitInfoHPBar,0,UnitInfoLine,2, 0.002,-0.06); 
        //单位信息面板的血条
        UnitInfoHP=DzCreateFrameByTagName("BACKDROP", "NewUI_UnitInfo_HP",UnitInfoHPBar, "ShowInfo", 0);
        DzFrameSetTexture( UnitInfoHP, "UI_HPBar.blp", 0 );
        DzFrameSetSize( UnitInfoHP, 0.001,0.016 ); //0%血量状态
        //DzFrameSetSize( UnitInfoHP, 0.225,0.016 ); 100%血量状态 
        DzFrameSetPoint( UnitInfoHP,0,UnitInfoHPBar,0, 0.001,-0.002); 
        //单位信息面板的血条文字
        UnitInfoHPText=DzCreateFrameByTagName("TEXT", "NewUI_UnitInfo_HP_TEXT",UnitInfoHPBar, "ShowInfo", 0);
        DzFrameSetSize( UnitInfoHPText, 0.06,0.016 );
        DzFrameSetPoint( UnitInfoHPText,4,UnitInfoHPBar,4,0,-0.002);         
        DzFrameSetText(UnitInfoHPText, "");    
        //单位信息面板的魔法框
        UnitInfoMPBar=DzCreateFrameByTagName("BACKDROP", "NewUI_UnitInfo_MPBar",UnitInfoBarBackground, "ShowInfo", 0);
        DzFrameSetTexture( UnitInfoMPBar, "UI_LeftUpperBackgroundNew.blp", 0 );
        DzFrameSetSize( UnitInfoMPBar, 0.255,0.02 );
        DzFrameSetPoint( UnitInfoMPBar,0,UnitInfoLine,2, 0.002,-0.082); 
        //单位信息面板的蓝条
        UnitInfoMP=DzCreateFrameByTagName("BACKDROP", "NewUI_UnitInfo_MP",UnitInfoMPBar, "ShowInfo", 0);
        DzFrameSetTexture( UnitInfoMP, "UI_MPBar.blp", 0 );
        DzFrameSetSize( UnitInfoMP, 0.001,0.016 ); //0%血量状态
        //DzFrameSetSize( UnitInfoHP, 0.225,0.016 ); 100%血量状态 
        DzFrameSetPoint( UnitInfoMP,0,UnitInfoMPBar,0, 0.001,-0.002); 
        //单位信息面板的蓝条文字
        UnitInfoMPText=DzCreateFrameByTagName("TEXT", "NewUI_UnitInfo_MP_TEXT",UnitInfoMPBar, "ShowInfo", 0);
        DzFrameSetSize( UnitInfoMPText, 0.06,0.016 );
        DzFrameSetPoint( UnitInfoMPText,4,UnitInfoMPBar,4,0,-0.002);         
        DzFrameSetText(UnitInfoMPText, "");
        //隐藏信息面板 
        DzFrameShow(UnitInfoBackground,false); 

        //魔兽原版提示
        War3ToolTip=DzCreateFrameByTagName("BACKDROP", "NewUI_ToolTip",GameUI, "ShowInfo", 0);
        DzFrameSetTexture( War3ToolTip, "nothing.blp", 0 );
        DzFrameSetSize( War3ToolTip, 0.22,0.35 );
        DzFrameSetPoint( War3ToolTip,0,GameUI,4,0.18,0.21);  
        DzFrameSetAllPoints(DzFrameGetTooltip(),War3ToolTip);

        //6个物品栏的低图
        for(0<=i<6){
            BagItemBackground[i]=DzCreateFrameByTagName("BACKDROP", "NewUI_Bag_Item"+I2S(i),UnitInfoBackground, "ShowInfo", 0);
            DzFrameSetTexture(BagItemBackground[i], "UI_Bag.blp", 0 );
            DzFrameSetSize(BagItemBackground[i], 0.032,0.032 );
            DzFrameSetSize( DzFrameGetItemBarButton(i), 0.032, 0.032 );
        }

        //金币背景图
        MoneyBackground=DzCreateFrameByTagName("BACKDROP", "NewUI_Money",GameUI, "ShowInfo", 0);
        DzFrameSetTexture( MoneyBackground, "UI\\Feedback\\Resources\\ResourceGold.blp", 0 );
        DzFrameSetSize( MoneyBackground, 0.015,0.015 );
        DzFrameSetPoint( MoneyBackground,0,MiniMapRightLine,8,0,0.014);  
        //金币文字的背景图
        MoneyRightBackground=DzCreateFrameByTagName("BACKDROP", "NewUI_Money_Right",MoneyBackground, "ShowInfo", 0);
        DzFrameSetTexture( MoneyRightBackground, "UI_RightDownPanelLine.blp", 0 );
        DzFrameSetSize( MoneyRightBackground, 0.05,0.015 );
        DzFrameSetPoint( MoneyRightBackground,0,MoneyBackground,2,-0.001,0);  
        //金币文字
        MoneyText=DzCreateFrameByTagName("TEXT", "NewUI_Money_Text",MoneyRightBackground, "ShowInfo", 0);
        DzFrameSetSize( MoneyText, 0.05,0.016 );
        DzFrameSetPoint( MoneyText,0,MoneyRightBackground,0,0,-0.001);         
        DzFrameSetText(MoneyText, "$44444"); 

        //注册会显示的BUFF
        BuffUI.RegBuff('BPSE');
        BuffUI.RegBuff('Bprg');
        BuffUI.RegBuff('B003');
        BuffUI.RegBuff('B005');
        BuffUI.RegBuff('B004');
        BuffUI.RegBuff('B000');
        BuffUI.RegBuff('B007');
        BuffUI.RegBuff('B009');
        BuffUI.RegBuff('B00A');
        BuffUI.RegBuff('B006');
        BuffUI.RegBuff('B008');
        BuffUI.RegBuff('B002');
        BuffUI.RegBuff('B001');
        //BUFF条
        BuffUI.BackgroundSize(0.18,0.024); 
        BuffUI.BackgroundMove(0.02,-0.186); 
        BuffUI.BackgroundShow(false);

        //LOGO
        Logo[0]=DzCreateFrameByTagName("BACKDROP", "Logo_Penhuolong",GameUI, "ShowInfo", 0);
        DzFrameSetTexture( Logo[0], "UI_penhuolong.blp", 0 );
        DzFrameSetSize(Logo[0],0.04,0.04 );
        DzFrameSetPoint(Logo[0],0,GameUI,4,-0.168,0.27);  

        Logo[1]=DzCreateFrameByTagName("BACKDROP", "Logo_Zhadan",GameUI, "ShowInfo", 0);
        DzFrameSetTexture( Logo[1], "UI_zhadan.blp", 0 );
        DzFrameSetSize(Logo[1],0.04,0.04 );
        DzFrameSetPoint(Logo[1],0,GameUI,4,0.13,0.27);  

        Logo[2]=DzCreateFrameByTagName("BACKDROP", "Logo_Xiazi",GameUI, "ShowInfo", 0);
        DzFrameSetTexture( Logo[2], "UI_xiazi.blp", 0 );
        DzFrameSetSize(Logo[2],0.04,0.04 );
        DzFrameSetPoint(Logo[2],0,GameUI,4,0.14,0.29);  
     
    } 
 
    function Select(EventArgs e){ 
        integer i;
        integer s;
        integer idx;
        if(e.TriggerPlayer==Players.localplayer){
            UISelectUnit=e.TriggerUnit;   
            DzFrameSetTexture( UnitInfoTX, Util.GetUnitValue(GetUnitTypeId(UISelectUnit),"Art"), 0 ); 
            DzFrameShow(UnitInfoBarBackground,true); 
            DzFrameSetPoint( UnitInfoBackground,4,GameUI,4,-0.02, -0.245);  
            DzFrameShow(UnitInfoBackground,true);  
            BuffUI.BackgroundShow(true);                
            for(0<=i<4){
                for(0<=s<3){ 
                    DzFrameSetPoint( DzFrameGetCommandBarButton(s,i), 0, UnitInfoLine, 2, 0.001+(0.045*i),-0.2);
                        
                }
            } 
            if(IsUnitType(UISelectUnit,UNIT_TYPE_HERO)==true){
                
                BuffUI.BackgroundMove(-0.0518,-0.186); 
                BuffUI.BackgroundTipMove(-0.0518,-0.172);
                UIType=1;
                DzFrameSetPoint( UnitInfoName,0,UnitInfoTX,2, 0.001,-0.01);                        

                //Q
                DzFrameSetPoint( DzFrameGetCommandBarButton(2, 0), 0, UnitInfoLine, 2, 0.001,-0.016);
                DzFrameSetSize( DzFrameGetCommandBarButton(2, 0), 0.04, 0.04 );
                //W
                DzFrameSetPoint( DzFrameGetCommandBarButton(2, 1), 0, UnitInfoLine, 2, 0.041,-0.016);
                DzFrameSetSize( DzFrameGetCommandBarButton(2, 1), 0.04, 0.04 );
                //E
                DzFrameSetPoint( DzFrameGetCommandBarButton(2, 2), 0, UnitInfoLine, 2, 0.081,-0.016);
                DzFrameSetSize( DzFrameGetCommandBarButton(2, 2), 0.04, 0.04 );
                //R
                DzFrameSetPoint( DzFrameGetCommandBarButton(1,1), 0, UnitInfoLine, 2, 0.121,-0.016);
                DzFrameSetSize( DzFrameGetCommandBarButton(1, 1), 0.04, 0.04 );
                //D
                DzFrameSetPoint( DzFrameGetCommandBarButton(1,2), 0, UnitInfoLine, 2, 0.161,-0.016);
                DzFrameSetSize( DzFrameGetCommandBarButton(1, 2), 0.04, 0.04 );
                //F
                DzFrameSetPoint( DzFrameGetCommandBarButton(1,3), 0, UnitInfoLine, 2, 0.201,-0.016);
                DzFrameSetSize( DzFrameGetCommandBarButton(1, 3), 0.04, 0.04 );
                //物品栏
                if(GetOwningPlayer(UISelectUnit)==Players.localplayer){
                    idx=0; 
                    for(0<=i<3){ 
                        for(0<=s<2){
                            DzFrameSetPoint( BagItemBackground[idx],0,MiniMapRightLine,2,0.00+(0.032*s),-0.0403+(-0.032*i)); 
                            DzFrameSetPoint( DzFrameGetItemBarButton(idx), 0, MiniMapRightLine, 2,0.00+(0.032*s),-0.0403+(-0.032*i));
                            idx+=1;
                        } 
                    }
                }else{
                    for(0<=i<6){ 
                        DzFrameSetPoint( BagItemBackground[i],0,UnitInfoLine,2,0.003+(0.032*i),-0.018); 
                        DzFrameSetPoint( DzFrameGetItemBarButton(i), 0, UnitInfoLine, 2,0.003+(0.032*i),-0.018 );
                    }
                }

            }else{
                
                BuffUI.BackgroundMove(-0.0518,-0.226);  
                BuffUI.BackgroundTipMove(-0.0518,-0.212);
                UIType=2;         
                for(0<=i<6){ 
                    DzFrameShow(BagItemBackground[i],false);
                    //DzFrameSetPoint( BagItemBackground[i],0,UnitInfoLine,2,0.003+(0.032*i),-0.018); 
                    //DzFrameSetPoint( DzFrameGetItemBarButton(i), 0, UnitInfoLine, 2,0.003+(0.032*i),-0.018 );
                }//非英雄单位暂时没有物品栏
                
                if(GetUnitAbilityLevel(UISelectUnit,'Apit')==1){
                    UIType=3;  
                    DzFrameSetPoint( UnitInfoBackground,4,GameUI,4, -0.02, -0.24);  
                    DzFrameSetText(UnitInfoName,GetUnitName(UISelectUnit)+"|n"+Util.GetUnitValue(GetUnitTypeId(UISelectUnit),"Description"));        
                    DzFrameShow(UnitInfoBarBackground,false);
                    BuffUI.BackgroundShow(false);
                    for(0<=i<4){
                        for(0<=s<3){ 
                            DzFrameSetPoint( DzFrameGetCommandBarButton(s,i), 0, UnitInfoLine, 2, 0.002+(0.04*i),0.01+(-0.04*s));
                            DzFrameSetSize( DzFrameGetCommandBarButton(s,i), 0.04, 0.04 );
                        }
                    }
                }
            } 
        } 
    }

    function Loop(){
        real exp,hp,mp;
        integer i;
        DzFrameSetText(MoneyText,"|cffFFFF00$" +I2S(GetPlayerState(Players.localplayer, PLAYER_STATE_RESOURCE_GOLD))+"|r"); 
        if(UISelectUnit!=null){ 
            if(IsUnitAliveBJ(UISelectUnit)==true&&IsUnitVisible(UISelectUnit,Players.localplayer)==true){ 
                if(UIType==1){ 
                    exp=(GetHeroXP(UISelectUnit)/LvExp[GetHeroLevel(UISelectUnit)])*100;
                    if(IsUnitEnemy(UISelectUnit,Players.localplayer)==false){
                        DzFrameSetText(UnitInfoName,"等级 "+I2S(GetHeroLevel(UISelectUnit))+"("+I2S(R2I(exp)) +"%)"+"|n攻击 "+I2S(R2I(GetUnitState(UISelectUnit, ConvertUnitState(0x14))))+"~"+I2S(R2I(GetUnitState(UISelectUnit, ConvertUnitState(0x15))))+"|n防御 "+I2S(R2I(GetUnitState(UISelectUnit, ConvertUnitState(0x20))))+"|n力量 "+I2S(GetHeroStr(UISelectUnit,true))+"|n敏捷 "+I2S(GetHeroAgi(UISelectUnit,true))+"|n智力 "+I2S(GetHeroInt(UISelectUnit,true))+"|n移速 "+R2S(GetUnitMoveSpeed(UISelectUnit))+"|n攻速 "+R2S(GetUnitState(UISelectUnit, ConvertUnitState(0x51))));        
                    }else{
                        DzFrameSetText(UnitInfoName,"等级 "+I2S(GetHeroLevel(UISelectUnit))+"|n攻击 "+I2S(R2I(GetUnitState(UISelectUnit, ConvertUnitState(0x14))))+"~"+I2S(R2I(GetUnitState(UISelectUnit, ConvertUnitState(0x15))))+"|n防御 "+I2S(R2I(GetUnitState(UISelectUnit, ConvertUnitState(0x20))))+"|n力量 "+I2S(GetHeroStr(UISelectUnit,true))+"|n敏捷 "+I2S(GetHeroAgi(UISelectUnit,true))+"|n智力 "+I2S(GetHeroInt(UISelectUnit,true))+"|n移速 "+R2S(GetUnitMoveSpeed(UISelectUnit))+"|n攻速 "+R2S(GetUnitState(UISelectUnit, ConvertUnitState(0x51))));        
                    }
                    hp=GetUnitLifePercent(UISelectUnit)/100;
                    mp=GetUnitManaPercent(UISelectUnit)/100;
                    DzFrameSetSize( UnitInfoHP,0.0001+(hp*0.2524),0.016 );
                    DzFrameSetSize( UnitInfoMP,0.0001+(mp*0.2524),0.016 );
                    DzFrameSetText(UnitInfoHPText,"|cffFF0000"+R2S(GetUnitState(UISelectUnit, UNIT_STATE_LIFE))+"|r"); 
                    DzFrameSetText(UnitInfoMPText,"|cff0000FF"+R2S(GetUnitState(UISelectUnit, UNIT_STATE_MANA))+"|r");     
                    for(0<=i<6){ 
                        if(UnitItemInSlot(UISelectUnit,i) == null){
                            DzFrameShow(BagItemBackground[i],true);
                        }else{
                            DzFrameShow(BagItemBackground[i],false);
                        }
                    }        
                    BuffUI.Flush(UISelectUnit);
                }else if(UIType==2){
                    DzFrameSetText(UnitInfoName,GetUnitName(UISelectUnit)+"|n攻击 "+I2S(R2I(GetUnitState(UISelectUnit, ConvertUnitState(0x14))))+"~"+I2S(R2I(GetUnitState(UISelectUnit, ConvertUnitState(0x15))))+"|n防御 "+I2S(R2I(GetUnitState(UISelectUnit, ConvertUnitState(0x20))))+"|n移速 "+R2S(GetUnitMoveSpeed(UISelectUnit))+"|n攻速 "+R2S(GetUnitState(UISelectUnit, ConvertUnitState(0x51))));        
                    hp=GetUnitLifePercent(UISelectUnit)/100;
                    mp=GetUnitManaPercent(UISelectUnit)/100;
                    DzFrameSetSize( UnitInfoHP,0.0001+(hp*0.2524),0.016 );
                    DzFrameSetSize( UnitInfoMP,0.0001+(mp*0.2524),0.016 );
                    DzFrameSetText(UnitInfoHPText,"|cffFF0000"+R2S(GetUnitState(UISelectUnit, UNIT_STATE_LIFE))+"|r"); 
                    DzFrameSetText(UnitInfoMPText,"|cff0000FF"+R2S(GetUnitState(UISelectUnit, UNIT_STATE_MANA))+"|r");     
                    BuffUI.Flush(UISelectUnit);
                    /*for(0<=i<6){ 
                        if(UnitItemInSlot(UISelectUnit,i) == null){
                            DzFrameShow(BagItemBackground[i],true);
                        }else{
                            DzFrameShow(BagItemBackground[i],false);
                        }
                    }非英雄单位暂时没有物品栏    
                    */                     
                }
            }else{ 
                BuffUI.BackgroundShow(false);
                DzFrameShow(UnitInfoBackground,false);
                UIType=0;
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
        UIType=0;  
        UISelectUnit=null;
        Reg();  
        TimerStart(NewTimer(),0.01,true,function Loop); 
        Events.On(Events.onPlayerSelectUnit,Select);
    }
}