globals
//globals from BzAPI:
constant boolean LIBRARY_BzAPI=true
trigger array BzAPI__DamageEventQueue
integer BzAPI__DamageEventNumber= 0
//endglobals from BzAPI
//globals from Players:
constant boolean LIBRARY_Players=true
//endglobals from Players
//globals from Table:
constant boolean LIBRARY_Table=true
constant integer Table___MAX_INSTANCES=8100
        //Feel free to change max instances if necessary, it will only affect allocation
        //speed which shouldn't matter that much.

    //=========================================================
hashtable Table___ht
//endglobals from Table
//globals from TakeUi:
constant boolean LIBRARY_TakeUi=true
//endglobals from TakeUi
//globals from Teams:
constant boolean LIBRARY_Teams=true
force Teams___AllPlayers
// processed:         force  array Teams___Team_Players[3]
// processed:         rect  array Teams___Team_Rect[3]
// processed:         string  array Teams___Team_Name[3]
// processed:         integer  array Teams___Team_Kills[3]
//endglobals from Teams
//globals from TimerUtils:
constant boolean LIBRARY_TimerUtils=true
        //How to tweak timer utils:
        // USE_HASH_TABLE = true  (new blue)
        //  * SAFEST
        //  * SLOWEST (though hash tables are kind of fast)
        //
        // USE_HASH_TABLE = false, USE_FLEXIBLE_OFFSET = true  (orange)
        //  * kinda safe (except there is a limit in the number of timers)
        //  * ALMOST FAST
        //
        // USE_HASH_TABLE = false, USE_FLEXIBLE_OFFSET = false (red)
        //  * THE FASTEST (though is only  faster than the previous method
        //                  after using the optimizer on the map)
        //  * THE LEAST SAFE ( you may have to tweak OFSSET manually for it to
        //                     work)
        //
constant boolean TimerUtils___USE_HASH_TABLE= false
constant boolean TimerUtils___USE_FLEXIBLE_OFFSET= true

constant integer TimerUtils___OFFSET= 0x100000
integer TimerUtils___VOFFSET= TimerUtils___OFFSET
              
        //Timers to preload at map init:
constant integer TimerUtils___QUANTITY= 256
        
        //Changing this  to something big will allow you to keep recycling
        // timers even when there are already AN INCREDIBLE AMOUNT of timers in
        // the stack. But it will make things far slower so that's probably a bad idea...
constant integer TimerUtils___ARRAY_SIZE= 8190

// processed:         integer array TimerUtils___data[TimerUtils___ARRAY_SIZE]
hashtable TimerUtils___ht
// processed:         timer array TimerUtils___tT[TimerUtils___ARRAY_SIZE]
integer TimerUtils___tN= 0
constant integer TimerUtils___HELD=0x23729801
        //use a totally random number here, the more improbable someone uses it, the better.
//endglobals from TimerUtils
//globals from Tree:
constant boolean LIBRARY_Tree=true
rect array Tree___rec
//endglobals from Tree
//globals from Util:
constant boolean LIBRARY_Util=true
//endglobals from Util
//globals from Camera:
constant boolean LIBRARY_Camera=true
//endglobals from Camera
//globals from PlayerEvent:
constant boolean LIBRARY_PlayerEvent=true
//endglobals from PlayerEvent
//globals from Units:
constant boolean LIBRARY_Units=true
//endglobals from Units
//globals from HeroRare:
constant boolean LIBRARY_HeroRare=true
// processed:     unitpool  array HeroRare___HeroRare[3]
unit HeroRare_LastRandomUnit
//endglobals from HeroRare
//globals from Winner:
constant boolean LIBRARY_Winner=true
//endglobals from Winner
//globals from Init:
constant boolean LIBRARY_Init=true
unit Origin_Ball
unit Origin_Magic
real Origin_X
real Origin_Y
//endglobals from Init
//globals from KillUi:
constant boolean LIBRARY_KillUi=true
//endglobals from KillUi
    // Generated
rect gg_rct_YeGuai_01= null
rect gg_rct_ShuLin_01= null
rect gg_rct_YeGuai_02= null
rect gg_rct_A_TEAM= null
rect gg_rct_B_TEAM= null
rect gg_rct_C_TEAM= null
sound gg_snd_ItemReceived= null
sound gg_snd_Winner= null
trigger gg_trg_init= null
unit gg_unit_e001_0011= null
unit gg_unit_e000_0010= null

trigger l__library_init

//JASSHelper struct globals:
constant integer si__Players=1
integer si__Players_F=0
integer si__Players_I=0
integer array si__Players_V
integer s__Players_ht
integer array s__Players_playerid
player array s__Players_player
integer array s__Players_teamid
integer array s__Players_Kills
integer array s__Players_Deaths
unit array s__Players_hero
constant integer si__Table___GTable=2
integer si__Table___GTable_F=0
integer si__Table___GTable_I=0
integer array si__Table___GTable_V
constant integer si__Table=3
constant integer si__StringTable=4
constant integer si__HandleTable=5
constant integer si__TakeUi=6
integer si__TakeUi_F=0
integer si__TakeUi_I=0
integer array si__TakeUi_V
integer s__TakeUi_TakeBackground
integer s__TakeUi_TakeLeftText
integer s__TakeUi_TakeMoveBar
integer s__TakeUi_TakeRightText
constant integer si__Teams=7
integer si__Teams_F=0
integer si__Teams_I=0
integer array si__Teams_V
constant integer si__Util___Util=8
integer si__Util___Util_F=0
integer si__Util___Util_I=0
integer array si__Util___Util_V
constant integer si__Units=9
integer si__Units_F=0
integer si__Units_I=0
integer array si__Units_V
integer s__Units_ht
integer array s__Units_player
boolean array s__Units_isHero
string array s__Units_name
unit array s__Units_unit
integer array s__Units_hero
constant integer si__HeroRares=10
integer si__HeroRares_F=0
integer si__HeroRares_I=0
integer array si__HeroRares_V
boolean s__HeroRares_isRepeat=false
constant integer si__Winner=11
integer si__Winner_F=0
integer si__Winner_I=0
integer array si__Winner_V
boolean s__Winner_GameEnd=false
integer s__Winner_MaxKills=100
real s__Winner_OX
real s__Winner_OY
real s__Winner_NowTime=0
real s__Winner_MaxTime=30
integer s__Winner_Team=- 1
integer s__Winner_WinTeam=- 1
constant integer si__KillUi=12
integer si__KillUi_F=0
integer si__KillUi_I=0
integer array si__KillUi_V
integer s__KillUi_KillBackground
integer s__KillUi_KillBackgroundText
integer s__KillUi_KillBackgroundMaxLine
integer s__KillUi_KillBackgroundMaxBorder
integer s__KillUi_tmp
integer array s__KillUi_TeamIndex
integer array s__KillUi_TeamNumbers
integer array s___KillUi_TeamPlayer
constant integer s___KillUi_TeamPlayer_size=3
integer array s__KillUi_TeamPlayer
integer array s__KillUi_TeamName
integer array s___KillUi_TeamNumberName
constant integer s___KillUi_TeamNumberName_size=3
integer array s__KillUi_TeamNumberName
integer array s___KillUi_TeamNumberHeroName
constant integer s___KillUi_TeamNumberHeroName_size=3
integer array s__KillUi_TeamNumberHeroName
integer array s___KillUi_TeamNumberHeroIcon
constant integer s___KillUi_TeamNumberHeroIcon_size=3
integer array s__KillUi_TeamNumberHeroIcon
integer array s___KillUi_TeamNumberInfo
constant integer s___KillUi_TeamNumberInfo_size=3
integer array s__KillUi_TeamNumberInfo
force array s__Teams___Team_Players
rect array s__Teams___Team_Rect
string array s__Teams___Team_Name
integer array s__Teams___Team_Kills
integer array s__TimerUtils___data
timer array s__TimerUtils___tT
unitpool array s__HeroRare___HeroRare
integer array s__s__KillUi_KillTeam
integer array si__Table___GTable_type
trigger array st__Table___GTable_onDestroy
trigger st__HandleTable__getindex
trigger st__HandleTable__setindex
trigger st__HeroRares_Repeat
trigger st__HeroRares_AddRandomHero
trigger st__Winner_ShowWin
trigger st__KillUi_FlushKillData
handle f__arg_handle1
integer f__arg_integer1
boolean f__arg_boolean1
unit f__arg_unit1
integer f__arg_this
integer f__result_integer

