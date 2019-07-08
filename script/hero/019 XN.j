library XN requires Groups{
    //英雄‘傻娜’的技能
    //SSR
    struct XN{ 

        static method Spawn(Units u,Units m){
            Data data;
            if(u.IsAbility('A072')==true){
                //是傻娜
                data=Data.create('A072');
                data.c[0]=u;
                data.g[0]=CreateGroup();//红莲单位组
                data.r[0]=5;//红莲刷新间隔
                data.r[1]=0;//旋转角度
                BJDebugMsg("来了");
                Timers.Start(0.01,data,function(Timers t){
                    Data data=Data(t.Data());
                    Units u=Units(data.c[0]);
                    Units mj;
                    real x=u.X(),y=u.Y(),f,a=0;
                    if(u.Alive()==true){
                        if(data.r[0]<=0){ 
                            data.r[0]=5; 
                            if(GroupNumber(data.g[0])<2){
                                mj=Units.MJ(u.player.player,'e008','A072',0,u.X(),u.Y(),0,86400,0.4,1, "stand","hero_emberspirit_n3s_f_ribbon_misslie.mdl");
                                mj.SetH(100);
                                mj.Alpha(0);
                                GroupAddUnit(data.g[0],mj.unit);
                            } 
                        }else{
                            if(u.IsTimeStop()==false){
                                data.r[0]-=0.01; 
                                data.r[1]+=3;
                                if(data.r[1]>360){
                                    data.r[1]=0;
                                }
                            }
                        }
                        GroupAddGroup(data.g[0],tmp_group);  
                        while(FirstOfGroup(tmp_group)!=null){
                            mj=Units.Get(FirstOfGroup(tmp_group));  
                            GroupRemoveUnit(tmp_group,mj.unit);  
                            mj.Position(x+150*CosBJ(a+data.r[1]),y+150*SinBJ(a+data.r[1]),false); 
                            mj.SetF(Util.XY(mj.unit,u.unit),true);
                            mj.SetH(u.H()+75);
                            a+=180;
                        }
                        GroupClear(tmp_group);
                    }else{
                        BJDebugMsg("没了");
                        GroupAddGroup(data.g[0],tmp_group);  
                        while(FirstOfGroup(tmp_group)!=null){
                            mj=Units.Get(FirstOfGroup(tmp_group));   
                            GroupRemoveUnit(tmp_group,mj.unit); 
                            mj.Anime("death");
                            mj.Life(2.5);
                        }
                        GroupClear(tmp_group);
                        DestroyGroup(data.g[0]);
                        data.g[0]=null;
                        data.Destroy();
                        t.Destroy();
                    }
                });
            }
        }

        static method Order(EventArgs e){
            Units u=Units.Get(e.TriggerUnit);
            BJDebugMsg(I2S(Order.RightClick)); 
        }

        static method onInit(){
            Units.On(Units.onHeroSpawn,XN.Spawn);
            
            Events.On(Events.onUnitOrderToUnit,XN.Order);
            Events.On(Events.onUnitOrderToLocation,XN.Order); 
        }
    }
}