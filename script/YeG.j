library YeG requires Groups{

    rect rec[2];

    function onInit(){
        rec[0]=gg_rct_YeGuai_01;
        rec[1]=gg_rct_YeGuai_02;
        TimerStart(NewTimer(),20,true,function(){
            integer s;
            location d;
            GroupEnumUnitsInRange(tmp_group,0,0,9999999999,function()->boolean{ return GetUnitTypeId(GetFilterUnit()) == 'n001'; });
            s=200-GroupNumber(tmp_group);
            while(s>0){
                d=GetRandomLocInRect(rec[GetRandomInt(0,1)]);
                Units.Spawn(Player(PLAYER_NEUTRAL_AGGRESSIVE),'n001',GetLocationX(d),GetLocationY(d),0);
                RemoveLocation(d);
                d=null;    
                s-=1;
            }
            GroupClear(tmp_group);


        });
    }
}