library MR requires Groups{
    //英雄‘鸣人’的技能
    //R级
    struct MR{

        static method Rua(Units u)->boolean{
            real x=u.X(),y=u.Y(),f=Util.XYEX(x,y,x+100*CosBJ(u.F()),y+100*SinBJ(u.F())),f1;
            Units tmp;
            boolean rus=false;
            GroupEnumUnitsInRange(tmp_group,x,y,600,function GroupIsAliveNotAloc);     
            while(FirstOfGroup(tmp_group)!=null){
                tmp=Units.Get(FirstOfGroup(tmp_group));
                GroupRemoveUnit(tmp_group,tmp.unit);
                if(tmp.IsAbility('A00P')==true){
                    if(Util.FAN(tmp.unit,u.unit,Util.XYEX(tmp.X(),tmp.Y(),tmp.X()+20*CosBJ(tmp.F()),tmp.Y()+20*SinBJ(tmp.F())),60)==true){
                        RuaText(tmp.unit,"narutoooo！!",10,2,1,180,0.3,0.05);
                    } 
                    if(rus==false){  
                        if(Util.FAN(u.unit,tmp.unit,f,60)==true){ 
                            RuaText(u.unit,"sasukeeeeeeee！！！！！!",10,2,1,180,0,0.03);
                            rus=true;
                        } 
                    }
                }
            }
            GroupClear(tmp_group);  
            return rus;
        }
  
        static method Spawn(Units u,Units m){
            timer t;
            Data data; 
            if(u.IsAbility('A01X')==true){
                t=NewTimer();
                data=Data.create('A01X');
                data.c[0]=u;
                data.i[0]=0; 
                data.r[0]=u.X();
                data.r[1]=u.Y();
                data.r[2]=0.0;
                data.r[3]=0;
                SetTimerData(t,data);
                TimerStart(t,0.01,true,function(){
                    Data data=Data(GetTimerData(GetExpiredTimer()));
                    Units u=Units(data.c[0]);
                    Units tmp;
                    real speed;
                    integer tte=0;
                    real x=u.X(),y=u.Y(),f=Util.XYEX(x,y,x+100*CosBJ(u.F()),y+100*SinBJ(u.F())),f1; 
                    if(u.Alive()==false){ 
                        data.Destroy();
                        ReleaseTimer(GetExpiredTimer());
                    }else{
                        speed=Util.XY2EX(x,y,data.r[0],data.r[1]);
                        if(speed>5){
                            data.r[2]+=0.01;
                        }else{ 
                            data.r[2]=0;
                            if(data.i[0]==1){
                                data.i[0]=0; 
                                Dash.Start(u.unit,u.F(),300,Dash.SUB,10,true,false).onMove=function(Dash dash){
                                    dash.Angle=GetUnitFacing(dash.Unit);
                                };
                            }
                        }
                        if(data.r[2]>=1.0){
                            data.i[0]=1;
                        } 
                        data.r[0]=x;
                        data.r[1]=y;
                        if(data.r[3]==1.0){
                            data.r[3]=0;
                            if((u.HP()/u.MaxHP())<=0.3){
                                Buffs.Add(u.unit,'A01Y','B00B',30,false);
                            }  
                            if(u.IsAbility('B00B')==true){
                                GroupEnumUnitsInRange(tmp_group,x,y,150,function GroupIsAliveNotAloc);     
                                while(FirstOfGroup(tmp_group)!=null){
                                    tmp=Units.Get(FirstOfGroup(tmp_group));
                                    GroupRemoveUnit(tmp_group,tmp.unit);
                                    if(IsUnitEnemy(tmp.unit,u.player.player)==true){  
                                        u.Damage(tmp.unit,Damage.Chaos,'A01X',u.Str(true)*3.0);
                                        DestroyEffect( AddSpecialEffectTarget("fire4.mdl",tmp.unit, "chest") );
                                    }
                                }
                                GroupClear(tmp_group); 
                            }
                        }else{
                            if(u.IsTimeStop()==false){ 
                                data.r[3]+=0.01;
                            }
                        }
                        if(data.r[4]==1.5){
                            data.r[4]=0;
                            MR.Rua(u);
                        }else{
                            data.r[4]+=0.01;
                        }
                    }
                });
                t=null;
            }
        }

        //友军死亡触发九尾
        static method Death(Units u,Units m){ 
            Units mj; 
            GroupEnumUnitsInRange(tmp_death_group,u.X(),u.Y(),1200,function GroupIsAliveNotAloc);     
            while(FirstOfGroup(tmp_death_group)!=null){
                mj=Units.Get(FirstOfGroup(tmp_death_group));
                GroupRemoveUnit(tmp_death_group,mj.unit);
                if(IsUnitEnemy(mj.unit,u.player.player)==false){ 
                    if(mj.IsAbility('A01X')==true){
                        Buffs.Add(mj.unit,'A01Y','B00B',30,false);
                    }
                }
            }
            GroupClear(tmp_death_group);
        }

        static method Damage(DamageArgs e){
            Units u=e.TriggerUnit;
            if(u.IsAbility('A01X')==true){ 
                if(e.DamageType==Damage.Magic){
                    //九尾之力 魔法减伤15%
                    e.Damage=e.Damage-(e.Damage*0.15);
                }
                if(u.IsAbility('B00B')==true){
                    //情绪激动 所有伤害减少15% 
                    e.Damage=e.Damage-(e.Damage*0.15); 
                }
            } 
        }
 
        static method E(Spell e){
            Units u=Units.Get(e.Spell);
            Units mj;
            Units tmp;
            Buffs b;
            Data data;
            real f;
            GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),600,function GroupIsAliveNotAloc);     
            while(FirstOfGroup(tmp_group)!=null){
                mj=Units.Get(FirstOfGroup(tmp_group));
                GroupRemoveUnit(tmp_group,mj.unit);
                if(IsUnitEnemy(mj.unit,u.player.player)==true){  
                    f=Util.XY(mj.unit,u.unit);
                    tmp=Units.MJ(u.player.player,'e008','A025',0,mj.X()+115*CosBJ(f+180),mj.Y()+115*SinBJ(f+180),f,1.1,1.2,2, "Spell Two","mr.mdl"); 
                    tmp.DelayAlpha(255,0,1);
                    DestroyEffect( AddSpecialEffectTarget("kuriyamaq.mdl",mj.unit, "chest") );
                    DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Orc\\MirrorImage\\MirrorImageDeathCaster.mdl",tmp.unit, "origin") );
                    Dash.Start(mj.unit,Util.XY(mj.unit,u.unit),Util.XY2(mj.unit,u.unit)+100,Dash.SUB,20,true,true);
                    HitFlys.Add(mj.unit,45);
                    u.Damage(mj.unit,Damage.Physics,'A025',u.Str(true)*10.0);
                    data=Data.create('A025');
                    data.c[0]=u;
                    data.c[1]=mj;
                    data.r[0]=0;
                    b=Buffs.Add(mj.unit,'A026','B00D',5,false);
                    b.Obj=data;
                    b.Type=Buffs.TYPE_SUB+Buffs.TYPE_DISPEL_TRUE; 
                    b.onTime=function(Buffs b){ 
                        Data data=Data(b.Obj);
                        Units u=Units(data.c[0]);
                        Units mj=Units(data.c[1]);
                        if(data.r[0]==0){
                            DestroyEffect( AddSpecialEffectTarget("StampedeMissileDeath_stand.mdx",mj.unit, "chest") ); 
                            u.Damage(mj.unit,Damage.Chaos,'A025',u.Str(true));
                            data.r[0]=1; 
                        }else{
                            data.r[0]-=0.01;
                        }
                    };
                    b.onEnd=function(Buffs b){ 
                        Data data=Data(b.Obj);
                        data.Destroy();
                    };
                }
            }
            GroupClear(tmp_group); 
            e.Destroy();         
        }
 
        static method W(Spell e){
            Units u=Units.Get(e.Spell);
            Units mj;
            integer targetSex=Units.SexMan;
            Buffs b; 
            if(u.player.press.W==true){
                TextAngle(u.unit,"  逆",3,10,270);
                targetSex=Units.SexWomen;
            }
            //Util.Range(u.X(),u.Y(),600);
            GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),600,function GroupIsAliveNotAloc);     
            while(FirstOfGroup(tmp_group)!=null){
                mj=Units.Get(FirstOfGroup(tmp_group));
                GroupRemoveUnit(tmp_group,mj.unit);
                if(IsUnitEnemy(mj.unit,u.player.player)==true&&mj.Sex()==targetSex){ 
                    DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Orc\\MirrorImage\\MirrorImageDeathCaster.mdl",u.unit, "origin") );
                    DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Orc\\MirrorImage\\MirrorImageDeathCaster.mdl",mj.unit, "origin") );
                    u.Damage(mj.unit,Damage.Chaos,'A020',u.Str(true)*5.0+u.Agi(true)*2.0+u.Int(true)*3.0);
                    if(targetSex==Units.SexWomen){
                        b=Buffs.Add(mj.unit,'A023','B00C',5,false);
                    }else{
                        b=Buffs.Add(mj.unit,'A024','B00C',5,false);
                    }
                    b.Type=Buffs.TYPE_SUB+Buffs.TYPE_DISPEL_TRUE;
                    mj.AddAbility('Abun');
                    b.onEnd=function(Buffs b){
                        Units u=Units.Get(b.Unit);
                        u.RemoveAbility('Abun');
                    };
                }
            }
            GroupClear(tmp_group);   
            e.Destroy();         
        }


        static method R1(){ 
            Data data=Data(GetTimerData(GetExpiredTimer()));
            Units u=Units(data.c[0]);     
            Units mj;
            Dash dash;
            real f=u.F(),x=u.X()+150*CosBJ(f),y=u.Y()+150*SinBJ(f),dis,fa; 
            if(u.IsTimeStop()==false){ 
                if(data.i[0]==0){//后撤搓丸子与前冲
                    //

                    //data.i[0]=1;
                    TimerStart(GetExpiredTimer(),0.02,true,function MR.R1);
                    mj=Units.MJ(u.player.player,'e008','A027',0,u.X()+110*CosBJ(f-135),u.Y()+110*SinBJ(f-135),0,1.5,1.2,1.5, "stand","mr.mdl"); 
                    DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Orc\\MirrorImage\\MirrorImageDeathCaster.mdl",mj.unit, "origin") );
                    mj.SetF(Util.XY(mj.unit,u.unit),true);
                    mj.AnimeId(12);   
                    u.AnimeSpeed(0);
                    data.c[2]=mj;
                    data.r[4]=1;
                    data.i[0]=4;
                }else if(data.i[0]==1){//冲到了！  
                    TimerStart(GetExpiredTimer(),data.r[1],true,function MR.R1); 
                    Dash.Start(u.unit,f,80-(data.r[0]*30),Dash.SUB,5,true,false);
                    mj=Units.MJ(u.player.player,'e00B','A027',0,x,y,GetRandomReal(0,360),1,1.5,2, "stand","Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl"); 
                    mj.SetH(50);
                    mj=Units.MJ(u.player.player,'e008','A027',0,x,y,GetRandomReal(0,360),1,1.5,2, "death","wind2.mdl");
                    mj.SetH(25); 
                    mj=Units.MJ(u.player.player,'e009','A027',0,x,y,f+180,5,0.8,1+data.r[0], "stand","tx_white2.mdl"); 
                    mj.SetH(150);
                    Dash.Start(mj.unit,f+180,600,Dash.SUB,40,true,false);
                    if(u.IsAbility('B00B')==true){
                        mj=Units.MJ(u.player.player,'e009','A027',0,x,y,f+180,5,0.8,1+data.r[0], "stand","tx_white2.mdl"); 
                        mj.SetH(150);
                        Dash.Start(mj.unit,f+180,600,Dash.SUB,40,true,false);          
                        mj.Color(255,120,120);         
                    }
                    mj=Units.MJ(u.player.player,'e008','A027',0,x,y,GetRandomReal(0,360),0.3,1.25+data.r[0],1, "birth","t_lxw.mdl");  
                    mj.SetH(100);
                    mj=Units.MJ(u.player.player,'e008','A027',0,x,y,GetRandomReal(0,360),0.3,1.25+data.r[0],3, "stand","Objects\\Spawnmodels\\Undead\\UCancelDeath\\UCancelDeath.mdl");  
                    mj.Color(0,155,255);
                    if(u.IsAbility('B00B')==true){
                        mj=Units.MJ(u.player.player,'e008','A027',0,x,y,GetRandomReal(0,360),0.3,1.25+data.r[0],1, "birth","t_lxw_red.mdx");  
                        mj.SetH(100);
                        mj=Units.MJ(u.player.player,'e008','A027',0,x,y,GetRandomReal(0,360),0.3,1.25+data.r[0],3, "stand","Objects\\Spawnmodels\\Undead\\UCancelDeath\\UCancelDeath.mdl");  
                        mj.Color(255,0,0);
                    }
                    Util.Duang(x,y,0.3,250,250,-48,0.02,50);
                    //11次伤害
                    //Util.Range(x,y,200);
                    GroupEnumUnitsInRange(tmp_group,x,y,600,function GroupIsAliveNotAloc);     
                    while(FirstOfGroup(tmp_group)!=null){
                        mj=Units.Get(FirstOfGroup(tmp_group));
                        GroupRemoveUnit(tmp_group,mj.unit);
                        if(IsUnitEnemy(mj.unit,u.player.player)==true){ 
                            dis=Util.XY2EX(mj.X(),mj.Y(),x,y);
                            fa=Util.XYEX(mj.X(),mj.Y(),x,y);
                            if(dis<=200){ 
                                u.Damage(mj.unit,Damage.Chaos,'A027',u.Str(true)*0.91); //一共11次,10倍
                                mj.Position(mj.X()+4.22*CosBJ(fa),mj.Y()+4.22*SinBJ(fa),true);
                            }else{
                                Dash.Start(mj.unit,fa,dis/10,Dash.NORMAL,4,true,false);
                            }
                        }
                    }
                    GroupClear(tmp_group);   
                    if(data.i[4]==0){
                        if(MR.Rua(u)==true){
                            data.i[4]=1;
                        }
                    }
                    data.r[0]+=0.15;//2.65
                    data.r[1]-=(data.r[1]*0.2); 
                    if(data.r[1]<0.02){
                        data.i[0]=2;
                    }
                }else if(data.i[0]==2){//最后一发！ 
                    if(data.i[4]==0){ 
                        MR.Rua(u);
                    }
                    mj=Units.MJ(u.player.player,'e008','A027',0,x,y,GetRandomReal(0,360),1,1.5,0.5, "stand","by_wood_effect_yuanbanlin_sand2.mdl"); 
                    mj=Units.MJ(u.player.player,'e008','A027',0,x,y,GetRandomReal(0,360),2,1.25+data.r[0],2.5, "stand","Objects\\Spawnmodels\\Undead\\UCancelDeath\\UCancelDeath.mdl");  
                    mj.Color(0,155,255);
                    mj=Units.MJ(u.player.player,'e008','A027',0,x,y,GetRandomReal(0,360),1,2,2, "stand","white-qiquan-new.mdl");  
                    if(u.IsAbility('B00B')==true){                
                        mj=Units.MJ(u.player.player,'e008','A027',0,x,y,GetRandomReal(0,360),2,1.25+data.r[0],2.5, "stand","Objects\\Spawnmodels\\Undead\\UCancelDeath\\UCancelDeath.mdl");  
                        mj.Color(255,0,0);
                    }
                    Util.Duang(x,y,0.8,250,250,-256,0.02,50);
                    //Util.Range(x,y,300); 
                    GroupEnumUnitsInRange(tmp_group,x,y,375,function GroupIsAliveNotAloc);     
                    while(FirstOfGroup(tmp_group)!=null){
                        mj=Units.Get(FirstOfGroup(tmp_group));
                        GroupRemoveUnit(tmp_group,mj.unit);
                        if(IsUnitEnemy(mj.unit,u.player.player)==true){  
                            u.Damage(mj.unit,Damage.Chaos,'A027',u.Str(true)*10.0); 
                        }
                        dash=Dash.Start(mj.unit,Util.XYEX(x,y,mj.X(),mj.Y()),450,Dash.PWX,30,true,false);
                        dash.Obj=3;
                        dash.onMove=function(Dash dash){
                            if(dash.Obj==0){
                                dash.Obj=3;
                                DestroyEffect( AddSpecialEffect("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl", dash.X,dash.Y) );
                            }else{
                                dash.Obj-=1;
                            }
                        };
                    }
                    GroupClear(tmp_group);                     
                    data.i[0]=3; 
                    TimerStart(GetExpiredTimer(),0.2,true,function MR.R1); 
                    
                }else if(data.i[0]==4){//分身搓丸子
                    mj=Units(data.c[2]);
                    if(data.r[4]<=0){
                        data.i[0]=1;
                        u.AnimeSpeed(1); 
                        Dash.Start(u.unit,f,200,Dash.ADD,25,true,false).onMove=function(Dash dash){
                            if(dash.Speed>1&&dash.Speed<1.25){ 
                                HitFlys.Add(dash.Unit,13);
                            }
                        }; 
                        DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Orc\\MirrorImage\\MirrorImageDeathCaster.mdl",mj.unit, "origin") );
                        mj.DelayAlpha(255,0,0.4);
                        mj.AnimeSpeed(1);
                        mj.AnimeId(4);
                        TimerStart(GetExpiredTimer(),0.35,true,function MR.R1);
                    }else{
                        mj.Position(u.X()+125*CosBJ(f-135),u.Y()+125*SinBJ(f-135),false);
                        mj.SetF(Util.XY(mj.unit,u.unit),true);
                        if(data.r[4]==0.5){
                            u.AddAbility('A028');
                            if(u.IsAbility('B00B')==true){ 
                                u.AddAbility('A029');
                            }  
                        } 
                        data.r[4]-=0.02;
                    }
                }
                if(data.i[0]==3){//结束硬直
                    data.i[0]=18;
                }
                if(u.Alive()==false){
                    data.i[0]=18;
                }
                if(data.i[0]==18){//技能结束
                    u.RemoveAbility('A029');
                    u.RemoveAbility('A028');
                    u.AnimeSpeed(1);
                    u.Pause(false);
                    Spell(data.c[1]).Destroy();
                    data.Destroy();
                    ReleaseTimer(GetExpiredTimer());
                }
            }
        } 
        //1
        static method R(Spell e){
            Units u=Units.Get(e.Spell);
            timer t=NewTimer();
            Data data=Data.create('A027');
            u.Pause(true); 
            u.SetF(u.F(),true);
            u.AnimeId(1);
            Dash.Start(u.unit,u.F()+180,100,Dash.ADD,25,true,false);
            data.c[0]=u;
            data.c[1]=e;
            data.i[0]=0; 
            data.r[0]=1;
            data.r[1]=0.2;
            data.i[4]=0;
            SetTimerData(t,data); 
            TimerStart(t,0.3,true,function MR.R1);
            t=null;
        }

        static method HERO_START(Spell e){
            Units u=Units.Get(e.Spell);
            if(e.Id=='A020'||e.Id=='A025'){
                u.FlushAnimeId(2);
                e.Destroy();
            }
            if(e.Id=='A027'){
                if(u.IsAbility('B00B')==false){
                    u.FlushAnimeId(2);
                    e.Destroy();
                }else{
                    if(u.MP()>=200.0){
                        if(u.GetAbilityCD('A027')==0){ 
                            SpellText(u.unit,'A027',3,15);
                            u.SetMP(u.MP()-200);
                            u.SetAbilityCD('A027',20);
                            MR.R(e); 
                        }else{
                            e.Destroy();
                        }
                    }else{
                        e.Destroy();
                    }
                }
            }
        } 

        static method onInit(){ 
            Spell.On(Spell.onSpell,'A027',MR.R);
            Spell.On(Spell.onSpell,'A020',MR.W);
            Spell.On(Spell.onSpell,'A025',MR.E);
            Spell.On(Spell.onReady,'A020',MR.HERO_START);
            Spell.On(Spell.onReady,'A025',MR.HERO_START);
            Spell.On(Spell.onReady,'A027',MR.HERO_START);
            Units.On(Units.onHeroDeath,MR.Death);
            Damage.On(Damage.onUnitDamage_SubDamage,MR.Damage); 
            Units.On(Units.onHeroSpawn,MR.Spawn);
        }
    }

}