library TianQi {
    //天气相关

    function onInit(){
        
        Events.On(Events.onNight,test);
        Events.On(Events.onSun,test1);
    }
}