endglobals
    native DzGetMouseTerrainX takes nothing returns real
    native DzGetMouseTerrainY takes nothing returns real
    native DzGetMouseTerrainZ takes nothing returns real
    native DzIsMouseOverUI takes nothing returns boolean
    native DzGetMouseX takes nothing returns integer
    native DzGetMouseY takes nothing returns integer
    native DzGetMouseXRelative takes nothing returns integer
    native DzGetMouseYRelative takes nothing returns integer
    native DzSetMousePos takes integer x, integer y returns nothing
    native DzTriggerRegisterMouseEvent takes trigger trig, integer btn, integer status, boolean sync, string func returns nothing
    native DzTriggerRegisterMouseEventByCode takes trigger trig, integer btn, integer status, boolean sync, code funcHandle returns nothing
    native DzTriggerRegisterKeyEvent takes trigger trig, integer key, integer status, boolean sync, string func returns nothing
    native DzTriggerRegisterKeyEventByCode takes trigger trig, integer key, integer status, boolean sync, code funcHandle returns nothing
    native DzTriggerRegisterMouseWheelEvent takes trigger trig, boolean sync, string func returns nothing
    native DzTriggerRegisterMouseWheelEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
    native DzTriggerRegisterMouseMoveEvent takes trigger trig, boolean sync, string func returns nothing
    native DzTriggerRegisterMouseMoveEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
    native DzGetTriggerKey takes nothing returns integer
    native DzGetWheelDelta takes nothing returns integer
    native DzIsKeyDown takes integer iKey returns boolean
    native DzGetTriggerKeyPlayer takes nothing returns player
    native DzGetWindowWidth takes nothing returns integer
    native DzGetWindowHeight takes nothing returns integer
    native DzGetWindowX takes nothing returns integer
    native DzGetWindowY takes nothing returns integer
    native DzTriggerRegisterWindowResizeEvent takes trigger trig, boolean sync, string func returns nothing
    native DzTriggerRegisterWindowResizeEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
    native DzIsWindowActive takes nothing returns boolean
    native DzDestructablePosition takes destructable d, real x, real y returns nothing
    native DzSetUnitPosition takes unit whichUnit, real x, real y returns nothing
    native DzExecuteFunc takes string funcName returns nothing
    native DzGetUnitUnderMouse takes nothing returns unit
    native DzSetUnitTexture takes unit whichUnit, string path, integer texId returns nothing
    native DzSetMemory takes integer address, real value returns nothing
    native DzSetUnitID takes unit whichUnit, integer id returns nothing
    native DzSetUnitModel takes unit whichUnit, string path returns nothing
    native DzSetWar3MapMap takes string map returns nothing
    native DzTriggerRegisterSyncData takes trigger trig, string prefix, boolean server returns nothing
    native DzSyncData takes string prefix, string data returns nothing
    native DzGetTriggerSyncData takes nothing returns string
    native DzGetTriggerSyncPlayer takes nothing returns player
    native DzFrameHideInterface takes nothing returns nothing
    native DzFrameEditBlackBorders takes real upperHeight, real bottomHeight returns nothing
    native DzFrameGetPortrait takes nothing returns integer
    native DzFrameGetMinimap takes nothing returns integer
    native DzFrameGetCommandBarButton takes integer row, integer column returns integer
    native DzFrameGetHeroBarButton takes integer buttonId returns integer
    native DzFrameGetHeroHPBar takes integer buttonId returns integer
    native DzFrameGetHeroManaBar takes integer buttonId returns integer
    native DzFrameGetItemBarButton takes integer buttonId returns integer
    native DzFrameGetMinimapButton takes integer buttonId returns integer
    native DzFrameGetUpperButtonBarButton takes integer buttonId returns integer
    native DzFrameGetTooltip takes nothing returns integer
    native DzFrameGetChatMessage takes nothing returns integer
    native DzFrameGetUnitMessage takes nothing returns integer
    native DzFrameGetTopMessage takes nothing returns integer
    native DzGetColor takes integer r, integer g, integer b, integer a returns integer
    native DzFrameSetUpdateCallback takes string func returns nothing
    native DzFrameSetUpdateCallbackByCode takes code funcHandle returns nothing
    native DzFrameShow takes integer frame, boolean enable returns nothing
    native DzCreateFrame takes string frame, integer parent, integer id returns integer
    native DzCreateSimpleFrame takes string frame, integer parent, integer id returns integer
    native DzDestroyFrame takes integer frame returns nothing
    native DzLoadToc takes string fileName returns nothing
    native DzFrameSetPoint takes integer frame, integer point, integer relativeFrame, integer relativePoint, real x, real y returns nothing
    native DzFrameSetAbsolutePoint takes integer frame, integer point, real x, real y returns nothing
    native DzFrameClearAllPoints takes integer frame returns nothing
    native DzFrameSetEnable takes integer name, boolean enable returns nothing
    native DzFrameSetScript takes integer frame, integer eventId, string func, boolean sync returns nothing
    native DzFrameSetScriptByCode takes integer frame, integer eventId, code funcHandle, boolean sync returns nothing
    native DzGetTriggerUIEventPlayer takes nothing returns player
    native DzGetTriggerUIEventFrame takes nothing returns integer
    native DzFrameFindByName takes string name, integer id returns integer
    native DzSimpleFrameFindByName takes string name, integer id returns integer
    native DzSimpleFontStringFindByName takes string name, integer id returns integer
    native DzSimpleTextureFindByName takes string name, integer id returns integer
    native DzGetGameUI takes nothing returns integer
    native DzClickFrame takes integer frame returns nothing
    native DzSetCustomFovFix takes real value returns nothing
    native DzEnableWideScreen takes boolean enable returns nothing
    native DzFrameSetText takes integer frame, string text returns nothing
    native DzFrameGetText takes integer frame returns string
    native DzFrameSetTextSizeLimit takes integer frame, integer size returns nothing
    native DzFrameGetTextSizeLimit takes integer frame returns integer
    native DzFrameSetTextColor takes integer frame, integer color returns nothing
    native DzGetMouseFocus takes nothing returns integer
    native DzFrameSetAllPoints takes integer frame, integer relativeFrame returns boolean
    native DzFrameSetFocus takes integer frame, boolean enable returns boolean
    native DzFrameSetModel takes integer frame, string modelFile, integer modelType, integer flag returns nothing
    native DzFrameGetEnable takes integer frame returns boolean
    native DzFrameSetAlpha takes integer frame, integer alpha returns nothing
    native DzFrameGetAlpha takes integer frame returns integer
    native DzFrameSetAnimate takes integer frame, integer animId, boolean autocast returns nothing
    native DzFrameSetAnimateOffset takes integer frame, real offset returns nothing
    native DzFrameSetTexture takes integer frame, string texture, integer flag returns nothing
    native DzFrameSetScale takes integer frame, real scale returns nothing
    native DzFrameSetTooltip takes integer frame, integer tooltip returns nothing
    native DzFrameCageMouse takes integer frame, boolean enable returns nothing
    native DzFrameGetValue takes integer frame returns real
    native DzFrameSetMinMaxValue takes integer frame, real minValue, real maxValue returns nothing
    native DzFrameSetStepValue takes integer frame, real step returns nothing
    native DzFrameSetValue takes integer frame, real value returns nothing
    native DzFrameSetSize takes integer frame, real w, real h returns nothing
    native DzCreateFrameByTagName takes string frameType, string name, integer parent, string template, integer id returns integer
    native DzFrameSetVertexColor takes integer frame, integer color returns nothing


//Generated allocator of Players
function s__Players__allocate takes nothing returns integer
 local integer this=si__Players_F
    if (this!=0) then
        set si__Players_F=si__Players_V[this]
    else
        set si__Players_I=si__Players_I+1
        set this=si__Players_I
    endif
    if (this>8190) then
        return 0
    endif

    set si__Players_V[this]=-1
 return this
endfunction

//Generated destructor of Players
function s__Players_deallocate takes integer this returns nothing
    if this==null then
        return
    elseif (si__Players_V[this]!=-1) then
        return
    endif
    set si__Players_V[this]=si__Players_F
    set si__Players_F=this
endfunction

//Generated method caller for KillUi.FlushKillData
function sc__KillUi_FlushKillData takes nothing returns nothing
    call TriggerEvaluate(st__KillUi_FlushKillData)
endfunction

//Generated allocator of KillUi
function s__KillUi__allocate takes nothing returns integer
 local integer this=si__KillUi_F
    if (this!=0) then
        set si__KillUi_F=si__KillUi_V[this]
    else
        set si__KillUi_I=si__KillUi_I+1
        set this=si__KillUi_I
    endif
    if (this>2729) then
        return 0
    endif
    set s__KillUi_TeamPlayer[this]=(this-1)*3
    set s__KillUi_TeamNumberName[this]=(this-1)*3
    set s__KillUi_TeamNumberHeroName[this]=(this-1)*3
    set s__KillUi_TeamNumberHeroIcon[this]=(this-1)*3
    set s__KillUi_TeamNumberInfo[this]=(this-1)*3
    set si__KillUi_V[this]=-1
 return this
endfunction

//Generated destructor of KillUi
function s__KillUi_deallocate takes integer this returns nothing
    if this==null then
        return
    elseif (si__KillUi_V[this]!=-1) then
        return
    endif
    set si__KillUi_V[this]=si__KillUi_F
    set si__KillUi_F=this
endfunction

//Generated method caller for Winner.ShowWin
function sc__Winner_ShowWin takes integer teamid returns nothing
    set f__arg_integer1=teamid
    call TriggerEvaluate(st__Winner_ShowWin)
endfunction

//Generated allocator of Winner
function s__Winner__allocate takes nothing returns integer
 local integer this=si__Winner_F
    if (this!=0) then
        set si__Winner_F=si__Winner_V[this]
    else
        set si__Winner_I=si__Winner_I+1
        set this=si__Winner_I
    endif
    if (this>8190) then
        return 0
    endif

    set si__Winner_V[this]=-1
 return this
endfunction

//Generated destructor of Winner
function s__Winner_deallocate takes integer this returns nothing
    if this==null then
        return
    elseif (si__Winner_V[this]!=-1) then
        return
    endif
    set si__Winner_V[this]=si__Winner_F
    set si__Winner_F=this
endfunction

//Generated method caller for HeroRares.Repeat
function sc__HeroRares_Repeat takes boolean b returns nothing
            set s__HeroRares_isRepeat=b
endfunction

//Generated method caller for HeroRares.AddRandomHero
function sc__HeroRares_AddRandomHero takes unit u returns nothing
    set f__arg_unit1=u
    call TriggerEvaluate(st__HeroRares_AddRandomHero)
endfunction

//Generated allocator of HeroRares
function s__HeroRares__allocate takes nothing returns integer
 local integer this=si__HeroRares_F
    if (this!=0) then
        set si__HeroRares_F=si__HeroRares_V[this]
    else
        set si__HeroRares_I=si__HeroRares_I+1
        set this=si__HeroRares_I
    endif
    if (this>8190) then
        return 0
    endif

    set si__HeroRares_V[this]=-1
 return this
endfunction

//Generated destructor of HeroRares
function s__HeroRares_deallocate takes integer this returns nothing
    if this==null then
        return
    elseif (si__HeroRares_V[this]!=-1) then
        return
    endif
    set si__HeroRares_V[this]=si__HeroRares_F
    set si__HeroRares_F=this
endfunction

//Generated allocator of Units
function s__Units__allocate takes nothing returns integer
 local integer this=si__Units_F
    if (this!=0) then
        set si__Units_F=si__Units_V[this]
    else
        set si__Units_I=si__Units_I+1
        set this=si__Units_I
    endif
    if (this>8190) then
        return 0
    endif

    set si__Units_V[this]=-1
 return this
endfunction

//Generated destructor of Units
function s__Units_deallocate takes integer this returns nothing
    if this==null then
        return
    elseif (si__Units_V[this]!=-1) then
        return
    endif
    set si__Units_V[this]=si__Units_F
    set si__Units_F=this
