library Zg requires Groups{
    //英雄‘眼镜·七夜’的技能
    //SR
    /*
        27 - Q前摇
        24 - Q动作
        28 - Q2 第一阶段(0.768s蓄力)(0.464s蓄力完毕小踹)(0.421s大踹)
        29 - Q2 空中下踹
    */ 
    struct Zg{  

        static method Q2(Units u){
            Buffs b=Buffs.Find(u.unit,'B01T');  
            Data data=Data.create('A05X');
            b.Level=0;
            b.Stop(); 
            BJDebugMsg("触发Q2");
            u.Pause(true);
            u.AnimeId(28);
            u.AddAbility('A060');
            data.c[0]=u;
            data.r[0]=0.77;//一段蓄力
            data.r[1]=0.23;//小踹动作0.46
            data.r[2]=0.21;//大踹动作0.42
            Dash.Start(u.unit,u.F()+180,50,Dash.SUB,7,true,false);
            Timers.Start(0.01,data,function(Timers t){
                Data data=Data(t.Data());
                Units u=Units(data.c[0]);
                Units mj;
                real x=u.X(),y=u.Y(),f=u.F();
                Dash dash;
                Data data1;
                if(u.Alive()==false){
                    u.RemoveAbility('A060'); 
                    u.AnimeSpeed(1);
                    u.Pause(false);
                    t.Destroy();
                    data.Destroy();
                }else{
                    if(data.r[0]<=0){//小踹
                        if(data.r[1]==0.23){
                            u.AnimeSpeed(2);
                            data.r[1]-=0.01;
                            Dash.Start(u.unit,f,50,Dash.SUB,7,true,false);
                            mj=Units.MJ(u.player.player,'e009','A05X',0,x+100*CosBJ(f),y+100*SinBJ(f),f+180,1,0.7,2,"stand","white-qiquan-juhuang.mdl");
                            mj.SetH(105);  
                            mj.DelaySizeEx(0.7,1.5,0.9);
                            Dash.Start(mj.unit,f+180,150,Dash.SUB,10,true,false);
                        }else{ 
                            if(data.r[1]<=0){//大踹
                                if(data.r[2]==0.21){
                                    data.r[2]-=0.01;
                                    dash=Dash.Start(u.unit,f,350,Dash.SUB,15,true,false);
                                    mj=Units.MJ(u.player.player,'e00N','A05X',0,x+55*CosBJ(f),y+55*SinBJ(f),f,1,0.75,1,"stand","cf2.mdl");  
                                    dash.Obj=mj;
                                    dash.onMove=function(Dash dash){
                                        Units u=Units.Get(dash.Unit);
                                        Units mj=Units(dash.Obj);
                                        mj.Position(dash.X+55*CosBJ(dash.Angle),dash.Y+55*SinBJ(dash.Angle),false);
                                        mj.SetF(dash.Angle,true);
                                        mj.SetH(u.H());
                                    };
                                    HitFlys.Lister(HitFlys.Add(u.unit,30),HitFlys.onEnd,function(HitFlys h){
                                        Units u=Units.Get(h.Unit);
                                        u.AnimeSpeed(1);
                                        u.RemoveAbility('A060'); 
                                        u.Pause(false);
                                    }); 
                                    t.Destroy();
                                    data.Destroy();
                                }  
                            }else{
                                if(u.IsTimeStop()==false){
                                    data.r[1]-=0.01;
                                }
                            }
                        }
                    }else{
                        if(u.IsTimeStop()==false){//蓄力中
                            data.r[0]-=0.01; 
                            if(ModuloReal(data.r[0],0.1)==0.1){
                                mj=Units.MJ(u.player.player,'e008','A05X',0,x,y,f,0.6,0.3,1,"stand","white-qiquan.mdl");  
                            }
                        }
                    }
                }
            });
        }

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
            data.g[0]=CreateGroup();
            dash=Dash.Start(u.unit,e.Angle,400,Dash.SUB,50,true,false);
            dash.Obj=data;
            dash.onMove=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units(data.c[0]);
                Units mj=Units(data.c[2]);
                Units ts;
                if(dash.Speed>3.25){  
                    mj.Position(dash.X,dash.Y,false);
                    mj=Units(data.c[3]); 
                    mj.Position(dash.X,dash.Y,false);
                    GroupEnumUnitsInRange(tmp_group,dash.X,dash.Y,150,function GroupIsAliveNotAloc);     
                    while(FirstOfGroup(tmp_group)!=null){
                        mj=Units.Get(FirstOfGroup(tmp_group));
                        GroupRemoveUnit(tmp_group,mj.unit);
                        if(IsUnitEnemy(mj.unit,u.player.player)==true&&IsUnitInGroup(mj.unit,data.g[0])==false){    
                            GroupAddUnit(data.g[0],mj.unit);
                            u.Damage(mj.unit,Damage.Magic,'A05X',u.Agi(true)*2); 
                            Buffs.Skill(mj.unit,'A00W',1);
                            Dash.Start(mj.unit,dash.Angle,50+(dash.MaxDis-dash.NowDis),Dash.SUB,25,true,false); 
                            ts=Units.MJ(u.player.player,'e008','A05X',0,mj.X(),mj.Y(),dash.Angle,2,1,1,"stand", "blood-2.mdl");
                            ts.DelayAlpha(255,0,1.99);
                            Effect.ToUnit("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl",mj.unit,"chest").Destroy();
                                        
                        }
                    }
                    GroupClear(tmp_group); 
                }
            };
            dash.onEnd=function(Dash dash){
                Data data=Data(dash.Obj);
                Units u=Units(data.c[0]);
                Buffs.Add(u.unit,'A05Z','B01T',5,false);
                Timers.Start(0.2,u,function(Timers t){
                    Units u=Units(t.Data());
                    u.RemoveAbility('A05Y');
                    t.Destroy();
                });
                u.Pause(false);
                DestroyGroup(data.g[0]);
                data.g[0]=null;
                Spell(data.c[1]).Destroy(); 
                data.Destroy();
            };
        }

        static method Press(player ps,string k){
            Players p=Players.Get(ps);
            if(k=="Q"){ 
                if(p.hero.IsAbility('B01T')==true&&p.hero.IsAbility('BPSE')==false&&p.hero.IsPause()==false){
                    if(Buffs.Find(p.hero.unit,'B01T').Level==1){ 
                        Zg.Q2(p.hero);
                    }
                }
            } 
        }

        static method HERO_START(Spell e){
            Units u=Units.Get(e.Spell);
            if(e.Id=='A05X'){
                u.FlushAnimeId(27);
            }
            e.Destroy();
        }

        static method onInit(){

            Press.OnSnyc(Press.onSnycPressKeyDown,Zg.Press);
            Spell.On(Spell.onReady,'A05X',Zg.HERO_START); 
            Spell.On(Spell.onSpell,'A05X',Zg.Q);
        }
    }
} 