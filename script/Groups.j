library Groups requires Units,Damage{
    //一些常用的单位组判断


    public group tmp_group=CreateGroup();//公共单位组 
    public unit LAST_FIND_UNIT=null;//最后搜寻的单位
    group tmp_find_group=CreateGroup();//寻找单位用的临时组
    group tmp_create_group=CreateGroup();//寻找最早单位用的临时租
    group tmp_damage_group=CreateGroup();//范围伤害用的临时组
    group tmp_random_group=CreateGroup();//寻找随机单位用的临时租
    group tmp_cdj_group=CreateGroup();//场地技寻找周围场地技的临时租
    public group tmp_death_group=CreateGroup();//在死亡事件中使用的临时组
    public integer tmp_group_count;//用于计算单位组中单位数量的临时变量

    //返回单位组内单位数量
    public function GroupNumber(group g)->integer{
        return CountUnitsInGroup(g);
    }

    //是否是投射物单位
    public function GroupIsTSW()->boolean{
        return GetUnitAbilityLevel(GetFilterUnit(),Units.MJType_TSW)==1;
    }
    //是否是放置物单位
    public function GroupIsFZW()->boolean{
        return GetUnitAbilityLevel(GetFilterUnit(),Units.MJType_FZW)==1;
    }
    //是否是场地物单位
    public function GroupIsCDW()->boolean{
        return GetUnitAbilityLevel(GetFilterUnit(),Units.MJType_CDW)==1;
    }
    
    //是否可以被选取
    public function GroupIsNotSelect()->boolean{
        return GetUnitAbilityLevel(GetFilterUnit(),Units.Group_NotSelect)==0;
    }

    //是否是建筑
    public function GroupIsHouse()->boolean{
        return IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE);
    }

    //是否是英雄
    public function GroupIsHero()->boolean{
        return IsUnitType(GetFilterUnit(), UNIT_TYPE_HERO);
    }

    //是否存活
    public function GroupIsNotAlive()->boolean{ 
        return GetUnitState(GetFilterUnit(), UNIT_STATE_LIFE) >0;
    }

    //是否不是蝗虫单位
    public function GroupIsNotAloc()->boolean{
        return GetUnitAbilityLevel(GetFilterUnit(),'Aloc')==0&&GetUnitAbilityLevel(GetFilterUnit(),'A01Z')==0;
    }

    //是否是蝗虫单位
    public function GroupIsAloc()->boolean{
        return GetUnitAbilityLevel(GetFilterUnit(),'Aloc')==1||GetUnitAbilityLevel(GetFilterUnit(),'A01Z')==1;
    }

    //存活且是蝗虫单位
    public function GroupIsAliveAloc()->boolean{
        return GroupIsAloc()&&GroupIsNotAlive()&&GroupIsNotSelect();
    }

    //存活且不是蝗虫单位且是英雄
    public function GroupIsHeroAliveNotAloc()->boolean{
        return GroupIsNotAloc()&&GroupIsNotAlive()&&GroupIsHero()&&GroupIsNotSelect();
    }
    


    //存活并且不是蝗虫单位
    public function GroupIsAliveNotAloc()->boolean{
        return GroupIsNotAloc()&&GroupIsNotAlive()&&!GroupIsHouse()&&GroupIsNotSelect();
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
    public function GroupDamage(Units u,real x,real y,real dis,real dmg,real dmgtype,integer aid,boolean hero)
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

    //杀死x,y为圆心，范围1200码内的所有场地技
    public function KillCDJ(real x,real y){
        unit tmp;  
        GroupEnumUnitsInRange(tmp_cdj_group,x,y,1200,function GroupIsCDW);  
        while(FirstOfGroup(tmp_cdj_group)!=null){
            tmp=FirstOfGroup(tmp_cdj_group);
            GroupRemoveUnit(tmp_cdj_group,tmp);
            if(GetUnitAbilityLevel(tmp,Units.MJType_CDW)==1){
                SetUnitUserData(tmp,0);
            }
        }         
        GroupClear(tmp_cdj_group);
        tmp=null;
         
    }
}