endfunction

//Generated allocator of Util___Util
function s__Util___Util__allocate takes nothing returns integer
 local integer this=si__Util___Util_F
    if (this!=0) then
        set si__Util___Util_F=si__Util___Util_V[this]
    else
        set si__Util___Util_I=si__Util___Util_I+1
        set this=si__Util___Util_I
    endif
    if (this>8190) then
        return 0
    endif

    set si__Util___Util_V[this]=-1
 return this
endfunction

//Generated destructor of Util___Util
function s__Util___Util_deallocate takes integer this returns nothing
    if this==null then
        return
    elseif (si__Util___Util_V[this]!=-1) then
        return
    endif
    set si__Util___Util_V[this]=si__Util___Util_F
    set si__Util___Util_F=this
endfunction

//Generated allocator of Teams
function s__Teams__allocate takes nothing returns integer
 local integer this=si__Teams_F
    if (this!=0) then
        set si__Teams_F=si__Teams_V[this]
    else
        set si__Teams_I=si__Teams_I+1
        set this=si__Teams_I
    endif
    if (this>8190) then
        return 0
    endif

    set si__Teams_V[this]=-1
 return this
endfunction

//Generated destructor of Teams
function s__Teams_deallocate takes integer this returns nothing
    if this==null then
        return
    elseif (si__Teams_V[this]!=-1) then
        return
    endif
    set si__Teams_V[this]=si__Teams_F
    set si__Teams_F=this
endfunction

//Generated allocator of TakeUi
function s__TakeUi__allocate takes nothing returns integer
 local integer this=si__TakeUi_F
    if (this!=0) then
        set si__TakeUi_F=si__TakeUi_V[this]
    else
        set si__TakeUi_I=si__TakeUi_I+1
        set this=si__TakeUi_I
    endif
    if (this>8190) then
        return 0
    endif

    set si__TakeUi_V[this]=-1
 return this
endfunction

//Generated destructor of TakeUi
function s__TakeUi_deallocate takes integer this returns nothing
    if this==null then
        return
    elseif (si__TakeUi_V[this]!=-1) then
        return
    endif
    set si__TakeUi_V[this]=si__TakeUi_F
    set si__TakeUi_F=this
endfunction

//Generated method caller for Table___GTable.onDestroy
function sc__Table___GTable_onDestroy takes integer this returns nothing
    set f__arg_this=this
    call TriggerEvaluate(st__Table___GTable_onDestroy[2])
endfunction

//Generated allocator of Table___GTable
function s__Table___GTable__allocate takes nothing returns integer
 local integer this=si__Table___GTable_F
    if (this!=0) then
        set si__Table___GTable_F=si__Table___GTable_V[this]
    else
        set si__Table___GTable_I=si__Table___GTable_I+1
        set this=si__Table___GTable_I
    endif
    if (this>8100) then
        return 0
    endif

    set si__Table___GTable_type[this]=2
    set si__Table___GTable_V[this]=-1
 return this
endfunction

//Generated destructor of Table___GTable
function sc__Table___GTable_deallocate takes integer this returns nothing
    if this==null then
        return
    elseif (si__Table___GTable_V[this]!=-1) then
        return
    endif
    set f__arg_this=this
    call TriggerEvaluate(st__Table___GTable_onDestroy[si__Table___GTable_type[this]])
    set si__Table___GTable_V[this]=si__Table___GTable_F
    set si__Table___GTable_F=this
endfunction

//Generated allocator of StringTable
function s__StringTable__allocate takes nothing returns integer
 local integer this=s__Table___GTable__allocate()
 local integer kthis
    if(this==0) then
        return 0
    endif
    set si__Table___GTable_type[this]=4
    set kthis=this

 return this
endfunction


//Generated allocator of Table
function s__Table__allocate takes nothing returns integer
 local integer this=s__Table___GTable__allocate()
 local integer kthis
    if(this==0) then
        return 0
    endif
    set si__Table___GTable_type[this]=3
    set kthis=this

 return this
endfunction


//Generated method caller for HandleTable._getindex
function sc__HandleTable__getindex takes integer this,handle key returns integer
    set f__arg_this=this
    set f__arg_handle1=key
    call TriggerEvaluate(st__HandleTable__getindex)
 return f__result_integer
endfunction

//Generated method caller for HandleTable._setindex
function sc__HandleTable__setindex takes integer this,handle key,integer value returns nothing
    set f__arg_this=this
    set f__arg_handle1=key
    set f__arg_integer1=value
    call TriggerEvaluate(st__HandleTable__setindex)
endfunction

//Generated allocator of HandleTable
function s__HandleTable__allocate takes nothing returns integer
 local integer this=s__Table___GTable__allocate()
 local integer kthis
    if(this==0) then
        return 0
    endif
    set si__Table___GTable_type[this]=5
    set kthis=this

 return this
endfunction


//library BzAPI:
    //hardware




























    //plus









    //sync




    //gui
































































    function DzTriggerRegisterMouseEventTrg takes trigger trg,integer status,integer btn returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterMouseEvent(trg, btn, status, true, null)
    endfunction
    function DzTriggerRegisterKeyEventTrg takes trigger trg,integer status,integer btn returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterKeyEvent(trg, btn, status, true, null)
    endfunction
    function DzTriggerRegisterMouseMoveEventTrg takes trigger trg returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterMouseMoveEvent(trg, true, null)
    endfunction
    function DzTriggerRegisterMouseWheelEventTrg takes trigger trg returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterMouseWheelEvent(trg, true, null)
    endfunction
    function DzTriggerRegisterWindowResizeEventTrg takes trigger trg returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterWindowResizeEvent(trg, true, null)
    endfunction
    function DzF2I takes integer i returns integer
        return i
    endfunction
    function DzI2F takes integer i returns integer
        return i
    endfunction
    function DzK2I takes integer i returns integer
        return i
    endfunction
    function DzI2K takes integer i returns integer
        return i
    endfunction

//library BzAPI ends
//library Players:
        //public:  //玩家ID
        function s__Players_Set takes player ps returns integer
            local integer p=s__Players__allocate()
            set s__Players_Kills[p]=0
            set s__Players_Deaths[p]=0
            set s__Players_player[p]=ps
            set s__Players_hero[p]=null
            set s__Players_playerid[p]=GetConvertedPlayerId(ps)
            set s__Players_teamid[p]=GetPlayerTeam(ps)
            call sc__HandleTable__setindex(s__Players_ht,ps, (p))
            return p
        endfunction
        function s__Players_Get takes player p returns integer
            return (sc__HandleTable__getindex(s__Players_ht,p))
        endfunction
        function s__Players_onInit takes nothing returns nothing
            set s__Players_ht=s__HandleTable__allocate()
        endfunction

//library Players ends
//library Table:
//***************************************************************
//* Table object 3.0
//* ------------
//*
//*   set t=Table.create() - instanceates a new table object
//*   call t.destroy()     - destroys it
//*   t[1234567]           - Get value for key 1234567
//*                          (zero if not assigned previously)
//*   set t[12341]=32      - Assigning it.
//*   call t.flush(12341)  - Flushes the stored value, so it
//*                          doesn't use any more memory
//*   t.exists(32)         - Was key 32 assigned? Notice
//*                          that flush() unassigns values.
//*   call t.reset()       - Flushes the whole contents of the
//*                          Table.
//*
//*   call t.destroy()     - Does reset() and also recycles the id.
//*
//*   If you use HandleTable instead of Table, it is the same
//* but it uses handles as keys, the same with StringTable.
//*
//*  You can use Table on structs' onInit  if the struct is
//* placed in a library that requires Table or outside a library.
//*
//*  You can also do 2D array syntax if you want to touch
//* mission keys directly, however, since this is shared space
//* you may want to prefix your mission keys accordingly:
//*
//*  set Table["thisstring"][ 7 ] = 2
//*  set Table["thisstring"][ 5 ] = Table["thisstring"][7]
//*
//***************************************************************

//=============================================================


        function s__Table___GTable_reset takes integer this returns nothing
            call FlushChildHashtable(Table___ht, (this))
        endfunction

        function s__Table___GTable_onDestroy takes integer this returns nothing
            call FlushChildHashtable(Table___ht, ((this))) // INLINED!!
        endfunction

        //=============================================================
        // initialize it all.
        //
        function s__Table___GTable_onInit takes nothing returns nothing
            set Table___ht=InitHashtable()
        endfunction


    //Hey: Don't instanciate other people's textmacros that you are not supposed to, thanks.

//textmacro instance: Table__make("Table","integer","key" )

        function s__Table__getindex takes integer this,integer key returns integer
            return LoadInteger(Table___ht, (this), key)
        endfunction

        function s__Table__setindex takes integer this,integer key,integer value returns nothing
            call SaveInteger(Table___ht, (this), key, value)
        endfunction

        function s__Table_flush takes integer this,integer key returns nothing
            call RemoveSavedInteger(Table___ht, (this), key)
        endfunction

        function s__Table_exists takes integer this,integer key returns boolean
            return HaveSavedInteger(Table___ht, (this), key)
        endfunction

        function s__Table_flush2D takes string firstkey returns nothing
            call FlushChildHashtable(Table___ht, (((- StringHash(firstkey))))) // INLINED!!
        endfunction

        function s__Table__staticgetindex takes string firstkey returns integer
            return (- StringHash(firstkey))
        endfunction

//end of: Table__make("Table","integer","key" )
//textmacro instance: Table__make("StringTable","string", "StringHash(key)" )

        function s__StringTable__getindex takes integer this,string key returns integer
            return LoadInteger(Table___ht, (this), StringHash(key))
        endfunction

        function s__StringTable__setindex takes integer this,string key,integer value returns nothing
            call SaveInteger(Table___ht, (this), StringHash(key), value)
        endfunction

        function s__StringTable_flush takes integer this,string key returns nothing
            call RemoveSavedInteger(Table___ht, (this), StringHash(key))
        endfunction

        function s__StringTable_exists takes integer this,string key returns boolean
            return HaveSavedInteger(Table___ht, (this), StringHash(key))
        endfunction

        function s__StringTable_flush2D takes string firstkey returns nothing
            call FlushChildHashtable(Table___ht, (((- StringHash(firstkey))))) // INLINED!!
        endfunction

        function s__StringTable__staticgetindex takes string firstkey returns integer
            return (- StringHash(firstkey))
        endfunction

