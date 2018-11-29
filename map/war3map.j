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
rect array Tree__rec
//endglobals from Tree
//globals from Util:
constant boolean LIBRARY_Util=true
//endglobals from Util
//globals from YDWEEventDamageData:
constant boolean LIBRARY_YDWEEventDamageData=true
constant integer YDWEEventDamageData__EVENT_DAMAGE_DATA_VAILD= 0
constant integer YDWEEventDamageData__EVENT_DAMAGE_DATA_IS_PHYSICAL= 1
constant integer YDWEEventDamageData__EVENT_DAMAGE_DATA_IS_ATTACK= 2
constant integer YDWEEventDamageData__EVENT_DAMAGE_DATA_IS_RANGED= 3
constant integer YDWEEventDamageData__EVENT_DAMAGE_DATA_DAMAGE_TYPE= 4
constant integer YDWEEventDamageData__EVENT_DAMAGE_DATA_WEAPON_TYPE= 5
constant integer YDWEEventDamageData__EVENT_DAMAGE_DATA_ATTACK_TYPE= 6
//endglobals from YDWEEventDamageData
//globals from YDWETriggerEvent:
constant boolean LIBRARY_YDWETriggerEvent=true
trigger yd_DamageEventTrigger= null
trigger array YDWETriggerEvent__DamageEventQueue
integer YDWETriggerEvent__DamageEventNumber= 0
	
item bj_lastMovedItemInItemSlot= null
	
trigger YDWETriggerEvent__MoveItemEventTrigger= null
trigger array YDWETriggerEvent__MoveItemEventQueue
integer YDWETriggerEvent__MoveItemEventNumber= 0
//endglobals from YDWETriggerEvent
//globals from YDWEYDWEJapiScript:
constant boolean LIBRARY_YDWEYDWEJapiScript=true
constant integer YDWE_OBJECT_TYPE_ABILITY= 0
constant integer YDWE_OBJECT_TYPE_BUFF= 1
constant integer YDWE_OBJECT_TYPE_UNIT= 2
constant integer YDWE_OBJECT_TYPE_ITEM= 3
constant integer YDWE_OBJECT_TYPE_UPGRADE= 4
constant integer YDWE_OBJECT_TYPE_DOODAD= 5
constant integer YDWE_OBJECT_TYPE_DESTRUCTABLE= 6
//endglobals from YDWEYDWEJapiScript
//globals from Disconnect:
constant boolean LIBRARY_Disconnect=true
integer Disconnect__tmp
//endglobals from Disconnect
//globals from Events:
constant boolean LIBRARY_Events=true
//endglobals from Events
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
real GameTime=0.0
//endglobals from Init
//globals from KillUi:
constant boolean LIBRARY_KillUi=true
//endglobals from KillUi
//globals from Camera:
constant boolean LIBRARY_Camera=true
//endglobals from Camera
//globals from Respawn:
constant boolean LIBRARY_Respawn=true
//endglobals from Respawn
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
trigger gg_trg____________________001= null

trigger l__library_init

//JASSHelper struct globals:
constant integer si__Players=1
integer si__Players_F=0
integer si__Players_I=0
integer array si__Players_V
integer s__Players_ht
player s__Players_localplayer
integer array s__Players_playerid
player array s__Players_player
integer array s__Players_teamid
integer array s__Players_kills
integer array s__Players_deaths
integer array s__Players_hero
string array s__Players_name
boolean array s__Players_isonline
real array s__Players_randomhero
integer array s__Players_lifekill
integer array s__Players_respawn
integer array s__Players_nextherotype
boolean array s__Players_isdeath
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
constant integer si__Util=8
integer si__Util_F=0
integer si__Util_I=0
integer array si__Util_V
constant integer si__EventArgs=9
integer si__EventArgs_F=0
integer si__EventArgs_I=0
integer array si__EventArgs_V
unit array s__EventArgs_DeathUnit
unit array s__EventArgs_KillUnit
unit array s__EventArgs_TriggerUnit
player array s__EventArgs_TriggerPlayer
integer array s__EventArgs_TriggerKey
player array s__EventArgs_TriggerKeyPlayer
unit array s__EventArgs_DamageUnit
real array s__EventArgs_Damage
boolean array s__EventArgs_RangeDamage
boolean array s__EventArgs_AttackDamage
boolean array s__EventArgs_MagicDamage
constant integer si__Events=10
integer si__Events_F=0
integer si__Events_I=0
integer array si__Events_V
constant string s__Events_onUnitDeath="Events.UnitDeath"
constant string s__Events_onPlayerDisconnect="Events.PlayerDisconnect"
constant string s__Events_onPressKeyDown="Event.PressKeyDown"
constant string s__Events_onPressKeyUp="Event.PressKeyUp"
constant string s__Events_onUnitDamage="Events.UnitDamage"
constant integer si__Units=11
integer si__Units_F=0
integer si__Units_I=0
integer array si__Units_V
integer s__Units_ht
integer array s__Units_player
boolean array s__Units_isHero
string array s__Units_name
unit array s__Units_unit
integer array s__Units_uid
constant string s__Units_onUnitDeath="Units.UnitDeath"
constant string s__Units_onHeroDeath="Units.HeroDeath"
constant string s__Units_onUnitSpawn="Units.UnitSpawn"
constant string s__Units_onHeroSpawn="Units.HeroSpawn"
constant integer si__HeroRares=12
integer si__HeroRares_F=0
integer si__HeroRares_I=0
integer array si__HeroRares_V
boolean s__HeroRares_isRepeat=false
constant integer si__Winner=13
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
constant integer si__KillUi=14
integer si__KillUi_F=0
integer si__KillUi_I=0
integer array si__KillUi_V
integer s__KillUi_KillBackground
integer s__KillUi_KillBackgroundText
integer s__KillUi_KillBackgroundMaxLine
integer s__KillUi_KillBackgroundMaxBorder
real s__KillUi_KillBackgroundMaxHeight=0
integer s__KillUi_tmp
integer array s__KillUi_TeamIndex
integer array s__KillUi_TeamNumbers
integer array s___KillUi_TeamPlayer
constant integer s___KillUi_TeamPlayer_size=3
integer array s__KillUi_TeamPlayer
integer array s__KillUi_TeamName
integer array s__KillUi_TeamWin
integer array s__KillUi_TeamMoveBar
real array s__KillUi_TeamWinAcc
integer array s___KillUi_TeamNumberName
constant integer s___KillUi_TeamNumberName_size=3
integer array s__KillUi_TeamNumberName
integer array s___KillUi_TeamNumberHeroName
constant integer s___KillUi_TeamNumberHeroName_size=3
integer array s__KillUi_TeamNumberHeroName
integer array s___KillUi_TeamNumberHeroIcon
constant integer s___KillUi_TeamNumberHeroIcon_size=3
integer array s__KillUi_TeamNumberHeroIcon
integer array s___KillUi_TeamNumberHr
constant integer s___KillUi_TeamNumberHr_size=3
integer array s__KillUi_TeamNumberHr
integer array s___KillUi_TeamNumberInfo
constant integer s___KillUi_TeamNumberInfo_size=3
integer array s__KillUi_TeamNumberInfo
constant integer si__Respawn__Respawn=21
integer si__Respawn__Respawn_F=0
integer si__Respawn__Respawn_I=0
integer array si__Respawn__Respawn_V
integer s__Respawn__Respawn_DeathUIMainTop
integer s__Respawn__Respawn_DeathUIMainLine
integer s__Respawn__Respawn_DeathUIMainDown
integer s__Respawn__Respawn_DeathUIMainTitle
integer s__Respawn__Respawn_DeathUIMainRoll
integer s__Respawn__Respawn_DeathUIMainSave
integer s__Respawn__Respawn_DeathUIMainSaveLine
integer s__Respawn__Respawn_DeathUIMainBuy
integer s__Respawn__Respawn_DeathUIMainBuyLine
integer s__Respawn__Respawn_DeathUIMainTip
integer s__Respawn__Respawn_DeathUIMainSelect
integer s__Respawn__Respawn_DeathUIMainMoveBar
real s__Respawn__Respawn_MaxRespawnTime=5.0
boolean s__Respawn__Respawn_RespawnShow=false
real s__Respawn__Respawn_RespawnShowTime=0.0
real array s__Respawn__Respawn_RespawnTime
integer array s__Respawn__Respawn_RespawnSaveMoney
integer array s__Respawn__Respawn_RespawnSelectLast
integer array s__Respawn__Respawn_RespawnSelect
force array s__Teams___Team_Players
rect array s__Teams___Team_Rect
string array s__Teams___Team_Name
integer array s__Teams___Team_Kills
integer array s__TimerUtils___data
timer array s__TimerUtils___tT
unitpool array s__HeroRare___HeroRare
integer array s__s__KillUi_KillTeam
string array s__s__Respawn__Respawn_RespawnType
integer array si__Table___GTable_type
trigger array st__Table___GTable_onDestroy
trigger st__HandleTable__getindex
trigger st__HandleTable__setindex
trigger st__Events_On
trigger st__Units_Destroys
trigger st__Units_Get
trigger st__HeroRares_Repeat
trigger st__HeroRares_AddRandomHero
trigger st__Winner_ShowWin
trigger st__KillUi_FlushPlayerData
trigger st__KillUi_FlushData
trigger st__KillUi_FlushKillData
trigger st__Respawn__Respawn_Flush
trigger st__Respawn__Respawn_Show
trigger array st___prototype15
trigger array st___prototype16
handle f__arg_handle1
integer f__arg_integer1
integer f__arg_integer2
string f__arg_string1
unit f__arg_unit1
boolean f__arg_boolean1
player f__arg_player1
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
	native EXGetEventDamageData takes integer edd_type returns integer
	native EXSetEventDamage takes real amount returns boolean
	native EXExecuteScript takes string script returns string


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

//Generated method caller for Respawn__Respawn.Flush
function sc__Respawn__Respawn_Flush takes player ps returns nothing
    set f__arg_player1=ps
    call TriggerEvaluate(st__Respawn__Respawn_Flush)
endfunction

//Generated method caller for Respawn__Respawn.Show
function sc__Respawn__Respawn_Show takes player p,boolean show returns nothing
    set f__arg_player1=p
    set f__arg_boolean1=show
    call TriggerEvaluate(st__Respawn__Respawn_Show)
endfunction

//Generated allocator of Respawn__Respawn
function s__Respawn__Respawn__allocate takes nothing returns integer
 local integer this=si__Respawn__Respawn_F
    if (this!=0) then
        set si__Respawn__Respawn_F=si__Respawn__Respawn_V[this]
    else
        set si__Respawn__Respawn_I=si__Respawn__Respawn_I+1
        set this=si__Respawn__Respawn_I
    endif
    if (this>8190) then
        return 0
    endif

   set s__Respawn__Respawn_RespawnSaveMoney[this]=0
   set s__Respawn__Respawn_RespawnSelectLast[this]=0
   set s__Respawn__Respawn_RespawnSelect[this]=0
    set si__Respawn__Respawn_V[this]=-1
 return this
endfunction

//Generated destructor of Respawn__Respawn
function s__Respawn__Respawn_deallocate takes integer this returns nothing
    if this==null then
        return
    elseif (si__Respawn__Respawn_V[this]!=-1) then
        return
    endif
    set si__Respawn__Respawn_V[this]=si__Respawn__Respawn_F
    set si__Respawn__Respawn_F=this
endfunction

//Generated method caller for KillUi.FlushPlayerData
function sc__KillUi_FlushPlayerData takes player p returns nothing
    set f__arg_player1=p
    call TriggerEvaluate(st__KillUi_FlushPlayerData)
endfunction

//Generated method caller for KillUi.FlushData
function sc__KillUi_FlushData takes integer teamid returns nothing
    set f__arg_integer1=teamid
    call TriggerEvaluate(st__KillUi_FlushData)
endfunction

//Generated method caller for KillUi.FlushKillData
function sc__KillUi_FlushKillData takes integer tid returns nothing
    set f__arg_integer1=tid
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
    set s__KillUi_TeamNumberHr[this]=(this-1)*3
    set s__KillUi_TeamNumberInfo[this]=(this-1)*3
   set s__KillUi_TeamWinAcc[this]=0
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

//Generated method caller for Units.Destroys
function sc__Units_Destroys takes unit u returns nothing
    set f__arg_unit1=u
    call TriggerEvaluate(st__Units_Destroys)
endfunction

//Generated method caller for Units.Get
function sc__Units_Get takes unit u returns integer
    set f__arg_unit1=u
    call TriggerEvaluate(st__Units_Get)
 return f__result_integer
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

//Generated method caller for Events.On
function sc__Events_On takes string eName,integer callback returns nothing
    set f__arg_string1=eName
    set f__arg_integer1=callback
    call TriggerEvaluate(st__Events_On)
endfunction

//Generated allocator of Events
function s__Events__allocate takes nothing returns integer
 local integer this=si__Events_F
    if (this!=0) then
        set si__Events_F=si__Events_V[this]
    else
        set si__Events_I=si__Events_I+1
        set this=si__Events_I
    endif
    if (this>8190) then
        return 0
    endif

    set si__Events_V[this]=-1
 return this
endfunction

//Generated destructor of Events
function s__Events_deallocate takes integer this returns nothing
    if this==null then
        return
    elseif (si__Events_V[this]!=-1) then
        return
    endif
    set si__Events_V[this]=si__Events_F
    set si__Events_F=this
endfunction

//Generated allocator of EventArgs
function s__EventArgs__allocate takes nothing returns integer
 local integer this=si__EventArgs_F
    if (this!=0) then
        set si__EventArgs_F=si__EventArgs_V[this]
    else
        set si__EventArgs_I=si__EventArgs_I+1
        set this=si__EventArgs_I
    endif
    if (this>8190) then
        return 0
    endif

    set si__EventArgs_V[this]=-1
 return this
endfunction

//Generated destructor of EventArgs
function s__EventArgs_deallocate takes integer this returns nothing
    if this==null then
        return
    elseif (si__EventArgs_V[this]!=-1) then
        return
    endif
    set si__EventArgs_V[this]=si__EventArgs_F
    set si__EventArgs_F=this
endfunction

//Generated allocator of Util
function s__Util__allocate takes nothing returns integer
 local integer this=si__Util_F
    if (this!=0) then
        set si__Util_F=si__Util_V[this]
    else
        set si__Util_I=si__Util_I+1
        set this=si__Util_I
    endif
    if (this>8190) then
        return 0
    endif

    set si__Util_V[this]=-1
 return this
endfunction

//Generated destructor of Util
function s__Util_deallocate takes integer this returns nothing
    if this==null then
        return
    elseif (si__Util_V[this]!=-1) then
        return
    endif
    set si__Util_V[this]=si__Util_F
    set si__Util_F=this
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

