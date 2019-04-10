library Shiki requires Groups{
    //英雄‘极死·七夜’的技能
    //SR
    /*  35 屈腿
        16 踢腿
        17 上翻 0.433秒
        19 踢腿
        20 空踢
        36 空踢（无前摇）*/
    struct Shiki{ 

        static method Q(Spell e){
            Units u=Units.Get(e.Spell);
            Dash dash;
            Data data=Data.create('A05A');
            data.c[0]=u;
            data.c[1]=e;
            u.Pause(true);
            IssueImmediateOrder(u.unit,"stop"); 
            u.SetF(e.Angle,true);
            u.AnimeId(16);
            Units.MJ(u.player.player,'e008','A05A',0,u.X(),u.Y(),e.Angle,1,1.15,1.25,"stand","dust2_white.mdl");
            dash=Dash.Start(u.unit,e.Angle,600,Dash.SUB,75,true,false);
            dash.Obj=data;
            dash.onMove=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units(data.c[0]);
                Units m;
                Units mj;
                unit k=null;
                real x=dash.X+70*CosBJ(dash.Angle),y=dash.Y+70*SinBJ(dash.Angle);
                if(dash.Speed>3){
                    k=GroupFind(u.unit,x,y,70,true,false);
                    if(k!=null){
                        dash.Stop(); 
                        m=Units.MJ(u.player.player,'e008','A05A',0,x,y,dash.Angle+180,2,1.5,1,"stand","chongfeng2.mdl");
                        Dash.Start(m.unit,dash.Angle,400,Dash.SUB,50,true,false);
                        m=Units.MJ(u.player.player,'e008','A05A',0,dash.X,dash.Y,dash.Angle,1,u.modelsize,1.5,"stand",u.model);
                        m.AnimeId(16);
                        m.DelayAlpha(255,0,0.5); 
                        m=Units.Get(k);
                        k=null;
                        Units.MJ(u.player.player,'e008','A05A',0,dash.X,dash.Y,dash.Angle,1,0.5,0.6,"stand","white-qiquan.mdl");
                        
                        GroupEnumUnitsInRange(tmp_group,x+100*CosBJ(dash.Angle),y+100*SinBJ(dash.Angle),225,function GroupIsAliveNotAloc);     
                        while(FirstOfGroup(tmp_group)!=null){
                            mj=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,mj.unit);
                            if(IsUnitEnemy(mj.unit,u.player.player)==true&&mj.unit!=m.unit){    
                                Dash.Start(mj.unit,dash.Angle,450,Dash.SUB,40,true,false); 
                                HitFlys.Add(mj.unit,15);
                            }
                        }
                        GroupClear(tmp_group);
                        u.Damage(m.unit,Damage.Physics,'A05A',u.Agi(true)*5); 
                        Buffs.Skill(m.unit,'A00F',1);
                        u.Pause(true);
                        u.AnimeId(17);
                        u.AnimeSpeed(0.75);
                        HitFlys.Add(m.unit,12);
                        Effect.ToUnit("hiteffect08purplea.mdl",m.unit,"chest").Destroy();
                        Effect.ToUnit("hiteffect08purplea.mdl",m.unit,"chest").Destroy();
                        data=Data.create('A05A');
                        data.c[0]=u;
                        data.c[1]=m;
                        Timers.Start(0.15,data,function(Timers t){
                            Data data=Data(t.Data());
                            Units u=Units(data.c[0]);
                            Units m=Units(data.c[1]);  
                            u.DelayReleaseAnimePause(0.3);
                            Buffs.Skill(m.unit,'A00F',1);
                            Dash.Start(m.unit,u.F(),100,Dash.SUB,10,true,false);
                            Dash.Start(u.unit,u.F()+180,100,Dash.SUB,10,true,false);
                        
                            HitFlys.Add(m.unit,25);
                            Effect.ToUnit("hiteffect08purplea.mdl",m.unit,"chest").Destroy();
                            Effect.ToUnit("hit-juhuang-lizi.mdl",m.unit,"chest").Destroy();
                            t.Destroy();
                            data.Destroy();
                        });
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
 
 
        static method Order(EventArgs e){
            Units u=Units.Get(e.TriggerUnit);
            real f; 
            if(u.IsAbility('A05A')==true){
                if(e.OrderTargetUnit==null){ 
                    f=Util.XYEX(u.X(),u.Y(),e.OrderTargetX,e.OrderTargetY);
                }else{
                    f=Util.XY(u.unit,e.OrderTargetUnit);
                } 
                u.SetF(f,true);
            } 
                  
        }

        static method HERO_START(Spell e){
            Units u=Units.Get(e.Spell);
            if(e.Id=='A05A'){
                u.FlushAnimeId(35);
                Dash.Start(u.unit,e.Angle+180,80,Dash.SUB,10,true,false);
            }
        }


        static method onInit(){  
            Spell.On(Spell.onReady,'A05A',Shiki.HERO_START); 
            Spell.On(Spell.onSpell,'A05A',Shiki.Q);
            Events.On(Events.onUnitOrderToUnit,Shiki.Order);
            Events.On(Events.onUnitOrderToLocation,Shiki.Order); 
        }
    }
}

         