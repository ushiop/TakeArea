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
            data.c[0]=u;
            data.c[1]=e;
            u.Pause(true);
            u.AnimeId(24);
            u.AddAbility('A05Y'); 
            mj=Units.MJ(u.player.player,'e008','A05X',0,u.X(),u.Y(),0,0.5,1.5,1.5,"birth","az_lxj_blue_ex.mdl");
            mj.SetH(100); 
            data.c[2]=mj;
            mj=Units.MJ(u.player.player,'e00M','A05X',0,u.X(),u.Y(),e.Angle,0.6,0.5,1,"stand","az_dg01.mdl"); 
            mj.SetH(150); 
            data.c[3]=mj;
            dash=Dash.Start(u.unit,e.Angle,400,Dash.SUB,50,true,false);
            dash.Obj=data;
            dash.onMove=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units(data.c[0]);
                Units mj=Units(data.c[2]);
                mj.Position(dash.X,dash.Y,false);
                mj=Units(data.c[3]);
                mj.Position(dash.X+50*CosBJ(dash.Angle-90),dash.Y+50*SinBJ(dash.Angle-90),false);
                mj.Position(mj.X()+50*CosBJ(dash.Angle),mj.Y()+50*SinBJ(dash.Angle),false);
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