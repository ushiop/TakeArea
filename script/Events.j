library Events requires Table{
    //魔兽原生事件的统一管理类

    type EventInterface extends function(EventArgs);

    public struct EventArgs{
        //事件参数，包装所有事件可能的参数传递
        
        unit DeathUnit;//死亡单位
        unit KillUnit;//凶手单位
        unit TriggerUnit;//触发单位
        player TriggerPlayer;//触发玩家
        integer TriggerKey;//被按下的键
        player TriggerKeyPlayer;//触发硬件事件的玩家,网易怕不是个睿智哦
        
        static method create()->EventArgs{
            EventArgs e=EventArgs.allocate();
            return e;
        }

        method Destroy(){
            this.KillUnit=null;
            this.TriggerUnit=null;
            this.DeathUnit=null;
            this.TriggerPlayer=null;
            this.TriggerKeyPlayer=null;
            this.deallocate();
        }
    }

    public struct Events{
        //事件注册类
        public  {
            static constant string onUnitDeath="Events.UnitDeath";//任意单位死亡
            static constant string onPlayerDisconnect="Events.PlayerDisconnect";//任意玩家离开游戏
            static constant string onPressKeyDown="Event.PressKeyDown";//任意按键被按下
            static constant string onPressKeyUp="Event.PressKeyUp";//任意按键被松开

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

//! textmacro RegisterAction takes name 

    function Event_$name$(){
        integer i;
        EventInterface callback;
        EventArgs e=EventArgs.create();
        e.DeathUnit=GetDyingUnit();
        e.KillUnit=GetKillingUnit();
        e.TriggerUnit=GetTriggerUnit(); 
        e.TriggerPlayer=GetTriggerPlayer();
        e.TriggerKey=DzGetTriggerKey();
        e.TriggerKeyPlayer=DzGetTriggerKeyPlayer();
        for(1<=i<Table[Events.$name$][0]){ 
            callback=EventInterface(Table[Events.$name$][i]);
            callback.evaluate(e);
        }
        e.Destroy();
    }

//! endtextmacro

//! runtextmacro RegisterAction("onUnitDeath")
//! runtextmacro RegisterAction("onPlayerDisconnect")
//! runtextmacro RegisterAction("onPressKeyDown")
//! runtextmacro RegisterAction("onPressKeyUp")

    function onInit(){
        trigger t; 
        integer index;
        //! textmacro RegisterEvent takes tri,event,action
        t=CreateTrigger();
        $tri$(t, $event$ );
        TriggerAddAction(t,function $action$); 
        //! endtextmacro
        //! runtextmacro RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_UNIT_DEATH","Event_onUnitDeath")
 
        //! textmacro RegisterArgsEvent takes tri,args,event,action
        t=CreateTrigger();
        $tri$(t,$args$, $event$ );
        TriggerAddAction(t,function $action$); 
        //! endtextmacro
        //! runtextmacro RegisterArgsEvent("DzTriggerRegisterKeyEventTrg","1","113","Event_onPressKeyDown")
        //! runtextmacro RegisterArgsEvent("DzTriggerRegisterKeyEventTrg","0","113","Event_onPressKeyUp")
        //! runtextmacro RegisterArgsEvent("DzTriggerRegisterKeyEventTrg","1","'Q'","Event_onPressKeyDown") 
        //! runtextmacro RegisterArgsEvent("DzTriggerRegisterKeyEventTrg","1","'W'","Event_onPressKeyDown")               
        //! runtextmacro RegisterArgsEvent("DzTriggerRegisterKeyEventTrg","1","'E'","Event_onPressKeyDown") 
            
        //! textmacro AllPlayerRegisterEvent takes tri,event,action
        t=CreateTrigger();
        for(0<=index<=12){
            $tri$( t, Player(index) );
        } 
        TriggerAddAction(t, function $action$);
        //! endtextmacro
        //! runtextmacro AllPlayerRegisterEvent("TriggerRegisterPlayerEventLeave","","Event_onPlayerDisconnect")

        t=null;
    }

}