library DazzleMaster requires TimerUtils,Groups,Units{
    //英雄'炫纹大师'技能
    //SR级英雄

    public struct DazzleMaster{

        //攻击3次获得一个无属性炫纹
        static method Attack(DamageArgs e){
            Data data;
            if(e.DamageUnit.IsAbility('A008')==true){
                data=Data(e.DamageUnit.Obj);
                if(data.i[0]==2){
                    data.i[0]=0;
                    DazzleMaster.AddDazzle(e.DamageUnit.unit,0);
                }else{
                    data.i[0]+=1;
                }
            }
        }

        //炫纹死亡
        static method Death(Units u,Units m){
            Data data;
            if(u.aid=='A008'){
                data=Data(u.Obj);
                GroupRemoveUnit(data.g[0],u.unit);
                u.RemoveObj(); 
            }
        }

        //为指定单位添加一个炫纹
        static method AddDazzle(unit u,integer id){
            Units s=Units.Get(u);
            Data data=Data(s.Obj);
            Units mj=Units.MJ(s.player.player,'e008','A008',id,s.X(),s.Y(),0,15,1.5,1, "stand","Abilities\\Weapons\\BloodElfMissile\\BloodElfMissile.mdl");
            mj.AddObj(data);
            GroupAddUnit(data.g[0],mj.unit); 
        }

        //炫纹大师被创建时触发,绑定炫纹数据开启计时器
        static method Spawn(Units u,Units m){
            timer t;
            Data data;
            if(u.IsAbility('A008')==true){
                t=NewTimer();
                data=Data.create('A008');
                data.c[0]=u;
                data.r[0]=0;//'炫纹发射'带来的移动速度加成总额
                data.r[1]=0;//'炫纹发射'带来的攻击速度加成总额
                data.r[2]=0;//用于计算炫纹上下浮动的值
                data.i[0]=0;//用于计算无属性炫纹的触发
                data.g[0]=CreateGroup();//炫纹单位组
                u.AddObj(data);
                SetTimerData(t,data);
                TimerStart(t,0.01,true,function(){
                    Data data=Data(GetTimerData(GetExpiredTimer()));
                    Units u=Units(data.c[0]);
                    Units tmp;
                    real h=0,x,y,dis,fa,ra;
                    data.r[2]=data.r[2]+1;
                    if(data.r[2]>96) data.r[2]=data.r[2]-96;
                    if(u.Alive()==false){                    
                        GroupAddGroup(data.g[0],tmp_group);
                        while(FirstOfGroup(tmp_group)!=null){
                            tmp=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,tmp.unit);
                            Units.Kill(tmp.unit);
                        }
                        GroupClear(tmp_group);
                        ReleaseTimer(GetExpiredTimer());
                        DestroyGroup(data.g[0]);
                        data.g[0]=null;
                        u.RemoveObj();
                        data.Destroy();  
                    }else{
                        x=u.X()+(75+GroupNumber(data.g[0])*3)*CosBJ(u.F()+180);
                        y=u.Y()+(75+GroupNumber(data.g[0])*3)*SinBJ(u.F()+180);
                        GroupAddGroup(data.g[0],tmp_group);  
                        while(FirstOfGroup(tmp_group)!=null){
                            tmp=Units.Get(FirstOfGroup(tmp_group));
                            ra=360.0/GroupNumber(data.g[0])*(h/5);
                            dis=(Util.XY2(tmp.unit,u.unit)/50)+(GroupNumber(data.g[0])*3); 
                            x=x+(dis)*CosBJ(ra);
                            y=y+(dis)*SinBJ(ra);
                            tmp.Position(x,y,false);
                            tmp.SetH(70+(150*Util.GetPwx(3.99,data.r[2]+GetRandomReal(0,10),96)));
                            GroupRemoveUnit(tmp_group,tmp.unit);
                            h=h+5; 
                        }
                        GroupClear(tmp_group);
                    }
                });
                t=null;
            }
            
        }

        static method HERO_START(Spell e){
            if(e.Id=='A009'){
                Units.Get(e.Spell).AnimeSpeed(0.7);
                Units.Get(e.Spell).FlushAnimeId(5); 
            }
            e.Destroy();
        }

        static method HERO_STOP(Spell e){
            Units.Get(e.Spell).AnimeSpeed(1);
            e.Destroy();
        }
    }

    function onInit(){
        //Spell.On(Spell.onSpell,'A009',DazzleMaster.Q);
        Spell.On(Spell.onReady,'A009',DazzleMaster.HERO_START);
        Spell.On(Spell.onStop,'A009',DazzleMaster.HERO_STOP);   
        Damage.On(Damage.onHeroDamageed,DazzleMaster.Attack);
        Units.On(Units.onHeroSpawn,DazzleMaster.Spawn);
        Units.On(Units.onAlocDeath,DazzleMaster.Death);
    }
}