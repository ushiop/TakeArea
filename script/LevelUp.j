library LevelUp requires Events{
    //英雄升级管理类，解锁技能条件、调整AI等级

    static integer MaxLv=1;

    function LvUp(EventArgs e){
        integer lv=GetUnitLevel(e.TriggerUnit);
        Players p=Players.Get(Units.Get(e.TriggerUnit)));
        if(lv>MaxLv){
            MaxLv=lv;
        }
        if(lv>=5&&p.lv5==null){
            p.lv5=Units.Spawn(p.player,'e003',0,0,0);
        }        
        if(lv>=10&&p.lv10==null){
            p.lv10=Units.Spawn(p.player,'e004',0,0,0);
        }        
        if(lv>=15&&p.lv15==null){
            p.lv15=Units.Spawn(p.player,'e005',0,0,0);
        }        
        if(lv>=20&&p.lv20==null){
            p.lv20=Units.Spawn(p.player,'e006',0,0,0);
        }        
        if(lv>=25&&p.lv25==null){
            p.lv25=Units.Spawn(p.player,'e007',0,0,0);
        }
    }

    function onInit(){
        Events.On(Events.onHeroLevelUp,LvUp);
    }
}