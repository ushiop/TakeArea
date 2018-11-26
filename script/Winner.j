library Winner requires Units,TimerUtils,Teams,Ui {

    //两种胜利方式的管理类

    public struct Winner{

        private static boolean GameEnd=false;
        private static integer MaxKills=100;
        private static real OX,OY,NowTime=0,MaxTime=30; 
        private static integer Team=-1,WinTeam=-1; 

        //英雄死亡时调用该函数,计算胜利条件
        public static method Death(unit u){
            Units ud=Units.Get(u);
            integer p=ud.playerid;
            Teams.AddTeamKills(p,1);
            if(Teams.GetTeamKills(p)>=Winner.MaxKills){
                Winner.GameEnd=true;
                DisplayTimedTextToForce(Teams.GetAllPlayers(), 5.00,"游戏结束啦！！！！！！！！！！！ "+ Teams.GetTeamNameByIndex(p)+" 获得了最终的胜利！！");
                Winner.ShowWin(p);
            }
        }

        //设置指定阵营序号胜利
        private static method ShowWin(integer teamid){
            Winner.WinTeam=teamid;
            ForForce(Teams.GetAllPlayers(),function(){
                if(IsPlayerInForce(GetEnumPlayer(),Teams.GetTeamForceByIndex(Winner.WinTeam))==true){
                    CustomVictoryBJ( GetEnumPlayer(), true, false );
                }else{
                     CustomDefeatBJ( GetEnumPlayer(), "失败！" );
                }
            });
        }

        private static method ShowTip(){
            StopSoundBJ( gg_snd_ItemReceived, false );
            PlaySoundBJ( gg_snd_ItemReceived );
            PingMinimap(Winner.OX,Winner.OY, 3.00 );
        }
        //夺旗判定 - 范围900码
        private static method onLoop(){
            group g;
            unit tmp;
            integer numbers,ntmp,team_numbers[];
            real rtmp;
            if(Winner.GameEnd==false){
                g=CreateGroup();
                GroupEnumUnitsInRange(g,Winner.OX,Winner.OY,900,function()->boolean{ return IsUnitType(GetFilterUnit(), UNIT_TYPE_HERO) == true; });
                numbers=CountUnitsInGroup(g);
                while(FirstOfGroup(g)!=null){
                    tmp=FirstOfGroup(g);
                    team_numbers[GetPlayerTeam(GetOwningPlayer(tmp))]=team_numbers[GetPlayerTeam(GetOwningPlayer(tmp))]+1;
                    GroupRemoveUnit(g,tmp);
                    tmp=null;
                }
                DestroyGroup(g);
                g=null;
                if(Winner.Team==-1){
                    ntmp=-1;
                    if(team_numbers[0]!=0&&team_numbers[1]==0&&team_numbers[2]==0){
                        ntmp=0;
                    }else if(team_numbers[1]!=0&&team_numbers[0]==0&&team_numbers[2]==0)
                    {
                        ntmp=1;
                    }else if(team_numbers[2]!=0&&team_numbers[1]==0&&team_numbers[0]==0)
                    {
                        ntmp=2;
                    } 
                    if(ntmp!=-1){
                        Winner.ShowTip();
                        Winner.Team=ntmp;
                        DisplayTimedTextToForce(Teams.GetAllPlayers(), 5.00, "中央球已被" +Teams.GetTeamNameByIndex(ntmp)+ "占领！" );
                        TakeUi.ShowTakeBar(Teams.GetTeamNameByIndex(ntmp));
                    }
                }else{
                    if(numbers==0){
                        if(Winner.NowTime>0){
                            Winner.NowTime=Winner.NowTime-(0.02*Teams.GetTeamNumberByIndex(Winner.Team));
                        }else{
                            DisplayTimedTextToForce(Teams.GetAllPlayers(), 5.00, Teams.GetTeamNameByIndex(Winner.Team)+" 已经丢失了中央球的控制权，中央球现在是中立状态！" );
                            Winner.NowTime=0;
                            Winner.Team=-1;
                            Winner.ShowTip();
                            TakeUi.ShowTakeBar("");
                        }
                    }else{
                        if(Winner.NowTime>=Winner.MaxTime){
                            Winner.GameEnd=true;
                            PlaySoundBJ( gg_snd_Winner );
                            DisplayTimedTextToForce(Teams.GetAllPlayers(), 5.00,"游戏结束啦！！！！！！！！！！！ "+ Teams.GetTeamNameByIndex(Winner.Team)+" 获得了最终的胜利！！");
                            Winner.ShowWin(Winner.Team);

                        }else{
                            rtmp=(0.02*team_numbers[Winner.Team])-(0.01*(numbers-team_numbers[Winner.Team]));
                            Winner.NowTime=Winner.NowTime+rtmp;
                            
                        }
                    }
                    TakeUi.SetTakeBarStep(Winner.NowTime/Winner.MaxTime);
                }
            }else{
                ReleaseTimer(GetExpiredTimer());
            }
        }

        public static method start(){
            Winner.OX=GetUnitX(Origin_Ball);
            Winner.OY=GetUnitY(Origin_Ball);
            TimerStart(NewTimer(),0.01,true,function Winner.onLoop);
        }
    }
    



}