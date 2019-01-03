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
                    real speed;
                    if(u.Alive()==false){
                        BJDebugMsg("死了");
                        data.Destroy();
                        ReleaseTimer(GetExpiredTimer());
                    }else{
                        speed=Util.XY2EX(u.X(),u.Y(),data.r[0],data.r[1]);
                        if(speed>5){
                            data.r[2]+=0.01;
                        }else{ 
                            data.r[2]=0;
                            if(data.i[0]==1){
                                data.i[0]=0; 
                                Dash.Start(u.unit,u.F(),300,Dash.SUB,10,true,false).onMove=function(Dash dash){
                                    dash.Angle=GetUnitFacing(dash.Unit);
                                };
                            }
                        }
                        if(data.r[2]>=1.0){
                            data.i[0]=1;
                        } 
                        data.r[0]=u.X();
                        data.r[1]=u.Y();
                    }
                });
                t=null;
            }
        }

        static method Damage(DamageArgs e){
            if(e.DamageType==Damage.Magic){
                //九尾之力 魔法减伤15%
                e.Damage=e.Damage-(e.Damage*0.15);
            }
        }

        static method onInit(){ 
            Units.On(Units.onHeroSpawn,MR.Spawn);
            Damage.On(Damage.onUnitDamage,MR.Damage);
        }
    }
}