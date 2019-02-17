library TianQi {
    //天气相关

    weathereffect tq_sun;
    weathereffect tq_night;
    integer day=0;

    function Night(EventArgs e){  
        SetTimeOfDay(18.1);
        FogEnable( true );
        FogMaskEnable( true );
        EnableWeatherEffect(tq_night ,true);
        EnableWeatherEffect(tq_sun, false );
    }

    function Sun(EventArgs e){
        SetTimeOfDay(6.1);
        day+=1;
        DisplayTextToForce(Teams.GetAllPlayers(), "第"+I2S(day)+"天开始了~" );
        FogEnable( false );
        FogMaskEnable( false );
        EnableWeatherEffect(tq_night ,false);
        EnableWeatherEffect(tq_sun, true );
    }

    function onInit(){ 
        tq_sun=AddWeatherEffect(gg_rct_main, 'LRaa');
        tq_night=AddWeatherEffect(gg_rct_main, 'LRma');
        
        Events.On(Events.onNight,Night);
        Events.On(Events.onSun,Sun);
    }
}