function sc___prototype15_execute takes integer i,integer a1 returns nothing
    set f__arg_integer1=a1

    call TriggerExecute(st___prototype15[i])
endfunction
function sc___prototype15_evaluate takes integer i,integer a1 returns nothing
    set f__arg_integer1=a1

    call TriggerEvaluate(st___prototype15[i])

endfunction
function sc___prototype16_execute takes integer i,integer a1,integer a2 returns nothing
    set f__arg_integer1=a1
    set f__arg_integer2=a2

    call TriggerExecute(st___prototype16[i])
endfunction
function sc___prototype16_evaluate takes integer i,integer a1,integer a2 returns nothing
    set f__arg_integer1=a1
    set f__arg_integer2=a2

    call TriggerEvaluate(st___prototype16[i])

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
            function s__Players_Money takes integer this returns integer
                return GetPlayerState(s__Players_player[this], PLAYER_STATE_RESOURCE_GOLD)
            endfunction
            function s__Players_AddMoney takes integer this,integer addm returns nothing
                call AdjustPlayerStateBJ(addm, s__Players_player[this], PLAYER_STATE_RESOURCE_GOLD)
            endfunction
        function s__Players_Set takes player ps returns integer
            local integer p=s__Players__allocate()
            set s__Players_kills[p]=0
            set s__Players_deaths[p]=0
            set s__Players_player[p]=ps
            set s__Players_name[p]=GetPlayerName(ps)
            set s__Players_playerid[p]=GetConvertedPlayerId(ps)
            set s__Players_teamid[p]=GetPlayerTeam(ps)
            set s__Players_isonline[p]=true
            set s__Players_randomhero[p]=0
            set s__Players_lifekill[p]=0
            set s__Players_nextherotype[p]=0
            set s__Players_isdeath[p]=false
            call sc__HandleTable__setindex(s__Players_ht,ps, p)
            return p
        endfunction
        function s__Players_Get takes player p returns integer
            return sc__HandleTable__getindex(s__Players_ht,p)
        endfunction
        function s__Players_onInit takes nothing returns nothing
            set s__Players_ht=s__HandleTable__allocate()
            set s__Players_localplayer=GetLocalPlayer()
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

        function Tree__anon__7 takes nothing returns nothing
            call PolledWait(30.00)
            call DestructableRestoreLife(GetDyingDestructable(), GetDestructableMaxLife(GetDyingDestructable()), true)
        endfunction
    function Tree__onInit takes nothing returns nothing
        local trigger t
        local location d
        local integer i
        local integer x
        set Tree__rec[0]=gg_rct_ShuLin_01
        set Tree__rec[1]=gg_rct_YeGuai_01
        set Tree__rec[2]=gg_rct_YeGuai_02
        set t=CreateTrigger()
        call TriggerAddAction(t, function Tree__anon__7)
        set i=0
        loop
        exitwhen ( i >= 100 )
            set x=0
            loop
            exitwhen ( x >= 3 )
                set d=GetRandomLocInRect(Tree__rec[x])
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
        function s__Util_XY takes unit u,unit m returns real
            return bj_RADTODEG * Atan2(GetUnitY(m) - GetUnitY(u), GetUnitX(m) - GetUnitX(u))
        endfunction
        function s__Util_XYEX takes real x,real y,real x1,real y1 returns real
            return bj_RADTODEG * Atan2(y1 - y, x1 - x)
        endfunction
        function s__Util_XY2 takes unit u,unit m returns real
            local real dx=GetUnitX(m) - GetUnitX(u)
            local real dy=GetUnitY(m) - GetUnitY(u)
            return SquareRoot(dx * dx + dy * dy)
        endfunction
        function s__Util_XY2EX takes real x,real y,real x1,real y1 returns real
            local real dx=x1 - x
            local real dy=y1 - y
            return SquareRoot(dx * dx + dy * dy)
        endfunction
        function s__Util_UnitAddRemoveAbility takes unit u,integer i returns nothing
            call UnitAddAbility(u, i)
            call UnitRemoveAbility(u, i)
        endfunction
        function s__Util_GetUnitValue takes integer id,string valuename returns string
            return ( EXExecuteScript("(require'jass.slk').unit[" + I2S(id) + "]." + valuename) )
        endfunction

//library Util ends
//library YDWEEventDamageData:


	
 function YDWEIsEventPhysicalDamage takes nothing returns boolean
		return 0 != EXGetEventDamageData(YDWEEventDamageData__EVENT_DAMAGE_DATA_IS_PHYSICAL)
	endfunction
 function YDWEIsEventAttackDamage takes nothing returns boolean
		return 0 != EXGetEventDamageData(YDWEEventDamageData__EVENT_DAMAGE_DATA_IS_ATTACK)
	endfunction
	
 function YDWEIsEventRangedDamage takes nothing returns boolean
		return 0 != EXGetEventDamageData(YDWEEventDamageData__EVENT_DAMAGE_DATA_IS_RANGED)
	endfunction
	
 function YDWEIsEventDamageType takes damagetype damageType returns boolean
		return damageType == ConvertDamageType(EXGetEventDamageData(YDWEEventDamageData__EVENT_DAMAGE_DATA_DAMAGE_TYPE))
	endfunction
 function YDWEIsEventWeaponType takes weapontype weaponType returns boolean
		return weaponType == ConvertWeaponType(EXGetEventDamageData(YDWEEventDamageData__EVENT_DAMAGE_DATA_WEAPON_TYPE))
	endfunction
	
 function YDWEIsEventAttackType takes attacktype attackType returns boolean
		return attackType == ConvertAttackType(EXGetEventDamageData(YDWEEventDamageData__EVENT_DAMAGE_DATA_ATTACK_TYPE))
	endfunction
	
 function YDWESetEventDamage takes real amount returns boolean
		return EXSetEventDamage(amount)
	endfunction
	
	

//library YDWEEventDamageData ends
//library YDWETriggerEvent:
	
//===========================================================================  
//���ⵥλ�˺��¼� 
//===========================================================================
function YDWEAnyUnitDamagedTriggerAction takes nothing returns nothing
    local integer i= 0
    
    loop
        exitwhen i >= YDWETriggerEvent__DamageEventNumber
        if YDWETriggerEvent__DamageEventQueue[i] != null and IsTriggerEnabled(YDWETriggerEvent__DamageEventQueue[i]) and TriggerEvaluate(YDWETriggerEvent__DamageEventQueue[i]) then
            call TriggerExecute(YDWETriggerEvent__DamageEventQueue[i])
        endif
        set i=i + 1
    endloop
endfunction
function YDWEAnyUnitDamagedFilter takes nothing returns boolean
    if GetUnitAbilityLevel(GetFilterUnit(), 'Aloc') <= 0 then
        call TriggerRegisterUnitEvent(yd_DamageEventTrigger, GetFilterUnit(), EVENT_UNIT_DAMAGED)
    endif
    return false
endfunction
function YDWEAnyUnitDamagedEnumUnit takes nothing returns nothing
    local trigger t= CreateTrigger()
    local region r= CreateRegion()
    local group g= CreateGroup()
    call RegionAddRect(r, GetWorldBounds())
    call TriggerRegisterEnterRegion(t, r, Condition(function YDWEAnyUnitDamagedFilter))
    call GroupEnumUnitsInRect(g, GetWorldBounds(), Condition(function YDWEAnyUnitDamagedFilter))
    call DestroyGroup(g)
    set r=null
    set t=null
    set g=null
endfunction
	
function YDWESyStemAnyUnitDamagedRegistTrigger takes trigger trg returns nothing
    if trg == null then
        return
    endif
        
    if YDWETriggerEvent__DamageEventNumber == 0 then
        set yd_DamageEventTrigger=CreateTrigger()
        call TriggerAddAction(yd_DamageEventTrigger, function YDWEAnyUnitDamagedTriggerAction)
        call YDWEAnyUnitDamagedEnumUnit()
    endif
    
    set YDWETriggerEvent__DamageEventQueue[YDWETriggerEvent__DamageEventNumber]=trg
    set YDWETriggerEvent__DamageEventNumber=YDWETriggerEvent__DamageEventNumber + 1
endfunction
//===========================================================================  
//�ƶ���Ʒ�¼� 
//===========================================================================  
function YDWESyStemItemUnmovableTriggerAction takes nothing returns nothing
    local integer i= 0
    
    if GetIssuedOrderId() >= 852002 and GetIssuedOrderId() <= 852007 then
		set bj_lastMovedItemInItemSlot=GetOrderTargetItem()
    	loop
        	exitwhen i >= YDWETriggerEvent__MoveItemEventNumber
        	if YDWETriggerEvent__MoveItemEventQueue[i] != null and IsTriggerEnabled(YDWETriggerEvent__MoveItemEventQueue[i]) and TriggerEvaluate(YDWETriggerEvent__MoveItemEventQueue[i]) then
        	    call TriggerExecute(YDWETriggerEvent__MoveItemEventQueue[i])
        	endif
        	set i=i + 1
    	endloop
	endif
endfunction
function YDWESyStemItemUnmovableRegistTrigger takes trigger trg returns nothing
    if trg == null then
        return
    endif
        
    if YDWETriggerEvent__MoveItemEventNumber == 0 then
        set YDWETriggerEvent__MoveItemEventTrigger=CreateTrigger()
        call TriggerAddAction(YDWETriggerEvent__MoveItemEventTrigger, function YDWESyStemItemUnmovableTriggerAction)
        call TriggerRegisterAnyUnitEventBJ(YDWETriggerEvent__MoveItemEventTrigger, EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER)
    endif
    
    set YDWETriggerEvent__MoveItemEventQueue[YDWETriggerEvent__MoveItemEventNumber]=trg
    set YDWETriggerEvent__MoveItemEventNumber=YDWETriggerEvent__MoveItemEventNumber + 1
endfunction
function GetLastMovedItemInItemSlot takes nothing returns item
    return bj_lastMovedItemInItemSlot
endfunction

//library YDWETriggerEvent ends
//library YDWEYDWEJapiScript:


//library YDWEYDWEJapiScript ends
//library Disconnect:

        function Disconnect__anon__8 takes nothing returns nothing
            call AdjustPlayerStateBJ(GetPlayerState(s__Players_player[Disconnect__tmp], PLAYER_STATE_RESOURCE_GOLD) / ( (CountPlayersInForceBJ((s__Teams___Team_Players[GetPlayerTeam(((s__Players_player[Disconnect__tmp])))]))) - 1 ), GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD) // INLINED!!
        endfunction
    function Disconnect__onDisconnect takes integer e returns nothing
        local integer x
        local unit u
        set Disconnect__tmp=(sc__HandleTable__getindex(s__Players_ht,(s__EventArgs_TriggerPlayer[e]))) // INLINED!!
        set u=s__Units_unit[s__Players_hero[Disconnect__tmp]]
        call ReviveHero(u, GetUnitX(u), GetUnitY(u), false)
        call SetUnitPosition(u, GetRectCenterX((s__Teams___Team_Rect[GetPlayerTeam((s__Players_player[Disconnect__tmp]))])), GetRectCenterY((s__Teams___Team_Rect[GetPlayerTeam((s__Players_player[Disconnect__tmp]))]))) // INLINED!!
        set x=1
        loop
        exitwhen ( x > 6 )
            call UnitRemoveItemFromSlotSwapped(x, u)
        set x=x + 1
        endloop
        call sc__HeroRares_AddRandomHero(u)
        set x=(CountPlayersInForceBJ((s__Teams___Team_Players[GetPlayerTeam(((s__Players_player[Disconnect__tmp])))]))) - 1 // INLINED!!
        if ( x != 0 ) then
            call ForForce((s__Teams___Team_Players[GetPlayerTeam((s__Players_player[Disconnect__tmp]))]), function Disconnect__anon__8) // INLINED!!
        endif
        call s__Teams_PlayerRemoveForce(s__Players_player[Disconnect__tmp])
        call DisplayTimedTextToForce((Teams___AllPlayers), 5.00, s__Players_name[Disconnect__tmp] + " 离开了游戏，金钱将平分给他的队友。") // INLINED!!
        set s__Players_isonline[Disconnect__tmp]=false
        call sc__KillUi_FlushPlayerData(s__Players_player[Disconnect__tmp])
        set u=null
    endfunction
    function Disconnect__onInit takes nothing returns nothing
        call sc__Events_On(s__Events_onPlayerDisconnect , (1))
    endfunction

//library Disconnect ends
//library Events:

