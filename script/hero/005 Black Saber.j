library BlackSaber requires Groups{
    //英雄'黑-saber'的技能
    //SR级
    struct BlackSaber{

        static integer Q_HIT;

        //3 8
        static method Q(Spell e){
            Units u=Units.Get(e.Spell);
            Dash dash;
            u.Pause(true);
            u.AnimeId(3);
            u.AnimeSpeed(1); 
            dash=Dash.Start(u.unit,e.Angle,1000,Dash.ADD,70,true,false);
            dash.Obj=e;
            dash.onMove=function(Dash dash){
                Units u=Units.Get(dash.Unit);
                real x=u.X()+90*CosBJ(dash.Angle),y=u.Y()+90*SinBJ(dash.Angle);
                unit k=null;  
                Units mj;
                    if(dash.Speed<1.5){
                        DestroyEffect( AddSpecialEffect("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl", dash.X,dash.Y) );
                 
                    }
                    
                    k=GroupFind(u.unit,x,y,60,true,false);
                    if(k!=null){
                        dash.Stop();
                        u.Pause(true);
                        u.AnimeSpeed(2.5);
                        u.DelayReleaseAnimePause(0.2); 
                        u.Damage(k,Damage.Physics,'A00U',u.Str(true)*5.0);
                        Buffs.Skill(k,'A00W',1);     
                        
                        DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",k, "chest") );
                        if(dash.NowDis>100){
                            Dash.Start(u.unit,Util.XY(k,u.unit),200*(dash.NowDis/dash.MaxDis),Dash.SUB,20,true,false);
                        }
                        RunSoundOnUnit(BlackSaber.Q_HIT,k); 
                        mj=Units.MJ(u.player.player,'e008','A00U',0,x,y,0,1,2,1, "birth","Abilities\\Weapons\\Rifle\\RifleImpact.mdl");
                        mj.SetH(100);
                    }
                    k=null;
                 
            };
            dash.onEnd=function(Dash dash){
                Units u=Units.Get(dash.Unit);
                Spell(dash.Obj).Destroy(); 
                u.AnimeSpeed(1);
                u.Pause(false);
            };
        }


        static method onInit(){
            Spell.On(Spell.onSpell,'A00U',BlackSaber.Q);
            /*
            Spell.On(Spell.onReady,'A009',DazzleMaster.HERO_START);
            Spell.On(Spell.onStop,'A009',DazzleMaster.HERO_STOP);   
            */
            Q_HIT=DefineSound("resource\\sound_effect_hit_0.wav",1000, false, true);
        }
    }
}