//end of: Table__make("StringTable","string", "StringHash(key)" )
//textmacro instance: Table__make("HandleTable","handle","GetHandleId(key)" )

        function s__HandleTable__getindex takes integer this,handle key returns integer
            return LoadInteger(Table___ht, (this), GetHandleId(key))
        endfunction

        function s__HandleTable__setindex takes integer this,handle key,integer value returns nothing
            call SaveInteger(Table___ht, (this), GetHandleId(key), value)
        endfunction

        function s__HandleTable_flush takes integer this,handle key returns nothing
            call RemoveSavedInteger(Table___ht, (this), GetHandleId(key))
        endfunction

        function s__HandleTable_exists takes integer this,handle key returns boolean
            return HaveSavedInteger(Table___ht, (this), GetHandleId(key))
        endfunction

        function s__HandleTable_flush2D takes string firstkey returns nothing
            call FlushChildHashtable(Table___ht, (((- StringHash(firstkey))))) // INLINED!!
        endfunction

        function s__HandleTable__staticgetindex takes string firstkey returns integer
            return (- StringHash(firstkey))
        endfunction

//end of: Table__make("HandleTable","handle","GetHandleId(key)" )


//library Table ends
//library TakeUi:
        function s__TakeUi_ShowTakeBar takes string str returns nothing
            if ( str == "" ) then
                call DzFrameSetPoint(s__TakeUi_TakeRightText, 3, s__TakeUi_TakeBackground, 3, 0.26, - 0.003)
                call DzFrameSetText(s__TakeUi_TakeRightText, "中央区域尚未被争夺")
                call DzFrameShow(s__TakeUi_TakeMoveBar, false)
            else
                call DzFrameSetPoint(s__TakeUi_TakeRightText, 3, s__TakeUi_TakeBackground, 3, 0.302, - 0.003)
                call DzFrameSetText(s__TakeUi_TakeRightText, str + "争夺中")
                call DzFrameShow(s__TakeUi_TakeMoveBar, true)
            endif
        endfunction
        function s__TakeUi_SetTakeBarStep takes real acc returns nothing
            call DzFrameSetPoint(s__TakeUi_TakeMoveBar, 3, s__TakeUi_TakeBackground, 3, 0.3 - ( ( 0.3 - 0.021 ) * acc ), 0.001)
            call DzFrameSetSize(s__TakeUi_TakeMoveBar, 0.001 + 0.278 * acc, 0.009)
        endfunction
        function s__TakeUi_onInit takes nothing returns nothing
            set s__TakeUi_TakeBackground=DzCreateFrameByTagName("BACKDROP", "TakeBackground", DzGetGameUI(), "Panel", 0)
            call DzFrameSetSize(s__TakeUi_TakeBackground, 0.349, 0.024)
            call DzFrameSetPoint(s__TakeUi_TakeBackground, 3, DzFrameGetUpperButtonBarButton(0), 3, - 0.01, 0)
            call DzFrameSetTexture(s__TakeUi_TakeBackground, "UI_LeftUpperBackground.blp", 0)
            set s__TakeUi_TakeLeftText=DzCreateFrameByTagName("TEXT", "TakeLeftText", s__TakeUi_TakeBackground, "TextInfo", 0)
            call DzFrameSetPoint(s__TakeUi_TakeLeftText, 3, s__TakeUi_TakeBackground, 3, 0.005, - 0.003)
            call DzFrameSetSize(s__TakeUi_TakeLeftText, 0.02, 0.02)
            call DzFrameSetText(s__TakeUi_TakeLeftText, "胜利")
            set s__TakeUi_TakeRightText=DzCreateFrameByTagName("TEXT", "TakeRightText", s__TakeUi_TakeBackground, "TextInfo", 0) //右侧文字提示，未争夺状态的设置
            call DzFrameSetPoint(s__TakeUi_TakeRightText, 3, s__TakeUi_TakeBackground, 3, 0.26, - 0.003)
            call DzFrameSetSize(s__TakeUi_TakeRightText, 0.08, 0.02)
            call DzFrameSetText(s__TakeUi_TakeRightText, "中央区域尚未被争夺")
            set s__TakeUi_TakeMoveBar=DzCreateFrameByTagName("BACKDROP", "TakeMoveBar", s__TakeUi_TakeBackground, "ShowInfo", 0) //争夺进度条 //进度0%的位置: Point(0.3,0.001),Size(0.001,0.009) //进度100%的位置: Point(0.021,0.001),Size(0.279,0.009)
            call DzFrameSetPoint(s__TakeUi_TakeMoveBar, 3, s__TakeUi_TakeBackground, 3, 0.3, 0.001)
            call DzFrameSetSize(s__TakeUi_TakeMoveBar, 0.001, 0.009)
            call DzFrameSetTexture(s__TakeUi_TakeMoveBar, "UI_LeftUpperMoveBar.blp", 0)
            call DzFrameShow(s__TakeUi_TakeMoveBar, false)
        endfunction

//library TakeUi ends
//library Teams:

    //private:  //玩家阵营相关内容初始化类 //玩家组
        function Teams___anon__1 takes nothing returns boolean
            return GetPlayerSlotState(GetFilterPlayer()) == PLAYER_SLOT_STATE_PLAYING
        endfunction
        function Teams___anon__2 takes nothing returns boolean
            return IsPlayerInForce(GetFilterPlayer(), Teams___AllPlayers) == true and GetPlayerTeam(GetFilterPlayer()) == 0
        endfunction
        function Teams___anon__3 takes nothing returns boolean
            return IsPlayerInForce(GetFilterPlayer(), Teams___AllPlayers) == true and GetPlayerTeam(GetFilterPlayer()) == 1
        endfunction
        function Teams___anon__4 takes nothing returns boolean
            return IsPlayerInForce(GetFilterPlayer(), Teams___AllPlayers) == true and GetPlayerTeam(GetFilterPlayer()) == 2
        endfunction
    function Teams___onInit takes nothing returns nothing
        set Teams___AllPlayers=GetPlayersMatching(Condition(function Teams___anon__1))
        set s__Teams___Team_Players[0]= GetPlayersMatching(Condition(function Teams___anon__2))
        set s__Teams___Team_Players[1]= GetPlayersMatching(Condition(function Teams___anon__3))
        set s__Teams___Team_Players[2]= GetPlayersMatching(Condition(function Teams___anon__4))
        set s__Teams___Team_Rect[0]= gg_rct_A_TEAM
        set s__Teams___Team_Rect[1]= gg_rct_B_TEAM
        set s__Teams___Team_Rect[2]= gg_rct_C_TEAM
        set s__Teams___Team_Name[0]= "A组"
        set s__Teams___Team_Name[1]= "B组"
        set s__Teams___Team_Name[2]= "C组"
    endfunction
        function s__Teams_GetTeamKills takes integer p returns integer
            return s__Teams___Team_Kills[p]
        endfunction
        function s__Teams_AddTeamKills takes integer p,integer k returns nothing
            set s__Teams___Team_Kills[p]= s__Teams___Team_Kills[p] + k
        endfunction
        function s__Teams_GetAllPlayers takes nothing returns force
            return Teams___AllPlayers
        endfunction
        function s__Teams_ActionsForAllPlayer takes code f returns nothing
            call ForForce(Teams___AllPlayers, f)
        endfunction
        function s__Teams_ActionsForTeamPlayer takes integer tid,code f returns nothing
            call ForForce(s__Teams___Team_Players[tid], f)
        endfunction
        function s__Teams_PlayerRemoveForce takes player p returns nothing
            call ForceRemovePlayer(Teams___AllPlayers, p)
            call ForceRemovePlayer(s__Teams___Team_Players[GetPlayerTeam(p)], p)
        endfunction
        function s__Teams_GetTeamName takes player p returns string
            return s__Teams___Team_Name[GetPlayerTeam(p)]
        endfunction
        function s__Teams_GetTeamNameByIndex takes integer p returns string
            return s__Teams___Team_Name[p]
        endfunction
        function s__Teams_GetTeamRect takes player p returns rect
            return s__Teams___Team_Rect[GetPlayerTeam(p)]
        endfunction
        function s__Teams_GetTeamForce takes player p returns force
            return s__Teams___Team_Players[GetPlayerTeam(p)]
        endfunction
        function s__Teams_GetTeamForceByIndex takes integer p returns force
            return s__Teams___Team_Players[p]
        endfunction
        function s__Teams_GetTeamNumber takes player p returns integer
            return CountPlayersInForceBJ((s__Teams___Team_Players[GetPlayerTeam((p))])) // INLINED!!
        endfunction
        function s__Teams_GetTeamNumberByIndex takes integer p returns integer
            return CountPlayersInForceBJ((s__Teams___Team_Players[(p)])) // INLINED!!
        endfunction

//library Teams ends
//library TimerUtils:
//*********************************************************************
//* TimerUtils (red+blue+orange flavors for 1.24b+)
//* ----------
//*
//*  To implement it , create a custom text trigger called TimerUtils
//* and paste the contents of this script there.
//*
//*  To copy from a map to another, copy the trigger holding this
//* library to your map.
//*
//* (requires vJass)   More scripts: htt://www.wc3c.net
//*
//* For your timer needs:
//*  * Attaching
//*  * Recycling (with double-free protection)
//*
//* set t=NewTimer()      : Get a timer (alternative to CreateTimer)
//* ReleaseTimer(t)       : Relese a timer (alt to DestroyTimer)
//* SetTimerData(t,2)     : Attach value 2 to timer
//* GetTimerData(t)       : Get the timer's value.
//*                         You can assume a timer's value is 0
//*                         after NewTimer.
//*
//* Multi-flavor:
//*    Set USE_HASH_TABLE to true if you don't want to complicate your life.
//*
//* If you like speed and giberish try learning about the other flavors.
//*
//********************************************************************