//processed:     function interface Events___EventInterface takes EventArgs arg0 returns nothing
        function s__EventArgs_create takes nothing returns integer
            local integer e=s__EventArgs__allocate()
            return e
        endfunction
        function s__EventArgs_Destroy takes integer this returns nothing
            set s__EventArgs_KillUnit[this]=null
            set s__EventArgs_TriggerUnit[this]=null
            set s__EventArgs_DeathUnit[this]=null
            set s__EventArgs_TriggerPlayer[this]=null
            set s__EventArgs_TriggerKeyPlayer[this]=null
            set s__EventArgs_DamageUnit[this]=null
            call s__EventArgs_deallocate(this)
        endfunction
        //public:  //任意单位死亡
            function s__Events_On takes string eName,integer callback returns nothing
                if ( (LoadInteger(Table___ht, (((- StringHash((eName))))), (0))) == 0 ) then // INLINED!!
                    call SaveInteger(Table___ht, (((- StringHash((eName))))), (0), ( 1)) // INLINED!!
                endif
                call SaveInteger(Table___ht, (((- StringHash((eName))))), ((LoadInteger(Table___ht, (((- StringHash((eName))))), (0)))), ( callback)) // INLINED!!
                call SaveInteger(Table___ht, (((- StringHash((eName))))), (0), ( (LoadInteger(Table___ht, (((- StringHash((eName))))), (0))) + 1)) // INLINED!!
            endfunction
    function Events___Event_onUnitDeath takes nothing returns nothing
        local integer i
        local integer callback
        local integer e=s__EventArgs_create()
        set s__EventArgs_DeathUnit[e]=GetDyingUnit()
        set s__EventArgs_KillUnit[e]=GetKillingUnit()
        set s__EventArgs_DamageUnit[e]=GetEventDamageSource()
        set s__EventArgs_Damage[e]=GetEventDamage()
        set s__EventArgs_RangeDamage[e]=(0 != EXGetEventDamageData(YDWEEventDamageData__EVENT_DAMAGE_DATA_IS_RANGED)) // INLINED!!
        set s__EventArgs_AttackDamage[e]=(0 != EXGetEventDamageData(YDWEEventDamageData__EVENT_DAMAGE_DATA_IS_ATTACK)) // INLINED!!
        set s__EventArgs_MagicDamage[e]=not ( (0 != EXGetEventDamageData(YDWEEventDamageData__EVENT_DAMAGE_DATA_IS_PHYSICAL)) ) // INLINED!!
        set s__EventArgs_TriggerUnit[e]=GetTriggerUnit()
        set s__EventArgs_TriggerPlayer[e]=GetTriggerPlayer()
        set s__EventArgs_TriggerKey[e]=DzGetTriggerKey()
        set s__EventArgs_TriggerKeyPlayer[e]=DzGetTriggerKeyPlayer()
        set i=1
        loop
        exitwhen ( i >= (LoadInteger(Table___ht, (((- StringHash((s__Events_onUnitDeath))))), (0))) ) // INLINED!!
            set callback=((LoadInteger(Table___ht, (((- StringHash((s__Events_onUnitDeath))))), (i)))) // INLINED!!
            call sc___prototype15_evaluate(callback,e)
        set i=i + 1
        endloop
        call s__EventArgs_Destroy(e)
    endfunction
    function Events___Event_onPlayerDisconnect takes nothing returns nothing
        local integer i
        local integer callback
        local integer e=s__EventArgs_create()
        set s__EventArgs_DeathUnit[e]=GetDyingUnit()
        set s__EventArgs_KillUnit[e]=GetKillingUnit()
        set s__EventArgs_DamageUnit[e]=GetEventDamageSource()
        set s__EventArgs_Damage[e]=GetEventDamage()
        set s__EventArgs_RangeDamage[e]=(0 != EXGetEventDamageData(YDWEEventDamageData__EVENT_DAMAGE_DATA_IS_RANGED)) // INLINED!!
        set s__EventArgs_AttackDamage[e]=(0 != EXGetEventDamageData(YDWEEventDamageData__EVENT_DAMAGE_DATA_IS_ATTACK)) // INLINED!!
        set s__EventArgs_MagicDamage[e]=not ( (0 != EXGetEventDamageData(YDWEEventDamageData__EVENT_DAMAGE_DATA_IS_PHYSICAL)) ) // INLINED!!
        set s__EventArgs_TriggerUnit[e]=GetTriggerUnit()
        set s__EventArgs_TriggerPlayer[e]=GetTriggerPlayer()
        set s__EventArgs_TriggerKey[e]=DzGetTriggerKey()
        set s__EventArgs_TriggerKeyPlayer[e]=DzGetTriggerKeyPlayer()
        set i=1
        loop
        exitwhen ( i >= (LoadInteger(Table___ht, (((- StringHash((s__Events_onPlayerDisconnect))))), (0))) ) // INLINED!!
            set callback=((LoadInteger(Table___ht, (((- StringHash((s__Events_onPlayerDisconnect))))), (i)))) // INLINED!!
            call sc___prototype15_evaluate(callback,e)
        set i=i + 1
        endloop
        call s__EventArgs_Destroy(e)
    endfunction
    function Events___Event_onPressKeyDown takes nothing returns nothing
        local integer i
        local integer callback
        local integer e=s__EventArgs_create()
        set s__EventArgs_DeathUnit[e]=GetDyingUnit()
        set s__EventArgs_KillUnit[e]=GetKillingUnit()
        set s__EventArgs_DamageUnit[e]=GetEventDamageSource()
        set s__EventArgs_Damage[e]=GetEventDamage()
        set s__EventArgs_RangeDamage[e]=(0 != EXGetEventDamageData(YDWEEventDamageData__EVENT_DAMAGE_DATA_IS_RANGED)) // INLINED!!
        set s__EventArgs_AttackDamage[e]=(0 != EXGetEventDamageData(YDWEEventDamageData__EVENT_DAMAGE_DATA_IS_ATTACK)) // INLINED!!
        set s__EventArgs_MagicDamage[e]=not ( (0 != EXGetEventDamageData(YDWEEventDamageData__EVENT_DAMAGE_DATA_IS_PHYSICAL)) ) // INLINED!!
        set s__EventArgs_TriggerUnit[e]=GetTriggerUnit()
        set s__EventArgs_TriggerPlayer[e]=GetTriggerPlayer()
        set s__EventArgs_TriggerKey[e]=DzGetTriggerKey()
        set s__EventArgs_TriggerKeyPlayer[e]=DzGetTriggerKeyPlayer()
        set i=1
        loop
        exitwhen ( i >= (LoadInteger(Table___ht, (((- StringHash((s__Events_onPressKeyDown))))), (0))) ) // INLINED!!
            set callback=((LoadInteger(Table___ht, (((- StringHash((s__Events_onPressKeyDown))))), (i)))) // INLINED!!
            call sc___prototype15_evaluate(callback,e)
        set i=i + 1
        endloop
        call s__EventArgs_Destroy(e)
    endfunction
    function Events___Event_onPressKeyUp takes nothing returns nothing
        local integer i
        local integer callback
        local integer e=s__EventArgs_create()
        set s__EventArgs_DeathUnit[e]=GetDyingUnit()
        set s__EventArgs_KillUnit[e]=GetKillingUnit()
        set s__EventArgs_DamageUnit[e]=GetEventDamageSource()
        set s__EventArgs_Damage[e]=GetEventDamage()
        set s__EventArgs_RangeDamage[e]=(0 != EXGetEventDamageData(YDWEEventDamageData__EVENT_DAMAGE_DATA_IS_RANGED)) // INLINED!!
        set s__EventArgs_AttackDamage[e]=(0 != EXGetEventDamageData(YDWEEventDamageData__EVENT_DAMAGE_DATA_IS_ATTACK)) // INLINED!!
        set s__EventArgs_MagicDamage[e]=not ( (0 != EXGetEventDamageData(YDWEEventDamageData__EVENT_DAMAGE_DATA_IS_PHYSICAL)) ) // INLINED!!
        set s__EventArgs_TriggerUnit[e]=GetTriggerUnit()
        set s__EventArgs_TriggerPlayer[e]=GetTriggerPlayer()
        set s__EventArgs_TriggerKey[e]=DzGetTriggerKey()
        set s__EventArgs_TriggerKeyPlayer[e]=DzGetTriggerKeyPlayer()
        set i=1
        loop
        exitwhen ( i >= (LoadInteger(Table___ht, (((- StringHash((s__Events_onPressKeyUp))))), (0))) ) // INLINED!!
            set callback=((LoadInteger(Table___ht, (((- StringHash((s__Events_onPressKeyUp))))), (i)))) // INLINED!!
            call sc___prototype15_evaluate(callback,e)
        set i=i + 1
        endloop
        call s__EventArgs_Destroy(e)
    endfunction
    function Events___Event_onUnitDamage takes nothing returns nothing
        local integer i
        local integer callback
        local integer e=s__EventArgs_create()
        set s__EventArgs_DeathUnit[e]=GetDyingUnit()
        set s__EventArgs_KillUnit[e]=GetKillingUnit()
        set s__EventArgs_DamageUnit[e]=GetEventDamageSource()
        set s__EventArgs_Damage[e]=GetEventDamage()
        set s__EventArgs_RangeDamage[e]=(0 != EXGetEventDamageData(YDWEEventDamageData__EVENT_DAMAGE_DATA_IS_RANGED)) // INLINED!!
        set s__EventArgs_AttackDamage[e]=(0 != EXGetEventDamageData(YDWEEventDamageData__EVENT_DAMAGE_DATA_IS_ATTACK)) // INLINED!!
        set s__EventArgs_MagicDamage[e]=not ( (0 != EXGetEventDamageData(YDWEEventDamageData__EVENT_DAMAGE_DATA_IS_PHYSICAL)) ) // INLINED!!
        set s__EventArgs_TriggerUnit[e]=GetTriggerUnit()
        set s__EventArgs_TriggerPlayer[e]=GetTriggerPlayer()
        set s__EventArgs_TriggerKey[e]=DzGetTriggerKey()
        set s__EventArgs_TriggerKeyPlayer[e]=DzGetTriggerKeyPlayer()
        set i=1
        loop
        exitwhen ( i >= (LoadInteger(Table___ht, (((- StringHash((s__Events_onUnitDamage))))), (0))) ) // INLINED!!
            set callback=((LoadInteger(Table___ht, (((- StringHash((s__Events_onUnitDamage))))), (i)))) // INLINED!!
            call sc___prototype15_evaluate(callback,e)
        set i=i + 1
        endloop
        call s__EventArgs_Destroy(e)
    endfunction
    function Events___onInit takes nothing returns nothing
        local trigger t
        local integer index
        set t=CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_DEATH)
        call TriggerAddAction(t, function Events___Event_onUnitDeath) //end of: RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_UNIT_DEATH","Event_onUnitDeath")
        set t=CreateTrigger() //textmacro instance: RegisterArgsEvent("DzTriggerRegisterKeyEventTrg","1","113","Event_onPressKeyDown")
        call DzTriggerRegisterKeyEventTrg(t , 1 , 113)
        call TriggerAddAction(t, function Events___Event_onPressKeyDown) //end of: RegisterArgsEvent("DzTriggerRegisterKeyEventTrg","1","113","Event_onPressKeyDown")
        set t=CreateTrigger() //textmacro instance: RegisterArgsEvent("DzTriggerRegisterKeyEventTrg","0","113","Event_onPressKeyUp")
        call DzTriggerRegisterKeyEventTrg(t , 0 , 113)
        call TriggerAddAction(t, function Events___Event_onPressKeyUp) //end of: RegisterArgsEvent("DzTriggerRegisterKeyEventTrg","0","113","Event_onPressKeyUp")
        set t=CreateTrigger() //textmacro instance: RegisterArgsEvent("DzTriggerRegisterKeyEventTrg","1","'Q'","Event_onPressKeyDown") 
        call DzTriggerRegisterKeyEventTrg(t , 1 , 'Q')
        call TriggerAddAction(t, function Events___Event_onPressKeyDown) //end of: RegisterArgsEvent("DzTriggerRegisterKeyEventTrg","1","'Q'","Event_onPressKeyDown") 
        set t=CreateTrigger() //textmacro instance: RegisterArgsEvent("DzTriggerRegisterKeyEventTrg","1","'W'","Event_onPressKeyDown")               
        call DzTriggerRegisterKeyEventTrg(t , 1 , 'W')
        call TriggerAddAction(t, function Events___Event_onPressKeyDown) //end of: RegisterArgsEvent("DzTriggerRegisterKeyEventTrg","1","'W'","Event_onPressKeyDown")               
        set t=CreateTrigger() //textmacro instance: RegisterArgsEvent("DzTriggerRegisterKeyEventTrg","1","'E'","Event_onPressKeyDown") 
        call DzTriggerRegisterKeyEventTrg(t , 1 , 'E')
        call TriggerAddAction(t, function Events___Event_onPressKeyDown) //end of: RegisterArgsEvent("DzTriggerRegisterKeyEventTrg","1","'E'","Event_onPressKeyDown") 
        set t=CreateTrigger() //textmacro instance: RegisterArgsEvent("DzTriggerRegisterKeyEventTrg","1","'C'","Event_onPressKeyDown") 
        call DzTriggerRegisterKeyEventTrg(t , 1 , 'C')
        call TriggerAddAction(t, function Events___Event_onPressKeyDown) //end of: RegisterArgsEvent("DzTriggerRegisterKeyEventTrg","1","'C'","Event_onPressKeyDown") 
        set t=CreateTrigger() //textmacro instance: AllPlayerRegisterEvent("TriggerRegisterPlayerEventLeave","","Event_onPlayerDisconnect")
        set index=0
        loop
        exitwhen ( index > 12 )
            call TriggerRegisterPlayerEventLeave(t, Player(index))
        set index=index + 1
        endloop
        call TriggerAddAction(t, function Events___Event_onPlayerDisconnect) //end of: AllPlayerRegisterEvent("TriggerRegisterPlayerEventLeave","","Event_onPlayerDisconnect")
        set t=CreateTrigger()
        call YDWESyStemAnyUnitDamagedRegistTrigger(t)
        call TriggerAddAction(t, function Events___Event_onUnitDamage)
        set t=null
    endfunction

