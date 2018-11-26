library KillUi requires Teams,Winner{
    //杀敌数、战绩榜UI
 

    public struct KillUi{
        private static integer KillBackground;//最小化状态的背景条
        private static integer KillBackgroundText;//文字
        private static integer KillBackgroundMaxLine;//最大化状态的背景
        private static integer KillBackgroundMaxBorder;//最大化状态的底部
        private static KillUi KillTeam[3];
        private static KillUi tmp;

        private{
            integer TeamIndex;//队伍序号 
            integer TeamNumbers;//队伍内人数
            Players TeamPlayer[3];
            integer TeamName;//队伍名字
            integer TeamNumberName[3];//玩家名字
            integer TeamNumberHeroName[3];//玩家英雄的名字
            integer TeamNumberHeroIcon[3];//玩家英雄头像
            integer TeamNumberInfo[3];//玩家数据
        }

        public static method create(integer tid)->KillUi{
            tmp=KillUi.allocate(); 
            tmp.TeamIndex=tid;
            ForForce(Teams.GetTeamForceByIndex(tid),function(){
                tmp.TeamPlayer[tmp.TeamNumbers]=Players.Get(GetEnumPlayer());
                tmp.TeamNumbers=tmp.TeamNumbers+1;
            });

            return tmp;
        }
 

        //刷新最小化状态的杀敌指示器
        public static method FlushKillData(){
            DzFrameSetText( KillBackgroundText, " 杀敌数   "+Teams.GetTeamNameByIndex(0)+":"+I2S(Teams.GetTeamKills(0))+"    "+Teams.GetTeamNameByIndex(1)+":"+I2S(Teams.GetTeamKills(1))+"    "+Teams.GetTeamNameByIndex(2)+":"+I2S(Teams.GetTeamKills(2))+"    胜利:"+I2S(Winner.GetMaxKills())+"    ↓F2↓" );
        }
            
        static method onInit(){ 
            KillBackground = DzCreateFrameByTagName("BACKDROP", "KillBackground", DzGetGameUI(), "Panel", 0);
            DzFrameSetSize( KillBackground, 0.254, 0.024 );
            DzFrameSetPoint( KillBackground, 3, DzFrameGetUpperButtonBarButton(0), 5, 0.458, 0.00 );
            DzFrameSetTexture( KillBackground, "UI_RightUpperBackground.blp", 0 );
            KillBackgroundText = DzCreateFrameByTagName("TEXT", "KillBackgroundText", KillBackground, "TextInfo", 0);
            DzFrameSetPoint( KillBackgroundText, 3, KillBackground, 3,0.001,-0.042);
            DzFrameSetSize( KillBackgroundText,0.3, 0.1 );
            TimerStart(NewTimer(),1,false,function(){
                FlushKillData();
                ReleaseTimer(GetExpiredTimer());
            });
            //-----最小化状态

            KillBackgroundMaxLine = DzCreateFrameByTagName("BACKDROP", "KillBackgroundMaxLine", KillBackground, "ShowInfo", 0);
            DzFrameSetSize( KillBackgroundMaxLine, 0.254, 0.2 );
            DzFrameSetPoint(KillBackgroundMaxLine, 1, KillBackground, 7, 0, 0.006);
            DzFrameSetTexture( KillBackgroundMaxLine, "UI_RightDownPanelLine.blp", 0 );
            
            KillBackgroundMaxBorder = DzCreateFrameByTagName("BACKDROP", "KillBackgroundMaxBorder", KillBackgroundMaxLine, "ShowInfo", 0);
            DzFrameSetSize( KillBackgroundMaxBorder, 0.254, 0.005 );
            DzFrameSetPoint(KillBackgroundMaxBorder, 1, KillBackgroundMaxLine, 7, 0, 0);
            DzFrameSetTexture( KillBackgroundMaxBorder, "UI_RightDownPanelBorder.blp", 0 ) ;
            //----最大化状态

            TimerStart(NewTimer(),1,false,function(){
                integer i;
                for(0<=i<3){ 
                    KillTeam[i]=-1;
                    if(Teams.GetTeamNumberByIndex(i)!=0){
                        KillTeam[i]=KillUi.create(i);
                        BJDebugMsg(I2S(i));
                    }
                }
            });
         
        }
    }
}