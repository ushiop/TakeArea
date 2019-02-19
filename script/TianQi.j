library TianQi {
    //天气相关

    weathereffect tq_sun;
    weathereffect tq_night;
    weathereffect tq_effect[];
    integer day=0;
    integer day_tq=0;
    integer day_first_start_time=0;
    integer day_second_start_time=0;

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
        EnableWeatherEffect(tq_effect[day_tq],false);//立即结束上一个天气效果
        if(GetRandomInt(0,1)==1){//50%的几率是没有天气效果的
            day_tq=GetRandomInt(0,2);//所有天气中随机一个
            day_first_start_time=GetRandomInt(7,14);//在白天的第一波天气变化，7点到18点随机时间开始，持续4小时
            day_second_start_time=GetRandomInt(15,20);//晚上的第二波变化，15~20点随机开始，持续4小时 
            //DisplayTextToForce(Teams.GetAllPlayers(), "[天气预告]今天的天气可能是"+I2S(day_tq)+",预计为"+I2S(day_first_start_time)+"/"+I2S(day_second_start_time));
        }else{
            day_tq=0;
            day_first_start_time=0;
            day_second_start_time=0;
        }
    }

    function TQ(Timers t){//计时器每一秒，游戏中过0.5个小时
        real gt=GetTimeOfDay();
        if(day_tq!=0){
            if((gt>=day_first_start_time&&gt<=(day_first_start_time+4))||(gt>=day_second_start_time&&gt<=(day_second_start_time+4))){
                EnableWeatherEffect(tq_effect[day_tq],true);    
                Teams.ActionsForAllPlayer(function(){//天气效果
                    Players p=Players.Get(GetEnumPlayer());
                    if(day_tq==0){//雨天
                        Buffs.Add(p.hero.unit,'A045','B00Z',1.1,false);
                    }
                    if(day_tq==1){//暴风雪
                        Buffs.Add(p.hero.unit,'A046','B010',1.1,false); 
                    }
                    if(day_tq==2){//大风
                        Buffs.Add(p.hero.unit,'A047','B011',1.1,false);
                        Dash.Start(p.hero.unit,200,200,Dash.NORMAL,3,true,false);
                    }
                });
            }else{
                EnableWeatherEffect(tq_effect[day_tq],false);
            }
        } 
    }

    //天气增伤
    function TQ_DMG_ADD(DamageArgs e){
        if(e.TriggerUnit.IsAbility('B00Z')==true){
            if(e.DamageType==Damage.Magic){
                e.Damage+=e.Damage*0.2;
            }
        }
        if(e.TriggerUnit.IsAbility('B010')==true){
            if(e.DamageType==Damage.Magic){
                e.Damage+=e.Damage*0.3;
            } 
        }
    }

    //天气减伤
    function TQ_DMG_SUB(DamageArgs e){
        if(e.TriggerUnit.IsAbility('B010')==true){
            if(e.DamageType==Damage.Attack||e.DamageType==Damage.Physics){
                e.Damage-=e.Damage*0.4;
            }
        }
    }
  
    function onInit(){ 
        tq_sun=AddWeatherEffect(gg_rct_main, 'LRaa');//日光
        tq_night=AddWeatherEffect(gg_rct_main, 'LRma');//月光

        tq_effect[0]=AddWeatherEffect(gg_rct_main, 'RAhr');//大雨
        tq_effect[1]=AddWeatherEffect(gg_rct_main, 'SNbs');//暴风雪
        tq_effect[2]=AddWeatherEffect(gg_rct_main, 'WOcw');//大风
        
        Events.On(Events.onNight,Night);
        Events.On(Events.onSun,Sun); 
        Damage.On(Damage.onItemDamage_AddDamage,TQ_DMG_ADD);
        Damage.On(Damage.onItemDamage_SubDamage,TQ_DMG_SUB);

        Timers.Start(1,0,TQ);
    }
}