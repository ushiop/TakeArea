library TR requires Groups{
    //英雄‘桐人’的技能
    //R级

    struct TR{
        //发动刀光冲击的实际效果 2
        static method W2(unit ua,real f){
            Units u=Units.Get(ua);
            Dash dash;
            u.Pause(true);
            u.AnimeId(2);
            u.AnimeSpeed(2);
            
            dash=Dash.Start(u.unit,f,600,Dash.SUB,60,true,false);
            dash.Obj=u;
            dash.onEnd=function(Dash dash){
                Units u=Units(dash.Obj);
                u.Pause(false);
                u.AnimeSpeed(1);
            };
        }
        //命令触发刀光冲击
        static method W1(EventArgs e){ 
            Units u=Units.Get(e.TriggerUnit);
            real f;
            Buffs b; 
            if(u.IsAbility('B00E')==true){
                if(e.OrderId==851983||e.OrderId==851986||e.OrderId==851971){
                    if(e.OrderTargetUnit==null){ 
                        f=Util.XYEX(u.X(),u.Y(),e.OrderTargetX,e.OrderTargetY);
                    }else{
                        f=Util.XY(u.unit,e.OrderTargetUnit);
                    }
                    b=Buffs.Find(u.unit,'B00E'); 
                    if(b.NowTime<4.990){ 
                        TR.W2(u.unit,f);
                        b.Level-=1;
                        if(b.Level<=0){
                            b.Stop();
                        } 
                    }
                }  
            }
        }
        //获得刀光BUFF
        static method W(Spell e){ 
            Units u=Units.Get(e.Spell);
            timer t=NewTimer();
            Buffs b;
            u.Pause(true);
            u.Pause(false);
            //删除咆哮BUFF
            SetTimerData(t,u);
            TimerStart(t,0,false,function(){
                Units u=Units(GetTimerData(GetExpiredTimer())); 
                if(u.IsAbility('Broa')==true){
                    u.RemoveAbility('Broa');
                }
                ReleaseTimer(GetExpiredTimer());
            });
            t=null;
            b=Buffs.Add(u.unit,'A02E','B00E',5,false);
            b.Level=4;
            b.Obj=e;
            b.onEnd=function(Buffs b){
                Spell(b.Obj).Destroy();
            };
        }

        static method Q(Spell e){
            Units u=Units.Get(e.Spell);
            Data data=Data.create('A02C');
            Dash dash;
            u.Pause(true);
            u.Pause(false);
            data.c[0]=u;
            data.c[1]=e;
            data.i[0]=0;
            Units.MJ(u.player.player,'e008','A02C',0,u.X(),u.Y(),u.F(),1,1,1.5, "stand","dust2.mdl"); 
            dash=Dash.Start(u.unit,u.F(),400,Dash.SUB,30,true,false);
            dash.Obj=data;
            dash.onMove=function(Dash dash){ 
                Data data=Data(dash.Obj);
                Units u=Units(data.c[0]);
                unit k;
                if(data.i[0]==0){ 
                    k=GroupFind(u.unit,dash.X,dash.Y,110,true,false);
                    if(k!=null){
                        data.i[0]=1;
                        if((dash.MaxDis-dash.NowDis)>150){
                            dash.MaxDis-=150;
                        }
                        k=null;
                    }
                }
                if(dash.Speed>7){
                    Effect.To("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl",dash.X,dash.Y).Destroy();
                }
            };
            dash.onEnd=function(Dash dash){
                Data data=Data(dash.Obj);
                Spell(data.c[1]).Destroy();
                data.Destroy();
            };
        }


        static method onInit(){
            Spell.On(Spell.onSpell,'A02C',TR.Q);
            Spell.On(Spell.onSpell,'A02D',TR.W);
            Events.On(Events.onUnitOrderToUnit,TR.W1);
            Events.On(Events.onUnitOrderToLocation,TR.W1);
        }
    }
}