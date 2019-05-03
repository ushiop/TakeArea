library Zg requires Groups{
    //英雄‘眼镜·七夜’的技能
    //SR
    /*
        27 - Q前摇
        24 - Q动作
    */ 
    struct Zg{  

        static method Q(Spell e){
            Units u=Units.Get(e.Spell);
            Data data=Data.create('A05X');
            Dash dash;
            Units mj;
            real x=u.X(),y=u.Y(); 
            data.c[0]=u;
            data.c[1]=e;
            u.Pause(true);
            u.AnimeId(24);
            u.AddAbility('A05Y');  
            Util.Duang(x,y,0.5,100,100,-36,0.02,50);
            mj=Units.MJ(u.player.player,'e008','A05X',0,x,y,e.Angle,2,0.65,1.35,"stand","dust2.mdl");
            mj.DelayAnimeSpeed(0.7,0.5);  
            Dash.Start(mj.unit,e.Angle,150,Dash.SUB,30,true,false);
            mj=Units.MJ(u.player.player,'e008','A05X',0,x,y,0,0.5,1.5,1.5,"birth","az_lxj_blue_ex.mdl");
            mj.SetH(100); 
            data.c[2]=mj;
            mj=Units.MJ(u.player.player,'e008','A05X',0,x,y,e.Angle,0.6,1,1.25,"stand","dg7.mdl"); 
            mj.AnimeId(4);
            data.c[3]=mj; 
            dash=Dash.Start(u.unit,e.Angle,400,Dash.SUB,50,true,false);
            dash.Obj=data;
            dash.onMove=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units(data.c[0]);
                Units mj=Units(data.c[2]);
                mj.Position(dash.X,dash.Y,false);
                mj=Units(data.c[3]); 
                mj.Position(dash.X,dash.Y,false);
            };
            dash.onEnd=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units(data.c[0]);
                Timers.Start(0.2,u,function(Timers t){
                    Units u=Units(t.Data());
                    u.RemoveAbility('A05Y');
                    t.Destroy();
                });
                u.Pause(false);
                Spell(data.c[1]).Destroy(); 
                data.Destroy();
            };
        }

        static method HERO_START(Spell e){
            Units u=Units.Get(e.Spell);
            if(e.Id=='A05X'){
                u.FlushAnimeId(27);
            }
            e.Destroy();
        }

        static method onInit(){

            Spell.On(Spell.onReady,'A05X',Zg.HERO_START); 
            Spell.On(Spell.onSpell,'A05X',Zg.Q);
        }
    }
} 