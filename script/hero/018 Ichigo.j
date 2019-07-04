library Ichigo requires Groups{
    //英雄‘一护’的技能
    //SR
    struct Ichigo{ 
        
        static method Q(unit ua,real dis,real f){
            Units u=Units.Get(ua);
            real maxdis=600+(u.Agi(true)*10);
            real mp=0,speed=0;
            Dash dash;
            Units mj;
            Data data;
            dis=dis-50;
            if(dis>maxdis){
                dis=maxdis;
            }
            mp=dis*0.08;
            if(mp<50){
                mp=50;
            }
            if(u.MP()>=mp){//发动成功
                if(dis>1000){
                    if(dis>2000){
                        speed=dis/4;
                    }else{ 
                        speed=dis/2;
                    }
                }else{
                    speed=dis;
                }
                u.SetMP(u.MP()-mp);
                Units.MJ(u.player.player,'e008','A06T',0,u.X(),u.Y(),0,3,1,1, "stand","blackblink.mdl");
                Units.MJ(u.player.player,'e008','A06T',0,u.X(),u.Y(),GetRandomReal(0,360),3,0.5,1.5, "stand","white-qiquan_ex.mdl");
                u.Alpha(0);
                if(dis>1000){
                    mj=Units.MJ(u.player.player,'e008','A06T',0,u.X(),u.Y(),0,1,4,3, "stand","Abilities\\Weapons\\AvengerMissile\\AvengerMissile.mdl");
                    mj.SetH(100);
                    data=Data.create('A06T');
                    data.c[0]=mj;
                    data.r[0]=u.X()+dis*CosBJ(f);
                    data.r[1]=u.Y()+dis*SinBJ(f);
                    Timers.Start(0.3,data,function(Timers t){
                        Data data=Data(t.Data());
                        Units mj=Units(data.c[0]);
                        mj.Position(data.r[0],data.r[1],false); 
                        mj.Size(0);
                        data.Destroy();
                        t.Destroy();
                    });
                }  
                u.SetF(f,true);
                dash=Dash.Start(u.unit,f,dis,Dash.NORMAL,speed,true,false);
                dash.onMove=function(Dash dash){
                    Units u=Units.Get(dash.Unit);
                    real dis=GetRandomReal(0,200);
                    real f=GetRandomReal(0,360);

                    if(u.IsAbility('BPSE')==true){
                        dash.Stop();
                    }else{
                        Units.MJ(u.player.player,'e008','A06T',0,dash.X+dis*CosBJ(f),dash.Y+dis*SinBJ(f),0,3,1,1, "stand","blackblink.mdl");
                    }
                };
                dash.onEnd=function(Dash dash){
                    Units u=Units.Get(dash.Unit);
                    u.DelayAlpha(0,255,0.5);
                };
            }else{
                TextForPlayer(u.player.player,u.unit,"瞬步所需魔法值不足!",0.8,14,90);
            }
        }

        static method Q_Order(EventArgs e){
            Units u=Units.Get(e.TriggerUnit);
            real f,dis;
            if(u.IsAbility('A06T')==true&&e.OrderId==851971&&u.IsTimeStop()==false&&u.IsAbility('BPSE')==false&&u.IsPause()==false&&u.player.press.Q==true){
                if(e.OrderTargetUnit==null){ 
                    f=Util.XYEX(u.X(),u.Y(),e.OrderTargetX,e.OrderTargetY);
                    dis=Util.XY2EX(u.X(),u.Y(),e.OrderTargetX,e.OrderTargetY);
                }else{
                    f=Util.XY(u.unit,e.OrderTargetUnit);
                    dis=Util.XY2(u.unit,e.OrderTargetUnit);
                }
                Ichigo.Q(u.unit,dis,f);
            }
        }

        static method onInit(){ 
             
            Events.On(Events.onUnitOrderToUnit,Ichigo.Q_Order);
            Events.On(Events.onUnitOrderToLocation,Ichigo.Q_Order); 
        }
    }
} 