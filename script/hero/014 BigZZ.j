library BigZZ requires Groups{
    //英雄‘大佐助’的技能
    //SR
    struct BigZZ{

        static method Death(Units u,Units m){
            if(u.IsAbility('A04U')==true){
                Units.Kill(Units(u.Data()).unit);
            }
        }

        static method Spawn(Units u,Units m){
            if(u.IsAbility('A04U')==true){
                u.SetData(Units.MJ(u.player.player,'e00L','A04U',0,0,0,0,86400,1,1,"two",".mdl"));    
            }
        }

        static method Q(Spell e){
            Units u=Units.Get(e.Spell); 
            Data data=Data.create('A04U');
            Units.Kill(Units(u.Data()).unit);
            u.Pause(true);
            u.AnimeId(7);
            data.c[0]=u;
            data.c[1]=e;
            Timers.Start(0.3,data,function(Timers t){
                Data data=Data(t.Data());
                Units u=Units(data.c[0]);
                Units mj;
                Dash dash;
                if(u.Alive()==true){ 
                    Buffs.Add(u.unit,'A04W','B019',10,false);
                    mj=Units.MJ(u.player.player,'e008','A04U',0,u.X(),u.Y(),u.F(),11,u.modelsize,1,"stand",u.model);
                    data.c[2]=mj; 
                    u.Alpha(0);
                    u.AddAbility('A04V');
                    mj.AnimeId(5);
                    mj.AnimeSpeed(2);
                    dash=Dash.Start(u.unit,u.F(),1000,Dash.NORMAL,10,true,false);
                    dash.Obj=data;
                    dash.onMove=function(Dash dash){ 
                        Data data=Data(dash.Obj);
                        Units u=Units.Get(dash.Unit);
                        Units ts=Units(data.c[2]);
                        if(u.IsAbility('B019')==true){
                            dash.Angle=u.F();
                            dash.MaxDis+=100;
                        }else{
                            dash.Stop();
                        }
                        ts.Position(dash.X,dash.Y,false);
                        ts.SetF(dash.Angle,true);
                    };
                    dash.onEnd=function(Dash dash){
                        Data data=Data(dash.Obj);
                        Units u=Units(data.c[0]);
                        Units mj=Units(data.c[2]); 
                        if(u.IsAbility('B019')==true){
                            Buffs.Find(u.unit,'B019').Stop();
                        }
                        u.RemoveAbility('A04V');
                        u.Alpha(255);
                        u.SetData(Units.MJ(u.player.player,'e00L','A04U',0,0,0,0,86400,1,1,"two",".mdl")); 
                        Dash.Start(u.unit,u.F(),200,Dash.SUB,dash.Speed,true,false);
                        mj.Life(0.3);
                        mj.Alpha(0);
                        Spell(data.c[1]).Destroy();
                        data.Destroy();
                    };
                }else{
                    Spell(data.c[1]).Destroy();
                    data.Destroy();
                }  
                u.Pause(false);
                t.Destroy();
            });
        }


        //4 挥手雷电 5 雷电奔跑 6 雷电穿刺 7 搓雷电
        static method HERO_START(Spell e){
            Units u=Units.Get(e.Spell);
            if(u.IsAbility('A04U')==true){
                u.FlushAnimeId(4);
                e.Destroy();
            }
        }

        static method onInit(){ 
            Spell.On(Spell.onSpell,'A04U',BigZZ.Q); 
            Spell.On(Spell.onReady,'A04U',BigZZ.HERO_START); 
            Units.On(Units.onHeroSpawn,BigZZ.Spawn);
            Units.On(Units.onHeroDeath,BigZZ.Death);
        }
    }
}