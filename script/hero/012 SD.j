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
                Timers.Start(1,data,function(Timers t){
                    Data data=Data(t.Data());
                    Units u=Units(data.c[0]);
                    Units mj;
                    if(u.Alive()==false){
                        BJDebugMsg("结束了-4D");
                        t.Destroy();
                        data.Destroy();
                    }else{
                        GroupEnumUnitsInRange(tmp_group,u.X(),u.Y(),9999999999,function GroupIsAliveNotAloc);     
                        while(FirstOfGroup(tmp_group)!=null){
                            mj=Units.Get(FirstOfGroup(tmp_group));
                            GroupRemoveUnit(tmp_group,mj.unit);
                            if(mj.unit!=u.unit&&mj.isHero==true&&IsUnitAlly(mj.unit,u.player.player)==true){
                                Buffs.Add(mj.unit,'A03J','B00S',86400,false);
                            }
                        }  
                        GroupClear(tmp_group);   
                    }
                });
            } 
                              
            
        }

        static method onInit(){
            Units.On(Units.onHeroSpawn,SD.Spawn);
        }
    }
}