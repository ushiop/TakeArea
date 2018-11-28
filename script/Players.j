library Players{
    //玩家类，包含了玩家信息，以及玩家相关事件的接口
    public struct Players{

        private static HandleTable ht;
        public static player localplayer;

        public{
            integer playerid;//玩家ID
            player player;//玩家自己
            integer teamid;//阵营ID
            integer kills;//杀敌数量
            integer deaths;//死亡数量
            Units hero;//目前的英雄
            string name;//玩家名字
            boolean isonline;//是否在线
            real randomhero;//抽奖的上限值
            integer lifekill;//这条命的杀敌数,英雄死亡后重置
            Respawn respawn;//复活信息
            integer nextherotype;//指定复活的英雄类型
            boolean isdeath;//是否死亡

            //返回玩家金钱
            method Money()->integer{
                return GetPlayerState(this.player, PLAYER_STATE_RESOURCE_GOLD);
            }

            //增加玩家金钱
            method AddMoney(integer addm){
                AdjustPlayerStateBJ(addm,this.player, PLAYER_STATE_RESOURCE_GOLD );
            }
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
            p.isonline=true;
            p.randomhero=0;
            p.lifekill=0;
            p.nextherotype=0;
            p.isdeath=false;
            ht[ps]=p;
            return p;
        }

        public static method Get(player p)->Players{
            return ht[p];
        }


        static method onInit(){
            ht=HandleTable.create();
            localplayer=GetLocalPlayer();
        }
    }
}