//library Events ends
//library Units:
//processed:     function interface Units___UnitsEventInterface takes Units arg0, Units arg1 returns nothing  //单位基础类 //管理单位身上的集合数据,创建单位用该类函数,杀死单位也是 //以及单位事件
        //public:  //属性
            function s__Units_Lock takes integer this,player p returns nothing
                if ( s__Players_localplayer == p ) then
                    call PanCameraToTimed(GetUnitX(s__Units_unit[this]), GetUnitY(s__Units_unit[this]), 0)
                endif
            endfunction
            function s__Units_Position takes integer this,real x,real y,boolean order returns nothing
                if ( order == true ) then
                    call SetUnitPosition(s__Units_unit[this], x, y)
                else
                    call SetUnitX(s__Units_unit[this], x)
                    call SetUnitY(s__Units_unit[this], y)
                endif
            endfunction
        //public:  //自定义事件
            function s__Units_Trigger takes string eName,unit u,unit m returns nothing
                local integer i
                local integer callback
                set i=1
                loop
                exitwhen ( i >= (LoadInteger(Table___ht, (((- StringHash((eName))))), (0))) ) // INLINED!!
                    set callback=((LoadInteger(Table___ht, (((- StringHash((eName))))), (i)))) // INLINED!!
                    call sc___prototype16_evaluate(callback,sc__Units_Get(u) , sc__Units_Get(m))
                set i=i + 1
                endloop
            endfunction
            function s__Units_On takes string eName,integer callback returns nothing
                if ( (LoadInteger(Table___ht, (((- StringHash((eName))))), (0))) == 0 ) then // INLINED!!
                    call SaveInteger(Table___ht, (((- StringHash((eName))))), (0), ( 1)) // INLINED!!
                endif
                call SaveInteger(Table___ht, (((- StringHash((eName))))), ((LoadInteger(Table___ht, (((- StringHash((eName))))), (0)))), ( callback)) // INLINED!!
                call SaveInteger(Table___ht, (((- StringHash((eName))))), (0), ( (LoadInteger(Table___ht, (((- StringHash((eName))))), (0))) + 1)) // INLINED!!
            endfunction
        function s__Units_onDeath takes integer e returns nothing
            if ( IsUnitType(s__EventArgs_TriggerUnit[e], UNIT_TYPE_HERO) == true ) then
                call s__Units_Trigger(s__Units_onHeroDeath , s__EventArgs_TriggerUnit[e] , s__EventArgs_KillUnit[e])
            else
                call s__Units_Trigger(s__Units_onUnitDeath , s__EventArgs_TriggerUnit[e] , s__EventArgs_KillUnit[e])
                call sc__Units_Destroys(s__EventArgs_TriggerUnit[e])
            endif
        endfunction
        function s__Units_onSpawn takes unit u returns nothing
            if ( IsUnitType(u, UNIT_TYPE_HERO) == true ) then
                call s__Units_Trigger(s__Units_onHeroSpawn , u , null)
            else
                call s__Units_Trigger(s__Units_onUnitSpawn , u , null)
            endif
        endfunction
        function s__Units_onInit takes nothing returns nothing
            set s__Units_ht=s__HandleTable__allocate()
            call s__Events_On(s__Events_onUnitDeath , (2))
        endfunction
        function s__Units_Create takes unit u returns nothing
            local integer ud=s__Units__allocate()
            set s__Units_player[ud]=(sc__HandleTable__getindex(s__Players_ht,(GetOwningPlayer(u)))) // INLINED!!
            set s__Units_isHero[ud]=IsUnitType(u, UNIT_TYPE_HERO)
            set s__Units_name[ud]=GetUnitName(u)
            set s__Units_uid[ud]=GetUnitTypeId(u)
            set s__Units_unit[ud]=u
            call SaveInteger(Table___ht, ((s__Units_ht)), GetHandleId((u)), ( ud)) // INLINED!!
        endfunction
        function s__Units_Destroys takes unit u returns nothing
            local integer ud=(LoadInteger(Table___ht, ((s__Units_ht)), GetHandleId((u)))) // INLINED!!
            set s__Units_unit[ud]=null
            call s__Units_deallocate(ud)
            call RemoveSavedInteger(Table___ht, ((s__Units_ht)), GetHandleId((u))) // INLINED!!
        endfunction
        function s__Units_Get takes unit u returns integer
            return (LoadInteger(Table___ht, ((s__Units_ht)), GetHandleId((u)))) // INLINED!!
        endfunction
        function s__Units_Set takes unit u returns nothing
            if ( (HaveSavedInteger(Table___ht, ((s__Units_ht)), GetHandleId((u)))) == false ) then // INLINED!!
                call s__Units_Create(u)
                call s__Units_onSpawn(u)
            endif
        endfunction
        function s__Units_Spawn takes player p,integer unitid,real x,real y,real f returns unit
            local unit u=CreateUnit(p, unitid, x, y, f)
            call s__Units_Create(u)
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call s__Units_onSpawn(u)
            set bj_lastCreatedUnit=u
            set u=null
            return bj_lastCreatedUnit
        endfunction
        function s__Units_Kill takes unit u returns nothing
            call KillUnit(u)
        endfunction
        function s__Units_Remove takes unit u returns nothing
            call s__Units_Destroys(u)
            call RemoveUnit(u)
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
        function s__Winner_Death takes integer u,integer m returns nothing
            set s__Players_deaths[s__Units_player[u]]=s__Players_deaths[s__Units_player[u]] + 1
            call sc__KillUi_FlushPlayerData(s__Players_player[s__Units_player[u]])
            if ( s__Players_teamid[s__Units_player[u]] != s__Players_teamid[s__Units_player[m]] and s__Units_unit[m] != null ) then
                set s__Players_kills[s__Units_player[m]]=s__Players_kills[s__Units_player[m]] + 1
                call s__Teams_AddTeamKills(s__Players_teamid[s__Units_player[m]] , 1)
                call sc__KillUi_FlushKillData(s__Players_teamid[s__Units_player[m]])
            endif
            if ( (s__Teams___Team_Kills[(s__Players_teamid[s__Units_player[m]])]) >= s__Winner_MaxKills ) then // INLINED!!
                set s__Winner_GameEnd=true
                call DisplayTimedTextToForce((Teams___AllPlayers), 5.00, "游戏结束啦！！！！！！！！！！！ " + (s__Teams___Team_Name[(s__Players_teamid[s__Units_player[m]])]) + " 获得了最终的胜利！！") // INLINED!!
                call sc__Winner_ShowWin(s__Players_teamid[s__Units_player[m]])
            endif
        endfunction
            function s__Winner_anon__9 takes nothing returns nothing
                if ( IsPlayerInForce(GetEnumPlayer(), (s__Teams___Team_Players[(s__Winner_WinTeam)])) == true ) then // INLINED!!
                    call CustomVictoryBJ(GetEnumPlayer(), true, false)
                else
                    call CustomDefeatBJ(GetEnumPlayer(), "失败！")
                endif
            endfunction
        function s__Winner_ShowWin takes integer teamid returns nothing
            set s__Winner_WinTeam=teamid
            call ForForce((Teams___AllPlayers), function s__Winner_anon__9) // INLINED!!
        endfunction
        function s__Winner_ShowTip takes nothing returns nothing
            call StopSoundBJ(gg_snd_ItemReceived, false)
            call PlaySoundBJ(gg_snd_ItemReceived)
            call PingMinimap(s__Winner_OX, s__Winner_OY, 3.00)
        endfunction  //夺旗判定 - 范围900码
            function s__Winner_anon__10 takes nothing returns boolean
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
                call GroupEnumUnitsInRange(g, s__Winner_OX, s__Winner_OY, 900, Condition(function s__Winner_anon__10))
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
                    if ( numbers > 0 ) then
                        set ntmp=- 1
                        if ( team_numbers[0] == numbers ) then
                            set ntmp=0
                        elseif ( team_numbers[1] == numbers ) then
                            set ntmp=1
                        elseif ( team_numbers[2] == numbers ) then
                            set ntmp=2
                        endif
                        if ( ntmp != - 1 ) then
                            call s__Winner_ShowTip()
                            set s__Winner_NowTime=0.001
                            set s__Winner_Team=ntmp
                            call DisplayTimedTextToForce((Teams___AllPlayers), 5.00, "中央球已被" + (s__Teams___Team_Name[(ntmp)]) + "占领！") // INLINED!!
                            call s__TakeUi_ShowTakeBar((s__Teams___Team_Name[(ntmp)])) // INLINED!!
                        endif
                    endif
                elseif ( s__Winner_NowTime > 0 ) then
                    if ( s__Winner_NowTime >= s__Winner_MaxTime ) then
                        set s__Winner_GameEnd=true
                        call PlaySoundBJ(gg_snd_Winner)
                        call DisplayTimedTextToForce((Teams___AllPlayers), 5.00, "游戏结束啦！！！！！！！！！！！ " + (s__Teams___Team_Name[(s__Winner_Team)]) + " 获得了最终的胜利！！") // INLINED!!
                        call s__Winner_ShowWin(s__Winner_Team)
                    else
                        if ( numbers == 0 ) then
                            set s__Winner_NowTime=s__Winner_NowTime - ( 0.02 * (CountPlayersInForceBJ((s__Teams___Team_Players[((s__Winner_Team))]))) ) // INLINED!!
                        else
                            set rtmp=( 0.02 * team_numbers[s__Winner_Team] ) - ( 0.01 * ( numbers - team_numbers[s__Winner_Team] ) )
                            set s__Winner_NowTime=s__Winner_NowTime + rtmp
                        endif
                        call s__TakeUi_SetTakeBarStep(s__Winner_NowTime / s__Winner_MaxTime)
                    endif
                else
                    call DisplayTimedTextToForce((Teams___AllPlayers), 5.00, (s__Teams___Team_Name[(s__Winner_Team)]) + " 已经丢失了中央球的控制权，中央球现在是中立状态！") // INLINED!!
                    set s__Winner_NowTime=0
                    set s__Winner_Team=- 1
                    call s__Winner_ShowTip()
                    call s__TakeUi_ShowTakeBar("")
                endif
            else
                call ReleaseTimer(GetExpiredTimer())
            endif
        endfunction
        function s__Winner_start takes nothing returns nothing
            set s__Winner_OX=GetUnitX(Origin_Ball)
            set s__Winner_OY=GetUnitY(Origin_Ball)
            call TimerStart(NewTimer(), 0.01, true, function s__Winner_onLoop)
            call s__Units_On(s__Units_onHeroDeath , (1))
        endfunction

