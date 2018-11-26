library Players{
    //玩家类，包含了玩家信息，以及玩家相关事件的接口
    public struct Players{

        private static HandleTable ht;

        public{
            integer playerid;//玩家ID
            player player;//玩家自己
            integer teamid;//阵营ID
            integer kills;//杀敌数量
            integer deaths;//死亡数量
            Units hero;//目前的英雄
            string name;//玩家名字
            boolean isOnline;//是否在线
        }

        //为玩家创建对象实例
        public static method Set(player ps)->Players{
            Players p=Players.allocate();
            p.kills=0;
            p.deaths=0;
            p.player=ps; 
            p.name=GetPlayerName(ps);
            p.playerid=GetConvertedPlayerId(ps);
            p.teamid=GetPlayerTeam(ps);
            p.isOnline=true;
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