//================================================================

    //==================================================================================================

    //It is dependent on jasshelper's recent inlining optimization in order to perform correctly.
    function SetTimerData takes timer t,integer value returns nothing





            // orange





            set s__TimerUtils___data[GetHandleId(t) - TimerUtils___VOFFSET]= value









    endfunction

    function GetTimerData takes timer t returns integer





            // orange





            return s__TimerUtils___data[GetHandleId(t) - TimerUtils___VOFFSET]









    endfunction

    //==========================================================================================

    //==========================================================================================
    function NewTimer takes nothing returns timer
        if ( TimerUtils___tN == 0 ) then
            //If this happens then the QUANTITY rule has already been broken, try to fix the
            // issue, else fail.

                set s__TimerUtils___tT[0]= CreateTimer()

                    if ( GetHandleId(s__TimerUtils___tT[0]) - TimerUtils___VOFFSET < 0 ) or ( GetHandleId(s__TimerUtils___tT[0]) - TimerUtils___VOFFSET >= TimerUtils___ARRAY_SIZE ) then
                        //all right, couldn't fix it
                        call BJDebugMsg("NewTimer: Unable to allocate a timer, you should probably set TimerUtils_USE_HASH_TABLE to true or fix timer leaks.")
                        return null
                    endif








        else
            set TimerUtils___tN=TimerUtils___tN - 1
        endif
        set s__TimerUtils___data[GetHandleId((s__TimerUtils___tT[TimerUtils___tN] )) - TimerUtils___VOFFSET]= ( 0) // INLINED!!
     return s__TimerUtils___tT[TimerUtils___tN]
    endfunction

    //==========================================================================================
    function ReleaseTimer takes timer t returns nothing
        if ( t == null ) then
            return
        endif
        if ( TimerUtils___tN == TimerUtils___ARRAY_SIZE ) then
            //stack is full, the map already has much more troubles than the chance of bug
            call DestroyTimer(t)
        else
            call PauseTimer(t)
            if ( (s__TimerUtils___data[GetHandleId((t)) - TimerUtils___VOFFSET]) == TimerUtils___HELD ) then // INLINED!!
                return
            endif
            set s__TimerUtils___data[GetHandleId((t )) - TimerUtils___VOFFSET]= ( TimerUtils___HELD) // INLINED!!
            set s__TimerUtils___tT[TimerUtils___tN]= t
            set TimerUtils___tN=TimerUtils___tN + 1
        endif
    endfunction

    function TimerUtils___init takes nothing returns nothing
     local integer i=0
     local integer o=- 1
     local boolean oops= false
     










            loop
                set i=0
                loop
                    exitwhen ( i == TimerUtils___QUANTITY )
                    set s__TimerUtils___tT[i]= CreateTimer()
                    if ( i == 0 ) then
                        set TimerUtils___VOFFSET=GetHandleId(s__TimerUtils___tT[i])

                            set o=TimerUtils___VOFFSET



                    endif
                    if ( GetHandleId(s__TimerUtils___tT[i]) - o >= TimerUtils___ARRAY_SIZE ) then
                        exitwhen true
                    endif
                    if ( GetHandleId(s__TimerUtils___tT[i]) - o >= 0 ) then
                        set i=i + 1
                    endif
                endloop
                set TimerUtils___tN=i
                exitwhen ( TimerUtils___tN == TimerUtils___QUANTITY )
                set oops=true
                exitwhen not TimerUtils___USE_FLEXIBLE_OFFSET
            endloop
            
            if ( oops ) then

                    //If this message doesn't appear then there is so much
                    //handle id fragmentation that it was impossible to preload
                    //so many timers and the thread crashed! Therefore this
                    //debug message is useful.






            endif


    endfunction


//library TimerUtils ends
//library Tree:

        function Tree___anon__7 takes nothing returns nothing
            call PolledWait(30.00)
            call DestructableRestoreLife(GetDyingDestructable(), GetDestructableMaxLife(GetDyingDestructable()), true)
        endfunction
    function Tree___onInit takes nothing returns nothing
        local trigger t
        local location d
        local integer i
        local integer x
        set Tree___rec[0]=gg_rct_ShuLin_01
        set Tree___rec[1]=gg_rct_YeGuai_01
        set Tree___rec[2]=gg_rct_YeGuai_02
        set t=CreateTrigger()
        call TriggerAddAction(t, function Tree___anon__7)
        set i=0
        loop
        exitwhen ( i >= 100 )
            set x=0
            loop
            exitwhen ( x >= 3 )
                set d=GetRandomLocInRect(Tree___rec[x])
                call CreateDestructableLoc('B000', d, GetRandomDirectionDeg(), GetRandomReal(1.00, 2.00), GetRandomInt(0, 4))
                call TriggerRegisterDeathEvent(t, GetLastCreatedDestructable())
                call RemoveLocation(d)
                set d=null
            set x=x + 1
            endloop
        set i=i + 1
        endloop
        set t=null
    endfunction

//library Tree ends
//library Util:
        function s__Util___Util_XY takes unit u,unit m returns real
            return bj_RADTODEG * Atan2(GetUnitY(m) - GetUnitY(u), GetUnitX(m) - GetUnitX(u))
        endfunction
        function s__Util___Util_XYEX takes real x,real y,real x1,real y1 returns real
            return bj_RADTODEG * Atan2(y1 - y, x1 - x)
        endfunction
        function s__Util___Util_XY2 takes unit u,unit m returns real
            local real dx=GetUnitX(m) - GetUnitX(u)
            local real dy=GetUnitY(m) - GetUnitY(u)
            return SquareRoot(dx * dx + dy * dy)
        endfunction
        function s__Util___Util_XY2EX takes real x,real y,real x1,real y1 returns real
            local real dx=x1 - x
            local real dy=y1 - y
            return SquareRoot(dx * dx + dy * dy)
        endfunction
        function s__Util___Util_UnitAddRemoveAbility takes unit u,integer i returns nothing
            call UnitAddAbility(u, i)
            call UnitRemoveAbility(u, i)
        endfunction

//library Util ends
//library Camera:

        function Camera___anon__5 takes nothing returns nothing
            call SetCameraField(CAMERA_FIELD_TARGET_DISTANCE, 3000.00, 0)
        endfunction
    function Camera___onInit takes nothing returns nothing
        call CameraSetSmoothingFactor(998.00)
        call TimerStart(NewTimer(), 0.01, true, function Camera___anon__5)
    endfunction

//library Camera ends
//library PlayerEvent:

//library PlayerEvent ends
//library Units:
        //public:
        function s__Units_onInit takes nothing returns nothing
            set s__Units_ht=s__HandleTable__allocate()
        endfunction
        function s__Units_Create takes unit u returns nothing
            local integer ud=s__Units__allocate()
            set s__Units_player[ud]=(sc__HandleTable__getindex(s__Players_ht,(GetOwningPlayer(u)))) // INLINED!!
            set s__Units_isHero[ud]=IsUnitType(u, UNIT_TYPE_HERO)
            set s__Units_name[ud]=GetUnitName(u)
            set s__Units_unit[ud]=u
            if ( s__Units_isHero[ud] == true ) then
            endif
            call SaveInteger(Table___ht, ((s__Units_ht)), GetHandleId((u)), ( (ud))) // INLINED!!
        endfunction
        function s__Units_Destroys takes unit u returns nothing
            local integer ud=((LoadInteger(Table___ht, ((s__Units_ht)), GetHandleId((u))))) // INLINED!!
            set s__Units_unit[ud]=null
            call s__Units_deallocate(ud)
            call RemoveSavedInteger(Table___ht, ((s__Units_ht)), GetHandleId((u))) // INLINED!!
        endfunction
        function s__Units_Get takes unit u returns integer
            return ((LoadInteger(Table___ht, ((s__Units_ht)), GetHandleId((u))))) // INLINED!!
        endfunction
        function s__Units_Set takes unit u returns nothing
            if ( (HaveSavedInteger(Table___ht, ((s__Units_ht)), GetHandleId((u)))) == false ) then // INLINED!!
                call s__Units_Create(u)
            endif
        endfunction
        function s__Units_Spawn takes player p,integer unitid,real x,real y,real f returns unit
            local unit u=CreateUnit(p, unitid, x, y, f)
            call s__Units_Create(u)
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            set bj_lastCreatedUnit=u
            set u=null
            return bj_lastCreatedUnit
        endfunction
        function s__Units_Kill takes unit u returns nothing
            call KillUnit(u)
            if ( s__Units_isHero[(LoadInteger(Table___ht, ((s__Units_ht)), GetHandleId(((u)))))] == false ) then // INLINED!!
                call s__Units_Destroys(u)
            endif
        endfunction
        function s__Units_Remove takes unit u returns nothing
            call RemoveUnit(u)
            call s__Units_Destroys(u)
        endfunction

//library Units ends
//library HeroRare:

        function HeroRare___anon__6 takes nothing returns nothing
            local unit gu=GetEnumUnit()
            if ( IsUnitType(gu, UNIT_TYPE_HERO) == true ) then
                call sc__HeroRares_AddRandomHero(gu)
            endif
            set gu=null
        endfunction
    function HeroRare___onInit takes nothing returns nothing
        local group g=CreateGroup()
        set s__HeroRare___HeroRare[0]= CreateUnitPool()
        set s__HeroRare___HeroRare[1]= CreateUnitPool()
        set s__HeroRare___HeroRare[2]= CreateUnitPool()
        call GroupEnumUnitsInRange(g, 0, 0, 65535, null)
        call ForGroup(g, function HeroRare___anon__6)
        call DestroyGroup(g)
        set s__HeroRares_isRepeat=(true) // INLINED!!
    endfunction
        function s__HeroRares_Repeat takes boolean b returns nothing
            set s__HeroRares_isRepeat=b
        endfunction
        function s__HeroRares_GetRepeat takes nothing returns boolean
            return s__HeroRares_isRepeat
        endfunction
        function s__HeroRares_AddRandomHero takes unit u returns nothing
            if ( (s__HeroRares_isRepeat) == false ) then // INLINED!!
                call UnitPoolAddUnitType(s__HeroRare___HeroRare[GetUnitPointValue(u)], GetUnitTypeId(u), 1)
            endif
            call s__Units_Remove(u)
        endfunction
        function s__HeroRares_GetRandomHero takes player p,real r returns unit
            local real r1=GetRandomReal(0, r)
            local integer index=- 1
            if ( r1 >= 0 and r1 <= 30 ) then
                set index=0
            elseif ( r1 >= 31 and r1 <= 70 ) then
                set index=1
            elseif ( r1 >= 71 ) then
                set index=2
            endif
            set HeroRare_LastRandomUnit=PlaceRandomUnit(s__HeroRare___HeroRare[index], p, 0, 0, 0)
            call s__Units_Set(HeroRare_LastRandomUnit)
            if ( (s__HeroRares_isRepeat) == false ) then // INLINED!!
                call UnitPoolRemoveUnitType(s__HeroRare___HeroRare[index], GetUnitTypeId(HeroRare_LastRandomUnit))
            endif
            return HeroRare_LastRandomUnit
        endfunction

