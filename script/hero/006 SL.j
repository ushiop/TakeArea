library SL requires Groups{
    //R级英雄‘神裂’的技能
    struct SL{

        //3
        static method Q(Spell e){
            Units u=Units.Get(e.Spell);
            Data data=Data.create('A017');
            timer t=NewTimer();
            u.Pause(true);
            u.AnimeSpeed(4);
            u.AnimeId(3);
            data.c[0]=u;
            data.c[1]=e;
            SetTimerData(t,data);
            TimerStart(t,0.1,false,function(){
                Data data=Data(GetTimerData(GetExpiredTimer()));
                Units u=Units(data.c[0]);
                Units mj;
                real x=u.X(),y=u.Y(),a; 
                real f=Util.XYEX(x,y,x+100*CosBJ(u.F()),y+100*SinBJ(u.F()));
                integer i;
                 
                if(u.Alive()==true){
                    Units.MJ(u.player.player,'e008','A017',0,x,y,u.F(),2,0.5,2.2, "stand","[spell]xinzhao_r2_3.mdl").SetH(100); 
                    GroupEnumUnitsInRange(tmp_group,x,y,300,function GroupIsAliveNotAloc);                   
                    while(FirstOfGroup(tmp_group)!=null){
                        mj=Units.Get(FirstOfGroup(tmp_group));
                        GroupRemoveUnit(tmp_group,mj.unit);
                        if(IsUnitEnemy(mj.unit,u.player.player)==true){  
                            if(Util.FAN(u.unit,mj.unit,f,80)==true){ 
                                u.Damage(mj.unit,Damage.Physics,'A017',u.Str(true)*5.0);  
                                DestroyEffect( AddSpecialEffectTarget("az-blood-hit.mdl", mj.unit, "chest") );
                                Dash.Start(mj.unit,Util.XY(u.unit,mj.unit),200.0,Dash.SUB,20,true,true);
                            }
                        }
                    }
                    GroupClear(tmp_group);    
                }
                u.AnimeSpeed(2);
                u.DelayReleaseAnimePause(0.4);
                Spell(data.c[1]).Destroy();
                data.Destroy();
                ReleaseTimer(GetExpiredTimer());
            });
            t=null;

        }


        static method onInit(){ 
            Spell.On(Spell.onSpell,'A017',SL.Q); 
        }
    }
}