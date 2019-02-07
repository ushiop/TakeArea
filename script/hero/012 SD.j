library SD requires Groups{
    //英雄‘水门’的技能
    //SSR
    struct SD{

        //友军标记
        static method Spawn(Units u,Units m){
            Data data;
            if(u.IsAbility('A03I')==true){
                data=Data.create('A03I');
                data.c[0]=u;
                data.u[0]=null;//W-苦无需求
                data.r[0]=0;//上友军BUFF的间隔
                Buffs.Add(u.unit,'A03L','B00T',86400,false);
                Timers.Start(0.01,data,function(Timers t){
                    Data data=Data(t.Data());
                    Units u=Units(data.c[0]);
                    Units mj;
                    if(u.Alive()==false){
                        BJDebugMsg("结束了-4D");
                        t.Destroy();
                        data.Destroy();
                    }else{
                        if(data.r[0]<=0){//友军标记 上BUFF
                            data.r[0]=1; 
                            GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),9999999999,function GroupIsAliveNotAloc);     
                            while(FirstOfGroup(tmp_group)!=null){
                                mj=Units.Get(FirstOfGroup(tmp_group));
                                GroupRemoveUnit(tmp_group,mj.unit);
                                if(mj.unit!=u.unit&&mj.isHero==true&&IsUnitAlly(mj.unit,u.player.player)==true){
                                    Buffs.Add(mj.unit,'A03J','B00S',86400,false);
                                }
                            }  
                            GroupClear(tmp_group);  
                        }else{
                            data.r[0]-=0.01;
                        } 
                        if(u.IsAbility('B00T')==true){//放置苦无 需求
                            if(data.u[0]==null){
                                data.u[0]=Units.MJ(u.player.player,'e00I','A03I',5,0,0,0,86400,1,1, "stand",".mdx").unit; 
                            }
                        }else{
                            if(data.u[0]!=null){
                                Units.Remove(data.u[0]); 
                                data.u[0]=null;
                            }
                        }
                    }
                });
            }  
        }
 
        static method W(Spell e){
            Units u=Units.Get(e.Spell);
            Buffs b;
            Units mj;
            if(u.IsAbility('B00T')==true){
                b=Buffs.Find(u.unit,'B00T');
                b.Level-=1;
                if(b.Level<1){
                    b.Stop();
                }
                mj=Units.MJ(u.player.player,'e008','A03K',0,u.X()+75*CosBJ(u.F()),u.Y()+75*SinBJ(u.F()),0,86400,1.5,1, "stand","fls_kw_ex.mdl"); 
                mj.Position(mj.X(),mj.Y(),true);
                mj.AddAbility(Units.MJType_FZW);
                
            }
            e.Destroy();
        }
 
        static method HERO_START(Spell e){
            Units u=Units.Get(e.Spell);
            if(e.Id=='A03K'){
                u.FlushAnimeId(8);
                u.AnimeSpeed(0.5);
            }
            e.Destroy();
        }

        static method HERO_STOP(Spell e){
            Units u=Units.Get(e.Spell);
            u.AnimeSpeed(1);
            e.Destroy();
        }

        static method onInit(){ 
            Spell.On(Spell.onSpell,'A03K',SD.W);
            Spell.On(Spell.onReady,'A03K',SD.HERO_START);
            Spell.On(Spell.onStop,'A03K',SD.HERO_STOP);   
            Units.On(Units.onHeroSpawn,SD.Spawn);
        }
    }
}