//library HeroRare ends
//library Winner:
        function s__Winner_GetMaxKills takes nothing returns integer
            return s__Winner_MaxKills
        endfunction
        function s__Winner_Death takes unit u returns nothing
            local integer ud=s__Units_player[(LoadInteger(Table___ht, ((s__Units_ht)), GetHandleId(((u)))))] // INLINED!!
            call s__Teams_AddTeamKills(s__Players_teamid[ud] , 1)
            call TriggerEvaluate(st__KillUi_FlushKillData) // INLINED!!
            if ( (s__Teams___Team_Kills[(s__Players_teamid[ud])]) >= s__Winner_MaxKills ) then // INLINED!!
                set s__Winner_GameEnd=true
                call DisplayTimedTextToForce((Teams___AllPlayers), 5.00, "游戏结束啦！！！！！！！！！！！ " + (s__Teams___Team_Name[(s__Players_teamid[ud])]) + " 获得了最终的胜利！！") // INLINED!!
                call sc__Winner_ShowWin(s__Players_teamid[ud])
            endif
        endfunction
            function s__Winner_anon__8 takes nothing returns nothing
                if ( IsPlayerInForce(GetEnumPlayer(), (s__Teams___Team_Players[(s__Winner_WinTeam)])) == true ) then // INLINED!!
                    call CustomVictoryBJ(GetEnumPlayer(), true, false)
                else
                    call CustomDefeatBJ(GetEnumPlayer(), "失败！")
                endif
            endfunction
        function s__Winner_ShowWin takes integer teamid returns nothing
            set s__Winner_WinTeam=teamid
            call ForForce((Teams___AllPlayers), function s__Winner_anon__8) // INLINED!!
        endfunction
        function s__Winner_ShowTip takes nothing returns nothing
            call StopSoundBJ(gg_snd_ItemReceived, false)
            call PlaySoundBJ(gg_snd_ItemReceived)
            call PingMinimap(s__Winner_OX, s__Winner_OY, 3.00)
        endfunction  //夺旗判定 - 范围900码
            function s__Winner_anon__9 takes nothing returns boolean
                return IsUnitType(GetFilterUnit(), UNIT_TYPE_HERO) == true
            endfunction
        function s__Winner_onLoop takes nothing returns nothing
            local group g
            local integer tmp
            local unit tmp1
            local integer numbers
            local integer ntmp
            local integer array team_numbers
            local real rtmp
            if ( s__Winner_GameEnd == false ) then
                set g=CreateGroup()
                call GroupEnumUnitsInRange(g, s__Winner_OX, s__Winner_OY, 900, Condition(function s__Winner_anon__9))
                set numbers=CountUnitsInGroup(g)
                loop
                exitwhen ( FirstOfGroup(g) == null )
                    set tmp1=FirstOfGroup(g)
                    set tmp=s__Units_player[(LoadInteger(Table___ht, ((s__Units_ht)), GetHandleId(((tmp1)))))] // INLINED!!
                    set team_numbers[s__Players_teamid[tmp]]=team_numbers[s__Players_teamid[tmp]] + 1
                    call GroupRemoveUnit(g, tmp1)
                    set tmp1=null
                endloop
                call DestroyGroup(g)
                set g=null
                if ( s__Winner_Team == - 1 ) then
                    set ntmp=- 1
                    if ( team_numbers[0] != 0 and team_numbers[1] == 0 and team_numbers[2] == 0 ) then
                        set ntmp=0
                    elseif ( team_numbers[1] != 0 and team_numbers[0] == 0 and team_numbers[2] == 0 ) then
                        set ntmp=1
                    elseif ( team_numbers[2] != 0 and team_numbers[1] == 0 and team_numbers[0] == 0 ) then
                        set ntmp=2
                    endif
                    if ( ntmp != - 1 ) then
                        call s__Winner_ShowTip()
                        set s__Winner_Team=ntmp
                        call DisplayTimedTextToForce((Teams___AllPlayers), 5.00, "中央球已被" + (s__Teams___Team_Name[(ntmp)]) + "占领！") // INLINED!!
                        call s__TakeUi_ShowTakeBar((s__Teams___Team_Name[(ntmp)])) // INLINED!!
                    endif
                else
                    if ( numbers == 0 ) then
                        if ( s__Winner_NowTime > 0 ) then
                            set s__Winner_NowTime=s__Winner_NowTime - ( 0.02 * (CountPlayersInForceBJ((s__Teams___Team_Players[((s__Winner_Team))]))) ) // INLINED!!
                        else
                            call DisplayTimedTextToForce((Teams___AllPlayers), 5.00, (s__Teams___Team_Name[(s__Winner_Team)]) + " 已经丢失了中央球的控制权，中央球现在是中立状态！") // INLINED!!
                            set s__Winner_NowTime=0
                            set s__Winner_Team=- 1
                            call s__Winner_ShowTip()
                            call s__TakeUi_ShowTakeBar("")
                        endif
                    elseif ( s__Winner_NowTime >= s__Winner_MaxTime ) then
                        set s__Winner_GameEnd=true
                        call PlaySoundBJ(gg_snd_Winner)
                        call DisplayTimedTextToForce((Teams___AllPlayers), 5.00, "游戏结束啦！！！！！！！！！！！ " + (s__Teams___Team_Name[(s__Winner_Team)]) + " 获得了最终的胜利！！") // INLINED!!
                        call s__Winner_ShowWin(s__Winner_Team)
                    else
                        set rtmp=( 0.02 * team_numbers[s__Winner_Team] ) - ( 0.01 * ( numbers - team_numbers[s__Winner_Team] ) )
                        set s__Winner_NowTime=s__Winner_NowTime + rtmp
                    endif
                    call s__TakeUi_SetTakeBarStep(s__Winner_NowTime / s__Winner_MaxTime)
                endif
            else
                call ReleaseTimer(GetExpiredTimer())
            endif
        endfunction
        function s__Winner_start takes nothing returns nothing
            set s__Winner_OX=GetUnitX(Origin_Ball)
            set s__Winner_OY=GetUnitY(Origin_Ball)
            call TimerStart(NewTimer(), 0.01, true, function s__Winner_onLoop)
        endfunction

//library Winner ends
//library Init:

    //public:  //中央球、阵初始化、杂物初始化类 //中央球,中央阵
        function Init___anon__0 takes nothing returns nothing
            local unit u
            local integer p=s__Players_Set(GetEnumPlayer())
            call UnitShareVision(Origin_Ball, s__Players_player[p], true) //目前没有SR、SSR池英雄，随机上限定位R级
            set u=s__HeroRares_GetRandomHero(s__Players_player[p] , 20)
            set s__Players_hero[p]=u
            call SetUnitPosition(u, GetRectCenterX((s__Teams___Team_Rect[GetPlayerTeam((s__Players_player[p]))])), GetRectCenterY((s__Teams___Team_Rect[GetPlayerTeam((s__Players_player[p]))]))) // INLINED!!
            set u=null
        endfunction
    function Init___onInit takes nothing returns nothing
        set Origin_Ball=gg_unit_e000_0010
        set Origin_Magic=gg_unit_e001_0011
        set Origin_X=GetUnitX(Origin_Ball)
        set Origin_Y=GetUnitY(Origin_Ball)
        call SetUnitTimeScale(Origin_Magic, 0)
        call s__Winner_start()
        call s__Players_Set(Player(PLAYER_NEUTRAL_PASSIVE))
        call ForForce(Teams___AllPlayers, (function Init___anon__0)) // INLINED!!
    endfunction

