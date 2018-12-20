library KillUi requires Teams,Winner,BzAPI,Util{
    //杀敌数、战绩榜UI
 

    public struct KillUi{
        private static integer KillBackground;//最小化状态的背景条
        private static integer KillBackgroundText;//文字
        public static integer KillBackgroundMaxLine;//最大化状态的背景
        private static integer KillBackgroundMaxBorder;//最大化状态的底部
        public static real KillBackgroundMaxHeight=0;//最大化状态时的高度
        public static KillUi KillTeam[3];
        private static KillUi tmp; 

        private{
            integer TeamIndex;//队伍序号 
            integer TeamNumbers;//队伍内人数
            Players TeamPlayer[3];
            integer TeamName;//队伍名字
            integer TeamWin;//队伍胜利文字
            integer TeamMoveBar;//胜利进度条
            real TeamWinAcc=0;//胜利进度
            integer TeamNumberName[3];//玩家名字
            integer TeamNumberHeroName[3];//玩家英雄的名字
            integer TeamNumberHeroIcon[3];//玩家英雄头像
            integer TeamNumberHr[3];//名字分割
            integer TeamNumberInfo[3];//玩家数据
        }

        //刷新指定玩家的战绩榜数据，同时也会更新阵营数据
        public static method FlushPlayerData(player p){
            KillUi.FlushData(GetPlayerTeam(p));
        }

        //刷新某个阵营相关的战绩榜数据
        public static method FlushData(integer teamid){
            Players tp;
            KillUi this;
            integer x;
            this=KillTeam[teamid]; 
            this.TeamWinAcc=Teams.GetTeamKills(this.TeamIndex)/I2R(Winner.GetMaxKills());
            DzFrameSetSize( this.TeamMoveBar, 0.202 * this.TeamWinAcc, 0.01 );
            for(0<=x<this.TeamNumbers){
                tp=this.TeamPlayer[x];
                if(tp.isonline==false){
                    DzFrameSetTexture( this.TeamNumberHeroIcon[x],"ReplaceableTextures\\CommandButtons\\BTNCancel.blp",0);
                    DzFrameSetText( this.TeamNumberName[x],"[离线]"+DzFrameGetText(this.TeamNumberName[x]) );
                }else{
                    DzFrameSetTexture( this.TeamNumberHeroIcon[x], Util.GetUnitValue(tp.hero.uid ,"Art"),0);
                }
                DzFrameSetText(this.TeamNumberInfo[x],"击杀/死亡   "+I2S(tp.kills)+"/"+I2S(tp.deaths));
                DzFrameSetText(this.TeamNumberHeroName[x],tp.hero.name);
            }
        }

        public static method create(integer tid,integer index)->KillUi{
            integer i;
            tmp=KillUi.allocate(); 
            tmp.TeamIndex=tid;
            ForForce(Teams.GetTeamForceByIndex(tid),function(){
                tmp.TeamPlayer[tmp.TeamNumbers]=Players.Get(GetEnumPlayer());
                tmp.TeamNumbers=tmp.TeamNumbers+1;
            });
            KillBackgroundMaxHeight=KillBackgroundMaxHeight+0.007;
            tmp.TeamName = DzCreateFrameByTagName("TEXT", "TEAMNAME_TITLE_"+I2S(tid), KillBackgroundMaxLine, "TextInfo", 0);
            DzFrameSetSize( tmp.TeamName, 0.2, 0.1 );
            DzFrameSetPoint(tmp.TeamName, 0, KillBackgroundMaxLine,0, 0.01,-KillBackgroundMaxHeight);
            DzFrameSetText( tmp.TeamName,Teams.GetTeamNameByIndex(tid));
            tmp.TeamWin = DzCreateFrameByTagName("TEXT", "TEAMNAME_TITLE_"+I2S(tid)+"_WIN_", tmp.TeamName, "TextInfo", 0);
            DzFrameSetSize( tmp.TeamWin, 0.2, 0.1 );
            DzFrameSetPoint(tmp.TeamWin, 0, tmp.TeamName, 0, 0.215,0) ;
            DzFrameSetText( tmp.TeamWin, "胜利" );
            tmp.TeamMoveBar = DzCreateFrameByTagName("BACKDROP","TEAMNAME_TITLE_"+I2S(tid)+"_MOVEBAR_",  tmp.TeamName, "ShowInfo", 0);
            DzFrameSetSize( tmp.TeamMoveBar, 0.001, 0.01 );
            DzFrameSetPoint(tmp.TeamMoveBar, 0, tmp.TeamName, 0, 0.013,-0.001) ;
            DzFrameSetTexture( tmp.TeamMoveBar, "UI_RightMoveBar.blp", 0 );
            for(0<=i<tmp.TeamNumbers){
                KillBackgroundMaxHeight=KillBackgroundMaxHeight+0.037;
                tmp.TeamNumberHeroName[i]=DzCreateFrameByTagName("TEXT", "TEAMNAME_TITLE_"+I2S(tid)+"_HERONAME_"+I2S(i), tmp.TeamName, "TextInfo", 0);
                DzFrameSetSize( tmp.TeamNumberHeroName[i], 0.2, 0.1 );
                DzFrameSetPoint(tmp.TeamNumberHeroName[i], 0, tmp.TeamName,0,0.035,-0.019 + (I2R(i)*-0.035));
                DzFrameSetText( tmp.TeamNumberHeroName[i], tmp.TeamPlayer[i].hero.name );       
                tmp.TeamNumberHeroIcon[i] = DzCreateFrameByTagName("BACKDROP", "TEAMNAME_TITLE_"+I2S(tid)+"_HEROICON_"+I2S(i),tmp.TeamName, "ShowInfo", 0);
                DzFrameSetSize( tmp.TeamNumberHeroIcon[i], 0.025, 0.025 );
                DzFrameSetPoint(tmp.TeamNumberHeroIcon[i], 0, tmp.TeamName, 0, 0.007, -0.02+(I2R(i)*-0.036)); 
                DzFrameSetTexture( tmp.TeamNumberHeroIcon[i],  Util.GetUnitValue(tmp.TeamPlayer[i].hero.uid,"Art"), 0 );         
                tmp.TeamNumberHr[i]= DzCreateFrameByTagName("BACKDROP", "TEAMNAME_TITLE_"+I2S(tid)+"_HR_"+I2S(i),tmp.TeamName, "ShowInfo", 0);
                DzFrameSetSize( tmp.TeamNumberHr[i], 0.06, 0.001 );
                DzFrameSetPoint(tmp.TeamNumberHr[i], 0, tmp.TeamName, 0, 0.035,-0.032 + (I2R(i)*-0.035));
                DzFrameSetTexture( tmp.TeamNumberHr[i], "UI_WHITEBLOCK.blp", 0 ) ;
                tmp.TeamNumberName[i] = DzCreateFrameByTagName("TEXT","TEAMNAME_TITLE_"+I2S(tid)+"_PLAYERNAME_"+I2S(i), tmp.TeamName, "TextInfo", 0);
                DzFrameSetSize( tmp.TeamNumberName[i], 0.2, 0.1 );
                DzFrameSetPoint(tmp.TeamNumberName[i], 0, tmp.TeamName, 0, 0.036,-0.034 + (I2R(i)*-0.035)) ;
                DzFrameSetText( tmp.TeamNumberName[i],tmp.TeamPlayer[i].name );
                tmp.TeamNumberInfo[i] = DzCreateFrameByTagName("TEXT","TEAMNAME_TITLE_"+I2S(tid)+"_INFO_"+I2S(i), tmp.TeamName, "TextInfo", 0);
                DzFrameSetSize( tmp.TeamNumberInfo[i], 0.2, 0.1 );
                DzFrameSetPoint(tmp.TeamNumberInfo[i], 0, tmp.TeamName, 0, 0.123,-0.027 + (I2R(i)*-0.034)) ;
                DzFrameSetText( tmp.TeamNumberInfo[i], "击杀/死亡   0/0" );
            }
            KillBackgroundMaxHeight=KillBackgroundMaxHeight+0.01;
            return tmp;
        }
 

        //刷新最小化状态的杀敌指示器与战绩榜内的阵营数据,-1为初始化时使用
        public static method FlushKillData(integer tid){
            DzFrameSetText( KillBackgroundText, " 杀敌数   "+Teams.GetTeamNameByIndex(0)+":"+I2S(Teams.GetTeamKills(0))+"    "+Teams.GetTeamNameByIndex(1)+":"+I2S(Teams.GetTeamKills(1))+"    "+Teams.GetTeamNameByIndex(2)+":"+I2S(Teams.GetTeamKills(2))+"    胜利:"+I2S(Winner.GetMaxKills())+"    ↓F2↓" );
            if(tid!=-1){ 
                FlushData(tid);
            }
        }

        static method Show(player p,string e){
            if(e=="F2"){  
                    DzFrameShow(KillBackgroundMaxLine,true);
            } 
        }

        
        static method Hide(player p,string e){
            if(e=="F2"){  
                    DzFrameShow(KillBackgroundMaxLine,false);
            } 
        }
            
        static method onInit(){ 
            KillBackground = DzCreateFrameByTagName("BACKDROP", "KillBackground", DzGetGameUI(), "Panel", 0);
            DzFrameSetSize( KillBackground, 0.254, 0.024 );
            DzFrameSetPoint( KillBackground, 3, DzFrameGetUpperButtonBarButton(0), 5, 0.458, 0.00 );
            DzFrameSetTexture( KillBackground, "UI_RightUpperBackground.blp", 0 );
            KillBackgroundText = DzCreateFrameByTagName("TEXT", "KillBackgroundText", KillBackground, "TextInfo", 0);
            DzFrameSetPoint( KillBackgroundText, 3, KillBackground, 3,0.001,-0.004);
            DzFrameSetSize( KillBackgroundText,0.3, 0.021 );


            KillBackgroundMaxLine = DzCreateFrameByTagName("BACKDROP", "KillBackgroundMaxLine", KillBackground, "ShowInfo", 0);
            DzFrameSetSize( KillBackgroundMaxLine, 0.254, 0.37 );
            DzFrameSetPoint(KillBackgroundMaxLine, 1, KillBackground, 7, 0, 0.006);
            DzFrameSetTexture( KillBackgroundMaxLine, "UI_RightDownPanelLine.blp", 0 );
            
            KillBackgroundMaxBorder = DzCreateFrameByTagName("BACKDROP", "KillBackgroundMaxBorder", KillBackgroundMaxLine, "ShowInfo", 0);
            DzFrameSetSize( KillBackgroundMaxBorder, 0.254, 0.005 );
            DzFrameSetPoint(KillBackgroundMaxBorder, 1, KillBackgroundMaxLine, 7, 0, 0);
            DzFrameSetTexture( KillBackgroundMaxBorder, "UI_RightDownPanelBorder.blp", 0 ) ;
            //----最大化状态

            DzFrameShow(KillBackgroundMaxLine,false); 
            Press.OnSnyc(Press.onSnycPressKeyDown,KillUi.Show);
            Press.OnSnyc(Press.onSnycPressKeyUp,KillUi.Hide);
        }
    }

    function onInit(){
                    TimerStart(NewTimer(),0.05,false,function(){
                KillUi.FlushKillData(-1);
                ReleaseTimer(GetExpiredTimer());
            });
            //-----最小化状态
            
            TimerStart(NewTimer(),0.06,false,function(){
                integer i,index=0;
                for(0<=i<3){ 
                    KillUi.KillTeam[i]=-1;
                    if(Teams.GetTeamNumberByIndex(i)!=0){
                        KillUi.KillTeam[i]=KillUi.create(i,index);  
                        index=index+1;
                    }
                }
                ReleaseTimer(GetExpiredTimer()); 
                DzFrameSetSize(KillUi.KillBackgroundMaxLine,0.254,KillUi.KillBackgroundMaxHeight);  
                
            });
    }
}