library Yuuki requires Groups{
    //英雄‘优纪’的技能
    //R级
    struct Yuuki{

        static method Damage(DamageArgs e){
            if(e.TriggerUnit.IsAbility('A04J')==true){ 
                if(e.DamageType==Damage.Attack||e.DamageType==Damage.Physics){
                    e.Damage-=e.Damage*0.85;
                }
            }

        }

        static method Q1(player ps,string k){
            Players p=Players.Get(ps);
            Buffs b;
            Data data;
            Units mj;
            if(k=="Q"){ 
                if(p.hero.IsAbility('B013')==true&&p.hero.IsAbility('A04J')==false){
                    b=Buffs.Find(p.hero.unit,'B013'); 
                    if(b.Level<=1){ 
                        data=Data(b.Obj);
                        Units.MJ(p.player,'e008','A04H',0,p.hero.X(),p.hero.Y(),0,2,1.5,1,"death","lizi_zi1.mdl"); 
                        Units.MJ(p.player,'e008','A04H',0,p.hero.X(),p.hero.Y(),0,2,2,1,"stand","hiteffect08purplea.mdl").SetH(100); 
                        mj=Units.MJ(p.player,'e008','A04H',0,p.hero.X(),p.hero.Y(),0,2,p.hero.modelsize,2,"attack",p.hero.model); 
                        mj.Alpha(0);
                        mj.SetF(Util.XY(mj.unit,p.hero.unit),true);
                        p.hero.Position(Units(data.c[2]).X(),Units(data.c[2]).Y(),false);
                        data=Data.create('A04H');
                        data.c[0]=mj;
                        data.r[0]=p.hero.X();
                        data.r[1]=p.hero.Y();
                        Timers.Start(0.2,data,function(Timers t){
                            Data data=Data(t.Data());
                            Units(data.c[0]).Position(data.r[0],data.r[1],false);
                            t.Destroy();
                            data.Destroy();
                        }); 
                        b.Stop();
                    }
                }
            }
        }

        static method Q(Spell e){
            Units u=Units.Get(e.Spell);
            Buffs b;
            real f=e.Angle,x,y;
            Dash dash;
            Data data;
            Units mj;
            if(u.IsAbility('B013')==false){//第一次用
                data=Data.create('A04H');
                data.c[0]=u;
                data.c[1]=e;
                mj=Units.MJ(u.player.player,'e008','A04H',0,u.X(),u.Y(),0,6,1,1,"stand","bowen_zi.mdl");
                data.c[2]=mj;
                b=Buffs.Add(u.unit,'A04I','B013',5,false);
                b.Level=2;
                b.Obj=data;
                b.onEnd=function(Buffs b){
                    Data data=Data(b.Obj);
                    Units(data.c[0]).SetAbilityCD('A04H',10-b.Time);
                    Spell(data.c[1]).Destroy();
                    Units(data.c[2]).Anime("death");
                    data.Destroy();
                };
            }else{//后续使用
                b=Buffs.Find(u.unit,'B013');
                b.Level-=1;
                e.Destroy();
            }
            if(b.Level>0){  
                u.Pause(true);
                u.SetF(f,true);
                u.AnimeId(8); 
                x=u.X();
                y=u.Y();
                if(b.Level>1){ 
                    u.Position(x,y,true);
                    u.RemoveAbility('A04H');
                    u.AddAbility('A04H');
                }else{
                    mj=Units.MJ(u.player.player,'e009','A04H',0,x,y,f,2,1,1.5,"stand","tx_white2.mdl");
                    mj.SetH(75);
                    mj.DelaySizeEx(1,2,1.5);
                    Dash.Start(mj.unit,f,600,Dash.PWX,70,true,false);
                }
                u.AddAbility('A04J');
                u.DelayAlpha(0,255,0.6);
                data=Data.create('A04H');
                Units.MJ(u.player.player,'e008','A04H',0,x,y,f,1,0.6,1,"stand","cf2.mdl"); 
                mj=Units.MJ(u.player.player,'e009','A04H',0,x,y,f,2,1,3,"stand","white-qiquan-new.mdl");
                mj.SetH(75);
                mj.DelaySizeEx(1,2,1.5);
                Dash.Start(mj.unit,f,600,Dash.ADD,70,true,false);
                mj=Units.MJ(u.player.player,'e008','A04H',0,x,y,f,2,0.6,1,"stand","akiha claw_zi.mdl");
                mj.SetH(100); 
                data.c[0]=u;
                data.c[1]=mj;
                data.i[0]=0;
                dash=Dash.Start(u.unit,f,700,Dash.SUB,40,true,false);
                dash.Obj=data;
                dash.onMove=function(Dash dash){
                    Data data=Data(dash.Obj);
                    Units u=Units.Get(dash.Unit);
                    if(dash.Speed>6){
                        if(data.i[0]==0){
                            data.i[0]=2;
                            Effect.To("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl",dash.X,dash.Y).Destroy();
                        }else{
                            data.i[0]-=1;
                        }
                        Units(data.c[1]).Position(dash.X+100*CosBJ(dash.Angle),dash.Y+100*SinBJ(dash.Angle),false);
                    }
                    
                    if(dash.Speed<2.3){
                        dash.Stop();
                    }
                };
                dash.onEnd=function(Dash dash){
                    Data data=Data(dash.Obj);
                    Units u=Units.Get(dash.Unit); 
                    u.RemoveAbility('A04J');
                    u.Pause(false);
                    data.Destroy();
                };
            } 
        }


        static method HERO_START(Spell e){
            Units u=Units.Get(e.Spell);
            if(e.Id=='A04H'){
                u.FlushAnimeId(7);
            }
            e.Destroy();
        }

         

        static method onInit(){
            Spell.On(Spell.onSpell,'A04H',Yuuki.Q); 
            Spell.On(Spell.onReady,'A04H',Yuuki.HERO_START); 
            Damage.On(Damage.onUnitDamage_SubDamage,Yuuki.Damage);
            Press.OnSnyc(Press.onSnycPressKeyDown,Yuuki.Q1);
            //Spell.On(Spell.onStop,'A04H',Yuuki.HERO_STOP);   
        }
    }
}