//library Init ends
//library KillUi:
        //private:  //队伍序号 
            function s__KillUi_anon__10 takes nothing returns nothing
                set s___KillUi_TeamPlayer[s__KillUi_TeamPlayer[s__KillUi_tmp]+s__KillUi_TeamNumbers[s__KillUi_tmp]]=(sc__HandleTable__getindex(s__Players_ht,(GetEnumPlayer()))) // INLINED!!
                set s__KillUi_TeamNumbers[s__KillUi_tmp]=s__KillUi_TeamNumbers[s__KillUi_tmp] + 1
            endfunction
        function s__KillUi_create takes integer tid returns integer
            set s__KillUi_tmp=s__KillUi__allocate()
            set s__KillUi_TeamIndex[s__KillUi_tmp]=tid
            call ForForce((s__Teams___Team_Players[(tid)]), function s__KillUi_anon__10) // INLINED!!
            return s__KillUi_tmp
        endfunction
        function s__KillUi_FlushKillData takes nothing returns nothing
            call DzFrameSetText(s__KillUi_KillBackgroundText, " 杀敌数   " + (s__Teams___Team_Name[(0)]) + ":" + I2S((s__Teams___Team_Kills[(0)])) + "    " + (s__Teams___Team_Name[(1)]) + ":" + I2S((s__Teams___Team_Kills[(1)])) + "    " + (s__Teams___Team_Name[(2)]) + ":" + I2S((s__Teams___Team_Kills[(2)])) + "    胜利:" + I2S((s__Winner_MaxKills)) + "    ↓F2↓") // INLINED!!
        endfunction
            function s__KillUi_anon__11 takes nothing returns nothing
                call DzFrameSetText(s__KillUi_KillBackgroundText, " 杀敌数   " + (s__Teams___Team_Name[(0)]) + ":" + I2S((s__Teams___Team_Kills[(0)])) + "    " + (s__Teams___Team_Name[(1)]) + ":" + I2S((s__Teams___Team_Kills[(1)])) + "    " + (s__Teams___Team_Name[(2)]) + ":" + I2S((s__Teams___Team_Kills[(2)])) + "    胜利:" + I2S((s__Winner_MaxKills)) + "    ↓F2↓") // INLINED!!
                call ReleaseTimer(GetExpiredTimer())
            endfunction  //-----最小化状态
            function s__KillUi_anon__12 takes nothing returns nothing
                local integer i
                set i=0
                loop
                exitwhen ( i >= 3 )
                    set s__s__KillUi_KillTeam[i]= - 1
                    if ( (CountPlayersInForceBJ((s__Teams___Team_Players[((i))]))) != 0 ) then // INLINED!!
                        set s__s__KillUi_KillTeam[i]= s__KillUi_create(i)
                        call BJDebugMsg(I2S(i))
                    endif
                set i=i + 1
                endloop
            endfunction
        function s__KillUi_onInit takes nothing returns nothing
            set s__KillUi_KillBackground=DzCreateFrameByTagName("BACKDROP", "KillBackground", DzGetGameUI(), "Panel", 0)
            call DzFrameSetSize(s__KillUi_KillBackground, 0.254, 0.024)
            call DzFrameSetPoint(s__KillUi_KillBackground, 3, DzFrameGetUpperButtonBarButton(0), 5, 0.458, 0.00)
            call DzFrameSetTexture(s__KillUi_KillBackground, "UI_RightUpperBackground.blp", 0)
            set s__KillUi_KillBackgroundText=DzCreateFrameByTagName("TEXT", "KillBackgroundText", s__KillUi_KillBackground, "TextInfo", 0)
            call DzFrameSetPoint(s__KillUi_KillBackgroundText, 3, s__KillUi_KillBackground, 3, 0.001, - 0.042)
            call DzFrameSetSize(s__KillUi_KillBackgroundText, 0.3, 0.1)
            call TimerStart(NewTimer(), 1, false, function s__KillUi_anon__11)
            set s__KillUi_KillBackgroundMaxLine=DzCreateFrameByTagName("BACKDROP", "KillBackgroundMaxLine", s__KillUi_KillBackground, "ShowInfo", 0)
            call DzFrameSetSize(s__KillUi_KillBackgroundMaxLine, 0.254, 0.2)
            call DzFrameSetPoint(s__KillUi_KillBackgroundMaxLine, 1, s__KillUi_KillBackground, 7, 0, 0.006)
            call DzFrameSetTexture(s__KillUi_KillBackgroundMaxLine, "UI_RightDownPanelLine.blp", 0)
            set s__KillUi_KillBackgroundMaxBorder=DzCreateFrameByTagName("BACKDROP", "KillBackgroundMaxBorder", s__KillUi_KillBackgroundMaxLine, "ShowInfo", 0)
            call DzFrameSetSize(s__KillUi_KillBackgroundMaxBorder, 0.254, 0.005)
            call DzFrameSetPoint(s__KillUi_KillBackgroundMaxBorder, 1, s__KillUi_KillBackgroundMaxLine, 7, 0, 0)
            call DzFrameSetTexture(s__KillUi_KillBackgroundMaxBorder, "UI_RightDownPanelBorder.blp", 0)
            call TimerStart(NewTimer(), 1, false, function s__KillUi_anon__12)
        endfunction

//library KillUi ends
//===========================================================================
// 
// 抢地盘
// 
//   Warcraft III map script
//   Generated by the Warcraft III World Editor
//   Date: Mon Nov 26 15:26:52 2018
//   Map Author: 未知！
// 
//===========================================================================
//***************************************************************************
//*
//*  Global Variables
//*
//***************************************************************************
function InitGlobals takes nothing returns nothing
endfunction
//***************************************************************************
//*
//*  Sounds
//*
//***************************************************************************
function InitSounds takes nothing returns nothing
    set gg_snd_ItemReceived=CreateSound("Sound\\Interface\\ItemReceived.wav", false, false, false, 10, 10, "")
    call SetSoundParamsFromLabel(gg_snd_ItemReceived, "ItemReward")
    call SetSoundDuration(gg_snd_ItemReceived, 1483)
    set gg_snd_Winner=CreateSound("Sound\\Interface\\ArrangedTeamInvitation.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_Winner, "ArrangedTeamInvitation")
    call SetSoundDuration(gg_snd_Winner, 2914)
endfunction
//***************************************************************************
//*
//*  Unit Creation
//*
//***************************************************************************
//===========================================================================
function CreateNeutralPassive takes nothing returns nothing
    local player p= Player(PLAYER_NEUTRAL_PASSIVE)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'H000', - 127.4, - 141.7, 357.230)
    set gg_unit_e000_0010=CreateUnit(p, 'e000', - 207.2, - 777.2, 178.920)
    set gg_unit_e001_0011=CreateUnit(p, 'e001', - 189.7, - 805.3, 188.608)
endfunction
//===========================================================================
function CreatePlayerBuildings takes nothing returns nothing
endfunction
//===========================================================================
function CreatePlayerUnits takes nothing returns nothing
endfunction
//===========================================================================
function CreateAllUnits takes nothing returns nothing
    call CreatePlayerBuildings()
    call CreateNeutralPassive()
    call CreatePlayerUnits()
endfunction
//***************************************************************************
//*
//*  Regions
//*
//***************************************************************************
function CreateRegions takes nothing returns nothing
    local weathereffect we
    set gg_rct_YeGuai_01=Rect(- 4800.0, - 2752.0, - 1664.0, 4736.0)
    set gg_rct_ShuLin_01=Rect(- 2304.0, - 5376.0, 2720.0, - 4000.0)
    set gg_rct_YeGuai_02=Rect(1472.0, - 2688.0, 4864.0, 4832.0)
    set gg_rct_A_TEAM=Rect(- 4448.0, - 4928.0, - 3744.0, - 4288.0)
    set gg_rct_B_TEAM=Rect(- 512.0, 3936.0, 192.0, 4544.0)
    set gg_rct_C_TEAM=Rect(3808.0, - 4864.0, 4448.0, - 4256.0)
endfunction
//***************************************************************************
//*
//*  Custom Script Code
//*
//***************************************************************************
//TESH.scrollpos=0
//TESH.alwaysfold=0
// BEGIN IMPORT OF C:\Users\ushiop\Desktop\war3\project\map/script/Table.j

// END IMPORT OF C:\Users\ushiop\Desktop\war3\project\map/script/Table.j
// BEGIN IMPORT OF C:\Users\ushiop\Desktop\war3\project\map/script/TimerUtils.j


// END IMPORT OF C:\Users\ushiop\Desktop\war3\project\map/script/TimerUtils.j
//***************************************************************************
//*
//*  Triggers
//*
//***************************************************************************
//===========================================================================
// Trigger: init
//
// 生成地图上已放置单位的变量
// 调用一些需要的函数让YDWE导入对应库
//===========================================================================
function Trig_initActions takes nothing returns nothing
    call DzLoadToc("resource\\UI.toc")
    call SetUnitUserData(gg_unit_e000_0010, 0)
    call SetUnitUserData(gg_unit_e001_0011, 0)
endfunction
//===========================================================================
function InitTrig_init takes nothing returns nothing
    set gg_trg_init=CreateTrigger()
    call TriggerAddAction(gg_trg_init, function Trig_initActions)
endfunction
//===========================================================================
function InitCustomTriggers takes nothing returns nothing
    call InitTrig_init()
endfunction
//***************************************************************************
//*
//*  Players
//*
//***************************************************************************
function InitCustomPlayerSlots takes nothing returns nothing
    // Player 0
    call SetPlayerStartLocation(Player(0), 0)
    call ForcePlayerStartLocation(Player(0), 0)
    call SetPlayerColor(Player(0), ConvertPlayerColor(0))
    call SetPlayerRacePreference(Player(0), RACE_PREF_UNDEAD)
    call SetPlayerRaceSelectable(Player(0), false)
    call SetPlayerController(Player(0), MAP_CONTROL_USER)
    // Player 1
    call SetPlayerStartLocation(Player(1), 1)
    call ForcePlayerStartLocation(Player(1), 1)
    call SetPlayerColor(Player(1), ConvertPlayerColor(1))
    call SetPlayerRacePreference(Player(1), RACE_PREF_UNDEAD)
    call SetPlayerRaceSelectable(Player(1), false)
    call SetPlayerController(Player(1), MAP_CONTROL_USER)
    // Player 2
    call SetPlayerStartLocation(Player(2), 2)
    call ForcePlayerStartLocation(Player(2), 2)
    call SetPlayerColor(Player(2), ConvertPlayerColor(2))
    call SetPlayerRacePreference(Player(2), RACE_PREF_UNDEAD)
    call SetPlayerRaceSelectable(Player(2), false)
    call SetPlayerController(Player(2), MAP_CONTROL_USER)
    // Player 3
    call SetPlayerStartLocation(Player(3), 3)
    call ForcePlayerStartLocation(Player(3), 3)
    call SetPlayerColor(Player(3), ConvertPlayerColor(3))
    call SetPlayerRacePreference(Player(3), RACE_PREF_UNDEAD)
    call SetPlayerRaceSelectable(Player(3), false)
    call SetPlayerController(Player(3), MAP_CONTROL_USER)
    // Player 4
    call SetPlayerStartLocation(Player(4), 4)
    call ForcePlayerStartLocation(Player(4), 4)
    call SetPlayerColor(Player(4), ConvertPlayerColor(4))
    call SetPlayerRacePreference(Player(4), RACE_PREF_UNDEAD)
    call SetPlayerRaceSelectable(Player(4), false)
    call SetPlayerController(Player(4), MAP_CONTROL_USER)
    // Player 5
    call SetPlayerStartLocation(Player(5), 5)
    call ForcePlayerStartLocation(Player(5), 5)
    call SetPlayerColor(Player(5), ConvertPlayerColor(5))
    call SetPlayerRacePreference(Player(5), RACE_PREF_UNDEAD)
    call SetPlayerRaceSelectable(Player(5), false)
    call SetPlayerController(Player(5), MAP_CONTROL_USER)
    // Player 6
    call SetPlayerStartLocation(Player(6), 6)
    call ForcePlayerStartLocation(Player(6), 6)
    call SetPlayerColor(Player(6), ConvertPlayerColor(6))
    call SetPlayerRacePreference(Player(6), RACE_PREF_UNDEAD)
    call SetPlayerRaceSelectable(Player(6), false)
    call SetPlayerController(Player(6), MAP_CONTROL_USER)
    // Player 7
    call SetPlayerStartLocation(Player(7), 7)
    call ForcePlayerStartLocation(Player(7), 7)
    call SetPlayerColor(Player(7), ConvertPlayerColor(7))
    call SetPlayerRacePreference(Player(7), RACE_PREF_UNDEAD)
    call SetPlayerRaceSelectable(Player(7), false)
    call SetPlayerController(Player(7), MAP_CONTROL_USER)
    // Player 8
    call SetPlayerStartLocation(Player(8), 8)
    call ForcePlayerStartLocation(Player(8), 8)
    call SetPlayerColor(Player(8), ConvertPlayerColor(8))
    call SetPlayerRacePreference(Player(8), RACE_PREF_UNDEAD)
    call SetPlayerRaceSelectable(Player(8), false)
    call SetPlayerController(Player(8), MAP_CONTROL_USER)
