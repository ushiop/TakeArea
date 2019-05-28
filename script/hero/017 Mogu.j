library Mogu requires Groups{
    //英雄‘妹红’的技能
    //SR
    struct Mogu{

        /*
            2 - 回旋踢动作
            9 - 回旋踢（远）终结踢
            23 - 回旋踢(近)终结踢
        */

        static method W1(Data data){
            Units u=Units(data.c[0]);
            Spell e=Spell(data.c[1]);
            data.i[0]+=1;
            data.i[1]=0;//当前阶段，0为后回旋，1为输出回旋
            data.r[1]=0.329/data.r[0];//后回旋，结束时牵引判定
            data.r[2]=(0.123/0.4)/data.r[0];//前回旋，伤害判定
            data.r[3]=0;//前回旋火焰角度
            data.r[4]=180/(data.r[2]/0.01);//前回旋火焰角度幅度
            u.Pause(true);
            u.AnimeSpeed(data.r[0]);
            u.AnimeId(2);
            Timers.Start(0.01,data,function(Timers t){
                Data data=Data(t.Data());
                Units u=Units(data.c[0]);
                Units mj;
                real x,y,f;
                if(u.Alive()==true){
                    if(u.IsTimeStop()==false){
                        if(data.i[1]==0){
                            if(data.r[1]<=0){
                                //后回旋结束，进入前回旋
                                u.AnimeSpeed(0.4*data.r[0]);
                                Dash.Start(u.unit,u.F(),50,Dash.NORMAL,u.MoveSpeed()/100,true,false);
                                data.i[1]=1;
                            }else{
                                data.r[1]-=0.01; 
                                if(data.r[1]>=0.13&&data.r[1]<=0.14){//牵引周围敌人 
                                    mj=Units.MJ(u.player.player,'e008','A06G',0,u.X(),u.Y(),GetRandomReal(0,360),1,1,1,"stand","white-qiquan.mdl");
                                    mj.Color(255,0,0);
                                    mj.DelaySizeEx(0.6,0.1,0.8);
                                    f=u.F();
                                    x=u.X()+150*CosBJ(f);
                                    y=u.Y()+150*SinBJ(f);
                                    f=Util.XYEX(x,y,x+100*CosBJ(f),y+100*SinBJ(f));
                                    GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),400,function GroupIsAliveNotAloc);     
                                    while(FirstOfGroup(tmp_group)!=null){
                                        mj=Units.Get(FirstOfGroup(tmp_group));
                                        GroupRemoveUnit(tmp_group,mj.unit);
                                        if(IsUnitEnemy(mj.unit,u.player.player)==true){
                                            if((Util.XY2(mj.unit,u.unit)>200&&Util.FAN(u.unit,mj.unit,f,80)==true)||(Util.FAN(u.unit,mj.unit,f,80)==false)){ 
                                                Dash.Start(mj.unit,Util.XYEX(mj.X(),mj.Y(),x,y),Util.XY2EX(mj.X(),mj.Y(),x,y),Dash.NORMAL,15,true,true);
                                                Effect.ToUnit("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",mj.unit,"chest").Destroy();
                                            }  
                                        }
                                    }
                                    GroupClear(tmp_group); 
                                }
                            }
                        }else{
                            if(data.r[2]<=0){
                                u.AnimeSpeed(1);
                                u.Pause(false);
                                t.Destroy();
                                if(u.player.press.W==true&&u.IsAbility('BPSE')==false&&data.i[0]<4){
                                    //继续踢
                                    data.r[0]+=0.25;
                                    Mogu.W1(data);
                                }else{
                                    //不踢了
                                    if(data.i[0]>2){
                                        //踢远并减速
                                    }else{
                                        //踢高并眩晕
                                    }
                                    Spell(data.c[1]).Destroy();
                                    data.Destroy();
                                }
                            }else{
                                data.r[2]-=0.01; 
                                f=(u.F()-90)+data.r[3];
                                data.r[3]+=data.r[4];
                                mj=Units.MJ(u.player.player,'e008','A06G',0,u.X()+60*CosBJ(f),u.Y()+60*SinBJ(f),GetRandomReal(0,360),2,0.5,0.7,"stand","by_wood_effect_yuzhiboyou_fire_fengxianhuo_2.mdl");
                                mj.SetH(30+(data.r[3]/2)); 
                                Dash.Start(mj.unit,f,70,Dash.SUB,15,true,false);
                                 
                                if(data.r[2]>=0.12&&data.r[2]<=0.13){
                                    x=u.X();
                                    y=u.Y();
                                    f=Util.XYEX(x,y,x+100*CosBJ(u.F()),y+100*SinBJ(u.F()));
                                    GroupEnumUnitsInRange(tmp_group,x,y,200,function GroupIsAliveNotAloc);     
                                    while(FirstOfGroup(tmp_group)!=null){
                                        mj=Units.Get(FirstOfGroup(tmp_group));
                                        GroupRemoveUnit(tmp_group,mj.unit);
                                        if(IsUnitEnemy(mj.unit,u.player.player)==true){
                                            if(Util.FAN(u.unit,mj.unit,f,80)==true){ 
                                                Dash.Start(mj.unit,f,75,Dash.NORMAL,6,true,true);
                                                HitFlys.Add(mj.unit,13);
                                                Effect.ToUnit("by_wood_effect_yuzhiboyou_fire_fengxianhuo_2.mdl",mj.unit,"chest").Destroy();
                                            } 
                                        }
                                    }
                                    GroupClear(tmp_group); 
                                }
                            }   
                        }        
                    }
                }else{
                    u.AnimeSpeed(1);
                    u.Pause(false);
                    t.Destroy();
                    Spell(data.c[1]).Destroy();
                    data.Destroy(); 
                }
            });
        }

        static method W(Spell e){
            Data data=Data.create('A06G');
            data.c[0]=Units.Get(e.Spell);
            data.c[1]=e;
            data.i[0]=0;//踢的次数
            data.r[0]=1.0;//速度倍率
            Mogu.W1(data);
        }

        static method Q(Units u,Units m){
            if(u.aid=='A06E'&&u.aidindex==0){ 
                Units.MJ(u.player.player,'e008','A06E',1,u.X(),u.Y(),GetRandomReal(0,360),2.5,0.8,2, "stand","chushou_by_wood_effect_flame_explosion_2.mdl");
                //Util.Range(u.X(),u.Y(),150);
                GroupDamage(u, u.X(),u.Y(),150,u.player.hero.Str(true)*1.5,Damage.Magic,'A06E',false); 
            }
        }

        static method Spawn(Units u,Units m){
            Data data;
            if(u.IsAbility('A06E')==true){
                data=Data.create('A06E');
                data.c[0]=u;
                data.c[1]=Effect.ToUnit("fire-buff-qiquan.mdl",u.unit,"origin");
                data.r[0]=0;
                BJDebugMsg("有了");
                Timers.Start(500,data,function(Timers t){//0.05
                    Data data=Data(t.Data());
                    Units u=Units(data.c[0]);
                    Units mj; 
                    if(u.IsTimeStop()==false){
                        if(data.r[0]==0){
                            data.r[0]=1;
                            if(u.Alive()==true){
                                //伤害和留下火
                                Effect.ToUnit("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",u.unit,"right hand").Destroy();
                                Effect.ToUnit("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",u.unit,"left hand").Destroy();
                                Effect.ToUnit("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl",u.unit,"chest").Destroy();
                                mj=Units.MJ(u.player.player,'e008','A06E',0,u.X(),u.Y(),0,GetRandomReal(0.5,1.5),1.5,1, "stand","Environment\\LargeBuildingFire\\LargeBuildingFire1.mdl");
                                mj.Position(mj.X(),mj.Y(),true);
                                mj.AddAbility(Units.MJType_FZW);
                                GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),150,function GroupIsAliveNotAloc);     
                                while(FirstOfGroup(tmp_group)!=null){
                                    mj=Units.Get(FirstOfGroup(tmp_group));
                                    GroupRemoveUnit(tmp_group,mj.unit);
                                    if(IsUnitEnemy(mj.unit,u.player.player)==true){
                                        u.Damage(mj.unit,Damage.Magic,'A06E',u.Str(true));  
                                        Buffs.Add(mj.unit,'A06F','B021',2,false);
                                    }
                                }
                                GroupClear(tmp_group); 
                            }else{
                                BJDebugMsg("没了");
                                Effect(data.c[1]).Destroy();
                                data.Destroy();
                                t.Destroy();
                            }
                        }else{
                            data.r[0]-=0.05;
                        }
                    }
                });
            }
        }

        static method onInit(){
            Units.On(Units.onHeroSpawn,Mogu.Spawn); 
            Units.On(Units.onAlocDeath,Mogu.Q); 
            Spell.On(Spell.onSpell,'A06G',Mogu.W);
        }
    }
}