library Winner requires Units,TimerUtils,Teams,TakeUi {

    //两种胜利方式的管理类

    public struct Winner{

        private static boolean GameEnd=false;
        private static integer MaxKills=100;
        private static real OX,OY,NowTime=0,MaxTime=240; 
        private static integer Team=-1,WinTeam=-1; 
        private static real TimeTips=0;
        private static integer OnKill=0;

        public static method GetKillStart()->boolean{
            return OnKill!=0;
        }

        public static method SetMaxKills(integer max){
            MaxKills=max;
            KillUi.FlushKillData(-1);
        }

        public static method GetMaxKills()->integer{
                return MaxKills;
        }

        //英雄死亡, u 死亡单位, m 凶手单位
        public static method Death(Units u,Units m){ 
            if(Winner.GameEnd==false){ 
                if(u.player.hero!=null){ 
                    u.player.deaths=u.player.deaths+1;
                    KillUi.FlushPlayerData(u.player.player);
                }
                if(m.player.hero!=null){
                    if(u.player.teamid!=m.player.teamid){ 
                        if(OnKill==0){
                            DisplayTextToForce(Teams.GetAllPlayers(), "[提示]由于产生了一次有效击杀，[-K]指令从现在起就不能使用了" );
                        }
                        OnKill+=1;
                        m.player.kills=m.player.kills+1;
                        Teams.AddTeamKills(m.player.teamid,1);
                        KillUi.FlushKillData(m.player.teamid);
                    }
                    if(Teams.GetTeamKills(m.player.teamid)>=Winner.MaxKills){
                        Winner.GameEnd=true;
                        DisplayTextToForce(Teams.GetAllPlayers(),"游戏结束啦！！！！！！！！！！！ "+ Teams.GetTeamNameByIndex(m.player.teamid)+" 获得了最终的胜利！！");
                        Winner.ShowWin(m.player.teamid);
                    }
                }
            }
        }

        //设置指定阵营序号胜利
        private static method ShowWin(integer teamid){ 
            Server.Global_Set("game_count",I2S(S2I(Server.Global_Get("game_count"))+1));
            StartSound(gg_snd_Winner);
            Winner.WinTeam=teamid;
            PauseGame(true);
            Timers.Start(1,0,function(Timers t){
                Teams.ActionsForAllPlayer(function(){ 
                    Players p=Players.Get(GetEnumPlayer());
                    if(p.hero.Alive()==true){
                        p.hero.Pause(true);
                        SetUnitInvulnerable(p.hero.unit, true );
                    }
                });
            });
            //游戏结束时暂停游戏，而不是设置游戏胜利
            /*ForForce(Teams.GetAllPlayers(),function(){
                if(IsPlayerInForce(GetEnumPlayer(),Teams.GetTeamForceByIndex(Winner.WinTeam))==true){
                    CustomVictoryBJ( GetEnumPlayer(), true, false );
                }else{
                     CustomDefeatBJ( GetEnumPlayer(), "失败！" );
                }
            });*/
        }

        private static method ShowTip(){ 
            StopSound(gg_snd_ItemReceived, false, false);
            StartSound( gg_snd_ItemReceived );
            PingMinimap(Winner.OX,Winner.OY, 3.00 );
        }
        //夺旗判定 - 范围900码
        public  static method onLoop(){
            group g;
            Players tmp;
            unit tmp1;
            integer numbers,ntmp,team_numbers[];
            real rtmp;
            if(Winner.GameEnd==false){
                g=CreateGroup();
                GroupEnumUnitsInRange(g,Winner.OX,Winner.OY,900,function GroupIsHeroAliveNotAloc);
                numbers=CountUnitsInGroup(g);
                while(FirstOfGroup(g)!=null){
                    tmp1=FirstOfGroup(g);
                    tmp=Units.Get(tmp1).player;
                    team_numbers[tmp.teamid]=team_numbers[tmp.teamid]+1;
                    GroupRemoveUnit(g,tmp1);
                    tmp1=null; 
                }
                DestroyGroup(g);
                g=null;
                if(Winner.Team==-1){
                    if(numbers>0){
                        ntmp=-1;
                        if(team_numbers[0]==numbers){
                            ntmp=0;
                        }else if(team_numbers[1]==numbers)
                        {
                            ntmp=1;
                        }else if(team_numbers[2]==numbers)
                        {
                            ntmp=2;
                        } 
                        if(ntmp!=-1){
                            Winner.ShowTip();
                            Winner.NowTime=0.001;
                            Winner.Team=ntmp;
                            DisplayTextToForce(Teams.GetAllPlayers(), "中央球已被" +Teams.GetTeamNameByIndex(ntmp)+ "占领！" );
                            TakeUi.ShowTakeBar(Teams.GetTeamNameByIndex(ntmp));
                        }
                    } 
                }else{
                    if(Winner.NowTime>0){
                        if(Winner.NowTime>=Winner.MaxTime){
                            Winner.GameEnd=true;
                            DisplayTextToForce(Teams.GetAllPlayers(),"游戏结束啦！！！！！！！！！！！ "+ Teams.GetTeamNameByIndex(Winner.Team)+" 获得了最终的胜利！！");
                            Winner.ShowWin(Winner.Team);
                        }else{
                            if(numbers==0){
                                Winner.NowTime=Winner.NowTime-(0.02*Teams.GetTeamNumberByIndex(Winner.Team));
                            }else{ 
                                if(team_numbers[Winner.Team]==0){//中间区域内没有占领队伍的人员时
                                    rtmp=(-0.02*Teams.GetTeamNumberByIndex(Winner.Team))-(0.01*numbers);
                                }else{ 
                                    rtmp=(0.02*team_numbers[Winner.Team])-(0.01*(numbers-team_numbers[Winner.Team]));
                                }
                                Winner.NowTime=Winner.NowTime+rtmp;
                            }
                            TakeUi.SetTakeBarStep(Winner.NowTime/Winner.MaxTime);
                            if(Winner.NowTime>=160){//MaxTime-20 = 160
                                if(Winner.TimeTips<=0){
                                    StopSound( gg_snd_TimeTips, false ,false);
                                    StartSound( gg_snd_TimeTips );
                                    Winner.TimeTips=3;
                                }else{
                                    Winner.TimeTips-=0.01;
                                }
                            }
                        } 
                    }else{
                        DisplayTextToForce(Teams.GetAllPlayers(), Teams.GetTeamNameByIndex(Winner.Team)+" 已经丢失了中央球的控制权，中央球现在是中立状态！" );
                        Winner.NowTime=0;
                        Winner.Team=-1;
                        Winner.ShowTip();
                        TakeUi.ShowTakeBar("");
                    }
                }
            }else{
                ReleaseTimer(GetExpiredTimer());
            }
        }

        public static method start(){
            Winner.OX=GetUnitX(Origin_Ball);
            Winner.OY=GetUnitY(Origin_Ball);
            Units.On(Units.onHeroDeath,Winner.Death);
        }
    }
    function onInit(){

        TimerStart(NewTimer(),0.01,true,function Winner.onLoop);
    }



}