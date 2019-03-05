library TeamTips {
    //英雄出生时添加队伍标志

    public integer TeamTips_Ability_Id[];//技能标志的ID

    function Spawn(Units u,Units m){
        u.RemoveAbility(TeamTips_Ability_Id[u.player.teamid]);
        u.AddAbility(TeamTips_Ability_Id[u.player.teamid]); 
    }

    function onInit(){
        TeamTips_Ability_Id[0]='A049';
        TeamTips_Ability_Id[1]='A04A';
        TeamTips_Ability_Id[2]='A04B';
        Units.On(Units.onHeroSpawn,Spawn);
        Units.On(Units.onHeroChangeModel,Spawn);
    }
} 