endfunction
function InitCustomTeams takes nothing returns nothing
    // Force: TRIGSTR_010
    call SetPlayerTeam(Player(0), 0)
    call SetPlayerState(Player(0), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(1), 0)
    call SetPlayerState(Player(1), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(2), 0)
    call SetPlayerState(Player(2), PLAYER_STATE_ALLIED_VICTORY, 1)
    //   Allied
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(1), true)
    //   Shared Vision
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(1), true)
    // Force: TRIGSTR_011
    call SetPlayerTeam(Player(3), 1)
    call SetPlayerState(Player(3), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(4), 1)
    call SetPlayerState(Player(4), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(5), 1)
    call SetPlayerState(Player(5), PLAYER_STATE_ALLIED_VICTORY, 1)
    //   Allied
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(4), true)
    //   Shared Vision
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(4), true)
    // Force: TRIGSTR_012
    call SetPlayerTeam(Player(6), 2)
    call SetPlayerState(Player(6), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(7), 2)
    call SetPlayerState(Player(7), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(8), 2)
    call SetPlayerState(Player(8), PLAYER_STATE_ALLIED_VICTORY, 1)
    //   Allied
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(7), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(7), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(7), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(7), true)
    //   Shared Vision
    call SetPlayerAllianceStateVisionBJ(Player(6), Player(7), true)
    call SetPlayerAllianceStateVisionBJ(Player(6), Player(8), true)
    call SetPlayerAllianceStateVisionBJ(Player(7), Player(6), true)
    call SetPlayerAllianceStateVisionBJ(Player(7), Player(8), true)
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(6), true)
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(7), true)
endfunction
function InitAllyPriorities takes nothing returns nothing
    call SetStartLocPrioCount(0, 2)
    call SetStartLocPrio(0, 0, 1, MAP_LOC_PRIO_LOW)
    call SetStartLocPrio(0, 1, 5, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(1, 2)
    call SetStartLocPrio(1, 0, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 1, 6, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(2, 3)
    call SetStartLocPrio(2, 0, 3, MAP_LOC_PRIO_LOW)
    call SetStartLocPrio(2, 1, 7, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(2, 2, 8, MAP_LOC_PRIO_LOW)
    call SetStartLocPrioCount(3, 1)
    call SetStartLocPrio(3, 0, 8, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(4, 2)
    call SetStartLocPrio(4, 0, 1, MAP_LOC_PRIO_LOW)
    call SetStartLocPrio(4, 1, 6, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(5, 1)
    call SetStartLocPrio(5, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(6, 1)
    call SetStartLocPrio(6, 0, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(7, 5)
    call SetStartLocPrio(7, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(7, 1, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(7, 2, 3, MAP_LOC_PRIO_LOW)
    call SetStartLocPrio(7, 3, 5, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(7, 4, 8, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(8, 1)
    call SetStartLocPrio(8, 0, 3, MAP_LOC_PRIO_HIGH)
endfunction
//***************************************************************************
//*
//*  Main Initialization
//*
//***************************************************************************
//===========================================================================
function main takes nothing returns nothing
    call SetCameraBounds(- 5376.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), - 5632.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 5376.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 5120.0 - GetCameraMargin(CAMERA_MARGIN_TOP), - 5376.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 5120.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 5376.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), - 5632.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
    call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    call NewSoundEnvironment("Default")
    call SetAmbientDaySound("LordaeronSummerDay")
    call SetAmbientNightSound("LordaeronSummerNight")
    call SetMapMusic("Music", true, 0)
    call InitSounds()
    call CreateRegions()
    call CreateAllUnits()
    call InitBlizzard()

call ExecuteFunc("jasshelper__initstructs770834437")
call ExecuteFunc("Teams___onInit")
call ExecuteFunc("TimerUtils___init")
call ExecuteFunc("Tree___onInit")
call ExecuteFunc("Camera___onInit")
call ExecuteFunc("HeroRare___onInit")
call ExecuteFunc("Init___onInit")

    call InitGlobals()
    call InitTrig_init() // INLINED!!
endfunction
//***************************************************************************
//*
//*  Map Configuration
//*
//***************************************************************************
function config takes nothing returns nothing
    call SetMapName("抢地盘")
    call SetMapDescription("当年有人在地图中央画了一个圈，你们懂8")
    call SetPlayers(9)
    call SetTeams(9)
    call SetGamePlacement(MAP_PLACEMENT_TEAMS_TOGETHER)
    call DefineStartLocation(0, - 512.0, - 2560.0)
    call DefineStartLocation(1, 2368.0, - 3392.0)
    call DefineStartLocation(2, - 4224.0, 3648.0)
    call DefineStartLocation(3, 640.0, 3712.0)
    call DefineStartLocation(4, 4160.0, - 2944.0)
    call DefineStartLocation(5, - 2752.0, - 3264.0)
    call DefineStartLocation(6, 3712.0, - 1664.0)
    call DefineStartLocation(7, - 2944.0, 256.0)
    call DefineStartLocation(8, 192.0, 2048.0)
    // Player setup
    call InitCustomPlayerSlots()
    call InitCustomTeams()
    call InitAllyPriorities()
endfunction




//Struct method generated initializers/callers:

//Functions for BigArrays:
function sa__KillUi_FlushKillData takes nothing returns boolean

            call DzFrameSetText(s__KillUi_KillBackgroundText, " 杀敌数   " + (s__Teams___Team_Name[(0)]) + ":" + I2S((s__Teams___Team_Kills[(0)])) + "    " + (s__Teams___Team_Name[(1)]) + ":" + I2S((s__Teams___Team_Kills[(1)])) + "    " + (s__Teams___Team_Name[(2)]) + ":" + I2S((s__Teams___Team_Kills[(2)])) + "    胜利:" + I2S((s__Winner_MaxKills)) + "    ↓F2↓") // INLINED!!
   return true
endfunction
function sa__Winner_ShowWin takes nothing returns boolean
local integer teamid=f__arg_integer1
            set s__Winner_WinTeam=teamid
            call ForForce((Teams___AllPlayers), function s__Winner_anon__8) // INLINED!!
   return true
endfunction
function sa__HeroRares_Repeat takes nothing returns boolean
local boolean b=f__arg_boolean1
            set s__HeroRares_isRepeat=b
   return true
endfunction
function sa__HeroRares_AddRandomHero takes nothing returns boolean
    call s__HeroRares_AddRandomHero(f__arg_unit1)
   return true
endfunction
function sa__Table___GTable_onDestroy takes nothing returns boolean
local integer this=f__arg_this
            call FlushChildHashtable(Table___ht, ((this))) // INLINED!!
   return true
endfunction
function sa__HandleTable__getindex takes nothing returns boolean
local integer this=f__arg_this
local handle key=f__arg_handle1
set f__result_integer= LoadInteger(Table___ht, (this), GetHandleId(key))
   return true
endfunction
function sa__HandleTable__setindex takes nothing returns boolean
local integer this=f__arg_this
local handle key=f__arg_handle1
local integer value=f__arg_integer1
            call SaveInteger(Table___ht, (this), GetHandleId(key), value)
   return true
endfunction

function jasshelper__initstructs770834437 takes nothing returns nothing
    set st__KillUi_FlushKillData=CreateTrigger()
    call TriggerAddCondition(st__KillUi_FlushKillData,Condition( function sa__KillUi_FlushKillData))
    set st__Winner_ShowWin=CreateTrigger()
    call TriggerAddCondition(st__Winner_ShowWin,Condition( function sa__Winner_ShowWin))
    set st__HeroRares_Repeat=CreateTrigger()
    call TriggerAddCondition(st__HeroRares_Repeat,Condition( function sa__HeroRares_Repeat))
    set st__HeroRares_AddRandomHero=CreateTrigger()
    call TriggerAddCondition(st__HeroRares_AddRandomHero,Condition( function sa__HeroRares_AddRandomHero))
    set st__Table___GTable_onDestroy[2]=CreateTrigger()
    set st__Table___GTable_onDestroy[3]=st__Table___GTable_onDestroy[2]
    set st__Table___GTable_onDestroy[4]=st__Table___GTable_onDestroy[2]
    set st__Table___GTable_onDestroy[5]=st__Table___GTable_onDestroy[2]
    call TriggerAddCondition(st__Table___GTable_onDestroy[2],Condition( function sa__Table___GTable_onDestroy))
    set st__HandleTable__getindex=CreateTrigger()
    call TriggerAddCondition(st__HandleTable__getindex,Condition( function sa__HandleTable__getindex))
    set st__HandleTable__setindex=CreateTrigger()
    call TriggerAddCondition(st__HandleTable__setindex,Condition( function sa__HandleTable__setindex))


















    call ExecuteFunc("s__Players_onInit")
    call ExecuteFunc("s__Table___GTable_onInit")
    call ExecuteFunc("s__TakeUi_onInit")
    call ExecuteFunc("s__Units_onInit")
    call ExecuteFunc("s__KillUi_onInit")
endfunction

