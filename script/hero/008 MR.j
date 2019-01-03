library MR requires Groups{
    //英雄‘鸣人’的技能
    //R级
    struct MR{
  
        static method Spawn(Units u,Units m){
            timer t;
            Data data;
            if(u.IsAbility('A01X')==true){
                t=NewTimer();
                data=Data.create('A01X');
                data.c[0]=u;
                data.i[0]=0;
                data.r[0]=u.X();
                data.r[1]=u.Y();
                data.r[2]=0.0;
                SetTimerData(t,data);
                TimerStart(t,0.01,true,function(){
                    Data data=Data(GetTimerData(GetExpiredTimer()));
                    Units u=Units(data.c[0]);
                    if(u.Alive()==false){
                        BJDebugMsg("死了");
                        data.Destroy();
                        ReleaseTimer(GetExpiredTimer());
                    }else{
                        BJDebugMsg(R2S(Util.XY2EX(u.X(),u.Y(),data.r[0],data.r[1])));
                        data.r[0]=u.X();
                        data.r[1]=u.Y();
                    }
                });
                t=null;
            }
        }

        static method onInit(){ 
            //Units.On(Units.onHeroSpawn,MR.Spawn);
        }
    }
}