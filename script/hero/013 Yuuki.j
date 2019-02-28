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
            if(k=="Q"){ 
                if(p.hero.IsAbility('B013')==true&&p.hero.IsAbility('A04J')==false){
                    b=Buffs.Find(p.hero.unit,'B013'); 
                    if(b.Level<=1){ 
                        data=Data(b.Obj);
                        p.hero.Position(Units(data.c[2]).X(),Units(data.c[2]).Y(),false);
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
                }
                u.AddAbility('A04J');
                Units.MJ(u.player.player,'e008','A04H',0,x,y,f,1,0.6,1,"stand","cf2.mdl");
                Units.MJ(u.player.player,'e009','A04H',0,x,y,f,2,1,1.5,"stand","tx_white2.mdl").SetH(75);
                mj=Units.MJ(u.player.player,'e009','A04H',0,x,y,f,2,1,3,"stand","white-qiquan-new.mdl");
                mj.SetH(75);
                mj.DelaySizeEx(1,2,1.5);
                Dash.Start(mj.unit,f,600,Dash.ADD,70,true,false);
                dash=Dash.Start(u.unit,f,700,Dash.SUB,40,true,false);
                dash.onMove=function(Dash dash){
                    Units u=Units.Get(dash.Unit);
                    if(dash.Speed>6){
                        if(dash.Obj==0){
                            dash.Obj=2;
                            Effect.To("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl",dash.X,dash.Y).Destroy();
                        }else{
                            dash.Obj-=1;
                        }
                    }
                    
                    if(dash.Speed<2.3){
                        dash.Stop();
                    }
                };
                dash.onEnd=function(Dash dash){
                    Units u=Units.Get(dash.Unit); 
                    u.RemoveAbility('A04J');
                    u.Pause(false);
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