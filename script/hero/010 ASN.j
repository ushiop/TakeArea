library ASN requires Groups{
    //英雄‘亚斯娜’的技能
    //R级
    //12 13 -戳  14-前摇
    struct ASN{

        static method Spawn(Units u,Units m){
            timer t;
            if(u.IsAbility('A02R')==true){
                t=NewTimer();
                SetTimerData(t,u);
                TimerStart(t,0.1,true,function(){
                    Units u=Units(GetTimerData(GetExpiredTimer()));
                    if(u.Alive()==false){
                        BJDebugMsg("结束");
                        ReleaseTimer(GetExpiredTimer());
                    }else{
                        if(u.MoveSpeed()>500){ 
                            if(u.Data()==0){ 
                                AddUnitAnimationProperties(u.unit, "fast", true );
                                u.SetData(1);
                            }
                        }else{
                            if(u.Data()==1){
                                u.SetData(0);
                                AddUnitAnimationProperties(u.unit, "fast", false );
                            }
                        }
                    }
                });
                t=null;
            }
        }

        static method Q(Spell e){
            Units u=Units.Get(e.Spell);
            Dash dash;
            Data data=Data.create('A02R');
            real x=u.X(),y=u.Y(),f=e.Angle;
            Units.MJ(u.player.player,'e008','A02R',0,x,y,f,1,1,1.25,"stand", "dust2_white.mdl");
            Util.Duang(x,y,0.4,100,100,-115,0.02,50);
            u.Pause(true);
            u.AnimeId(12);
            data.c[0]=u;
            data.c[1]=e;
            data.i[0]=0;
            dash=Dash.Start(u.unit,f,300,Dash.SUB,100,true,false);
            dash.Obj=data;
            dash.onMove=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units(data.c[0]); 
                real x=dash.X,y=dash.Y,dis=GetRandomReal(0,100),f=dash.Angle+180+GetRandomReal(45,-45);
                if((dash.NowDis>130&&dash.NowDis<145)||(dash.NowDis>160&&dash.NowDis<175)||(dash.NowDis>225&&dash.NowDis<230)){
                    Units.MJ(u.player.player,'e008','A02R',0,x+dis*CosBJ(f),y+dis*SinBJ(f),f,0.6,1,2,"birth", "az_lxj_blue.mdl").SetH(75);
                }
                if(dash.NowDis>250){
                    if(data.i[0]==0){  
                        data.i[0]=1;
                        Units.MJ(u.player.player,'e008','A02R',0,dash.X,dash.Y,GetRandomReal(0,360),1,3,5,"stand", "arcdirve02b1.mdl").SetH(75);
                    }
                }
            };
            dash.onEnd=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units(data.c[0]);
                u.Pause(false);
                Spell(data.c[1]).Destroy();
                data.Destroy();
            };
        }

        static method HERO_START(Spell e){
            Units u=Units.Get(e.Spell);
            u.FlushAnimeId(14);
            e.Destroy();
        }

        static method onInit(){ 
            Spell.On(Spell.onSpell,'A02R',ASN.Q);
            Spell.On(Spell.onReady,'A02R',ASN.HERO_START);
            Units.On(Units.onHeroSpawn,ASN.Spawn);
        }
    }
}