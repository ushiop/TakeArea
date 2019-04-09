library Shiki requires Groups{
    //英雄‘极死·七夜’的技能
    //SR
    /*  35 屈腿
        16 踢腿
        17 上翻
        19 踢腿
        20 空踢
        36 空踢（无前摇）*/
    struct Shiki{ 

 
        static method Order(EventArgs e){
            Units u=Units.Get(e.TriggerUnit);
            real f; 
            if(u.IsAbility('A05A')==true){
                if(e.OrderTargetUnit==null){ 
                    f=Util.XYEX(u.X(),u.Y(),e.OrderTargetX,e.OrderTargetY);
                }else{
                    f=Util.XY(u.unit,e.OrderTargetUnit);
                } 
                u.SetF(f,true);
            } 
                  
        }


        static method onInit(){ 
            Events.On(Events.onUnitOrderToUnit,Shiki.Order);
            Events.On(Events.onUnitOrderToLocation,Shiki.Order); 
        }
    }
}

         