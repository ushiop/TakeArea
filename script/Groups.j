library Groups requires Units,Damage{
    //一些常用的单位组判断


    public group tmp_group=CreateGroup();//公共单位组 
    public unit LAST_FIND_UNIT=null;//最后搜寻的单位
    group tmp_find_group=CreateGroup();//寻找单位用的临时组
    group tmp_create_group=CreateGroup();//寻找最早单位用的临时租
    group tmp_damage_group=CreateGroup();//范围伤害用的临时组
    group tmp_random_group=CreateGroup();//寻找随机单位用的临时租

    //返回单位组内单位数量
    public function GroupNumber(group g)->integer{
        return CountUnitsInGroup(g);
    }

    //是否是建筑
    public function GroupIsNotHouse()->boolean{
        return IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE);
    }

    //是否存活
    public function GroupIsNotAlive()->boolean{ 
        return IsUnitAliveBJ(GetFilterUnit());
    }

    //是否不是蝗虫单位
    public function GroupIsNotAloc()->boolean{
        return GetUnitAbilityLevel(GetFilterUnit(),'Aloc')==0;
    }

    //是否是蝗虫单位
    public function GroupIsAloc()->boolean{
        return GetUnitAbilityLevel(GetFilterUnit(),'Aloc')==1;
    }

    //存活且是蝗虫单位
    public function GroupIsAliveAloc()->boolean{
        return GroupIsAloc()&&GroupIsNotAlive();
    }


    //存活并且不是蝗虫单位
    public function GroupIsAliveNotAloc()->boolean{
        return GroupIsNotAloc()&&GroupIsNotAlive()&&!GroupIsNotHouse();
    }

    //返回指定单位组内最早出生的单位
    //最早出生，而不是第一个
    public function GroupFirst(group g)->unit{
        Units tmp;
        real c=99999;
        unit r=null;
        
        GroupAddGroup(g,tmp_create_group);
        while(FirstOfGroup(tmp_create_group)!=null){
            tmp=Units.Get(FirstOfGroup(tmp_create_group));
            GroupRemoveUnit(tmp_create_group,tmp.unit);
            if(tmp.createtime<c){
                r=tmp.unit;
                c=tmp.createtime;
            }
        }
        GroupClear(tmp_create_group);
        if(r!=null){
            LAST_FIND_UNIT=r;
            r=null;
            return LAST_FIND_UNIT;
        }
        return null;        
    }

    //让U对范围内的单位造成一次伤害
    public function GroupDamage(Units u,real x,real y,real dis,real dmg,integer dmgtype,integer aid,boolean hero)
    {  
        Units tmp;
        boolean f=false;
        GroupEnumUnitsInRange(tmp_damage_group,x,y,dis,function GroupIsAliveNotAloc); 
        while(FirstOfGroup(tmp_damage_group)!=null){
            tmp=Units.Get(FirstOfGroup(tmp_damage_group));
            f=false;
            if(IsUnitEnemy(tmp.unit,u.player.player)==true){  
                if(hero==true){
                    f=tmp.isHero;
                }else{
                    f=true;
                }
                if(f==true){ 
                    u.Damage(tmp.unit,dmgtype,aid,dmg); 
                }
            }
            GroupRemoveUnit(tmp_damage_group,tmp.unit);
        }  
        GroupClear(tmp_damage_group);
    }

    //在X Y的DIS范围内帮U寻找一个最近的敌人，HERO为是否英雄优先,true为优先
    //team为友军判定，true为友军,false为敌军
    public function GroupFind(unit u,real x,real y,real dis,boolean hero,boolean team)->unit{
        unit tmp;
        real rdis=9999999999;
        unit lock=null;
        GroupEnumUnitsInRange(tmp_find_group,x,y,dis,function GroupIsAliveNotAloc); 
        while(FirstOfGroup(tmp_find_group)!=null){
            tmp=FirstOfGroup(tmp_find_group); 
            if(tmp!=u){
                if(IsUnitEnemy(tmp,GetOwningPlayer(u))==!team){  
                    if(Util.XY2(tmp,u)<rdis){
                        if(hero==true){
                            if(IsUnitType(tmp,UNIT_TYPE_HERO)==true){ 
                                lock=tmp;
                                rdis=Util.XY2(tmp,u);
                            }else if(IsUnitType(lock,UNIT_TYPE_HERO)==false){
                                lock=tmp;
                                rdis=Util.XY2(tmp,u);                            
                            }
                        }else{
                            lock=tmp;
                            rdis=Util.XY2(tmp,u);
                        }
                    }
                }
            } 
            GroupRemoveUnit(tmp_find_group,tmp);
        }  
        GroupClear(tmp_find_group);     
        tmp=null;  
        if(lock!=null){
            LAST_FIND_UNIT=lock;
            lock=null;
            return LAST_FIND_UNIT;
        }
        return null; 
    }

    //在X Y的DIS范围内帮U寻找一个最近的敌人，HERO为是否英雄优先,true为优先
    //filter为排除某个单位
    //team为友军判定，true为友军,false为敌军
    public function GroupFindFilter(unit u,real x,real y,real dis,boolean hero,boolean team,unit filter)->unit{
        unit tmp;
        real rdis=9999999999;
        unit lock=null;
        GroupEnumUnitsInRange(tmp_find_group,x,y,dis,function GroupIsAliveNotAloc); 
        while(FirstOfGroup(tmp_find_group)!=null){
            tmp=FirstOfGroup(tmp_find_group); 
            if(filter!=tmp&&u!=tmp){
                if(IsUnitEnemy(tmp,GetOwningPlayer(u))==!team){  
                    if(Util.XY2(tmp,u)<rdis){
                        if(hero==true){
                            if(IsUnitType(tmp,UNIT_TYPE_HERO)==true){ 
                                lock=tmp;
                                rdis=Util.XY2(tmp,u);
                            }else if(IsUnitType(lock,UNIT_TYPE_HERO)==false){
                                lock=tmp;
                                rdis=Util.XY2(tmp,u);                            
                            }
                        }else{
                            lock=tmp;
                            rdis=Util.XY2(tmp,u);
                        }
                    }
                } 
            }
            GroupRemoveUnit(tmp_find_group,tmp);
        }  
        GroupClear(tmp_find_group);    
        tmp=null;   
        if(lock!=null){
            LAST_FIND_UNIT=lock;
            lock=null;
            return LAST_FIND_UNIT;
        }
        return null;
    }


    //在X Y的DIS范围内随机寻找一个敌人
    //filter为排除某个单位
    //team为是否为友军,true随机选取友军,false随机选取敌军
    public function GroupRandom(unit u,real x,real y,real dis,boolean team)->unit{
        unit tmp; 
        group g=CreateGroup();
        GroupEnumUnitsInRange(tmp_random_group,x,y,dis,function GroupIsAliveNotAloc); 
        GroupAddGroup(tmp_random_group,g);
        while(FirstOfGroup(g)!=null){
            tmp=FirstOfGroup(g);
            GroupRemoveUnit(g,tmp);
            if(IsUnitEnemy(tmp,GetOwningPlayer(u))==team){
                GroupRemoveUnit(tmp_random_group,tmp);
            }
        }        
        DestroyGroup(g);
        GroupRemoveUnit(tmp_random_group,u);
        g=null;
        tmp=null;
        tmp=GroupPickRandomUnit(tmp_random_group);
        GroupClear(tmp_random_group);   
        if(tmp!=null){
            LAST_FIND_UNIT=tmp;
            tmp=null;
            return LAST_FIND_UNIT;
        }
        return null;
    }

    //在X Y的DIS范围内随机寻找一个敌人
    //filter为排除某个单位 
    //team为是否为友军,true随机选取友军,false随机选取敌军
    public function GroupRandomFilter(unit u,real x,real y,real dis,boolean team,unit filter)->unit{
        unit tmp; 
        group g=CreateGroup();
        GroupEnumUnitsInRange(tmp_random_group,x,y,dis,function GroupIsAliveNotAloc); 
        GroupAddGroup(tmp_random_group,g);
        while(FirstOfGroup(g)!=null){
            tmp=FirstOfGroup(g);
            GroupRemoveUnit(g,tmp);
            if(IsUnitEnemy(tmp,GetOwningPlayer(u))==team||filter==tmp){
                GroupRemoveUnit(tmp_random_group,tmp);
            }
        }        
        DestroyGroup(g);
        GroupRemoveUnit(tmp_random_group,u);
        g=null;
        tmp=null;
        tmp=GroupPickRandomUnit(tmp_random_group);
        GroupClear(tmp_random_group);   
        if(tmp!=null){
            LAST_FIND_UNIT=tmp;
            tmp=null;
            return LAST_FIND_UNIT;
        }
        return null;
    }


}