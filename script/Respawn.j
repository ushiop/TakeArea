library Respawn requires TimerUtils,Units,Players,Util{
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
         
         
        private static string RespawnType[3];//复活类型的提示
        private static real MaxRespawnTime=5.0;//复活时间

        public{
            real RespawnTime;
            integer RespawnSaveMoney=0;//保留复活的金钱 
            integer RespawnSelectLast=0;//上一个选择的类型
            integer RespawnSelect=0;//选择的复活类型;
            boolean RespawnShow;
        }


        //复活某个玩家
        private static method Spawn(player p){
            integer hid=0,money=0;
            Players ps=Players.Get(p);
            Respawn r=ps.respawn;
            ps.isdeath=false;  
            if(r.RespawnSelect==1){
                hid=ps.hero.uid; 
                money=r.RespawnSaveMoney;
            }else if(r.RespawnSelect==2){
                hid=ps.nextherotype;
                money=r.RespawnSaveMoney*2;
            }               
            HeroRares.AddRandomHero(ps.hero.unit); 
            if(r.RespawnSelect==0)
            {
                HeroRares.GetRandomHero(p.player,ps.randomhero);            
            }else{
                ps.hero=Units.Get(Units.Spawn(ps.player,hid,GetRectCenterX(Teams.GetTeamRect(ps.player)),GetRectCenterY(Teams.GetTeamRect(ps.player)),0));   
            }
            ps.AddMoney(-money);
            ps.hero.Lock(p);
            Respawn.Show(p,false);
            ps.respawn=0;
            r.deallocate(); 
        }

        //减少所有玩家的复活时间
        private static method Time(){
            ForForce(Teams.GetAllPlayers(),function(){
                Players p=Players.Get(GetEnumPlayer());
                Respawn r=Respawn(p.respawn);
                if(r.RespawnTime>0){
                    r.RespawnTime=r.RespawnTime-1;
                    Respawn.Flush(p.player);
                }else{
                    if(p.isdeath==true){ 
                        Respawn.Spawn(p.player);
                    }
                }
            });
        }

        static method Death(Units u,Units m){
            Respawn r=Respawn.allocate();
            if(u.player.teamid!=m.player.teamid&&m.unit!=null){
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
            r.RespawnTime=Respawn.MaxRespawnTime;
            r.RespawnSaveMoney= 000 + R2I((u.player.lifekill *300) *1.2);
            r.RespawnSelect=0;
            r.RespawnSelectLast=0;
            r.RespawnShow=false;
            u.player.isdeath=true; 
            u.player.lifekill=0;
            u.player.respawn=r;
            Respawn.Show(u.player.player,true);
        }

        //刷新死亡面板的信息
        private static method Flush(player ps){  
            Players p=Players.Get(ps); 
            Respawn r=p.respawn;
            if(ps==Players.localplayer){
                DzFrameSetText( DeathUIMainSave, "(|cff00ff00W|r)保留当前英雄复活(需要|cffffcc00$"+I2S(r.RespawnSaveMoney)+"|r)" );
            }
            if(p.Money()>=r.RespawnSaveMoney){ 
                if(ps==Players.localplayer){
                    DzFrameShow(DeathUIMainSaveLine,false);
                }
            }else{
                if(r.RespawnSelect==1) r.RespawnSelect=r.RespawnSelectLast;
                if(ps==Players.localplayer){

                    DzFrameShow(DeathUIMainSaveLine,true);
                }
            }
            if(p.nextherotype==0){ 
                if(ps==Players.localplayer){
                    DzFrameSetText( DeathUIMainBuy, "(|cff00ff00E|r)使用指定的英雄复活(未指定/$0)" )  ;
                    DzFrameShow(DeathUIMainBuyLine,true);
                }
                if(r.RespawnSelect==2) r.RespawnSelect=r.RespawnSelectLast;
            }else{ 
                if(ps==Players.localplayer){

                    DzFrameSetText( DeathUIMainBuy, "(|cff00ff00E|r)使用指定的英雄复活("+ Util.GetUnitValue(p.nextherotype,"Name") +"/$"+I2S(r.RespawnSaveMoney*2)+")" )  ;
                }
                if(p.Money()>=(r.RespawnSaveMoney*2)){
                    if(ps==Players.localplayer){
                        DzFrameShow(DeathUIMainBuyLine,false);       
                    } 
                }else{
                    if(r.RespawnSelect==2) r.RespawnSelect=r.RespawnSelectLast;
                }
            }
            if(r.RespawnSelectLast!=r.RespawnSelect){
                r.RespawnSelectLast=r.RespawnSelect;
            }
            if(ps==Players.localplayer){

                DzFrameSetText( DeathUIMainSelect, "已选择:|cff00ff00"+Respawn.RespawnType[r.RespawnSelect]+"|r" ) ; 
                DzFrameSetSize( DeathUIMainMoveBar,0.001+( 0.136 * (1-(r.RespawnTime/Respawn.MaxRespawnTime))), 0.006 );
            }
        }

        //向玩家显示或者隐藏死亡面板并显示相关数据
        private static method Show(player p,boolean show){
            Players ps=Players.Get(p);
            Respawn(ps.respawn).RespawnShow=show;
            if(Players.localplayer==p){   
                DzFrameShow(DeathUIMainTop,show); 
                Respawn.Flush(p);
            }
        }

        public static method Press(EventArgs e){
            Players p=Players.Get(e.TriggerKeyPlayer);
            Respawn r=p.respawn;
            if( p.isdeath==true){
                    if(e.TriggerKey=='Q'){ 
                        r.RespawnSelect=0;
                        Respawn.Flush(p.player);
                    }else if(e.TriggerKey=='W'){
                        r.RespawnSelect=1; 
                        Respawn.Flush(p.player);
                    }else if(e.TriggerKey=='E'){
                        r.RespawnSelect=2;
                        Respawn.Flush(p.player);
                    } 
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
            DzFrameSetSize( DeathUIMainSaveLine, 0.097, 0.002 );
            DzFrameSetPoint(DeathUIMainSaveLine, 1, DeathUIMainLine, 1, -0.036,-0.072);
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

            Events.On(Events.onPressKeyDown,Respawn.Press);

            TimerStart(NewTimer(),1,true,function Respawn.Time);
        }
    }
}