//library Winner ends
//library Init:

    //public:  //中央球、阵初始化、杂物初始化类 //中央球,中央阵
        function Init___anon__0 takes nothing returns nothing
            local unit u
            local integer p=s__Players_Set(GetEnumPlayer())
            call UnitShareVision(Origin_Ball, s__Players_player[p], true) //目前没有SR、SSR池英雄，随机上限定位R级
            set u=s__HeroRares_GetRandomHero(s__Players_player[p] , 20)
            set s__Players_hero[p]=(LoadInteger(Table___ht, ((s__Units_ht)), GetHandleId(((u))))) // INLINED!!
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
        function s__KillUi_FlushPlayerData takes player p returns nothing
            call sc__KillUi_FlushData(GetPlayerTeam(p))
        endfunction
        function s__KillUi_FlushData takes integer teamid returns nothing
            local integer tp
            local integer this
            local integer x
            set this=s__s__KillUi_KillTeam[teamid]
            set s__KillUi_TeamWinAcc[this]=(s__Teams___Team_Kills[(s__KillUi_TeamIndex[this])]) / I2R((s__Winner_MaxKills)) // INLINED!!
            call DzFrameSetSize(s__KillUi_TeamMoveBar[this], 0.202 * s__KillUi_TeamWinAcc[this], 0.01)
            set x=0
            loop
            exitwhen ( x >= s__KillUi_TeamNumbers[this] )
                set tp=s___KillUi_TeamPlayer[s__KillUi_TeamPlayer[this]+x]
                if ( s__Players_isonline[tp] == false ) then
                    call DzFrameSetTexture(s___KillUi_TeamNumberHeroIcon[s__KillUi_TeamNumberHeroIcon[this]+x], "ReplaceableTextures\\CommandButtons\\BTNCancel.blp", 0)
                    call DzFrameSetText(s___KillUi_TeamNumberName[s__KillUi_TeamNumberName[this]+x], "[离线]" + DzFrameGetText(s___KillUi_TeamNumberName[s__KillUi_TeamNumberName[this]+x]))
                else
                    call DzFrameSetTexture(s___KillUi_TeamNumberHeroIcon[s__KillUi_TeamNumberHeroIcon[this]+x], (( EXExecuteScript("(require'jass.slk').unit[" + I2S((s__Units_uid[s__Players_hero[tp]] )) + "]." + ( "Art")) )), 0) // INLINED!!
                endif
                call DzFrameSetText(s___KillUi_TeamNumberInfo[s__KillUi_TeamNumberInfo[this]+x], "击杀/死亡   " + I2S(s__Players_kills[tp]) + "/" + I2S(s__Players_deaths[tp]))
                call DzFrameSetText(s___KillUi_TeamNumberHeroName[s__KillUi_TeamNumberHeroName[this]+x], s__Units_name[s__Players_hero[tp]])
            set x=x + 1
            endloop
        endfunction
            function s__KillUi_anon__11 takes nothing returns nothing
                set s___KillUi_TeamPlayer[s__KillUi_TeamPlayer[s__KillUi_tmp]+s__KillUi_TeamNumbers[s__KillUi_tmp]]=(sc__HandleTable__getindex(s__Players_ht,(GetEnumPlayer()))) // INLINED!!
                set s__KillUi_TeamNumbers[s__KillUi_tmp]=s__KillUi_TeamNumbers[s__KillUi_tmp] + 1
            endfunction
        function s__KillUi_create takes integer tid,integer index returns integer
            local integer i
            set s__KillUi_tmp=s__KillUi__allocate()
            set s__KillUi_TeamIndex[s__KillUi_tmp]=tid
            call ForForce((s__Teams___Team_Players[(tid)]), function s__KillUi_anon__11) // INLINED!!
            set s__KillUi_KillBackgroundMaxHeight=s__KillUi_KillBackgroundMaxHeight + 0.007
            set s__KillUi_TeamName[s__KillUi_tmp]=DzCreateFrameByTagName("TEXT", "TEAMNAME_TITLE_" + I2S(tid), s__KillUi_KillBackgroundMaxLine, "TextInfo", 0)
            call DzFrameSetSize(s__KillUi_TeamName[s__KillUi_tmp], 0.2, 0.1)
            call DzFrameSetPoint(s__KillUi_TeamName[s__KillUi_tmp], 0, s__KillUi_KillBackgroundMaxLine, 0, 0.01, - s__KillUi_KillBackgroundMaxHeight)
            call DzFrameSetText(s__KillUi_TeamName[s__KillUi_tmp], (s__Teams___Team_Name[(tid)])) // INLINED!!
            set s__KillUi_TeamWin[s__KillUi_tmp]=DzCreateFrameByTagName("TEXT", "TEAMNAME_TITLE_" + I2S(tid) + "_WIN_", s__KillUi_TeamName[s__KillUi_tmp], "TextInfo", 0)
            call DzFrameSetSize(s__KillUi_TeamWin[s__KillUi_tmp], 0.2, 0.1)
            call DzFrameSetPoint(s__KillUi_TeamWin[s__KillUi_tmp], 0, s__KillUi_TeamName[s__KillUi_tmp], 0, 0.215, 0)
            call DzFrameSetText(s__KillUi_TeamWin[s__KillUi_tmp], "胜利")
            set s__KillUi_TeamMoveBar[s__KillUi_tmp]=DzCreateFrameByTagName("BACKDROP", "TEAMNAME_TITLE_" + I2S(tid) + "_MOVEBAR_", s__KillUi_TeamName[s__KillUi_tmp], "ShowInfo", 0)
            call DzFrameSetSize(s__KillUi_TeamMoveBar[s__KillUi_tmp], 0.001, 0.01)
            call DzFrameSetPoint(s__KillUi_TeamMoveBar[s__KillUi_tmp], 0, s__KillUi_TeamName[s__KillUi_tmp], 0, 0.013, - 0.001)
            call DzFrameSetTexture(s__KillUi_TeamMoveBar[s__KillUi_tmp], "UI_RightMoveBar.blp", 0)
            set i=0
            loop
            exitwhen ( i >= s__KillUi_TeamNumbers[s__KillUi_tmp] )
                set s__KillUi_KillBackgroundMaxHeight=s__KillUi_KillBackgroundMaxHeight + 0.037
                set s___KillUi_TeamNumberHeroName[s__KillUi_TeamNumberHeroName[s__KillUi_tmp]+i]=DzCreateFrameByTagName("TEXT", "TEAMNAME_TITLE_" + I2S(tid) + "_HERONAME_" + I2S(i), s__KillUi_TeamName[s__KillUi_tmp], "TextInfo", 0)
                call DzFrameSetSize(s___KillUi_TeamNumberHeroName[s__KillUi_TeamNumberHeroName[s__KillUi_tmp]+i], 0.2, 0.1)
                call DzFrameSetPoint(s___KillUi_TeamNumberHeroName[s__KillUi_TeamNumberHeroName[s__KillUi_tmp]+i], 0, s__KillUi_TeamName[s__KillUi_tmp], 0, 0.035, - 0.019 + ( I2R(i) * - 0.035 ))
                call DzFrameSetText(s___KillUi_TeamNumberHeroName[s__KillUi_TeamNumberHeroName[s__KillUi_tmp]+i], s__Units_name[s__Players_hero[s___KillUi_TeamPlayer[s__KillUi_TeamPlayer[s__KillUi_tmp]+i]]])
                set s___KillUi_TeamNumberHeroIcon[s__KillUi_TeamNumberHeroIcon[s__KillUi_tmp]+i]=DzCreateFrameByTagName("BACKDROP", "TEAMNAME_TITLE_" + I2S(tid) + "_HEROICON_" + I2S(i), s__KillUi_TeamName[s__KillUi_tmp], "ShowInfo", 0)
                call DzFrameSetSize(s___KillUi_TeamNumberHeroIcon[s__KillUi_TeamNumberHeroIcon[s__KillUi_tmp]+i], 0.025, 0.025)
                call DzFrameSetPoint(s___KillUi_TeamNumberHeroIcon[s__KillUi_TeamNumberHeroIcon[s__KillUi_tmp]+i], 0, s__KillUi_TeamName[s__KillUi_tmp], 0, 0.007, - 0.02 + ( I2R(i) * - 0.036 ))
                call DzFrameSetTexture(s___KillUi_TeamNumberHeroIcon[s__KillUi_TeamNumberHeroIcon[s__KillUi_tmp]+i], (( EXExecuteScript("(require'jass.slk').unit[" + I2S((s__Units_uid[s__Players_hero[s___KillUi_TeamPlayer[s__KillUi_TeamPlayer[s__KillUi_tmp]+i]]] )) + "]." + ( "Art")) )), 0) // INLINED!!
                set s___KillUi_TeamNumberHr[s__KillUi_TeamNumberHr[s__KillUi_tmp]+i]=DzCreateFrameByTagName("BACKDROP", "TEAMNAME_TITLE_" + I2S(tid) + "_HR_" + I2S(i), s__KillUi_TeamName[s__KillUi_tmp], "ShowInfo", 0)
                call DzFrameSetSize(s___KillUi_TeamNumberHr[s__KillUi_TeamNumberHr[s__KillUi_tmp]+i], 0.06, 0.001)
                call DzFrameSetPoint(s___KillUi_TeamNumberHr[s__KillUi_TeamNumberHr[s__KillUi_tmp]+i], 0, s__KillUi_TeamName[s__KillUi_tmp], 0, 0.035, - 0.032 + ( I2R(i) * - 0.035 ))
                call DzFrameSetTexture(s___KillUi_TeamNumberHr[s__KillUi_TeamNumberHr[s__KillUi_tmp]+i], "UI_WHITEBLOCK.blp", 0)
                set s___KillUi_TeamNumberName[s__KillUi_TeamNumberName[s__KillUi_tmp]+i]=DzCreateFrameByTagName("TEXT", "TEAMNAME_TITLE_" + I2S(tid) + "_PLAYERNAME_" + I2S(i), s__KillUi_TeamName[s__KillUi_tmp], "TextInfo", 0)
                call DzFrameSetSize(s___KillUi_TeamNumberName[s__KillUi_TeamNumberName[s__KillUi_tmp]+i], 0.2, 0.1)
                call DzFrameSetPoint(s___KillUi_TeamNumberName[s__KillUi_TeamNumberName[s__KillUi_tmp]+i], 0, s__KillUi_TeamName[s__KillUi_tmp], 0, 0.036, - 0.034 + ( I2R(i) * - 0.035 ))
                call DzFrameSetText(s___KillUi_TeamNumberName[s__KillUi_TeamNumberName[s__KillUi_tmp]+i], s__Players_name[s___KillUi_TeamPlayer[s__KillUi_TeamPlayer[s__KillUi_tmp]+i]])
                set s___KillUi_TeamNumberInfo[s__KillUi_TeamNumberInfo[s__KillUi_tmp]+i]=DzCreateFrameByTagName("TEXT", "TEAMNAME_TITLE_" + I2S(tid) + "_INFO_" + I2S(i), s__KillUi_TeamName[s__KillUi_tmp], "TextInfo", 0)
                call DzFrameSetSize(s___KillUi_TeamNumberInfo[s__KillUi_TeamNumberInfo[s__KillUi_tmp]+i], 0.2, 0.1)
                call DzFrameSetPoint(s___KillUi_TeamNumberInfo[s__KillUi_TeamNumberInfo[s__KillUi_tmp]+i], 0, s__KillUi_TeamName[s__KillUi_tmp], 0, 0.123, - 0.027 + ( I2R(i) * - 0.034 ))
                call DzFrameSetText(s___KillUi_TeamNumberInfo[s__KillUi_TeamNumberInfo[s__KillUi_tmp]+i], "击杀/死亡   0/0")
            set i=i + 1
            endloop
            set s__KillUi_KillBackgroundMaxHeight=s__KillUi_KillBackgroundMaxHeight + 0.01
            return s__KillUi_tmp
        endfunction
        function s__KillUi_FlushKillData takes integer tid returns nothing
            call DzFrameSetText(s__KillUi_KillBackgroundText, " 杀敌数   " + (s__Teams___Team_Name[(0)]) + ":" + I2S((s__Teams___Team_Kills[(0)])) + "    " + (s__Teams___Team_Name[(1)]) + ":" + I2S((s__Teams___Team_Kills[(1)])) + "    " + (s__Teams___Team_Name[(2)]) + ":" + I2S((s__Teams___Team_Kills[(2)])) + "    胜利:" + I2S((s__Winner_MaxKills)) + "    ↓F2↓") // INLINED!!
            if ( tid != - 1 ) then
                call s__KillUi_FlushData(tid)
            endif
        endfunction
        function s__KillUi_Show takes integer e returns nothing
            if ( s__EventArgs_TriggerKey[e] == 113 ) then
                if ( GetLocalPlayer() == s__EventArgs_TriggerKeyPlayer[e] ) then
                    call DzFrameShow(s__KillUi_KillBackgroundMaxLine, true)
                endif
            endif
        endfunction
        function s__KillUi_Hide takes integer e returns nothing
            if ( s__EventArgs_TriggerKey[e] == 113 ) then
                if ( GetLocalPlayer() == s__EventArgs_TriggerKeyPlayer[e] ) then
                    call DzFrameShow(s__KillUi_KillBackgroundMaxLine, false)
                endif
            endif
        endfunction
            function s__KillUi_anon__12 takes nothing returns nothing
                call s__KillUi_FlushKillData(- 1)
                call ReleaseTimer(GetExpiredTimer())
            endfunction  //-----最小化状态
            function s__KillUi_anon__13 takes nothing returns nothing
                local integer i
                local integer index=0
                set i=0
                loop
                exitwhen ( i >= 3 )
                    set s__s__KillUi_KillTeam[i]= - 1
                    if ( (CountPlayersInForceBJ((s__Teams___Team_Players[((i))]))) != 0 ) then // INLINED!!
                        set s__s__KillUi_KillTeam[i]= s__KillUi_create(i , index)
                        set index=index + 1
                    endif
                set i=i + 1
                endloop
                call ReleaseTimer(GetExpiredTimer())
                call DzFrameSetSize(s__KillUi_KillBackgroundMaxLine, 0.254, s__KillUi_KillBackgroundMaxHeight)
            endfunction
        function s__KillUi_onInit takes nothing returns nothing
            set s__KillUi_KillBackground=DzCreateFrameByTagName("BACKDROP", "KillBackground", DzGetGameUI(), "Panel", 0)
            call DzFrameSetSize(s__KillUi_KillBackground, 0.254, 0.024)
            call DzFrameSetPoint(s__KillUi_KillBackground, 3, DzFrameGetUpperButtonBarButton(0), 5, 0.458, 0.00)
            call DzFrameSetTexture(s__KillUi_KillBackground, "UI_RightUpperBackground.blp", 0)
            set s__KillUi_KillBackgroundText=DzCreateFrameByTagName("TEXT", "KillBackgroundText", s__KillUi_KillBackground, "TextInfo", 0)
            call DzFrameSetPoint(s__KillUi_KillBackgroundText, 3, s__KillUi_KillBackground, 3, 0.001, - 0.042)
            call DzFrameSetSize(s__KillUi_KillBackgroundText, 0.3, 0.1)
            call TimerStart(NewTimer(), 0.05, false, function s__KillUi_anon__12)
            set s__KillUi_KillBackgroundMaxLine=DzCreateFrameByTagName("BACKDROP", "KillBackgroundMaxLine", s__KillUi_KillBackground, "ShowInfo", 0)
            call DzFrameSetSize(s__KillUi_KillBackgroundMaxLine, 0.254, 0.37)
            call DzFrameSetPoint(s__KillUi_KillBackgroundMaxLine, 1, s__KillUi_KillBackground, 7, 0, 0.006)
            call DzFrameSetTexture(s__KillUi_KillBackgroundMaxLine, "UI_RightDownPanelLine.blp", 0)
            set s__KillUi_KillBackgroundMaxBorder=DzCreateFrameByTagName("BACKDROP", "KillBackgroundMaxBorder", s__KillUi_KillBackgroundMaxLine, "ShowInfo", 0)
            call DzFrameSetSize(s__KillUi_KillBackgroundMaxBorder, 0.254, 0.005)
            call DzFrameSetPoint(s__KillUi_KillBackgroundMaxBorder, 1, s__KillUi_KillBackgroundMaxLine, 7, 0, 0)
            call DzFrameSetTexture(s__KillUi_KillBackgroundMaxBorder, "UI_RightDownPanelBorder.blp", 0)
            call TimerStart(NewTimer(), 0.06, false, function s__KillUi_anon__13)
            call DzFrameShow(s__KillUi_KillBackgroundMaxLine, false)
            call s__Events_On(s__Events_onPressKeyDown , (3))
            call s__Events_On(s__Events_onPressKeyUp , (4))
        endfunction

//library KillUi ends
//library Camera:

        function Camera___anon__5 takes nothing returns nothing
            call SetCameraField(CAMERA_FIELD_TARGET_DISTANCE, 3000.00, 0) //游戏时间轴，方便计算时间;
            set GameTime=GameTime + 0.01
        endfunction
    function Camera___onInit takes nothing returns nothing
        call CameraSetSmoothingFactor(998.00)
        call TimerStart(NewTimer(), 0.01, true, function Camera___anon__5)
    endfunction

