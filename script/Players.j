library Players{
    //玩家类，包含了玩家信息，以及玩家相关事件的接口
    public struct Players{

        private static HandleTable ht;

        public{
            integer playerid;//玩家ID
            player player;//玩家自己
            integer teamid;//阵营ID
            integer Kills;//杀敌数量
            integer Deaths;//死亡数量
            unit hero;//目前的英雄
        }

        //为玩家创建对象实例
        public static method Set(player ps)->Players{
            Players p=Players.allocate();
            p.Kills=0;
            p.Deaths=0;
            p.player=ps;
            p.hero=null;
            p.playerid=GetConvertedPlayerId(ps);
            p.teamid=GetPlayerTeam(ps);
            ht[ps]=integer(p);
            return p;
        }

        public static method Get(player p)->Players{
            return Players(ht[p]);
        }


        static method onInit(){
            ht=HandleTable.create();
        }
    }
}