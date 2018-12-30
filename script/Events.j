library Events requires Table{
    //魔兽原生事件的统一管理类

    type EventInterface extends function(EventArgs);

    public struct EventArgs{
        //事件参数，包装所有事件可能的参数传递
        
        unit DeathUnit;//死亡单位
        unit KillUnit;//凶手单位
        unit TriggerUnit;//触发单位 
        unit LevelUpUnit;//升级单位
        unit BuyingUnit;//购买单位
        unit SpellTargetUnit;//技能目标单位
        real SpellTargetX;//技能目标X
        real SpellTargetY;//技能目标Y
        integer SpellId;//施放的技能ID
        player TriggerPlayer;//触发玩家
        unit DamageUnit;//伤害来源
        real Damage;//伤害值
        boolean RangeDamage;//是否是远程伤害
        boolean AttackDamage;//是否是攻击伤害
        boolean MagicDamage;//是否是法术伤害 
        item BuyItem;//购买的物品
        string ChatString;//输入的聊天信息
        
        static method create()->EventArgs{
            EventArgs e=EventArgs.allocate();
            return e;
        }

        method Destroy(){
            this.KillUnit=null;
            this.SpellTargetUnit=null;
            this.LevelUpUnit=null;
            this.TriggerUnit=null;
            this.DeathUnit=null;
            this.TriggerPlayer=null; 
            this.DamageUnit=null;
            this.BuyingUnit=null; 
            this.BuyItem=null;
            this.ChatString=null;
            this.deallocate();
        }
    }

    public struct Events{
        //事件注册类
        public  {
            static constant string onUnitDeath="Events.UnitDeath";//任意单位死亡
            static constant string onUnitDeacy="Events.UnitDeacy";//任意单位开始腐化(真的死亡)
            static constant string onPlayerDisconnect="Events.PlayerDisconnect";//任意玩家离开游戏
            static constant string onUnitDamage="Events.UnitDamage";//任意单位受到伤害
            static constant string onUnitSpell="Events.onUnitSpell";//任意单位发动技能效果 
            static constant string onUnitReadySpell="Events.onUnitReadySpell";//任意单位准备发动技能效果
            static constant string onUnitStartSpell="Events.onUnitStartSpell";//任意单位开始发动技能效果
            static constant string onUnitStopSpell="Events.onUnitStopSpell";//任意单位停止发动技能效果
            static constant string onHeroLevelUp="Events.onHeroLevelUp";//任意英雄升级 
            static constant string onUnitSellItem="Events.onUnitSellItem";//任意单位出售物品
            static constant string onPlayerChat="Events.onPlayerChat";//任意玩家发消息
            static constant string onPlayerSelectUnit="Events.onPlayerSelectUnit";//任意玩家选择单位

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
        e.DamageUnit=GetEventDamageSource();
        e.Damage=GetEventDamage();
        e.RangeDamage=YDWEIsEventRangedDamage();
        e.AttackDamage=YDWEIsEventAttackDamage();
        e.MagicDamage=!YDWEIsEventPhysicalDamage();
        e.TriggerUnit=GetTriggerUnit(); 
        e.TriggerPlayer=GetTriggerPlayer();
        e.SpellTargetUnit=GetSpellTargetUnit();
        e.SpellTargetX=GetSpellTargetX();
        e.SpellTargetY=GetSpellTargetY();
        e.SpellId=GetSpellAbilityId();
        e.LevelUpUnit=GetLevelingUnit(); 
        e.BuyingUnit=GetBuyingUnit();
        e.BuyItem=GetSoldItem();
        e.ChatString=GetEventPlayerChatString();
        for(1<=i<Table[Events.$name$][0]){ 
            callback=EventInterface(Table[Events.$name$][i]);
            callback.evaluate(e);
        }
        e.Destroy();
    }

//! endtextmacro

//! runtextmacro RegisterAction("onUnitDeath")
//! runtextmacro RegisterAction("onPlayerDisconnect")
//! runtextmacro RegisterAction("onUnitDamage")
//! runtextmacro RegisterAction("onUnitSpell")
//! runtextmacro RegisterAction("onUnitReadySpell")
//! runtextmacro RegisterAction("onUnitStartSpell")
//! runtextmacro RegisterAction("onUnitStopSpell")
//! runtextmacro RegisterAction("onHeroLevelUp") 
//! runtextmacro RegisterAction("onUnitDeacy") 
//! runtextmacro RegisterAction("onUnitSellItem") 
//! runtextmacro RegisterAction("onPlayerChat") 
//! runtextmacro RegisterAction("onPlayerSelectUnit") 


    function onInit(){
        trigger t; 
        integer index;
        //! textmacro RegisterEvent takes tri,event,action
        t=CreateTrigger();
        $tri$(t, $event$ );
        TriggerAddAction(t,function $action$); 
        //! endtextmacro
        //! runtextmacro RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_UNIT_DEATH","Event_onUnitDeath")
        //! runtextmacro RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_UNIT_SPELL_EFFECT","Event_onUnitSpell")
        //! runtextmacro RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_HERO_LEVEL","Event_onHeroLevelUp")
        //! runtextmacro RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_UNIT_SPELL_CHANNEL","Event_onUnitReadySpell")
        //! runtextmacro RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_UNIT_SPELL_CAST","Event_onUnitStartSpell")
        //! runtextmacro RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_UNIT_SPELL_ENDCAST","Event_onUnitStopSpell")
        //! runtextmacro RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_UNIT_DECAY","Event_onUnitDeacy")
        //! runtextmacro RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_UNIT_SELL_ITEM","Event_onUnitSellItem")
 
  
        //! textmacro RegisterArgsEvent takes tri,args,event,action
        t=CreateTrigger();
        $tri$(t,$args$, $event$ );
        TriggerAddAction(t,function $action$); 
        //! endtextmacro 

            
        //! textmacro AllPlayerRegisterEvent takes tri,event,action,args
        t=CreateTrigger();
        for(0<=index<=12){
            $tri$( t, Player(index) $args$ );
        } 
        TriggerAddAction(t, function $action$);
        //! endtextmacro
        //! runtextmacro AllPlayerRegisterEvent("TriggerRegisterPlayerEventLeave","","Event_onPlayerDisconnect","")
        //! runtextmacro AllPlayerRegisterEvent("TriggerRegisterPlayerChatEvent","","Event_onPlayerChat",",\"\",false")
        //! runtextmacro AllPlayerRegisterEvent("TriggerRegisterPlayerSelectionEventBJ","","Event_onPlayerSelectUnit",",true")

        t=CreateTrigger();
        YDWESyStemAnyUnitDamagedRegistTrigger( t );
        TriggerAddAction(t, function Event_onUnitDamage);
        t=null;
    }

}