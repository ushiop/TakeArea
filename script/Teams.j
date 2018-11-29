library Teams  {

    //玩家阵营相关内容初始化类
    private {
        force AllPlayers,Team_Players[3];//玩家组
        rect Team_Rect[3];//阵营基地区域
        string Team_Name[3];//阵营名字
        integer Team_Kills[3];//阵营击杀总数
    }

    function onInit(){
        AllPlayers=GetPlayersMatching(function()->boolean{return GetPlayerSlotState(GetFilterPlayer()) == PLAYER_SLOT_STATE_PLAYING;});
        Team_Players[0]=GetPlayersMatching(function()->boolean{return IsPlayerInForce(GetFilterPlayer(),AllPlayers) == true && GetPlayerTeam(GetFilterPlayer()) == 0;});
        Team_Players[1]=GetPlayersMatching(function()->boolean{return IsPlayerInForce(GetFilterPlayer(),AllPlayers) == true && GetPlayerTeam(GetFilterPlayer()) == 1;});
        Team_Players[2]=GetPlayersMatching(function()->boolean{return IsPlayerInForce(GetFilterPlayer(),AllPlayers) == true && GetPlayerTeam(GetFilterPlayer()) == 2;});
        Team_Rect[0]=gg_rct_A_TEAM;
        Team_Rect[1]=gg_rct_B_TEAM;
        Team_Rect[2]=gg_rct_C_TEAM;
        Team_Name[0]="A组";
        Team_Name[1]="B组";
        Team_Name[2]="C组";
        SetPlayerName( Player(9),Team_Name[0] );
        SetPlayerName( Player(10),Team_Name[1] );
        SetPlayerName( Player(11),Team_Name[2] );
    }

    public struct Teams{

        //返回指定阵营序号的击杀数
        public static method GetTeamKills(integer p)->integer{
            return Team_Kills[p];
        }

        //增加指定阵营序号的击杀数
        public static method AddTeamKills(integer p,integer k){
            Team_Kills[p]=Team_Kills[p]+k;
        }

        //返回包含所有玩家的玩家组
        public static method GetAllPlayers()->force{
            return AllPlayers;
        }

        //对所有玩家组做指定动作
        public static method ActionsForAllPlayer(code f){
            ForForce(AllPlayers,f);
        }

        //对指定玩家组做动作
        public static method ActionsForTeamPlayer(integer tid,code f){
            ForForce(Team_Players[tid],f);
        }

        //将指定玩家从阵营玩家组与所有玩家组中移除
        public static method PlayerRemoveForce(player p){
            ForceRemovePlayer(AllPlayers,p);
            ForceRemovePlayer(Team_Players[GetPlayerTeam(p)],p); 
        }

        //返回玩家所在阵营的名字
        public static method GetTeamName(player p)->string{
            return Team_Name[GetPlayerTeam(p)];
        }

        //返回指定阵营阵营的名字
        public static method GetTeamNameByIndex(integer p)->string{
            return Team_Name[p];
        }

        //返回玩家所在阵营基地区域
        public static method GetTeamRect(player p)->rect{
            return Team_Rect[GetPlayerTeam(p)];
        }

        //返回玩家所在阵营的玩家组
        public static method GetTeamForce(player p)->force{
            return Team_Players[GetPlayerTeam(p)];
        }

        //返回指定阵营的玩家组
        public static method GetTeamForceByIndex(integer p)->force{
            return Team_Players[p];
        }

        //返回玩家所在阵营的玩家数量
        public static method GetTeamNumber(player p)->integer{
            return CountPlayersInForceBJ(GetTeamForce(p));
        }

        //返回指定玩家序号所在阵营的玩家数量
        public static method GetTeamNumberByIndex(integer p)->integer{
            return CountPlayersInForceBJ(GetTeamForceByIndex(p));
        }

    }
}