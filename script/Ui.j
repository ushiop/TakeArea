library Ui {
    struct Ui{
        private static integer TakeBackground;//背景条
        private static integer TakeLeftText;//左侧文字 
        private static integer TakeMoveBar;//移动条条
        private static integer TakeRightText;//右侧文字

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
            DzFrameSetText( TakeRightText, "中央区域尚未被争夺" );

            //争夺进度条
            //进度0%的位置: Point(0.3,0.001),Size(0.001,0.009)
            //进度100%的位置: Point(0.021,0.001),Size(0.279,0.009)
            TakeMoveBar = DzCreateFrameByTagName("BACKDROP", "TakeMoveBar", TakeBackground, "ShowInfo", 0);
            DzFrameSetPoint( TakeMoveBar, 3, TakeBackground, 3, 0.3,0.001);
            DzFrameSetSize( TakeMoveBar, 0.001, 0.009 ) ;
            DzFrameSetTexture( TakeMoveBar, "UI_LeftUpperMoveBar.blp", 0  );
 
        }


    }
}