//library Camera ends
//library Respawn:
        //public:
        function s__Respawn__Respawn_Spawn takes player p returns nothing
            local integer hid=0
            local integer money=0
            local integer ps=(sc__HandleTable__getindex(s__Players_ht,(p))) // INLINED!!
            local integer r=s__Players_respawn[ps]
            set s__Players_isdeath[ps]=false
            call sc__Respawn__Respawn_Show(p , false)
            if ( s__Respawn__Respawn_RespawnSelect[r] == 1 ) then
                set hid=s__Units_uid[s__Players_hero[ps]]
                set money=s__Respawn__Respawn_RespawnSaveMoney[r]
            elseif ( s__Respawn__Respawn_RespawnSelect[r] == 2 ) then
                set hid=s__Players_nextherotype[ps]
                set money=s__Respawn__Respawn_RespawnSaveMoney[r] * 2
            endif
            call s__HeroRares_AddRandomHero(s__Units_unit[s__Players_hero[ps]])
            if ( s__Respawn__Respawn_RespawnSelect[r] == 0 ) then
                set s__Players_hero[ps]=(LoadInteger(Table___ht, ((s__Units_ht)), GetHandleId(((s__HeroRares_GetRandomHero(s__Players_player[ps] , s__Players_randomhero[ps])))))) // INLINED!!
            else
                set s__Players_hero[ps]=(LoadInteger(Table___ht, ((s__Units_ht)), GetHandleId(((s__Units_Spawn(s__Players_player[ps] , hid , 0 , 0 , 0)))))) // INLINED!!
            endif
            call s__Units_Position(s__Players_hero[ps],GetRectCenterX((s__Teams___Team_Rect[GetPlayerTeam((s__Players_player[ps]))])) , GetRectCenterY((s__Teams___Team_Rect[GetPlayerTeam((s__Players_player[ps]))])) , true) // INLINED!!
            call s__Players_AddMoney(ps,- money)
            call s__Units_Lock(s__Players_hero[ps],p)
            set s__Players_respawn[ps]=0
            call s__Respawn__Respawn_deallocate(r)
        endfunction
            function s__Respawn__Respawn_anon__14 takes nothing returns nothing
                local integer p=(sc__HandleTable__getindex(s__Players_ht,(GetEnumPlayer()))) // INLINED!!
                local integer r=(s__Players_respawn[p])
                if ( s__Respawn__Respawn_RespawnTime[r] > 0 ) then
                    set s__Respawn__Respawn_RespawnTime[r]=s__Respawn__Respawn_RespawnTime[r] - 1
                    call sc__Respawn__Respawn_Flush(s__Players_player[p])
                elseif ( s__Players_isdeath[p] == true ) then
                    call s__Respawn__Respawn_Spawn(s__Players_player[p])
                endif
            endfunction
        function s__Respawn__Respawn_Time takes nothing returns nothing
            call ForForce((Teams___AllPlayers), function s__Respawn__Respawn_anon__14) // INLINED!!
        endfunction
            function s__Respawn__Respawn_anon__15 takes nothing returns nothing
                call AdjustPlayerStateBJ(300, GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD)
            endfunction
        function s__Respawn__Respawn_Death takes integer u,integer m returns nothing
            local integer r=s__Respawn__Respawn__allocate()
            if ( s__Players_teamid[s__Units_player[u]] != s__Players_teamid[s__Units_player[m]] and s__Units_unit[m] != null ) then
                set s__Players_lifekill[s__Units_player[m]]=s__Players_lifekill[s__Units_player[m]] + 1
                call ForForce((s__Teams___Team_Players[GetPlayerTeam((s__Players_player[s__Units_player[m]]))]), function s__Respawn__Respawn_anon__15) // INLINED!!
                call DisplayTimedTextToForce((Teams___AllPlayers), 5.00, s__Players_name[s__Units_player[m]] + " 及友军因击杀 " + s__Players_name[s__Units_player[u]] + " 而获得了|cffffcc00$300|r") // INLINED!!
                if ( s__Players_randomhero[s__Units_player[m]] > 0 ) then
                    set s__Players_randomhero[s__Units_player[m]]=s__Players_randomhero[s__Units_player[m]] - 5.0
                endif
            endif
            if ( s__Players_randomhero[s__Units_player[u]] < 100 ) then
                set s__Players_randomhero[s__Units_player[u]]=s__Players_randomhero[s__Units_player[u]] + 5.0
            endif
            set s__Respawn__Respawn_RespawnTime[r]=s__Respawn__Respawn_MaxRespawnTime
            set s__Respawn__Respawn_RespawnSaveMoney[r]=000 + R2I(( s__Players_lifekill[s__Units_player[u]] * 300 ) * 1.2)
            set s__Respawn__Respawn_RespawnSelect[r]=0
            set s__Respawn__Respawn_RespawnSelectLast[r]=0
            set s__Players_isdeath[s__Units_player[u]]=true
            set s__Players_lifekill[s__Units_player[u]]=0
            set s__Players_respawn[s__Units_player[u]]=r
            call sc__Respawn__Respawn_Show(s__Players_player[s__Units_player[u]] , true)
        endfunction
        function s__Respawn__Respawn_Flush takes player ps returns nothing
            local integer p=(sc__HandleTable__getindex(s__Players_ht,(ps))) // INLINED!!
            local integer r=s__Players_respawn[p]
            if ( ps == s__Players_localplayer ) then
                call DzFrameSetText(s__Respawn__Respawn_DeathUIMainSave, "(|cff00ff00W|r)保留当前英雄复活(需要|cffffcc00$" + I2S(s__Respawn__Respawn_RespawnSaveMoney[r]) + "|r)")
            endif
            if ( (GetPlayerState(s__Players_player[(p)], PLAYER_STATE_RESOURCE_GOLD)) >= s__Respawn__Respawn_RespawnSaveMoney[r] ) then // INLINED!!
                if ( ps == s__Players_localplayer ) then
                    call DzFrameShow(s__Respawn__Respawn_DeathUIMainSaveLine, false)
                endif
            else
                if ( s__Respawn__Respawn_RespawnSelect[r] == 1 ) then
                    set s__Respawn__Respawn_RespawnSelect[r]=s__Respawn__Respawn_RespawnSelectLast[r]
                endif
                if ( ps == s__Players_localplayer ) then
                    call DzFrameShow(s__Respawn__Respawn_DeathUIMainSaveLine, true)
                endif
            endif
            if ( s__Players_nextherotype[p] == 0 ) then
                if ( ps == s__Players_localplayer ) then
                    call DzFrameSetText(s__Respawn__Respawn_DeathUIMainBuy, "(|cff00ff00E|r)使用指定的英雄复活(未指定/$0)")
                    call DzFrameShow(s__Respawn__Respawn_DeathUIMainBuyLine, true)
                endif
                if ( s__Respawn__Respawn_RespawnSelect[r] == 2 ) then
                    set s__Respawn__Respawn_RespawnSelect[r]=s__Respawn__Respawn_RespawnSelectLast[r]
                endif
            else
                if ( ps == s__Players_localplayer ) then
                    call DzFrameSetText(s__Respawn__Respawn_DeathUIMainBuy, "(|cff00ff00E|r)使用指定的英雄复活(" + (( EXExecuteScript("(require'jass.slk').unit[" + I2S((s__Players_nextherotype[p] )) + "]." + ( "Name")) )) + "/$" + I2S(s__Respawn__Respawn_RespawnSaveMoney[r] * 2) + ")") // INLINED!!
                endif
                if ( (GetPlayerState(s__Players_player[(p)], PLAYER_STATE_RESOURCE_GOLD)) >= ( s__Respawn__Respawn_RespawnSaveMoney[r] * 2 ) ) then // INLINED!!
                    if ( ps == s__Players_localplayer ) then
                        call DzFrameShow(s__Respawn__Respawn_DeathUIMainBuyLine, false)
                    endif
                elseif ( s__Respawn__Respawn_RespawnSelect[r] == 2 ) then
                    set s__Respawn__Respawn_RespawnSelect[r]=s__Respawn__Respawn_RespawnSelectLast[r]
                endif
            endif
            if ( s__Respawn__Respawn_RespawnSelectLast[r] != s__Respawn__Respawn_RespawnSelect[r] ) then
                set s__Respawn__Respawn_RespawnSelectLast[r]=s__Respawn__Respawn_RespawnSelect[r]
            endif
            if ( ps == s__Players_localplayer ) then
                call DzFrameSetText(s__Respawn__Respawn_DeathUIMainSelect, "已选择:|cff00ff00" + s__s__Respawn__Respawn_RespawnType[s__Respawn__Respawn_RespawnSelect[r]] + "|r")
                call DzFrameSetSize(s__Respawn__Respawn_DeathUIMainMoveBar, 0.001 + ( 0.136 * ( 1 - ( s__Respawn__Respawn_RespawnTime[r] / s__Respawn__Respawn_MaxRespawnTime ) ) ), 0.006)
            endif
        endfunction
        function s__Respawn__Respawn_Show takes player p,boolean show returns nothing
            local integer ps=(sc__HandleTable__getindex(s__Players_ht,(p))) // INLINED!!
            if ( s__Players_localplayer == p ) then
                if ( GameTime >= s__Respawn__Respawn_RespawnShowTime or s__Players_isdeath[ps] == false ) then
                    set s__Respawn__Respawn_RespawnShowTime=GameTime + 0.05
                    set s__Respawn__Respawn_RespawnShow=show
                    call DzFrameShow(s__Respawn__Respawn_DeathUIMainTop, show)
                endif
                call s__Respawn__Respawn_Flush(p)
            endif
        endfunction
        function s__Respawn__Respawn_Press takes integer e returns nothing
            local integer p=(sc__HandleTable__getindex(s__Players_ht,(s__EventArgs_TriggerKeyPlayer[e]))) // INLINED!!
            local integer r=s__Players_respawn[p]
            if ( s__Players_isdeath[p] == true ) then
                if ( s__EventArgs_TriggerKey[e] == 'Q' ) then
                    set s__Respawn__Respawn_RespawnSelect[r]=0
                    call s__Respawn__Respawn_Flush(s__Players_player[p])
                elseif ( s__EventArgs_TriggerKey[e] == 'W' ) then
                    set s__Respawn__Respawn_RespawnSelect[r]=1
                    call s__Respawn__Respawn_Flush(s__Players_player[p])
                elseif ( s__EventArgs_TriggerKey[e] == 'E' ) then
                    set s__Respawn__Respawn_RespawnSelect[r]=2
                    call s__Respawn__Respawn_Flush(s__Players_player[p])
                endif
                if ( s__EventArgs_TriggerKey[e] == 'C' ) then
                    if ( s__Respawn__Respawn_RespawnShow == false ) then
                        call s__Respawn__Respawn_Show(s__Players_player[p] , true)
                    else
                        call s__Respawn__Respawn_Show(s__Players_player[p] , false)
                    endif
                endif
            endif
        endfunction
        function s__Respawn__Respawn_onInit takes nothing returns nothing
            set s__Respawn__Respawn_DeathUIMainTop=DzCreateFrameByTagName("BACKDROP", "DeathUIMainTop", DzGetGameUI(), "Panel", 0)
            call DzFrameSetSize(s__Respawn__Respawn_DeathUIMainTop, 0.18, 0.003)
            call DzFrameSetPoint(s__Respawn__Respawn_DeathUIMainTop, 4, DzGetGameUI(), 4, 0, 0.18)
            call DzFrameSetTexture(s__Respawn__Respawn_DeathUIMainTop, "UI_TopBorder.blp", 0)
            set s__Respawn__Respawn_DeathUIMainLine=DzCreateFrameByTagName("BACKDROP", "DeathUIMainLine", s__Respawn__Respawn_DeathUIMainTop, "ShowInfo", 0)
            call DzFrameSetSize(s__Respawn__Respawn_DeathUIMainLine, 0.18, 0.2)
            call DzFrameSetPoint(s__Respawn__Respawn_DeathUIMainLine, 1, s__Respawn__Respawn_DeathUIMainTop, 7, 0, 0)
            call DzFrameSetTexture(s__Respawn__Respawn_DeathUIMainLine, "UI_RightDownPanelLine.blp", 0)
            set s__Respawn__Respawn_DeathUIMainDown=DzCreateFrameByTagName("BACKDROP", "DeathUIMainDown", s__Respawn__Respawn_DeathUIMainLine, "ShowInfo", 0)
            call DzFrameSetSize(s__Respawn__Respawn_DeathUIMainDown, 0.18, 0.005)
            call DzFrameSetPoint(s__Respawn__Respawn_DeathUIMainDown, 1, s__Respawn__Respawn_DeathUIMainLine, 7, 0, 0)
            call DzFrameSetTexture(s__Respawn__Respawn_DeathUIMainDown, "UI_RightDownPanelBorder.blp", 0)
            set s__Respawn__Respawn_DeathUIMainTitle=DzCreateFrameByTagName("TEXT", "DeathUIMainTitle", s__Respawn__Respawn_DeathUIMainLine, "TextInfo", 0)
            call DzFrameSetSize(s__Respawn__Respawn_DeathUIMainTitle, 0.18, 0.12)
            call DzFrameSetPoint(s__Respawn__Respawn_DeathUIMainTitle, 1, s__Respawn__Respawn_DeathUIMainLine, 1, 0.045, - 0.01)
            call DzFrameSetText(s__Respawn__Respawn_DeathUIMainTitle, "↓请选择复活方式↓  \n按|cff00ff00C|r键可以开关该面板")
            set s__Respawn__Respawn_DeathUIMainRoll=DzCreateFrameByTagName("TEXT", "DeathUIMainRoll", s__Respawn__Respawn_DeathUIMainLine, "TextInfo", 0)
            call DzFrameSetSize(s__Respawn__Respawn_DeathUIMainRoll, 0.18, 0.12)
            call DzFrameSetPoint(s__Respawn__Respawn_DeathUIMainRoll, 1, s__Respawn__Respawn_DeathUIMainLine, 1, 0.005, - 0.04)
            call DzFrameSetText(s__Respawn__Respawn_DeathUIMainRoll, "(|cff00ff00Q|r)随机抽取一个新的英雄复活")
            set s__Respawn__Respawn_DeathUIMainSave=DzCreateFrameByTagName("TEXT", "DeathUIMainSave", s__Respawn__Respawn_DeathUIMainLine, "TextInfo", 0)
            call DzFrameSetSize(s__Respawn__Respawn_DeathUIMainSave, 0.18, 0.12)
            call DzFrameSetPoint(s__Respawn__Respawn_DeathUIMainSave, 1, s__Respawn__Respawn_DeathUIMainLine, 1, 0.005, - 0.067)
            call DzFrameSetText(s__Respawn__Respawn_DeathUIMainSave, "(|cff00ff00W|r)保留当前英雄复活(需要|cffffcc00$0|r)")
            set s__Respawn__Respawn_DeathUIMainSaveLine=DzCreateFrameByTagName("BACKDROP", "DeathUIMainSaveLine", s__Respawn__Respawn_DeathUIMainLine, "ShowInfo", 0)
            call DzFrameSetSize(s__Respawn__Respawn_DeathUIMainSaveLine, 0.097, 0.002)
            call DzFrameSetPoint(s__Respawn__Respawn_DeathUIMainSaveLine, 1, s__Respawn__Respawn_DeathUIMainLine, 1, - 0.036, - 0.072)
            call DzFrameSetTexture(s__Respawn__Respawn_DeathUIMainSaveLine, "UI_WHITEBLOCK.blp", 0)
            set s__Respawn__Respawn_DeathUIMainBuy=DzCreateFrameByTagName("TEXT", "DeathUIMainBuy", s__Respawn__Respawn_DeathUIMainLine, "TextInfo", 0)
            call DzFrameSetSize(s__Respawn__Respawn_DeathUIMainBuy, 0.18, 0.12)
            call DzFrameSetPoint(s__Respawn__Respawn_DeathUIMainBuy, 1, s__Respawn__Respawn_DeathUIMainLine, 1, 0.005, - 0.097)
            call DzFrameSetText(s__Respawn__Respawn_DeathUIMainBuy, "(|cff00ff00E|r)使用指定的英雄复活(未指定/$0)")
            set s__Respawn__Respawn_DeathUIMainBuyLine=DzCreateFrameByTagName("BACKDROP", "DeathUIMainBuyLine", s__Respawn__Respawn_DeathUIMainLine, "ShowInfo", 0)
            call DzFrameSetSize(s__Respawn__Respawn_DeathUIMainBuyLine, 0.087, 0.002)
            call DzFrameSetPoint(s__Respawn__Respawn_DeathUIMainBuyLine, 1, s__Respawn__Respawn_DeathUIMainLine, 1, - 0.041, - 0.103)
            call DzFrameSetTexture(s__Respawn__Respawn_DeathUIMainBuyLine, "UI_WHITEBLOCK.blp", 0)
            set s__Respawn__Respawn_DeathUIMainTip=DzCreateFrameByTagName("TEXT", "DeathUIMainTip", s__Respawn__Respawn_DeathUIMainLine, "TextInfo", 0)
            call DzFrameSetSize(s__Respawn__Respawn_DeathUIMainTip, 0.18, 0.12)
            call DzFrameSetPoint(s__Respawn__Respawn_DeathUIMainTip, 1, s__Respawn__Respawn_DeathUIMainLine, 1, 0.005, - 0.122)
            call DzFrameSetText(s__Respawn__Respawn_DeathUIMainTip, "按下绿色按键选择对应复活方式\n有白色线条挡住的不可选择\n如不选择,复活时将自动选择抽取复活")
            set s__Respawn__Respawn_DeathUIMainSelect=DzCreateFrameByTagName("TEXT", "DeathUIMainDeath", s__Respawn__Respawn_DeathUIMainLine, "TextInfo", 0)
            call DzFrameSetSize(s__Respawn__Respawn_DeathUIMainSelect, 0.18, 0.12)
            call DzFrameSetPoint(s__Respawn__Respawn_DeathUIMainSelect, 1, s__Respawn__Respawn_DeathUIMainLine, 1, 0.005, - 0.182)
            call DzFrameSetText(s__Respawn__Respawn_DeathUIMainSelect, "|cffff0000死亡|r")
            set s__Respawn__Respawn_DeathUIMainSelect=DzCreateFrameByTagName("TEXT", "DeathUIMainSpawn", s__Respawn__Respawn_DeathUIMainLine, "TextInfo", 0)
            call DzFrameSetSize(s__Respawn__Respawn_DeathUIMainSelect, 0.18, 0.12)
            call DzFrameSetPoint(s__Respawn__Respawn_DeathUIMainSelect, 1, s__Respawn__Respawn_DeathUIMainLine, 1, 0.159, - 0.182)
            call DzFrameSetText(s__Respawn__Respawn_DeathUIMainSelect, "|cff00ff00复活|r")
            set s__Respawn__Respawn_DeathUIMainSelect=DzCreateFrameByTagName("TEXT", "DeathUIMainSelect", s__Respawn__Respawn_DeathUIMainLine, "TextInfo", 0)
            call DzFrameSetSize(s__Respawn__Respawn_DeathUIMainSelect, 0.18, 0.12)
            call DzFrameSetPoint(s__Respawn__Respawn_DeathUIMainSelect, 1, s__Respawn__Respawn_DeathUIMainLine, 1, 0.005, - 0.167)
            call DzFrameSetText(s__Respawn__Respawn_DeathUIMainSelect, "已选择:|cff00ff00抽取复活|r")
            set s__Respawn__Respawn_DeathUIMainMoveBar=DzCreateFrameByTagName("BACKDROP", "DeathUIMainMoveBar", s__Respawn__Respawn_DeathUIMainLine, "ShowInfo", 0)
            call DzFrameSetSize(s__Respawn__Respawn_DeathUIMainMoveBar, 0.001, 0.006)
            call DzFrameSetPoint(s__Respawn__Respawn_DeathUIMainMoveBar, 0, s__Respawn__Respawn_DeathUIMainLine, 1, - 0.068, - 0.185)
            call DzFrameSetTexture(s__Respawn__Respawn_DeathUIMainMoveBar, "UI_WHITEBLOCK.blp", 0)
            set s__s__Respawn__Respawn_RespawnType[0]= "抽取复活"
            set s__s__Respawn__Respawn_RespawnType[1]= "保留复活"
            set s__s__Respawn__Respawn_RespawnType[2]= "指定复活"
            call DzFrameShow(s__Respawn__Respawn_DeathUIMainTop, false)
            call s__Units_On(s__Units_onHeroDeath , (2))
            call s__Events_On(s__Events_onPressKeyDown , (5))
            call TimerStart(NewTimer(), 1, true, function s__Respawn__Respawn_Time)
        endfunction

