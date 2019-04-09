library Shiki requires Groups{
    //英雄‘极死·七夜’的技能
    //SR
    struct Shiki{

        static method Order(EventArgs e){
            Units u=Units.Get(e.TriggerUnit);
            real f; 
            if(是七夜)
                if(e.OrderTargetUnit==null){ 
                    f=Util.XYEX(u.X(),u.Y(),e.OrderTargetX,e.OrderTargetY);
                }else{
                    f=Util.XY(u.unit,e.OrderTargetUnit);
                }
                u.Position(u.X(),u.Y(),true);
                u.SetF(f,false);
            } 
                  
        }


        static method onInit(){ 
            Events.On(Events.onUnitOrderToUnit,Shiki.Order);
            Events.On(Events.onUnitOrderToLocation,Shiki.Order); 
        }
    }
}

        