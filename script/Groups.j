library Groups requires Units,Damage{
    //一些常用的单位组判断


    public group tmp_group=CreateGroup();//公共单位组 
    public unit LAST_FIND_UNIT=null;//最后搜寻的单位

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

    //让U对范围内的单位造成一次伤害
    public function GroupDamage(Units u,real x,real y,real dis,real dmg,integer dmgtype,integer aid,boolean hero)
    {  
        Units tmp;
        boolean f=false;
        GroupEnumUnitsInRange(tmp_group,x,y,dis,function GroupIsAliveNotAloc); 
        while(FirstOfGroup(tmp_group)!=null){
            tmp=Units.Get(FirstOfGroup(tmp_group));
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
            GroupRemoveUnit(tmp_group,tmp.unit);
        }  
        GroupClear(tmp_group);
    }

    //在X Y的DIS范围内帮U寻找一个最近的敌人，HERO为是否英雄优先,true为优先
    public function GroupFind(unit u,real x,real y,real dis,boolean hero)->unit{
        unit tmp;
        real rdis=9999999999;
        unit lock=null;
        GroupEnumUnitsInRange(tmp_group,x,y,dis,function GroupIsAliveNotAloc); 
        while(FirstOfGroup(tmp_group)!=null){
            tmp=FirstOfGroup(tmp_group); 
            if(IsUnitEnemy(tmp,GetOwningPlayer(u))==true){  
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
            GroupRemoveUnit(tmp_group,tmp);
        }  
        GroupClear(tmp_group);       
        if(lock!=null){
            LAST_FIND_UNIT=lock;
            lock=null;
            return LAST_FIND_UNIT;
        }
        return null;
    }
}