//library Respawn ends
//===========================================================================
// 
// 抢地盘
// 
//   Warcraft III map script
//   Generated by the Warcraft III World Editor
//   Date: Thu Nov 29 12:06:13 2018
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
function CreateUnitsForPlayer0 takes nothing returns nothing
    local player p= Player(0)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'uaco', - 4177.3, - 4025.0, 149.590)
    set life=GetUnitState(u, UNIT_STATE_LIFE)
    call SetUnitState(u, UNIT_STATE_LIFE, 0.02 * life)
endfunction
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
    call CreateUnitsForPlayer0()
endfunction
//===========================================================================
function CreateAllUnits takes nothing returns nothing
    call CreatePlayerBuildings()
    call CreateNeutralPassive()
    call CreateUnitsForPlayer0() // INLINED!!
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
function Trig_initConditions takes nothing returns boolean
    return ( ( (0 != EXGetEventDamageData(YDWEEventDamageData__EVENT_DAMAGE_DATA_IS_ATTACK)) == true ) ) // INLINED!!
endfunction
function Trig_initActions takes nothing returns nothing
    call DzLoadToc("resource\\UI.toc")
    call SetUnitUserData(gg_unit_e000_0010, 0)
    call SetUnitUserData(gg_unit_e001_0011, 0)
    call BJDebugMsg(( EXExecuteScript("(require'jass.slk').unit[" + I2S('hrif') + "].Art") ))
endfunction
//===========================================================================
function InitTrig_init takes nothing returns nothing
    set gg_trg_init=CreateTrigger()
    call DisableTrigger(gg_trg_init)
    call YDWESyStemAnyUnitDamagedRegistTrigger(gg_trg_init)
    call TriggerAddCondition(gg_trg_init, Condition(function Trig_initConditions))
    call TriggerAddAction(gg_trg_init, function Trig_initActions)
endfunction
//===========================================================================
// Trigger: 未命名触发器 001
//===========================================================================
function Trig____________________001Actions takes nothing returns nothing
endfunction
//===========================================================================
function InitTrig____________________001 takes nothing returns nothing
    set gg_trg____________________001=CreateTrigger()
    call TriggerAddAction(gg_trg____________________001, function Trig____________________001Actions)
