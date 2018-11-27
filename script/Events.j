library Events requires Table{
    //魔兽原生事件的统一管理类

    type EventInterface extends function(EventArgs);

    public struct EventArgs{
        //事件参数，包装所有事件可能的参数传递
        
        unit DeathUnit;//死亡单位
        unit KillUnit;//凶手单位
        unit TriggerUnit;//触发单位
        
        static method create()->EventArgs{
            EventArgs e=EventArgs.allocate();
            return e;
        }

        method Destroy(){
            this.KillUnit=null;
            this.TriggerUnit=null;
            this.DeathUnit=null;
            this.deallocate();
        }
    }

    public struct Events{
        //事件注册类
        public  {
            static constant string onUnitDeath="Events.UnitDeath";//任意单位死亡
            static constant string onPlayerDisconnect="PlayerDisconnect";//任意玩家离开游戏

            //注册事件，触发时调用callback
            static method On(string eName,EventInterface callback){  
                if(Table[eName][0]==0){ 
                    Table[eName][0]=1;
                }
                Table[eName][Table[eName][0]]=callback;
                Table[eName][0]=Table[eName][0]+1;
            }
        }
    }

    //任意单位死亡
    function UnitDeath(){
        integer i;
        EventInterface callback;
        EventArgs e=EventArgs.create();
        e.DeathUnit=GetDyingUnit();
        e.KillUnit=GetKillingUnit();
        e.TriggerUnit=GetTriggerUnit(); 
        for(0<=i<Table[Events.onUnitDeath][0]){ 
            callback=EventInterface(Table[Events.onUnitDeath][i]);
            callback.evaluate(e);
        }
        e.Destroy();
        BJDebugMsg("实例回收"+GetUnitName(e.TriggerUnit));
    }


    function onInit(){ 
        trigger t=CreateTrigger();
        TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_DEATH );
        TriggerAddAction(t,function UnitDeath);
        t=null;
    }

}