library Players requires TimerUtils{
    //玩家类，包含了玩家信息，以及玩家相关事件的接口 
 

    public struct Players{

        private static HandleTable ht;
        public static player localplayer; 
        public{
            integer playerid;//玩家ID
            string playerids;//玩家ID（字符串)
            player player;//玩家自己
            integer teamid;//阵营ID
            integer kills;//杀敌数量
            integer deaths;//死亡数量
            Units hero;//目前的英雄
            string name;//玩家名字
            boolean isonline;//是否在线
            real randomhero;//抽奖的上限值
            integer lifekill;//这条命的杀敌数,英雄死亡后重置
            integer respawn;//复活信息
            integer nextherotype;//指定复活的英雄类型
            boolean isdeath;//是否死亡
            PlayerPress press;//玩家QWERDF的按键状态以及鼠标坐标（鼠标延迟很大)
            boolean isai;//玩家是否是电脑
            boolean pcmode;//玩家是否是电脑控制模式
            unit lv5;//技能等级5-25的解锁单位
            unit lv10;
            unit lv15;
            unit lv20;
            unit lv25;
            timer duangtimer=null;//震屏计时器
            real duanglv;//震屏幅度
            real duangtime;//震屏时间
            integer ailv;//AI等级

            //使玩家屏幕震荡，幅度可叠加，时间可叠加
            method Duang(real lv,real time){
                if(this.duangtimer==null){
                    this.duangtimer=NewTimer(); 
                    SetTimerData(this.duangtimer,this);
                    TimerStart(this.duangtimer,0.01,true,function(){
                        Players p=Players(GetTimerData(GetExpiredTimer()));
                        CameraSetEQNoiseForPlayer(p.player,p.duanglv);
                        p.duangtime-=0.01;
                        if(p.duangtime<=0){ 
                            p.duangtimer=null;
                            p.duanglv=0;
                            p.duangtime=0;
                            CameraClearNoiseForPlayer( p.player ); 
                            ReleaseTimer(GetExpiredTimer());
                        }
                    });
                }
                this.duanglv+=lv;
                this.duangtime+=time; 
            }

            //返回玩家金钱
            method Money()->integer{
                return GetPlayerState(this.player, PLAYER_STATE_RESOURCE_GOLD);
            }

            //增加玩家金钱
            method AddMoney(integer addm){
                AdjustPlayerStateBJ(addm,this.player, PLAYER_STATE_RESOURCE_GOLD );
            }

            //返回玩家是否处于英雄托管模式/AI托管模式
            method AI()->boolean{
                return this.isai==true||this.pcmode==true;
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
            p.playerids=I2S(GetPlayerId(ps));
            p.teamid=GetPlayerTeam(ps);
            p.isai=GetPlayerController(ps) == MAP_CONTROL_COMPUTER;
            p.pcmode=false;
            p.isonline=true;
            p.randomhero=100;
            p.lifekill=0;
            p.nextherotype=-1;
            p.isdeath=false;
            p.press=PlayerPress.create();
            p.ailv=0;
            if(p.isai==true){//如果是AI，则获取AI等级
                if(GetAIDifficulty(p.player) == AI_DIFFICULTY_NEWBIE){
                    p.ailv=1;
                }
                if(GetAIDifficulty(p.player) == AI_DIFFICULTY_NORMAL){
                    p.ailv=2;
                }
                if(GetAIDifficulty(p.player) == AI_DIFFICULTY_INSANE){
                    p.ailv=3;
                }
            }
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