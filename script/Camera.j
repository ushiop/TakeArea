library Camera requires TimerUtils,Init{
    //镜头设置初始化
    function onInit(){
        //移动平滑
        CameraSetSmoothingFactor( 998.00 );
        TimerStart(NewTimer(),0.01,true,function(){
            //锁定高度
            SetCameraField( CAMERA_FIELD_TARGET_DISTANCE, 2250.00, 0 );
            //游戏时间轴，方便计算时间;
            GameTime=GameTime+0.01;
        });
    }
}