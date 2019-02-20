library TeamTips {
    //英雄出生时添加队伍标志

    integer aid[];//技能标志的ID

    function Spawn(Units u,Units m){
        u.AddAbility(aid[u.player.teamid]);
    }

    function onInit(){
        aid[0]='A049';
        aid[1]='A04A';
        aid[2]='A04B';
        Units.On(Units.onHeroSpawn,Spawn);
    }
}