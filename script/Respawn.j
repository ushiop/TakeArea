library Respawn requires TimerUtils,Units,Players{
    //英雄复活、击杀奖励相关类

    struct Respawn{
        private static integer DeathUIMainTop;//死亡主面板顶部
        private static integer DeathUIMainLine;//死亡主面板本体
        private static integer DeathUIMainDown;//死亡主面板底部
        private static integer DeathUIMainTitle;//死亡面板标题
        private static integer DeathUIMainRoll;//抽取英雄的提示
        private static integer DeathUIMainSave;//保存英雄的提示
        private static integer DeathUIMainSaveLine;//保存英雄不可用的提示
        private static integer DeathUIMainBuy;//购买英雄的提示
        private static integer DeathUIMainBuyLine; //购买英雄不可用的提示
        private static integer DeathUIMainTip; //文字提示
        private static integer DeathUIMainSelect;//选择提示
        private static integer DeathUIMainMoveBar;//复活进度条
         
        private static real RespawnTime;//复活时间
        private static integer RespawnSaveMoney;//保留复活的金钱 
        private static integer RespawnSelect;//选择的复活类型;
        private static string RespawnType[3];//复活类型的提示

        //减少所有玩家的复活时间
        private static method Time(){
            ForForce(Teams.GetAllPlayers(),function(){
                Players p=Players.Get(GetEnumPlayer());
                if(p.respawntime>0){
                    p.respawntime=p.respawntime-1;
                    //Respawn.Flush();
                }else{
                    //Respawn.Spawn(p.player);
                }
            });
        }

        static method Death(Units u,Units m){
            if(u.player.teamid!=m.player.teamid){
                m.player.lifekill=m.player.lifekill+1;
                ForForce(Teams.GetTeamForce(m.player.player),function(){
                    AdjustPlayerStateBJ(300, GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD )  ;          
                });
                DisplayTimedTextToForce(Teams.GetAllPlayers(), 5.00,m.player.name+" 及友军因击杀 "+u.player.name+" 而获得了|cffffcc00$300|r");
                if(m.player.randomhero>0){
                    m.player.randomhero=m.player.randomhero-5.0;
                }
            } 
            if(u.player.randomhero<100){
                u.player.randomhero=u.player.randomhero+5.0;
            }
            if(Players.localplayer==u.player.player){
                Respawn.RespawnTime=5.0;
                Respawn.RespawnSaveMoney=300 + R2I((u.player.lifekill * 300) *1.2);
                Respawn.RespawnSelect=0;
            }
            u.player.respawntime=5.0;
            u.player.lifekill=0;
            Respawn.Show(u.player.player,true);
        }

        //刷新死亡面板的信息
        private static method Flush(){
            Players p=Players.Get(Players.localplayer);
            DzFrameSetText( DeathUIMainSave, "(|cff00ff00W|r)保留当前英雄复活(需要|cffffcc00$"+I2S(Respawn.RespawnSaveMoney)+"|r)" );
            if(p.Money()>=Respawn.RespawnSaveMoney){ 
                DzFrameShow(DeathUIMainSaveLine,false);
            }else{
                DzFrameShow(DeathUIMainSaveLine,true);
            }
            if(p.nextherotype==0){ 
                DzFrameSetText( DeathUIMainBuy, "(|cff00ff00E|r)使用指定的英雄复活(未指定/$0)" )  ;
                DzFrameShow(DeathUIMainBuyLine,true);
            }else{
                DzFrameSetText( DeathUIMainBuy, "(|cff00ff00E|r)使用指定的英雄复活("+EXExecuteScript("(require'jass.slk').unit[" + I2S(p.nextherotype) + "].Name")+"/$"+I2S(Respawn.RespawnSaveMoney*2)+")" )  ;
                if(p.Money()>=(Respawn.RespawnSaveMoney*2)){
                    DzFrameShow(DeathUIMainBuyLine,false);        
                }
            }
            DzFrameSetText( DeathUIMainSelect, "已选择:|cff00ff00"+Respawn.RespawnType[Respawn.RespawnSelect]+"|r" ) ; 
            DzFrameSetSize( DeathUIMainMoveBar, 0.137 * (1-(p.respawntime/Respawn.RespawnTime)), 0.006 );
             
        }

        //向玩家显示或者隐藏死亡面板并显示相关数据
        private static method Show(player p,boolean show){
            if(Players.localplayer==p){  
                //DzFrameShow(DeathUIMainTop,show); 
            }
        }

        static method onInit(){
            DeathUIMainTop = DzCreateFrameByTagName("BACKDROP", "DeathUIMainTop", DzGetGameUI(), "Panel", 0);
            DzFrameSetSize( DeathUIMainTop, 0.18, 0.003);
            DzFrameSetPoint( DeathUIMainTop, 4, DzGetGameUI(), 4, 0, 0.18 );
            DzFrameSetTexture( DeathUIMainTop, "UI_TopBorder.blp", 0 ) ;
 
            DeathUIMainLine = DzCreateFrameByTagName("BACKDROP", "DeathUIMainLine", DeathUIMainTop, "ShowInfo", 0);
            DzFrameSetSize( DeathUIMainLine, 0.18, 0.2 );
            DzFrameSetPoint(DeathUIMainLine, 1, DeathUIMainTop, 7, 0, 0);
            DzFrameSetTexture( DeathUIMainLine, "UI_RightDownPanelLine.blp", 0 );
    
            DeathUIMainDown = DzCreateFrameByTagName("BACKDROP", "DeathUIMainDown", DeathUIMainLine, "ShowInfo", 0);
            DzFrameSetSize( DeathUIMainDown, 0.18, 0.005 );
            DzFrameSetPoint(DeathUIMainDown, 1, DeathUIMainLine, 7, 0, 0);
            DzFrameSetTexture( DeathUIMainDown, "UI_RightDownPanelBorder.blp", 0 );

            DeathUIMainTitle = DzCreateFrameByTagName("TEXT", "DeathUIMainTitle", DeathUIMainLine, "TextInfo", 0);
            DzFrameSetSize( DeathUIMainTitle, 0.18, 0.12 );
            DzFrameSetPoint(DeathUIMainTitle, 1, DeathUIMainLine, 1, 0.045,-0.01) ;
            DzFrameSetText( DeathUIMainTitle, "↓请选择复活方式↓" );

            DeathUIMainRoll = DzCreateFrameByTagName("TEXT", "DeathUIMainRoll", DeathUIMainLine, "TextInfo", 0);
            DzFrameSetSize( DeathUIMainRoll, 0.18, 0.12 );
            DzFrameSetPoint(DeathUIMainRoll, 1, DeathUIMainLine, 1, 0.005,-0.04);
            DzFrameSetText( DeathUIMainRoll, "(|cff00ff00Q|r)随机抽取一个新的英雄复活" );

            DeathUIMainSave = DzCreateFrameByTagName("TEXT", "DeathUIMainSave", DeathUIMainLine, "TextInfo", 0);
            DzFrameSetSize( DeathUIMainSave, 0.18, 0.12 );
            DzFrameSetPoint(DeathUIMainSave, 1, DeathUIMainLine,1, 0.005,-0.067);
            DzFrameSetText( DeathUIMainSave, "(|cff00ff00W|r)保留当前英雄复活(需要|cffffcc00$0|r)" );

            DeathUIMainSaveLine= DzCreateFrameByTagName("BACKDROP", "DeathUIMainSaveLine", DeathUIMainLine, "ShowInfo", 0);
            DzFrameSetSize( DeathUIMainSaveLine, 0.10, 0.002 );
            DzFrameSetPoint(DeathUIMainSaveLine, 1, DeathUIMainLine, 1, -0.034,-0.072);
            DzFrameSetTexture( DeathUIMainSaveLine, "UI_WHITEBLOCK.blp", 0 );

            DeathUIMainBuy = DzCreateFrameByTagName("TEXT", "DeathUIMainBuy", DeathUIMainLine, "TextInfo", 0);
            DzFrameSetSize( DeathUIMainBuy, 0.18, 0.12 );
            DzFrameSetPoint(DeathUIMainBuy, 1, DeathUIMainLine, 1, 0.005,-0.097) ;
            DzFrameSetText( DeathUIMainBuy, "(|cff00ff00E|r)使用指定的英雄复活(未指定/$0)" )  ;

            DeathUIMainBuyLine= DzCreateFrameByTagName("BACKDROP", "DeathUIMainBuyLine", DeathUIMainLine, "ShowInfo", 0);
            DzFrameSetSize( DeathUIMainBuyLine, 0.087, 0.002 );
            DzFrameSetPoint(DeathUIMainBuyLine, 1, DeathUIMainLine, 1, -0.041,-0.103);
            DzFrameSetTexture( DeathUIMainBuyLine, "UI_WHITEBLOCK.blp", 0 );

            DeathUIMainTip = DzCreateFrameByTagName("TEXT", "DeathUIMainTip", DeathUIMainLine, "TextInfo", 0);
            DzFrameSetSize( DeathUIMainTip, 0.18, 0.12 );
            DzFrameSetPoint(DeathUIMainTip, 1, DeathUIMainLine, 1, 0.005,-0.122) ;
            DzFrameSetText( DeathUIMainTip, "按下绿色按键选择对应复活方式\n有白色线条挡住的不可选择\n如不选择,复活时将自动选择抽取复活" ) ;

            DeathUIMainSelect= DzCreateFrameByTagName("TEXT", "DeathUIMainDeath", DeathUIMainLine, "TextInfo", 0) ;
            DzFrameSetSize( DeathUIMainSelect, 0.18, 0.12 );
            DzFrameSetPoint(DeathUIMainSelect, 1, DeathUIMainLine, 1, 0.005,-0.182) ;
            DzFrameSetText( DeathUIMainSelect, "|cffff0000死亡|r" )    ;

            DeathUIMainSelect = DzCreateFrameByTagName("TEXT", "DeathUIMainSpawn", DeathUIMainLine, "TextInfo", 0); 
            DzFrameSetSize( DeathUIMainSelect, 0.18, 0.12 );
            DzFrameSetPoint(DeathUIMainSelect, 1, DeathUIMainLine, 1, 0.159,-0.182) ;
            DzFrameSetText( DeathUIMainSelect, "|cff00ff00复活|r" )  ;

            DeathUIMainSelect= DzCreateFrameByTagName("TEXT", "DeathUIMainSelect", DeathUIMainLine, "TextInfo", 0) ;
            DzFrameSetSize( DeathUIMainSelect, 0.18, 0.12 );
            DzFrameSetPoint(DeathUIMainSelect, 1, DeathUIMainLine, 1, 0.005,-0.167) ;
            DzFrameSetText( DeathUIMainSelect, "已选择:|cff00ff00抽取复活|r" ) ; 

            DeathUIMainMoveBar = DzCreateFrameByTagName("BACKDROP", "DeathUIMainMoveBar", DeathUIMainLine, "ShowInfo", 0);
            DzFrameSetSize( DeathUIMainMoveBar, 0.001, 0.006 );
            DzFrameSetPoint(DeathUIMainMoveBar, 0, DeathUIMainLine, 1, -0.068,-0.185);
            DzFrameSetTexture( DeathUIMainMoveBar, "UI_WHITEBLOCK.blp", 0 );

            RespawnType[0]="抽取复活";
            RespawnType[1]="保留复活";
            RespawnType[2]="指定复活";

            DzFrameShow(DeathUIMainTop,false);
            
            Units.On(Units.onHeroDeath,Respawn.Death);

            TimerStart(NewTimer(),1,true,function Respawn.Time);
        }
    }
}