endfunction
//===========================================================================
function InitCustomTriggers takes nothing returns nothing
    call InitTrig_init()
    call InitTrig____________________001()
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
    call SetPlayerController(Player(1), MAP_CONTROL_COMPUTER)
    // Player 2
    call SetPlayerStartLocation(Player(2), 2)
    call ForcePlayerStartLocation(Player(2), 2)
    call SetPlayerColor(Player(2), ConvertPlayerColor(2))
    call SetPlayerRacePreference(Player(2), RACE_PREF_UNDEAD)
    call SetPlayerRaceSelectable(Player(2), false)
    call SetPlayerController(Player(2), MAP_CONTROL_COMPUTER)
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
    call SetPlayerController(Player(4), MAP_CONTROL_COMPUTER)
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
    call SetPlayerController(Player(6), MAP_CONTROL_COMPUTER)
    // Player 7
    call SetPlayerStartLocation(Player(7), 7)
    call ForcePlayerStartLocation(Player(7), 7)
    call SetPlayerColor(Player(7), ConvertPlayerColor(7))
    call SetPlayerRacePreference(Player(7), RACE_PREF_UNDEAD)
    call SetPlayerRaceSelectable(Player(7), false)
    call SetPlayerController(Player(7), MAP_CONTROL_COMPUTER)
    // Player 8
    call SetPlayerStartLocation(Player(8), 8)
    call ForcePlayerStartLocation(Player(8), 8)
    call SetPlayerColor(Player(8), ConvertPlayerColor(8))
    call SetPlayerRacePreference(Player(8), RACE_PREF_UNDEAD)
    call SetPlayerRaceSelectable(Player(8), false)
    call SetPlayerController(Player(8), MAP_CONTROL_COMPUTER)
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
    call SetStartLocPrioCount(0, 1)
    call SetStartLocPrio(0, 0, 5, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(1, 2)
    call SetStartLocPrio(1, 0, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 1, 6, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(2, 3)
    call SetStartLocPrio(2, 0, 3, MAP_LOC_PRIO_LOW)
    call SetStartLocPrio(2, 1, 7, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(2, 2, 8, MAP_LOC_PRIO_LOW)
    call SetStartLocPrioCount(3, 2)
    call SetStartLocPrio(3, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(3, 1, 5, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(4, 2)
    call SetStartLocPrio(4, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(4, 1, 5, MAP_LOC_PRIO_LOW)
    call SetStartLocPrioCount(5, 1)
    call SetStartLocPrio(5, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(6, 1)
    call SetStartLocPrio(6, 0, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(7, 3)
    call SetStartLocPrio(7, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(7, 1, 5, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(7, 2, 8, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(8, 2)
    call SetStartLocPrio(8, 0, 0, MAP_LOC_PRIO_LOW)
    call SetStartLocPrio(8, 1, 7, MAP_LOC_PRIO_HIGH)
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

call ExecuteFunc("jasshelper__initstructs1017993296")
call ExecuteFunc("Teams___onInit")
call ExecuteFunc("TimerUtils___init")
call ExecuteFunc("Tree__onInit")
call ExecuteFunc("Disconnect__onInit")
call ExecuteFunc("Events___onInit")
call ExecuteFunc("HeroRare___onInit")
call ExecuteFunc("Init___onInit")
call ExecuteFunc("Camera___onInit")

    call InitGlobals()
    call InitCustomTriggers()
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
//===========================================================================  
//===========================================================================  
//�Զ����¼� 
//===========================================================================
//===========================================================================   




//Struct method generated initializers/callers:

//Functions for BigArrays:
function sa__Respawn__Respawn_Flush takes nothing returns boolean
local player ps=f__arg_player1
            local integer p=(sc__HandleTable__getindex(s__Players_ht,(ps))) // INLINED!!
            local integer r=s__Players_respawn[p]
            if ( ps == s__Players_localplayer ) then
                call DzFrameSetText(s__Respawn__Respawn_DeathUIMainSave, "(|cff00ff00W|r)保留当前英雄复活(需要|cffffcc00$" + I2S(s__Respawn__Respawn_RespawnSaveMoney[r]) + "|r)")
            endif
            if ( (GetPlayerState(s__Players_player[(p)], PLAYER_STATE_RESOURCE_GOLD)) >= s__Respawn__Respawn_RespawnSaveMoney[r] ) then // INLINED!!
                if ( ps == s__Players_localplayer ) then
                    call DzFrameShow(s__Respawn__Respawn_DeathUIMainSaveLine, false)
                endif
            else
                if ( s__Respawn__Respawn_RespawnSelect[r] == 1 ) then
                    set s__Respawn__Respawn_RespawnSelect[r]=s__Respawn__Respawn_RespawnSelectLast[r]
                endif
                if ( ps == s__Players_localplayer ) then
                    call DzFrameShow(s__Respawn__Respawn_DeathUIMainSaveLine, true)
                endif
            endif
            if ( s__Players_nextherotype[p] == 0 ) then
                if ( ps == s__Players_localplayer ) then
                    call DzFrameSetText(s__Respawn__Respawn_DeathUIMainBuy, "(|cff00ff00E|r)使用指定的英雄复活(未指定/$0)")
                    call DzFrameShow(s__Respawn__Respawn_DeathUIMainBuyLine, true)
                endif
                if ( s__Respawn__Respawn_RespawnSelect[r] == 2 ) then
                    set s__Respawn__Respawn_RespawnSelect[r]=s__Respawn__Respawn_RespawnSelectLast[r]
                endif
            else
                if ( ps == s__Players_localplayer ) then
                    call DzFrameSetText(s__Respawn__Respawn_DeathUIMainBuy, "(|cff00ff00E|r)使用指定的英雄复活(" + (( EXExecuteScript("(require'jass.slk').unit[" + I2S((s__Players_nextherotype[p] )) + "]." + ( "Name")) )) + "/$" + I2S(s__Respawn__Respawn_RespawnSaveMoney[r] * 2) + ")") // INLINED!!
                endif
                if ( (GetPlayerState(s__Players_player[(p)], PLAYER_STATE_RESOURCE_GOLD)) >= ( s__Respawn__Respawn_RespawnSaveMoney[r] * 2 ) ) then // INLINED!!
                    if ( ps == s__Players_localplayer ) then
                        call DzFrameShow(s__Respawn__Respawn_DeathUIMainBuyLine, false)
                    endif
                elseif ( s__Respawn__Respawn_RespawnSelect[r] == 2 ) then
                    set s__Respawn__Respawn_RespawnSelect[r]=s__Respawn__Respawn_RespawnSelectLast[r]
                endif
            endif
            if ( s__Respawn__Respawn_RespawnSelectLast[r] != s__Respawn__Respawn_RespawnSelect[r] ) then
                set s__Respawn__Respawn_RespawnSelectLast[r]=s__Respawn__Respawn_RespawnSelect[r]
            endif
            if ( ps == s__Players_localplayer ) then
                call DzFrameSetText(s__Respawn__Respawn_DeathUIMainSelect, "已选择:|cff00ff00" + s__s__Respawn__Respawn_RespawnType[s__Respawn__Respawn_RespawnSelect[r]] + "|r")
                call DzFrameSetSize(s__Respawn__Respawn_DeathUIMainMoveBar, 0.001 + ( 0.136 * ( 1 - ( s__Respawn__Respawn_RespawnTime[r] / s__Respawn__Respawn_MaxRespawnTime ) ) ), 0.006)
            endif
   return true
endfunction
function sa__Respawn__Respawn_Show takes nothing returns boolean
local player p=f__arg_player1
local boolean show=f__arg_boolean1
            local integer ps=(sc__HandleTable__getindex(s__Players_ht,(p))) // INLINED!!
            if ( s__Players_localplayer == p ) then
                if ( GameTime >= s__Respawn__Respawn_RespawnShowTime or s__Players_isdeath[ps] == false ) then
                    set s__Respawn__Respawn_RespawnShowTime=GameTime + 0.05
                    set s__Respawn__Respawn_RespawnShow=show
                    call DzFrameShow(s__Respawn__Respawn_DeathUIMainTop, show)
                endif
                call s__Respawn__Respawn_Flush(p)
            endif
   return true
endfunction
function sa__KillUi_FlushPlayerData takes nothing returns boolean
local player p=f__arg_player1
            call sc__KillUi_FlushData(GetPlayerTeam(p))
   return true
endfunction
function sa__KillUi_FlushData takes nothing returns boolean
local integer teamid=f__arg_integer1
            local integer tp
            local integer this
            local integer x
            set this=s__s__KillUi_KillTeam[teamid]
            set s__KillUi_TeamWinAcc[this]=(s__Teams___Team_Kills[(s__KillUi_TeamIndex[this])]) / I2R((s__Winner_MaxKills)) // INLINED!!
            call DzFrameSetSize(s__KillUi_TeamMoveBar[this], 0.202 * s__KillUi_TeamWinAcc[this], 0.01)
            set x=0
            loop
            exitwhen ( x >= s__KillUi_TeamNumbers[this] )
                set tp=s___KillUi_TeamPlayer[s__KillUi_TeamPlayer[this]+x]
                if ( s__Players_isonline[tp] == false ) then
                    call DzFrameSetTexture(s___KillUi_TeamNumberHeroIcon[s__KillUi_TeamNumberHeroIcon[this]+x], "ReplaceableTextures\\CommandButtons\\BTNCancel.blp", 0)
                    call DzFrameSetText(s___KillUi_TeamNumberName[s__KillUi_TeamNumberName[this]+x], "[离线]" + DzFrameGetText(s___KillUi_TeamNumberName[s__KillUi_TeamNumberName[this]+x]))
                else
                    call DzFrameSetTexture(s___KillUi_TeamNumberHeroIcon[s__KillUi_TeamNumberHeroIcon[this]+x], (( EXExecuteScript("(require'jass.slk').unit[" + I2S((s__Units_uid[s__Players_hero[tp]] )) + "]." + ( "Art")) )), 0) // INLINED!!
                endif
                call DzFrameSetText(s___KillUi_TeamNumberInfo[s__KillUi_TeamNumberInfo[this]+x], "击杀/死亡   " + I2S(s__Players_kills[tp]) + "/" + I2S(s__Players_deaths[tp]))
                call DzFrameSetText(s___KillUi_TeamNumberHeroName[s__KillUi_TeamNumberHeroName[this]+x], s__Units_name[s__Players_hero[tp]])
            set x=x + 1
            endloop
   return true
endfunction
function sa__KillUi_FlushKillData takes nothing returns boolean
local integer tid=f__arg_integer1
            call DzFrameSetText(s__KillUi_KillBackgroundText, " 杀敌数   " + (s__Teams___Team_Name[(0)]) + ":" + I2S((s__Teams___Team_Kills[(0)])) + "    " + (s__Teams___Team_Name[(1)]) + ":" + I2S((s__Teams___Team_Kills[(1)])) + "    " + (s__Teams___Team_Name[(2)]) + ":" + I2S((s__Teams___Team_Kills[(2)])) + "    胜利:" + I2S((s__Winner_MaxKills)) + "    ↓F2↓") // INLINED!!
            if ( tid != - 1 ) then
                call s__KillUi_FlushData(tid)
            endif
   return true
endfunction
function sa__Winner_ShowWin takes nothing returns boolean
local integer teamid=f__arg_integer1
            set s__Winner_WinTeam=teamid
            call ForForce((Teams___AllPlayers), function s__Winner_anon__9) // INLINED!!
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
function sa__Units_Destroys takes nothing returns boolean
    call s__Units_Destroys(f__arg_unit1)
   return true
endfunction
function sa__Units_Get takes nothing returns boolean
    set f__result_integer=(LoadInteger(Table___ht, ((s__Units_ht)), GetHandleId(((f__arg_unit1))))) // INLINED!!
   return true
endfunction
function sa__Events_On takes nothing returns boolean
local string eName=f__arg_string1
local integer callback=f__arg_integer1
                if ( (LoadInteger(Table___ht, (((- StringHash((eName))))), (0))) == 0 ) then // INLINED!!
                    call SaveInteger(Table___ht, (((- StringHash((eName))))), (0), ( 1)) // INLINED!!
                endif
                call SaveInteger(Table___ht, (((- StringHash((eName))))), ((LoadInteger(Table___ht, (((- StringHash((eName))))), (0)))), ( callback)) // INLINED!!
                call SaveInteger(Table___ht, (((- StringHash((eName))))), (0), ( (LoadInteger(Table___ht, (((- StringHash((eName))))), (0))) + 1)) // INLINED!!
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
function sa___prototype15_Disconnect__onDisconnect takes nothing returns boolean
 local integer e=f__arg_integer1

        local integer x
        local unit u
        set Disconnect__tmp=(sc__HandleTable__getindex(s__Players_ht,(s__EventArgs_TriggerPlayer[e]))) // INLINED!!
        set u=s__Units_unit[s__Players_hero[Disconnect__tmp]]
        call ReviveHero(u, GetUnitX(u), GetUnitY(u), false)
        call SetUnitPosition(u, GetRectCenterX((s__Teams___Team_Rect[GetPlayerTeam((s__Players_player[Disconnect__tmp]))])), GetRectCenterY((s__Teams___Team_Rect[GetPlayerTeam((s__Players_player[Disconnect__tmp]))]))) // INLINED!!
        set x=1
        loop
        exitwhen ( x > 6 )
            call UnitRemoveItemFromSlotSwapped(x, u)
        set x=x + 1
        endloop
        call sc__HeroRares_AddRandomHero(u)
        set x=(CountPlayersInForceBJ((s__Teams___Team_Players[GetPlayerTeam(((s__Players_player[Disconnect__tmp])))]))) - 1 // INLINED!!
        if ( x != 0 ) then
            call ForForce((s__Teams___Team_Players[GetPlayerTeam((s__Players_player[Disconnect__tmp]))]), function Disconnect__anon__8) // INLINED!!
        endif
        call s__Teams_PlayerRemoveForce(s__Players_player[Disconnect__tmp])
        call DisplayTimedTextToForce((Teams___AllPlayers), 5.00, s__Players_name[Disconnect__tmp] + " 离开了游戏，金钱将平分给他的队友。") // INLINED!!
        set s__Players_isonline[Disconnect__tmp]=false
        call sc__KillUi_FlushPlayerData(s__Players_player[Disconnect__tmp])
        set u=null
    return true
endfunction
function sa___prototype15_s__Units_onDeath takes nothing returns boolean
 local integer e=f__arg_integer1

            if ( IsUnitType(s__EventArgs_TriggerUnit[e], UNIT_TYPE_HERO) == true ) then
                call s__Units_Trigger(s__Units_onHeroDeath , s__EventArgs_TriggerUnit[e] , s__EventArgs_KillUnit[e])
            else
                call s__Units_Trigger(s__Units_onUnitDeath , s__EventArgs_TriggerUnit[e] , s__EventArgs_KillUnit[e])
                call sc__Units_Destroys(s__EventArgs_TriggerUnit[e])
            endif
    return true
endfunction
function sa___prototype16_s__Winner_Death takes nothing returns boolean
 local integer u=f__arg_integer1
 local integer m=f__arg_integer2

            set s__Players_deaths[s__Units_player[u]]=s__Players_deaths[s__Units_player[u]] + 1
            call sc__KillUi_FlushPlayerData(s__Players_player[s__Units_player[u]])
            if ( s__Players_teamid[s__Units_player[u]] != s__Players_teamid[s__Units_player[m]] and s__Units_unit[m] != null ) then
                set s__Players_kills[s__Units_player[m]]=s__Players_kills[s__Units_player[m]] + 1
                call s__Teams_AddTeamKills(s__Players_teamid[s__Units_player[m]] , 1)
                call sc__KillUi_FlushKillData(s__Players_teamid[s__Units_player[m]])
            endif
            if ( (s__Teams___Team_Kills[(s__Players_teamid[s__Units_player[m]])]) >= s__Winner_MaxKills ) then // INLINED!!
                set s__Winner_GameEnd=true
                call DisplayTimedTextToForce((Teams___AllPlayers), 5.00, "游戏结束啦！！！！！！！！！！！ " + (s__Teams___Team_Name[(s__Players_teamid[s__Units_player[m]])]) + " 获得了最终的胜利！！") // INLINED!!
                call sc__Winner_ShowWin(s__Players_teamid[s__Units_player[m]])
            endif
    return true
endfunction
function sa___prototype15_s__KillUi_Show takes nothing returns boolean
 local integer e=f__arg_integer1

            if ( s__EventArgs_TriggerKey[e] == 113 ) then
                if ( GetLocalPlayer() == s__EventArgs_TriggerKeyPlayer[e] ) then
                    call DzFrameShow(s__KillUi_KillBackgroundMaxLine, true)
                endif
            endif
    return true
endfunction
function sa___prototype15_s__KillUi_Hide takes nothing returns boolean
 local integer e=f__arg_integer1

            if ( s__EventArgs_TriggerKey[e] == 113 ) then
                if ( GetLocalPlayer() == s__EventArgs_TriggerKeyPlayer[e] ) then
                    call DzFrameShow(s__KillUi_KillBackgroundMaxLine, false)
                endif
            endif
    return true
endfunction
function sa___prototype16_s__Respawn__Respawn_Death takes nothing returns boolean
 local integer u=f__arg_integer1
 local integer m=f__arg_integer2

            local integer r=s__Respawn__Respawn__allocate()
            if ( s__Players_teamid[s__Units_player[u]] != s__Players_teamid[s__Units_player[m]] and s__Units_unit[m] != null ) then
                set s__Players_lifekill[s__Units_player[m]]=s__Players_lifekill[s__Units_player[m]] + 1
                call ForForce((s__Teams___Team_Players[GetPlayerTeam((s__Players_player[s__Units_player[m]]))]), function s__Respawn__Respawn_anon__15) // INLINED!!
                call DisplayTimedTextToForce((Teams___AllPlayers), 5.00, s__Players_name[s__Units_player[m]] + " 及友军因击杀 " + s__Players_name[s__Units_player[u]] + " 而获得了|cffffcc00$300|r") // INLINED!!
                if ( s__Players_randomhero[s__Units_player[m]] > 0 ) then
                    set s__Players_randomhero[s__Units_player[m]]=s__Players_randomhero[s__Units_player[m]] - 5.0
                endif
            endif
            if ( s__Players_randomhero[s__Units_player[u]] < 100 ) then
                set s__Players_randomhero[s__Units_player[u]]=s__Players_randomhero[s__Units_player[u]] + 5.0
            endif
            set s__Respawn__Respawn_RespawnTime[r]=s__Respawn__Respawn_MaxRespawnTime
            set s__Respawn__Respawn_RespawnSaveMoney[r]=000 + R2I(( s__Players_lifekill[s__Units_player[u]] * 300 ) * 1.2)
            set s__Respawn__Respawn_RespawnSelect[r]=0
            set s__Respawn__Respawn_RespawnSelectLast[r]=0
            set s__Players_isdeath[s__Units_player[u]]=true
            set s__Players_lifekill[s__Units_player[u]]=0
            set s__Players_respawn[s__Units_player[u]]=r
            call sc__Respawn__Respawn_Show(s__Players_player[s__Units_player[u]] , true)
    return true
endfunction
function sa___prototype15_s__Respawn__Respawn_Press takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer p=(sc__HandleTable__getindex(s__Players_ht,(s__EventArgs_TriggerKeyPlayer[e]))) // INLINED!!
            local integer r=s__Players_respawn[p]
            if ( s__Players_isdeath[p] == true ) then
                if ( s__EventArgs_TriggerKey[e] == 'Q' ) then
                    set s__Respawn__Respawn_RespawnSelect[r]=0
                    call s__Respawn__Respawn_Flush(s__Players_player[p])
                elseif ( s__EventArgs_TriggerKey[e] == 'W' ) then
                    set s__Respawn__Respawn_RespawnSelect[r]=1
                    call s__Respawn__Respawn_Flush(s__Players_player[p])
                elseif ( s__EventArgs_TriggerKey[e] == 'E' ) then
                    set s__Respawn__Respawn_RespawnSelect[r]=2
                    call s__Respawn__Respawn_Flush(s__Players_player[p])
                endif
                if ( s__EventArgs_TriggerKey[e] == 'C' ) then
                    if ( s__Respawn__Respawn_RespawnShow == false ) then
                        call s__Respawn__Respawn_Show(s__Players_player[p] , true)
                    else
                        call s__Respawn__Respawn_Show(s__Players_player[p] , false)
                    endif
                endif
            endif
    return true
endfunction

function jasshelper__initstructs1017993296 takes nothing returns nothing
    set st__Respawn__Respawn_Flush=CreateTrigger()
    call TriggerAddCondition(st__Respawn__Respawn_Flush,Condition( function sa__Respawn__Respawn_Flush))
    set st__Respawn__Respawn_Show=CreateTrigger()
    call TriggerAddCondition(st__Respawn__Respawn_Show,Condition( function sa__Respawn__Respawn_Show))
    set st__KillUi_FlushPlayerData=CreateTrigger()
    call TriggerAddCondition(st__KillUi_FlushPlayerData,Condition( function sa__KillUi_FlushPlayerData))
    set st__KillUi_FlushData=CreateTrigger()
    call TriggerAddCondition(st__KillUi_FlushData,Condition( function sa__KillUi_FlushData))
    set st__KillUi_FlushKillData=CreateTrigger()
    call TriggerAddCondition(st__KillUi_FlushKillData,Condition( function sa__KillUi_FlushKillData))
    set st__Winner_ShowWin=CreateTrigger()
    call TriggerAddCondition(st__Winner_ShowWin,Condition( function sa__Winner_ShowWin))
    set st__HeroRares_Repeat=CreateTrigger()
    call TriggerAddCondition(st__HeroRares_Repeat,Condition( function sa__HeroRares_Repeat))
    set st__HeroRares_AddRandomHero=CreateTrigger()
    call TriggerAddCondition(st__HeroRares_AddRandomHero,Condition( function sa__HeroRares_AddRandomHero))
    set st__Units_Destroys=CreateTrigger()
    call TriggerAddCondition(st__Units_Destroys,Condition( function sa__Units_Destroys))
    set st__Units_Get=CreateTrigger()
    call TriggerAddCondition(st__Units_Get,Condition( function sa__Units_Get))
    set st__Events_On=CreateTrigger()
    call TriggerAddCondition(st__Events_On,Condition( function sa__Events_On))
    set st__Table___GTable_onDestroy[2]=CreateTrigger()
    set st__Table___GTable_onDestroy[3]=st__Table___GTable_onDestroy[2]
    set st__Table___GTable_onDestroy[4]=st__Table___GTable_onDestroy[2]
    set st__Table___GTable_onDestroy[5]=st__Table___GTable_onDestroy[2]
    call TriggerAddCondition(st__Table___GTable_onDestroy[2],Condition( function sa__Table___GTable_onDestroy))
    set st__HandleTable__getindex=CreateTrigger()
    call TriggerAddCondition(st__HandleTable__getindex,Condition( function sa__HandleTable__getindex))
    set st__HandleTable__setindex=CreateTrigger()
    call TriggerAddCondition(st__HandleTable__setindex,Condition( function sa__HandleTable__setindex))
    set st___prototype15[1]=CreateTrigger()
    call TriggerAddAction(st___prototype15[1],function sa___prototype15_Disconnect__onDisconnect)
    call TriggerAddCondition(st___prototype15[1],Condition(function sa___prototype15_Disconnect__onDisconnect))
    set st___prototype15[2]=CreateTrigger()
    call TriggerAddAction(st___prototype15[2],function sa___prototype15_s__Units_onDeath)
    call TriggerAddCondition(st___prototype15[2],Condition(function sa___prototype15_s__Units_onDeath))
    set st___prototype16[1]=CreateTrigger()
    call TriggerAddAction(st___prototype16[1],function sa___prototype16_s__Winner_Death)
    call TriggerAddCondition(st___prototype16[1],Condition(function sa___prototype16_s__Winner_Death))
    set st___prototype15[3]=CreateTrigger()
    call TriggerAddAction(st___prototype15[3],function sa___prototype15_s__KillUi_Show)
    call TriggerAddCondition(st___prototype15[3],Condition(function sa___prototype15_s__KillUi_Show))
    set st___prototype15[4]=CreateTrigger()
    call TriggerAddAction(st___prototype15[4],function sa___prototype15_s__KillUi_Hide)
    call TriggerAddCondition(st___prototype15[4],Condition(function sa___prototype15_s__KillUi_Hide))
    set st___prototype16[2]=CreateTrigger()
    call TriggerAddAction(st___prototype16[2],function sa___prototype16_s__Respawn__Respawn_Death)
    call TriggerAddCondition(st___prototype16[2],Condition(function sa___prototype16_s__Respawn__Respawn_Death))
    set st___prototype15[5]=CreateTrigger()
    call TriggerAddAction(st___prototype15[5],function sa___prototype15_s__Respawn__Respawn_Press)
    call TriggerAddCondition(st___prototype15[5],Condition(function sa___prototype15_s__Respawn__Respawn_Press))
























    call ExecuteFunc("s__Players_onInit")
    call ExecuteFunc("s__Table___GTable_onInit")
    call ExecuteFunc("s__TakeUi_onInit")
    call ExecuteFunc("s__Units_onInit")
    call ExecuteFunc("s__KillUi_onInit")
    call ExecuteFunc("s__Respawn__Respawn_onInit")
endfunction

