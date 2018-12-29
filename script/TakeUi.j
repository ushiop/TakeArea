library TakeUi {
    //地盘争夺指示器
    public struct TakeUi{
        private static integer TakeBackground;//背景条
        private static integer TakeLeftText;//左侧文字 
        private static integer TakeMoveBar;//移动条条
        private static integer TakeRightText;//右侧文字

        //切换争夺指示器的状态，由未争夺切换为争夺,str为争夺者名字,str为空时切换为未争夺状态
        public static method ShowTakeBar(string str){
            if(str==""){
                DzFrameSetPoint( TakeRightText, 3, TakeBackground, 3, 0.26/*争夺状态为0.3*/ , -0.003); 
                DzFrameSetText( TakeRightText, "中央区域尚未被占领" );   
                DzFrameShow( TakeMoveBar, false );        
            }else{
                DzFrameSetPoint( TakeRightText, 3, TakeBackground, 3, 0.302/*争夺状态为0.3*/ , -0.003); 
                DzFrameSetText( TakeRightText, str+"占领中" );  
                DzFrameShow( TakeMoveBar, true );               
            }
        }

        //设置争夺指示器的进度百分比
        public static method SetTakeBarStep(real acc){
            DzFrameSetPoint( TakeMoveBar, 3, TakeBackground, 3, 0.3-((0.3-0.021)*acc),0.001);
            DzFrameSetSize( TakeMoveBar, 0.001+0.278*acc, 0.009 ) ;
        }

        static method onInit(){ 
            TakeBackground=DzCreateFrameByTagName("BACKDROP", "TakeBackground", DzGetGameUI(), "Panel", 0);
            DzFrameSetSize( TakeBackground, 0.349, 0.024 );
            DzFrameSetPoint( TakeBackground, 3, DzFrameGetUpperButtonBarButton(0), 3, -0.01, 0 );
            DzFrameSetTexture( TakeBackground, "UI_LeftUpperBackground.blp", 0 );
            TakeLeftText= DzCreateFrameByTagName("TEXT", "TakeLeftText", TakeBackground, "TextInfo", 0);
            DzFrameSetPoint( TakeLeftText, 3, TakeBackground, 3, 0.005, -0.003);
            DzFrameSetSize( TakeLeftText, 0.02, 0.02 );
            DzFrameSetText( TakeLeftText, "胜利" ) ;

            //右侧文字提示，未争夺状态的设置
            TakeRightText = DzCreateFrameByTagName("TEXT", "TakeRightText", TakeBackground, "TextInfo", 0);
            DzFrameSetPoint( TakeRightText, 3, TakeBackground, 3, 0.26/*争夺状态为0.3*/ , -0.003);
            DzFrameSetSize( TakeRightText, 0.08, 0.02 );
            DzFrameSetText( TakeRightText, "中央区域尚未被占领" );

            //争夺进度条
            //进度0%的位置: Point(0.3,0.001),Size(0.001,0.009)
            //进度100%的位置: Point(0.021,0.001),Size(0.279,0.009)
            TakeMoveBar = DzCreateFrameByTagName("BACKDROP", "TakeMoveBar", TakeBackground, "ShowInfo", 0);
            DzFrameSetPoint( TakeMoveBar, 3, TakeBackground, 3, 0.3,0.001);
            DzFrameSetSize( TakeMoveBar, 0.001, 0.009 ) ;
            DzFrameSetTexture( TakeMoveBar, "UI_LeftUpperMoveBar.blp", 0  );
            DzFrameShow( TakeMoveBar, false );
 
        }


    }
}