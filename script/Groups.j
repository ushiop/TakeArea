library Groups requires Units,Damage,Init{
    //一些常用的单位组判断



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
}