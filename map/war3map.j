globals
//globals from BzAPI:
constant boolean LIBRARY_BzAPI=true
trigger array BzAPI__DamageEventQueue
integer BzAPI__DamageEventNumber= 0
//endglobals from BzAPI
//globals from Data:
constant boolean LIBRARY_Data=true
//endglobals from Data
//globals from Players:
constant boolean LIBRARY_Players=true
//endglobals from Players
//globals from SpellNameText:
constant boolean LIBRARY_SpellNameText=true
//endglobals from SpellNameText
//globals from Table:
constant boolean LIBRARY_Table=true
constant integer Table__MAX_INSTANCES=8100
        //Feel free to change max instances if necessary, it will only affect allocation
        //speed which shouldn't matter that much.

    //=========================================================
hashtable Table__ht=InitHashtable()
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
//globals from TerrainPathability:
constant boolean LIBRARY_TerrainPathability=true
constant real TerrainPathability__MAX_RANGE= 10.0
constant integer TerrainPathability__DUMMY_ITEM_ID= 'wolg'
item TerrainPathability__Item= null
rect TerrainPathability__Find= null
item array TerrainPathability__Hid
integer TerrainPathability__HidMax= 0
real TerrainPathability_X= 0.0
real TerrainPathability_Y= 0.0
//endglobals from TerrainPathability
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
constant boolean TimerUtils__USE_HASH_TABLE= false
constant boolean TimerUtils__USE_FLEXIBLE_OFFSET= true

constant integer TimerUtils__OFFSET= 0x100000
integer TimerUtils__VOFFSET= TimerUtils__OFFSET
              
        //Timers to preload at map init:
constant integer TimerUtils__QUANTITY= 256
        
        //Changing this  to something big will allow you to keep recycling
        // timers even when there are already AN INCREDIBLE AMOUNT of timers in
        // the stack. But it will make things far slower so that's probably a bad idea...
constant integer TimerUtils__ARRAY_SIZE= 8190

// processed:         integer array TimerUtils__data[TimerUtils__ARRAY_SIZE]
hashtable TimerUtils__ht
// processed:         timer array TimerUtils__tT[TimerUtils__ARRAY_SIZE]
integer TimerUtils__tN= 0
constant integer TimerUtils__HELD=0x23729801
        //use a totally random number here, the more improbable someone uses it, the better.
//endglobals from TimerUtils
//globals from Tree:
constant boolean LIBRARY_Tree=true
rect array Tree___rec
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
//globals from YDWEGetUnitsOfPlayerMatchingNull:
constant boolean LIBRARY_YDWEGetUnitsOfPlayerMatchingNull=true
group yd_NullTempGroup
//endglobals from YDWEGetUnitsOfPlayerMatchingNull
//globals from YDWEJapiEffect:
constant boolean LIBRARY_YDWEJapiEffect=true
//endglobals from YDWEJapiEffect
//globals from YDWEJapiUnit:
constant boolean LIBRARY_YDWEJapiUnit=true
//endglobals from YDWEJapiUnit
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
//globals from Buff:
constant boolean LIBRARY_Buff=true
//endglobals from Buff
//globals from Dashs:
constant boolean LIBRARY_Dashs=true
//endglobals from Dashs
//globals from Disconnect:
constant boolean LIBRARY_Disconnect=true
integer Disconnect___tmp
//endglobals from Disconnect
//globals from Events:
constant boolean LIBRARY_Events=true
//endglobals from Events
//globals from HitFly:
constant boolean LIBRARY_HitFly=true
//endglobals from HitFly
//globals from Press:
constant boolean LIBRARY_Press=true
string PressType=""
string PressName=""
integer PressCode=0
//endglobals from Press
//globals from Spells:
constant boolean LIBRARY_Spells=true
//endglobals from Spells
//globals from YDWEGetUnitsOfPlayerAllNull:
constant boolean LIBRARY_YDWEGetUnitsOfPlayerAllNull=true
//endglobals from YDWEGetUnitsOfPlayerAllNull
//globals from Damage:
constant boolean LIBRARY_Damage=true
//endglobals from Damage
//globals from LevelUp:
constant boolean LIBRARY_LevelUp=true
integer LevelUp___MaxLv=1
//endglobals from LevelUp
//globals from PlayerPress:
constant boolean LIBRARY_PlayerPress=true
//endglobals from PlayerPress
//globals from Units:
constant boolean LIBRARY_Units=true
//endglobals from Units
//globals from Groups:
constant boolean LIBRARY_Groups=true
group tmp_group=CreateGroup()
//endglobals from Groups
//globals from HeroRare:
constant boolean LIBRARY_HeroRare=true
// processed:     unitpool  array HeroRare___HeroRare[3]
unit HeroRare_LastRandomUnit
//endglobals from HeroRare
//globals from Winner:
constant boolean LIBRARY_Winner=true
//endglobals from Winner
//globals from DazzleMaster:
constant boolean LIBRARY_DazzleMaster=true
//endglobals from DazzleMaster
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
//globals from OrdinaryWizard:
constant boolean LIBRARY_OrdinaryWizard=true
//endglobals from OrdinaryWizard
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
rect gg_rct_main= null
sound gg_snd_ItemReceived= null
sound gg_snd_Winner= null
trigger gg_trg_init= null
trigger gg_trg____________________001= null
trigger gg_trg____________________002= null
unit gg_unit_e001_0011= null
unit gg_unit_e000_0010= null

trigger l__library_init

//JASSHelper struct globals:
constant integer si__Data=1
integer si__Data_F=0
integer si__Data_I=0
integer array si__Data_V
integer array s__Data_id
integer array s___Data_i
constant integer s___Data_i_size=5
integer array s__Data_i
real array s___Data_r
constant integer s___Data_r_size=5
integer array s__Data_r
integer array s___Data_c
constant integer s___Data_c_size=5
integer array s__Data_c
unit array s___Data_u
constant integer s___Data_u_size=2
integer array s__Data_u
group array s___Data_g
constant integer s___Data_g_size=2
integer array s__Data_g
string array s___Data_s
constant integer s___Data_s_size=2
integer array s__Data_s
constant integer si__Players=8
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
integer array s__Players_press
boolean array s__Players_isai
unit array s__Players_lv5
unit array s__Players_lv10
unit array s__Players_lv15
unit array s__Players_lv20
unit array s__Players_lv25
constant integer si__Table__GTable=9
integer si__Table__GTable_F=0
integer si__Table__GTable_I=0
integer array si__Table__GTable_V
constant integer si__Table=10
constant integer si__StringTable=11
constant integer si__HandleTable=12
constant integer si__TakeUi=13
integer si__TakeUi_F=0
integer si__TakeUi_I=0
integer array si__TakeUi_V
integer s__TakeUi_TakeBackground
integer s__TakeUi_TakeLeftText
integer s__TakeUi_TakeMoveBar
integer s__TakeUi_TakeRightText
constant integer si__Teams=14
integer si__Teams_F=0
integer si__Teams_I=0
integer array si__Teams_V
constant integer si__Util=15
integer si__Util_F=0
integer si__Util_I=0
integer array si__Util_V
constant integer si__Buffs=16
integer si__Buffs_F=0
integer si__Buffs_I=0
integer array si__Buffs_V
integer s__Buffs_Root
integer s__Buffs_Last
integer s__Buffs_TYPE_ADD=1
integer s__Buffs_TYPE_SUB=2
integer s__Buffs_TYPE_DISPEL_TRUE=10
integer s__Buffs_TYPE_DISPEL_FALSE=20
real array s__Buffs_MaxTime
real array s__Buffs_NowTime
integer array s__Buffs_Ability
integer array s__Buffs_Buff
integer array s__Buffs_Obj
integer array s__Buffs_Type
unit array s__Buffs_Unit
integer array s__Buffs_onTime
integer array s__Buffs_onEnd
integer array s__Buffs_onRemove
integer array s__Buffs_onDelay
integer array s__Buffs_onFlush
integer array s__Buffs_Prev
integer array s__Buffs_Next
constant string s__Buffs_onUnitBuff="Buffs.UnitBuff"
constant string s__Buffs_onHeroBuff="Buffs.HeroBuff"
constant string s__Buffs_onUnitSkill="Buffs.UnitSkill"
constant integer si__Dash=17
integer si__Dash_F=0
integer si__Dash_I=0
integer array si__Dash_V
constant integer s__Dash_NORMAL=0
constant integer s__Dash_PWX=1
constant integer s__Dash_ADD=2
constant integer s__Dash_SUB=3
integer s__Dash_Root
integer s__Dash_Last
unit array s__Dash_Unit
real array s__Dash_Angle
real array s__Dash_MaxDis
real array s__Dash_NowDis
real array s__Dash_Speed
real array s__Dash_MaxSpeed
real array s__Dash_LastX
real array s__Dash_LastY
real array s__Dash_X
real array s__Dash_Y
boolean array s__Dash_Fly
boolean array s__Dash_Order
integer array s__Dash_DashType
integer array s__Dash_Obj
integer array s__Dash_onMove
integer array s__Dash_onEnd
integer array s__Dash_onRemove
integer array s__Dash_Prev
integer array s__Dash_Next
constant string s__Dash_onHeroDash="Dashs.HeroDash"
constant string s__Dash_onUnitDash="Dashs.UnitDash"
constant integer si__EventArgs=18
integer si__EventArgs_F=0
integer si__EventArgs_I=0
integer array si__EventArgs_V
unit array s__EventArgs_DeathUnit
unit array s__EventArgs_KillUnit
unit array s__EventArgs_TriggerUnit
unit array s__EventArgs_LevelUpUnit
unit array s__EventArgs_SpellTargetUnit
real array s__EventArgs_SpellTargetX
real array s__EventArgs_SpellTargetY
integer array s__EventArgs_SpellId
player array s__EventArgs_TriggerPlayer
unit array s__EventArgs_DamageUnit
real array s__EventArgs_Damage
boolean array s__EventArgs_RangeDamage
boolean array s__EventArgs_AttackDamage
boolean array s__EventArgs_MagicDamage
constant integer si__Events=19
integer si__Events_F=0
integer si__Events_I=0
integer array si__Events_V
constant string s__Events_onUnitDeath="Events.UnitDeath"
constant string s__Events_onUnitDeacy="Events.UnitDeacy"
constant string s__Events_onPlayerDisconnect="Events.PlayerDisconnect"
constant string s__Events_onUnitDamage="Events.UnitDamage"
constant string s__Events_onUnitSpell="Events.onUnitSpell"
constant string s__Events_onUnitReadySpell="Events.onUnitReadySpell"
constant string s__Events_onUnitStartSpell="Events.onUnitStartSpell"
constant string s__Events_onUnitStopSpell="Events.onUnitStopSpell"
constant string s__Events_onHeroLevelUp="Events.onHeroLevelUp"
constant integer si__HitFlys=20
integer si__HitFlys_F=0
integer si__HitFlys_I=0
integer array si__HitFlys_V
integer s__HitFlys_Root
integer s__HitFlys_Last
real s__HitFlys_Power=0.98
real array s__HitFlys_UpPower
boolean array s__HitFlys_Down
integer array s__HitFlys_Obj
unit array s__HitFlys_Unit
integer array s__HitFlys_onDown
integer array s__HitFlys_onEnd
integer array s__HitFlys_onRemove
integer array s__HitFlys_Prev
integer array s__HitFlys_Next
constant string s__HitFlys_onUnitHitFly="HitFlys.UnitHitFly"
constant integer si__Press=21
integer si__Press_F=0
integer si__Press_I=0
integer array si__Press_V
constant string s__Press_onPressKeyDown="Press.onPressKeyDown" //目前仅提供了F2 Q W E R D F C 空格的按键捕捉 
constant string s__Press_onPressKeyUp="Press.onPressKeyUp"
constant string s__Press_onSnycPressKeyDown="Press.onSnycPressKeyDown"
constant string s__Press_onSnycPressKeyUp="Press.onSnycPressKeyUp"
constant integer si__Spell=22
integer si__Spell_F=0
integer si__Spell_I=0
integer array si__Spell_V
unit array s__Spell_Spell
unit array s__Spell_Target
real array s__Spell_X
real array s__Spell_Y
real array s__Spell_Angle
real array s__Spell_Dis
integer array s__Spell_Id
integer array s__Spell_Obj
boolean array s__Spell_Kill
integer array s__Spell_Use
integer array s__Spell_State
constant integer s__Spell_SpellState=0
constant integer s__Spell_ReadyState=1
constant integer s__Spell_StartState=2
constant integer s__Spell_StopState=3
constant string s__Spell_onSpell="Spell.UnitSpell"
constant string s__Spell_onReady="Spell.UnitReadySpell"
constant string s__Spell_onStart="Spell.UnitStartSpell"
constant string s__Spell_onStop="Spell.UnitStopSpell"
constant integer si__DamageArgs=23
integer si__DamageArgs_F=0
integer si__DamageArgs_I=0
integer array si__DamageArgs_V
real array s__DamageArgs_Damage
integer array s__DamageArgs_TriggerUnit
integer array s__DamageArgs_DamageUnit
integer array s__DamageArgs_Spell
integer array s__DamageArgs_DamageType
boolean array s__DamageArgs_isRange
constant integer si__Damage=24
integer si__Damage_F=0
integer si__Damage_I=0
integer array si__Damage_V
integer s__Damage_ht
constant integer s__Damage_Magic=0
constant integer s__Damage_Chaos=1
constant integer s__Damage_Physics=2
constant integer s__Damage_Attack=3
constant string s__Damage_onUnitDamageed="Damage.UnitDamageed"
constant string s__Damage_onHeroDamageed="Damage.HeroDamageed"
constant string s__Damage_onHeroDamage="Damage.HeroDamage"
constant string s__Damage_onUnitDamage="Damage.UnitDamage"
constant integer si__PlayerPress=25
integer si__PlayerPress_F=0
integer si__PlayerPress_I=0
integer array si__PlayerPress_V
boolean array s__PlayerPress_Q
boolean array s__PlayerPress_W
boolean array s__PlayerPress_E
boolean array s__PlayerPress_R
boolean array s__PlayerPress_D
boolean array s__PlayerPress_F
real array s__PlayerPress_MouseX
real array s__PlayerPress_MouseY
constant integer si__Units=26
integer si__Units_F=0
integer si__Units_I=0
integer array si__Units_V
integer s__Units_ht
integer array s__Units_player
boolean array s__Units_isHero
string array s__Units_name
unit array s__Units_unit
boolean array s__Units_move
integer array s__Units_uid
integer array s__Units_spell
integer array s__Units_aid
integer array s__Units_aidindex
integer array s__Units_Obj
constant string s__Units_onUnitDeath="Units.UnitDeath"
constant string s__Units_onHeroDeath="Units.HeroDeath"
constant string s__Units_onUnitSpawn="Units.UnitSpawn"
constant string s__Units_onHeroSpawn="Units.HeroSpawn"
constant string s__Units_onAlocDeath="Units.AlocDeath"
constant string s__Units_onAlocSpawn="Units.AlocSpawn"
constant integer si__HeroRares=27
integer si__HeroRares_F=0
integer si__HeroRares_I=0
integer array si__HeroRares_V
boolean s__HeroRares_isRepeat=false
constant integer si__Winner=28
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
constant integer si__DazzleMaster=29
integer si__DazzleMaster_F=0
integer si__DazzleMaster_I=0
integer array si__DazzleMaster_V
constant integer si__KillUi=30
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
constant integer si__OrdinaryWizard___OrdinaryWizard=37
integer si__OrdinaryWizard___OrdinaryWizard_F=0
integer si__OrdinaryWizard___OrdinaryWizard_I=0
integer array si__OrdinaryWizard___OrdinaryWizard_V
constant integer si__Respawn___Respawn=38
integer si__Respawn___Respawn_F=0
integer si__Respawn___Respawn_I=0
integer array si__Respawn___Respawn_V
integer s__Respawn___Respawn_DeathUIMainTop
integer s__Respawn___Respawn_DeathUIMainLine
integer s__Respawn___Respawn_DeathUIMainDown
integer s__Respawn___Respawn_DeathUIMainTitle
integer s__Respawn___Respawn_DeathUIMainRoll
integer s__Respawn___Respawn_DeathUIMainSave
integer s__Respawn___Respawn_DeathUIMainSaveLine
integer s__Respawn___Respawn_DeathUIMainBuy
integer s__Respawn___Respawn_DeathUIMainBuyLine
integer s__Respawn___Respawn_DeathUIMainTip
integer s__Respawn___Respawn_DeathUIMainSelect
integer s__Respawn___Respawn_DeathUIMainMoveBar
real s__Respawn___Respawn_MaxRespawnTime=5.0
boolean s__Respawn___Respawn_RespawnShow=false
real s__Respawn___Respawn_RespawnShowTime=0.0
real array s__Respawn___Respawn_RespawnTime
integer array s__Respawn___Respawn_RespawnSaveMoney
integer array s__Respawn___Respawn_RespawnSelectLast
integer array s__Respawn___Respawn_RespawnSelect
force array s__Teams___Team_Players
rect array s__Teams___Team_Rect
string array s__Teams___Team_Name
integer array s__Teams___Team_Kills
integer array s__TimerUtils__data
timer array s__TimerUtils__tT
unitpool array s__HeroRare___HeroRare
integer array s__s__KillUi_KillTeam
string array s__s__Respawn___Respawn_RespawnType
integer array si__Table__GTable_type
trigger array st__Table__GTable_onDestroy
trigger st__HandleTable__getindex
trigger st__HandleTable__setindex
trigger st__Buffs_Find
trigger st__Buffs_Skill
trigger st__Buffs_Trigger
trigger st__Dash_Destroy
trigger st__Dash_Stop
trigger st__Dash_Trigger
trigger st__Events_On
trigger st__HitFlys_Find
trigger st__HitFlys_Trigger
trigger st__Units_DelayAnime
trigger st__Units_AnimeSpeed
trigger st__Units_Position
trigger st__Units_Destroys
trigger st__Units_Get
trigger st__Units_Spawn
trigger st__Units_Kill
trigger st__HeroRares_Repeat
trigger st__HeroRares_AddRandomHero
trigger st__Winner_ShowWin
trigger st__DazzleMaster_AddDazzle
trigger st__KillUi_FlushPlayerData
trigger st__KillUi_FlushData
trigger st__KillUi_FlushKillData
trigger st__Respawn___Respawn_Flush
trigger st__Respawn___Respawn_Show
trigger array st___prototype20
trigger array st___prototype21
trigger array st___prototype22
trigger array st___prototype23
trigger array st___prototype25
trigger array st___prototype28
handle f__arg_handle1
integer f__arg_integer1
integer f__arg_integer2
integer f__arg_integer3
unit f__arg_unit1
string f__arg_string1
real f__arg_real1
real f__arg_real2
real f__arg_real3
boolean f__arg_boolean1
player f__arg_player1
integer f__arg_this
integer f__result_integer
unit f__result_unit

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
	native EXGetEffectX takes effect e returns real
	native EXGetEffectY takes effect e returns real
	native EXGetEffectZ takes effect e returns real
	native EXSetEffectXY takes effect e, real x, real y returns nothing
	native EXSetEffectZ takes effect e, real z returns nothing
	native EXGetEffectSize takes effect e returns real
	native EXSetEffectSize takes effect e, real size returns nothing
	native EXEffectMatRotateX takes effect e, real angle returns nothing
	native EXEffectMatRotateY takes effect e, real angle returns nothing
	native EXEffectMatRotateZ takes effect e, real angle returns nothing
	native EXEffectMatScale takes effect e, real x, real y, real z returns nothing
	native EXEffectMatReset takes effect e returns nothing
	native EXSetEffectSpeed takes effect e, real speed returns nothing
	native EXSetUnitFacing takes unit u, real angle returns nothing
	native EXPauseUnit takes unit u, boolean flag returns nothing
	native EXSetUnitCollisionType takes boolean enable, unit u, integer t returns nothing
	native EXSetUnitMoveType takes unit u, integer t returns nothing
	native EXExecuteScript takes string script returns string


//Generated allocator of Data
function s__Data__allocate takes nothing returns integer
 local integer this=si__Data_F
    if (this!=0) then
        set si__Data_F=si__Data_V[this]
    else
        set si__Data_I=si__Data_I+1
        set this=si__Data_I
    endif
    if (this>1637) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: Data")
        return 0
    endif
    set s__Data_i[this]=(this-1)*5
    set s__Data_r[this]=(this-1)*5
    set s__Data_c[this]=(this-1)*5
    set s__Data_u[this]=(this-1)*2
    set s__Data_g[this]=(this-1)*2
    set s__Data_s[this]=(this-1)*2
    set si__Data_V[this]=-1
 return this
endfunction

//Generated destructor of Data
function s__Data_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: Data")
        return
    elseif (si__Data_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: Data")
        return
    endif
    set si__Data_V[this]=si__Data_F
    set si__Data_F=this
endfunction

//Generated method caller for Respawn___Respawn.Flush
function sc__Respawn___Respawn_Flush takes player ps returns nothing
    set f__arg_player1=ps
    call TriggerEvaluate(st__Respawn___Respawn_Flush)
endfunction

//Generated method caller for Respawn___Respawn.Show
function sc__Respawn___Respawn_Show takes player p,boolean show returns nothing
    set f__arg_player1=p
    set f__arg_boolean1=show
    call TriggerEvaluate(st__Respawn___Respawn_Show)
endfunction

//Generated allocator of Respawn___Respawn
function s__Respawn___Respawn__allocate takes nothing returns integer
 local integer this=si__Respawn___Respawn_F
    if (this!=0) then
        set si__Respawn___Respawn_F=si__Respawn___Respawn_V[this]
    else
        set si__Respawn___Respawn_I=si__Respawn___Respawn_I+1
        set this=si__Respawn___Respawn_I
    endif
    if (this>8190) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: Respawn___Respawn")
        return 0
    endif

   set s__Respawn___Respawn_RespawnSaveMoney[this]=0
   set s__Respawn___Respawn_RespawnSelectLast[this]=0
   set s__Respawn___Respawn_RespawnSelect[this]=0
    set si__Respawn___Respawn_V[this]=-1
 return this
endfunction

//Generated destructor of Respawn___Respawn
function s__Respawn___Respawn_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: Respawn___Respawn")
        return
    elseif (si__Respawn___Respawn_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: Respawn___Respawn")
        return
    endif
    set si__Respawn___Respawn_V[this]=si__Respawn___Respawn_F
    set si__Respawn___Respawn_F=this
endfunction

//Generated allocator of OrdinaryWizard___OrdinaryWizard
function s__OrdinaryWizard___OrdinaryWizard__allocate takes nothing returns integer
 local integer this=si__OrdinaryWizard___OrdinaryWizard_F
    if (this!=0) then
        set si__OrdinaryWizard___OrdinaryWizard_F=si__OrdinaryWizard___OrdinaryWizard_V[this]
    else
        set si__OrdinaryWizard___OrdinaryWizard_I=si__OrdinaryWizard___OrdinaryWizard_I+1
        set this=si__OrdinaryWizard___OrdinaryWizard_I
    endif
    if (this>8190) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: OrdinaryWizard___OrdinaryWizard")
        return 0
    endif

    set si__OrdinaryWizard___OrdinaryWizard_V[this]=-1
 return this
endfunction

//Generated destructor of OrdinaryWizard___OrdinaryWizard
function s__OrdinaryWizard___OrdinaryWizard_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: OrdinaryWizard___OrdinaryWizard")
        return
    elseif (si__OrdinaryWizard___OrdinaryWizard_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: OrdinaryWizard___OrdinaryWizard")
        return
    endif
    set si__OrdinaryWizard___OrdinaryWizard_V[this]=si__OrdinaryWizard___OrdinaryWizard_F
    set si__OrdinaryWizard___OrdinaryWizard_F=this
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
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: KillUi")
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
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: KillUi")
        return
    elseif (si__KillUi_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: KillUi")
        return
    endif
    set si__KillUi_V[this]=si__KillUi_F
    set si__KillUi_F=this
endfunction

//Generated method caller for DazzleMaster.AddDazzle
function sc__DazzleMaster_AddDazzle takes unit u,integer id returns nothing
    set f__arg_unit1=u
    set f__arg_integer1=id
    call TriggerEvaluate(st__DazzleMaster_AddDazzle)
endfunction

//Generated allocator of DazzleMaster
function s__DazzleMaster__allocate takes nothing returns integer
 local integer this=si__DazzleMaster_F
    if (this!=0) then
        set si__DazzleMaster_F=si__DazzleMaster_V[this]
    else
        set si__DazzleMaster_I=si__DazzleMaster_I+1
        set this=si__DazzleMaster_I
    endif
    if (this>8190) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: DazzleMaster")
        return 0
    endif

    set si__DazzleMaster_V[this]=-1
 return this
endfunction

//Generated destructor of DazzleMaster
function s__DazzleMaster_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: DazzleMaster")
        return
    elseif (si__DazzleMaster_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: DazzleMaster")
        return
    endif
    set si__DazzleMaster_V[this]=si__DazzleMaster_F
    set si__DazzleMaster_F=this
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
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: Winner")
        return 0
    endif

    set si__Winner_V[this]=-1
 return this
endfunction

//Generated destructor of Winner
function s__Winner_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: Winner")
        return
    elseif (si__Winner_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: Winner")
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
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: HeroRares")
        return 0
    endif

    set si__HeroRares_V[this]=-1
 return this
endfunction

//Generated destructor of HeroRares
function s__HeroRares_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: HeroRares")
        return
    elseif (si__HeroRares_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: HeroRares")
        return
    endif
    set si__HeroRares_V[this]=si__HeroRares_F
    set si__HeroRares_F=this
endfunction

//Generated method caller for Units.DelayAnime
function sc__Units_DelayAnime takes integer this,integer id,real delay returns nothing
    set f__arg_this=this
    set f__arg_integer1=id
    set f__arg_real1=delay
    call TriggerEvaluate(st__Units_DelayAnime)
endfunction

//Generated method caller for Units.AnimeSpeed
function sc__Units_AnimeSpeed takes integer this,real sp returns nothing
                call SetUnitTimeScale(s__Units_unit[this], sp)
endfunction

//Generated method caller for Units.Position
function sc__Units_Position takes integer this,real x,real y,boolean order returns nothing
    set f__arg_this=this
    set f__arg_real1=x
    set f__arg_real2=y
    set f__arg_boolean1=order
    call TriggerEvaluate(st__Units_Position)
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

//Generated method caller for Units.Spawn
function sc__Units_Spawn takes player p,integer unitid,real x,real y,real f returns unit
    set f__arg_player1=p
    set f__arg_integer1=unitid
    set f__arg_real1=x
    set f__arg_real2=y
    set f__arg_real3=f
    call TriggerEvaluate(st__Units_Spawn)
 return f__result_unit
endfunction

//Generated method caller for Units.Kill
function sc__Units_Kill takes unit u returns nothing
            call KillUnit(u)
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
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: Units")
        return 0
    endif

    set si__Units_V[this]=-1
 return this
endfunction

//Generated destructor of Units
function s__Units_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: Units")
        return
    elseif (si__Units_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: Units")
        return
    endif
    set si__Units_V[this]=si__Units_F
    set si__Units_F=this
endfunction

//Generated allocator of PlayerPress
function s__PlayerPress__allocate takes nothing returns integer
 local integer this=si__PlayerPress_F
    if (this!=0) then
        set si__PlayerPress_F=si__PlayerPress_V[this]
    else
        set si__PlayerPress_I=si__PlayerPress_I+1
        set this=si__PlayerPress_I
    endif
    if (this>8190) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: PlayerPress")
        return 0
    endif

    set si__PlayerPress_V[this]=-1
 return this
endfunction

//Generated destructor of PlayerPress
function s__PlayerPress_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: PlayerPress")
        return
    elseif (si__PlayerPress_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: PlayerPress")
        return
    endif
    set si__PlayerPress_V[this]=si__PlayerPress_F
    set si__PlayerPress_F=this
endfunction

//Generated allocator of Damage
function s__Damage__allocate takes nothing returns integer
 local integer this=si__Damage_F
    if (this!=0) then
        set si__Damage_F=si__Damage_V[this]
    else
        set si__Damage_I=si__Damage_I+1
        set this=si__Damage_I
    endif
    if (this>8190) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: Damage")
        return 0
    endif

    set si__Damage_V[this]=-1
 return this
endfunction

//Generated destructor of Damage
function s__Damage_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: Damage")
        return
    elseif (si__Damage_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: Damage")
        return
    endif
    set si__Damage_V[this]=si__Damage_F
    set si__Damage_F=this
endfunction

//Generated allocator of DamageArgs
function s__DamageArgs__allocate takes nothing returns integer
 local integer this=si__DamageArgs_F
    if (this!=0) then
        set si__DamageArgs_F=si__DamageArgs_V[this]
    else
        set si__DamageArgs_I=si__DamageArgs_I+1
        set this=si__DamageArgs_I
    endif
    if (this>8190) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: DamageArgs")
        return 0
    endif

    set si__DamageArgs_V[this]=-1
 return this
endfunction

//Generated destructor of DamageArgs
function s__DamageArgs_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: DamageArgs")
        return
    elseif (si__DamageArgs_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: DamageArgs")
        return
    endif
    set si__DamageArgs_V[this]=si__DamageArgs_F
    set si__DamageArgs_F=this
endfunction

//Generated allocator of Spell
function s__Spell__allocate takes nothing returns integer
 local integer this=si__Spell_F
    if (this!=0) then
        set si__Spell_F=si__Spell_V[this]
    else
        set si__Spell_I=si__Spell_I+1
        set this=si__Spell_I
    endif
    if (this>8190) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: Spell")
        return 0
    endif

    set si__Spell_V[this]=-1
 return this
endfunction

//Generated destructor of Spell
function s__Spell_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: Spell")
        return
    elseif (si__Spell_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: Spell")
        return
    endif
    set si__Spell_V[this]=si__Spell_F
    set si__Spell_F=this
endfunction

//Generated allocator of Press
function s__Press__allocate takes nothing returns integer
 local integer this=si__Press_F
    if (this!=0) then
        set si__Press_F=si__Press_V[this]
    else
        set si__Press_I=si__Press_I+1
        set this=si__Press_I
    endif
    if (this>8190) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: Press")
        return 0
    endif

    set si__Press_V[this]=-1
 return this
endfunction

//Generated destructor of Press
function s__Press_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: Press")
        return
    elseif (si__Press_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: Press")
        return
    endif
    set si__Press_V[this]=si__Press_F
    set si__Press_F=this
endfunction

//Generated method caller for HitFlys.Find
function sc__HitFlys_Find takes unit u returns integer
    set f__arg_unit1=u
    call TriggerEvaluate(st__HitFlys_Find)
 return f__result_integer
endfunction

//Generated method caller for HitFlys.Trigger
function sc__HitFlys_Trigger takes string eName,integer m returns nothing
    set f__arg_string1=eName
    set f__arg_integer1=m
    call TriggerEvaluate(st__HitFlys_Trigger)
endfunction

//Generated allocator of HitFlys
function s__HitFlys__allocate takes nothing returns integer
 local integer this=si__HitFlys_F
    if (this!=0) then
        set si__HitFlys_F=si__HitFlys_V[this]
    else
        set si__HitFlys_I=si__HitFlys_I+1
        set this=si__HitFlys_I
    endif
    if (this>8190) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: HitFlys")
        return 0
    endif

   set s__HitFlys_Down[this]=false
    set si__HitFlys_V[this]=-1
 return this
endfunction

//Generated destructor of HitFlys
function s__HitFlys_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: HitFlys")
        return
    elseif (si__HitFlys_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: HitFlys")
        return
    endif
    set si__HitFlys_V[this]=si__HitFlys_F
    set si__HitFlys_F=this
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
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: Events")
        return 0
    endif

    set si__Events_V[this]=-1
 return this
endfunction

//Generated destructor of Events
function s__Events_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: Events")
        return
    elseif (si__Events_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: Events")
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
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: EventArgs")
        return 0
    endif

    set si__EventArgs_V[this]=-1
 return this
endfunction

//Generated destructor of EventArgs
function s__EventArgs_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: EventArgs")
        return
    elseif (si__EventArgs_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: EventArgs")
        return
    endif
    set si__EventArgs_V[this]=si__EventArgs_F
    set si__EventArgs_F=this
endfunction

//Generated method caller for Dash.Destroy
function sc__Dash_Destroy takes integer this returns nothing
    set f__arg_this=this
    call TriggerEvaluate(st__Dash_Destroy)
endfunction

//Generated method caller for Dash.Stop
function sc__Dash_Stop takes integer this returns nothing
    set f__arg_this=this
    call TriggerEvaluate(st__Dash_Stop)
endfunction

//Generated method caller for Dash.Trigger
function sc__Dash_Trigger takes string eName,unit u,integer m returns nothing
    set f__arg_string1=eName
    set f__arg_unit1=u
    set f__arg_integer1=m
    call TriggerEvaluate(st__Dash_Trigger)
endfunction

//Generated allocator of Dash
function s__Dash__allocate takes nothing returns integer
 local integer this=si__Dash_F
    if (this!=0) then
        set si__Dash_F=si__Dash_V[this]
    else
        set si__Dash_I=si__Dash_I+1
        set this=si__Dash_I
    endif
    if (this>8190) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: Dash")
        return 0
    endif

    set si__Dash_V[this]=-1
 return this
endfunction

//Generated destructor of Dash
function s__Dash_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: Dash")
        return
    elseif (si__Dash_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: Dash")
        return
    endif
    set si__Dash_V[this]=si__Dash_F
    set si__Dash_F=this
endfunction

//Generated method caller for Buffs.Find
function sc__Buffs_Find takes unit u,integer aid,integer bid returns integer
    set f__arg_unit1=u
    set f__arg_integer1=aid
    set f__arg_integer2=bid
    call TriggerEvaluate(st__Buffs_Find)
 return f__result_integer
endfunction

//Generated method caller for Buffs.Skill
function sc__Buffs_Skill takes unit u,integer aid,integer lv returns nothing
    set f__arg_unit1=u
    set f__arg_integer1=aid
    set f__arg_integer2=lv
    call TriggerEvaluate(st__Buffs_Skill)
endfunction

//Generated method caller for Buffs.Trigger
function sc__Buffs_Trigger takes string eName,unit u,integer m returns nothing
    set f__arg_string1=eName
    set f__arg_unit1=u
    set f__arg_integer1=m
    call TriggerEvaluate(st__Buffs_Trigger)
endfunction

//Generated allocator of Buffs
function s__Buffs__allocate takes nothing returns integer
 local integer this=si__Buffs_F
    if (this!=0) then
        set si__Buffs_F=si__Buffs_V[this]
    else
        set si__Buffs_I=si__Buffs_I+1
        set this=si__Buffs_I
    endif
    if (this>8190) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: Buffs")
        return 0
    endif

    set si__Buffs_V[this]=-1
 return this
endfunction

//Generated destructor of Buffs
function s__Buffs_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: Buffs")
        return
    elseif (si__Buffs_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: Buffs")
        return
    endif
    set si__Buffs_V[this]=si__Buffs_F
    set si__Buffs_F=this
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
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: Util")
        return 0
    endif

    set si__Util_V[this]=-1
 return this
endfunction

//Generated destructor of Util
function s__Util_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: Util")
        return
    elseif (si__Util_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: Util")
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
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: Teams")
        return 0
    endif

    set si__Teams_V[this]=-1
 return this
endfunction

//Generated destructor of Teams
function s__Teams_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: Teams")
        return
    elseif (si__Teams_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: Teams")
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
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: TakeUi")
        return 0
    endif

    set si__TakeUi_V[this]=-1
 return this
endfunction

//Generated destructor of TakeUi
function s__TakeUi_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: TakeUi")
        return
    elseif (si__TakeUi_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: TakeUi")
        return
    endif
    set si__TakeUi_V[this]=si__TakeUi_F
    set si__TakeUi_F=this
endfunction

//Generated method caller for Table__GTable.onDestroy
function sc__Table__GTable_onDestroy takes integer this returns nothing
    set f__arg_this=this
    call TriggerEvaluate(st__Table__GTable_onDestroy[9])
endfunction

//Generated allocator of Table__GTable
function s__Table__GTable__allocate takes nothing returns integer
 local integer this=si__Table__GTable_F
    if (this!=0) then
        set si__Table__GTable_F=si__Table__GTable_V[this]
    else
        set si__Table__GTable_I=si__Table__GTable_I+1
        set this=si__Table__GTable_I
    endif
    if (this>8100) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: Table__GTable")
        return 0
    endif

    set si__Table__GTable_type[this]=9
    set si__Table__GTable_V[this]=-1
 return this
endfunction

//Generated destructor of Table__GTable
function sc__Table__GTable_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: Table__GTable")
        return
    elseif (si__Table__GTable_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: Table__GTable")
        return
    endif
    set f__arg_this=this
    call TriggerEvaluate(st__Table__GTable_onDestroy[si__Table__GTable_type[this]])
    set si__Table__GTable_V[this]=si__Table__GTable_F
    set si__Table__GTable_F=this
endfunction

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
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: Players")
        return 0
    endif

    set si__Players_V[this]=-1
 return this
endfunction

//Generated destructor of Players
function s__Players_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: Players")
        return
    elseif (si__Players_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: Players")
        return
    endif
    set si__Players_V[this]=si__Players_F
    set si__Players_F=this
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
 local integer this=s__Table__GTable__allocate()
 local integer kthis
    if(this==0) then
        return 0
    endif
    set si__Table__GTable_type[this]=12
    set kthis=this

 return this
endfunction


//Generated allocator of Table
function s__Table__allocate takes nothing returns integer
 local integer this=s__Table__GTable__allocate()
 local integer kthis
    if(this==0) then
        return 0
    endif
    set si__Table__GTable_type[this]=10
    set kthis=this

 return this
endfunction


//Generated allocator of StringTable
function s__StringTable__allocate takes nothing returns integer
 local integer this=s__Table__GTable__allocate()
 local integer kthis
    if(this==0) then
        return 0
    endif
    set si__Table__GTable_type[this]=11
    set kthis=this

 return this
endfunction

function sc___prototype20_execute takes integer i,integer a1 returns nothing
    set f__arg_integer1=a1

    call TriggerExecute(st___prototype20[i])
endfunction
function sc___prototype20_evaluate takes integer i,integer a1 returns nothing
    set f__arg_integer1=a1

    call TriggerEvaluate(st___prototype20[i])

endfunction
function sc___prototype21_execute takes integer i,unit a1,integer a2 returns nothing
    set f__arg_unit1=a1
    set f__arg_integer1=a2

    call TriggerExecute(st___prototype21[i])
endfunction
function sc___prototype21_evaluate takes integer i,unit a1,integer a2 returns nothing
    set f__arg_unit1=a1
    set f__arg_integer1=a2

    call TriggerEvaluate(st___prototype21[i])

endfunction
function sc___prototype22_execute takes integer i,string a1 returns nothing
    set f__arg_string1=a1

    call TriggerExecute(st___prototype22[i])
endfunction
function sc___prototype22_evaluate takes integer i,string a1 returns nothing
    set f__arg_string1=a1

    call TriggerEvaluate(st___prototype22[i])

endfunction
function sc___prototype23_execute takes integer i,player a1,string a2 returns nothing
    set f__arg_player1=a1
    set f__arg_string1=a2

    call TriggerExecute(st___prototype23[i])
endfunction
function sc___prototype23_evaluate takes integer i,player a1,string a2 returns nothing
    set f__arg_player1=a1
    set f__arg_string1=a2

    call TriggerEvaluate(st___prototype23[i])

endfunction
function sc___prototype25_execute takes integer i,integer a1,integer a2 returns nothing
    set f__arg_integer1=a1
    set f__arg_integer2=a2

    call TriggerExecute(st___prototype25[i])
endfunction
function sc___prototype25_evaluate takes integer i,integer a1,integer a2 returns nothing
    set f__arg_integer1=a1
    set f__arg_integer2=a2

    call TriggerEvaluate(st___prototype25[i])

endfunction
function sc___prototype28_execute takes integer i,integer a1,unit a2,integer a3,integer a4,real a5 returns nothing
    set f__arg_integer1=a1
    set f__arg_unit1=a2
    set f__arg_integer2=a3
    set f__arg_integer3=a4
    set f__arg_real1=a5

    call TriggerExecute(st___prototype28[i])
endfunction
function sc___prototype28_evaluate takes integer i,integer a1,unit a2,integer a3,integer a4,real a5 returns nothing
    set f__arg_integer1=a1
    set f__arg_unit1=a2
    set f__arg_integer2=a3
    set f__arg_integer3=a4
    set f__arg_real1=a5

    call TriggerEvaluate(st___prototype28[i])

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
//library Data:
        function s__Data_Destroy takes integer this returns nothing
            local integer x
            set x=0
            loop
            exitwhen ( x >= 5 )
                set s___Data_i[s__Data_i[this]+x]=0
                set s___Data_r[s__Data_r[this]+x]=0.0
                set s___Data_c[s__Data_c[this]+x]=0
            set x=x + 1
            endloop
            set s___Data_s[s__Data_s[this]]=null
            set s___Data_s[s__Data_s[this]+1]=null
            if ( s___Data_u[s__Data_u[this]] != null ) then
                call BJDebugMsg("DATA异常:u[0]未设空,ID:" + GetAbilityName(s__Data_id[this]) + "/index:" + I2S(this))
            endif
            if ( s___Data_u[s__Data_u[this]+1] != null ) then
                call BJDebugMsg("DATA异常:u[1]未设空,ID:" + GetAbilityName(s__Data_id[this]) + "/index:" + I2S(this))
            endif
            if ( s___Data_g[s__Data_g[this]] != null ) then
                call BJDebugMsg("DATA异常:g[0]未设空,ID:" + GetAbilityName(s__Data_id[this]) + "/index:" + I2S(this))
            endif
            if ( s___Data_g[s__Data_g[this]+1] != null ) then
                call BJDebugMsg("DATA异常:g[1]未设空,ID:" + GetAbilityName(s__Data_id[this]) + "/index:" + I2S(this))
            endif
            call s__Data_deallocate(this)
        endfunction
        function s__Data_create takes integer id returns integer
            local integer t=s__Data__allocate()
            set s__Data_id[t]=id
            return t
        endfunction

//library Data ends
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
            set s__Players_isai[p]=GetPlayerController(ps) == MAP_CONTROL_COMPUTER
            set s__Players_isonline[p]=true
            set s__Players_randomhero[p]=0
            set s__Players_lifekill[p]=0
            set s__Players_nextherotype[p]=0
            set s__Players_isdeath[p]=false
            set s__Players_press[p]=0
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
//library SpellNameText:
    function SpellNameText takes unit u,string name,real time,real text returns nothing
        local texttag t=CreateTextTagUnitBJ(name, u, 0, text, 100, 100, 0, 0)
        call SetTextTagLifespan(t, time)
        call SetTextTagVisibility(t, true)
        call SetTextTagVelocityBJ(t, 128.00, 90)
        call SetTextTagPermanent(t, false)
        call SetTextTagFadepoint(t, time * 0.1)
        set t=null
    endfunction

//library SpellNameText ends
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


        function s__Table__GTable_reset takes integer this returns nothing
            call FlushChildHashtable(Table__ht, (this))
        endfunction

        function s__Table__GTable_onDestroy takes integer this returns nothing
            call s__Table__GTable_reset(this)
        endfunction

        //=============================================================
        // initialize it all.
        //
        function s__Table__GTable_onInit takes nothing returns nothing
            //set ht = InitHashtable()
        endfunction


    //Hey: Don't instanciate other people's textmacros that you are not supposed to, thanks.

//textmacro instance: Table__make("Table","integer","key" )

        function s__Table__getindex takes integer this,integer key returns integer
            return LoadInteger(Table__ht, (this), key)
        endfunction

        function s__Table__setindex takes integer this,integer key,integer value returns nothing
            call SaveInteger(Table__ht, (this), key, value)
        endfunction

        function s__Table_flush takes integer this,integer key returns nothing
            call RemoveSavedInteger(Table__ht, (this), key)
        endfunction

        function s__Table_exists takes integer this,integer key returns boolean
            return HaveSavedInteger(Table__ht, (this), key)
        endfunction

        function s__Table_flush2D takes string firstkey returns nothing
            call s__Table__GTable_reset((- StringHash(firstkey)))
        endfunction

        function s__Table__staticgetindex takes string firstkey returns integer
            return (- StringHash(firstkey))
        endfunction

//end of: Table__make("Table","integer","key" )
//textmacro instance: Table__make("StringTable","string", "StringHash(key)" )

        function s__StringTable__getindex takes integer this,string key returns integer
            return LoadInteger(Table__ht, (this), StringHash(key))
        endfunction

        function s__StringTable__setindex takes integer this,string key,integer value returns nothing
            call SaveInteger(Table__ht, (this), StringHash(key), value)
        endfunction

        function s__StringTable_flush takes integer this,string key returns nothing
            call RemoveSavedInteger(Table__ht, (this), StringHash(key))
        endfunction

        function s__StringTable_exists takes integer this,string key returns boolean
            return HaveSavedInteger(Table__ht, (this), StringHash(key))
        endfunction

        function s__StringTable_flush2D takes string firstkey returns nothing
            call s__Table__GTable_reset((- StringHash(firstkey)))
        endfunction

        function s__StringTable__staticgetindex takes string firstkey returns integer
            return (- StringHash(firstkey))
        endfunction

//end of: Table__make("StringTable","string", "StringHash(key)" )
//textmacro instance: Table__make("HandleTable","handle","GetHandleId(key)" )

        function s__HandleTable__getindex takes integer this,handle key returns integer
            return LoadInteger(Table__ht, (this), GetHandleId(key))
        endfunction

        function s__HandleTable__setindex takes integer this,handle key,integer value returns nothing
            call SaveInteger(Table__ht, (this), GetHandleId(key), value)
        endfunction

        function s__HandleTable_flush takes integer this,handle key returns nothing
            call RemoveSavedInteger(Table__ht, (this), GetHandleId(key))
        endfunction

        function s__HandleTable_exists takes integer this,handle key returns boolean
            return HaveSavedInteger(Table__ht, (this), GetHandleId(key))
        endfunction

        function s__HandleTable_flush2D takes string firstkey returns nothing
            call s__Table__GTable_reset((- StringHash(firstkey)))
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
        function Teams___anon__5 takes nothing returns boolean
            return GetPlayerSlotState(GetFilterPlayer()) == PLAYER_SLOT_STATE_PLAYING
        endfunction
        function Teams___anon__6 takes nothing returns boolean
            return IsPlayerInForce(GetFilterPlayer(), Teams___AllPlayers) == true and GetPlayerTeam(GetFilterPlayer()) == 0
        endfunction
        function Teams___anon__7 takes nothing returns boolean
            return IsPlayerInForce(GetFilterPlayer(), Teams___AllPlayers) == true and GetPlayerTeam(GetFilterPlayer()) == 1
        endfunction
        function Teams___anon__8 takes nothing returns boolean
            return IsPlayerInForce(GetFilterPlayer(), Teams___AllPlayers) == true and GetPlayerTeam(GetFilterPlayer()) == 2
        endfunction
    function Teams___onInit takes nothing returns nothing
        set Teams___AllPlayers=GetPlayersMatching(Condition(function Teams___anon__5))
        set s__Teams___Team_Players[0]= GetPlayersMatching(Condition(function Teams___anon__6))
        set s__Teams___Team_Players[1]= GetPlayersMatching(Condition(function Teams___anon__7))
        set s__Teams___Team_Players[2]= GetPlayersMatching(Condition(function Teams___anon__8))
        set s__Teams___Team_Rect[0]= gg_rct_A_TEAM
        set s__Teams___Team_Rect[1]= gg_rct_B_TEAM
        set s__Teams___Team_Rect[2]= gg_rct_C_TEAM
        set s__Teams___Team_Name[0]= "A组"
        set s__Teams___Team_Name[1]= "B组"
        set s__Teams___Team_Name[2]= "C组"
        call SetPlayerName(Player(9), s__Teams___Team_Name[0])
        call SetPlayerName(Player(10), s__Teams___Team_Name[1])
        call SetPlayerName(Player(11), s__Teams___Team_Name[2])
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
            return CountPlayersInForceBJ(s__Teams_GetTeamForce(p))
        endfunction
        function s__Teams_GetTeamNumberByIndex takes integer p returns integer
            return CountPlayersInForceBJ(s__Teams_GetTeamForceByIndex(p))
        endfunction

//library Teams ends
//library TerrainPathability:
//******************************************************************************
//* BY: Rising_Dusk
//* 
//* This script can be used to detect the type of pathing at a specific point.
//* It is valuable to do it this way because the IsTerrainPathable is very
//* counterintuitive and returns in odd ways and aren't always as you would
//* expect. This library, however, facilitates detecting those things reliably
//* and easily.
//* 
//******************************************************************************
//* 
//*    > function IsTerrainDeepWater    takes real x, real y returns boolean
//*    > function IsTerrainShallowWater takes real x, real y returns boolean
//*    > function IsTerrainLand         takes real x, real y returns boolean
//*    > function IsTerrainPlatform     takes real x, real y returns boolean
//*    > function IsTerrainWalkable     takes real x, real y returns boolean
//* 
//* These functions return true if the given point is of the type specified
//* in the function's name and false if it is not. For the IsTerrainWalkable
//* function, the MAX_RANGE constant below is the maximum deviation range from
//* the supplied coordinates that will still return true.
//* 
//* The IsTerrainPlatform works for any preplaced walkable destructable. It will
//* return true over bridges, destructable ramps, elevators, and invisible
//* platforms. Walkable destructables created at runtime do not create the same
//* pathing hole as preplaced ones do, so this will return false for them. All
//* other functions except IsTerrainWalkable return false for platforms, because
//* the platform itself erases their pathing when the map is saved.
//* 
//* After calling IsTerrainWalkable(x, y), the following two global variables
//* gain meaning. They return the X and Y coordinates of the nearest walkable
//* point to the specified coordinates. These will only deviate from the
//* IsTerrainWalkable function arguments if the function returned false.
//* 
//* Variables that can be used from the library:
//*     [real]    TerrainPathability_X
//*     [real]    TerrainPathability_Y



    function IsTerrainDeepWater takes real x,real y returns boolean
        return not IsTerrainPathable(x, y, PATHING_TYPE_FLOATABILITY) and IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY)
    endfunction

    function IsTerrainShallowWater takes real x,real y returns boolean
        return not IsTerrainPathable(x, y, PATHING_TYPE_FLOATABILITY) and not IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY) and IsTerrainPathable(x, y, PATHING_TYPE_BUILDABILITY)
    endfunction

    function IsTerrainLand takes real x,real y returns boolean
        return IsTerrainPathable(x, y, PATHING_TYPE_FLOATABILITY)
    endfunction

    function IsTerrainPlatform takes real x,real y returns boolean
        return not IsTerrainPathable(x, y, PATHING_TYPE_FLOATABILITY) and not IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY) and not IsTerrainPathable(x, y, PATHING_TYPE_BUILDABILITY)
    endfunction

    function TerrainPathability__HideItem takes nothing returns nothing
        if IsItemVisible(GetEnumItem()) then
            set TerrainPathability__Hid[TerrainPathability__HidMax]=GetEnumItem()
            call SetItemVisible(TerrainPathability__Hid[TerrainPathability__HidMax], false)
            set TerrainPathability__HidMax=TerrainPathability__HidMax + 1
        endif
    endfunction

    function IsTerrainWalkable takes real x,real y returns boolean
        //Hide any items in the area to avoid conflicts with our item
        call MoveRectTo(TerrainPathability__Find, x, y)
        call EnumItemsInRect(TerrainPathability__Find, null, function TerrainPathability__HideItem)
        //Try to move the test item and get its coords
        call SetItemPosition(TerrainPathability__Item, x, y) //Unhides the item
        set TerrainPathability_X=GetItemX(TerrainPathability__Item)
        set TerrainPathability_Y=GetItemY(TerrainPathability__Item)
//#         static if LIBRARY_IsTerrainWalkable then
//#             //This is for compatibility with the IsTerrainWalkable library
//#             set IsTerrainWalkable_X = TerrainPathability_X
//#             set IsTerrainWalkable_Y = TerrainPathability_Y
//#         endif
        call SetItemVisible(TerrainPathability__Item, false) //Hide it again
        //Unhide any items hidden at the start
        loop
            exitwhen TerrainPathability__HidMax <= 0
            set TerrainPathability__HidMax=TerrainPathability__HidMax - 1
            call SetItemVisible(TerrainPathability__Hid[TerrainPathability__HidMax], true)
            set TerrainPathability__Hid[TerrainPathability__HidMax]=null
        endloop
        //Return walkability
        return ( TerrainPathability_X - x ) * ( TerrainPathability_X - x ) + ( TerrainPathability_Y - y ) * ( TerrainPathability_Y - y ) <= TerrainPathability__MAX_RANGE * TerrainPathability__MAX_RANGE and not IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY)
    endfunction

    function TerrainPathability__Init takes nothing returns nothing
        set TerrainPathability__Find=Rect(0., 0., 128., 128.)
        set TerrainPathability__Item=CreateItem(TerrainPathability__DUMMY_ITEM_ID, 0, 0)
        call SetItemVisible(TerrainPathability__Item, false)
    endfunction

//library TerrainPathability ends
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
//#         static if TimerUtils__USE_HASH_TABLE  then
//#             // new blue
//#             call SaveInteger(TimerUtils__ht,0,GetHandleId(t), value)
//#             
//#         elseif  TimerUtils__USE_FLEXIBLE_OFFSET  then
                // orange
//#             static if  true  then
                    if ( GetHandleId(t) - TimerUtils__VOFFSET < 0 ) then
                        call BJDebugMsg("SetTimerData: Wrong handle id, only use SetTimerData on timers created by NewTimer")
                    endif
//#             endif
                set s__TimerUtils__data[GetHandleId(t) - TimerUtils__VOFFSET]= value
//#         else
//#             // new red
//#             static if  true  then
//#                 if(GetHandleId(t)-TimerUtils__OFFSET<0) then
//#                     call BJDebugMsg("SetTimerData: Wrong handle id, only use SetTimerData on timers created by NewTimer")
//#                 endif
//#             endif
//#             set TimerUtils__data[GetHandleId(t)-TimerUtils__OFFSET]=value
//#         endif        
    endfunction

    function GetTimerData takes timer t returns integer
//#         static if TimerUtils__USE_HASH_TABLE  then
//#             // new blue
//#             return LoadInteger(TimerUtils__ht,0,GetHandleId(t) )
//#             
//#         elseif  TimerUtils__USE_FLEXIBLE_OFFSET  then
                // orange
//#             static if  true  then
                    if ( GetHandleId(t) - TimerUtils__VOFFSET < 0 ) then
                        call BJDebugMsg("SetTimerData: Wrong handle id, only use SetTimerData on timers created by NewTimer")
                    endif
//#             endif
                return s__TimerUtils__data[GetHandleId(t) - TimerUtils__VOFFSET]
//#         else
//#             // new red
//#             static if  true  then
//#                 if(GetHandleId(t)-TimerUtils__OFFSET<0) then
//#                     call BJDebugMsg("SetTimerData: Wrong handle id, only use SetTimerData on timers created by NewTimer")
//#                 endif
//#             endif
//#             return TimerUtils__data[GetHandleId(t)-TimerUtils__OFFSET]
//#         endif        
    endfunction

    //==========================================================================================

    //==========================================================================================
    function NewTimer takes nothing returns timer
        if ( TimerUtils__tN == 0 ) then
            //If this happens then the QUANTITY rule has already been broken, try to fix the
            // issue, else fail.
             call BJDebugMsg("NewTimer: Warning, Exceeding TimerUtils_QUANTITY, make sure all timers are getting recycled correctly")
//#             static if  not TimerUtils__USE_HASH_TABLE  then
                     call BJDebugMsg("In case of errors, please increase it accordingly, or set TimerUtils_USE_HASH_TABLE to true")
                    set s__TimerUtils__tT[0]= CreateTimer()
//#                 static if  TimerUtils__USE_FLEXIBLE_OFFSET  then
                        if ( GetHandleId(s__TimerUtils__tT[0]) - TimerUtils__VOFFSET < 0 ) or ( GetHandleId(s__TimerUtils__tT[0]) - TimerUtils__VOFFSET >= TimerUtils__ARRAY_SIZE ) then
                            //all right, couldn't fix it
                            call BJDebugMsg("NewTimer: Unable to allocate a timer, you should probably set TimerUtils_USE_HASH_TABLE to true or fix timer leaks.")
                            return null
                        endif
//#                 else
//#                     if (GetHandleId(TimerUtils__tT[0])-TimerUtils__OFFSET<0) or (GetHandleId(TimerUtils__tT[0])-TimerUtils__OFFSET>=TimerUtils__ARRAY_SIZE) then
//#                         //all right, couldn't fix it
//#                         call BJDebugMsg("NewTimer: Unable to allocate a timer, you should probably set TimerUtils_USE_HASH_TABLE to true or fix timer leaks.")
//#                         return null
//#                     endif
//#                 endif
//#             endif
        else
            set TimerUtils__tN=TimerUtils__tN - 1
        endif
        call SetTimerData(s__TimerUtils__tT[TimerUtils__tN] , 0)
     return s__TimerUtils__tT[TimerUtils__tN]
    endfunction

    //==========================================================================================
    function ReleaseTimer takes timer t returns nothing
        if ( t == null ) then
             call BJDebugMsg("Warning: attempt to release a null timer")
            return
        endif
        if ( TimerUtils__tN == TimerUtils__ARRAY_SIZE ) then
             call BJDebugMsg("Warning: Timer stack is full, destroying timer!!")

            //stack is full, the map already has much more troubles than the chance of bug
            call DestroyTimer(t)
        else
            call PauseTimer(t)
            if ( GetTimerData(t) == TimerUtils__HELD ) then
                 call BJDebugMsg("Warning: ReleaseTimer: Double free!")
                return
            endif
            call SetTimerData(t , TimerUtils__HELD)
            set s__TimerUtils__tT[TimerUtils__tN]= t
            set TimerUtils__tN=TimerUtils__tN + 1
        endif
    endfunction

    function TimerUtils__init takes nothing returns nothing
     local integer i=0
     local integer o=- 1
     local boolean oops= false
     
//#         static if  TimerUtils__USE_HASH_TABLE   then
//#             set TimerUtils__ht = InitHashtable()
//#             loop
//#                 exitwhen(i==TimerUtils__QUANTITY)
//#                 set TimerUtils__tT[i]=CreateTimer()
//#                 call SetTimerData(TimerUtils__tT[i], TimerUtils__HELD)
//#                 set i=i+1
//#             endloop
//#             set TimerUtils__tN = TimerUtils__QUANTITY
//#         else
                loop
                    set i=0
                    loop
                        exitwhen ( i == TimerUtils__QUANTITY )
                        set s__TimerUtils__tT[i]= CreateTimer()
                        if ( i == 0 ) then
                            set TimerUtils__VOFFSET=GetHandleId(s__TimerUtils__tT[i])
//#                         static if TimerUtils__USE_FLEXIBLE_OFFSET  then
                                set o=TimerUtils__VOFFSET
//#                         else
//#                             set o=TimerUtils__OFFSET
//#                         endif
                        endif
                        if ( GetHandleId(s__TimerUtils__tT[i]) - o >= TimerUtils__ARRAY_SIZE ) then
                            exitwhen true
                        endif
                        if ( GetHandleId(s__TimerUtils__tT[i]) - o >= 0 ) then
                            set i=i + 1
                        endif
                    endloop
                    set TimerUtils__tN=i
                    exitwhen ( TimerUtils__tN == TimerUtils__QUANTITY )
                    set oops=true
                    exitwhen not TimerUtils__USE_FLEXIBLE_OFFSET
                     call BJDebugMsg("TimerUtils_init: Failed a initialization attempt, will try again")
                endloop
                
                if ( oops ) then
//#                 static if   TimerUtils__USE_FLEXIBLE_OFFSET  then
                         call BJDebugMsg("The problem has been fixed.")
                        //If this message doesn't appear then there is so much
                        //handle id fragmentation that it was impossible to preload
                        //so many timers and the thread crashed! Therefore this
                        //debug message is useful.
//#                 elseif(true) then
//#                     call BJDebugMsg("There were problems and the new timer limit is "+I2S(i))
//#                     call BJDebugMsg("This is a rare ocurrence, if the timer limit is too low:")
//#                     call BJDebugMsg("a) Change USE_FLEXIBLE_OFFSET to true (reduces performance a little)")
//#                     call BJDebugMsg("b) or try changing OFFSET to "+I2S(TimerUtils__VOFFSET) )
//#                 endif
                endif
//#         endif

    endfunction


//library TimerUtils ends
//library Tree:

        function Tree___anon__11 takes nothing returns nothing
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
        call TriggerAddAction(t, function Tree___anon__11)
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
        function s__Util_GetAbilityValue takes integer id,string valuename returns string
            return ( EXExecuteScript("(require'jass.slk').ability[" + I2S(id) + "]." + valuename) )
        endfunction
        function s__Util_GetBuffValue takes integer id,string valuename returns string
            return ( EXExecuteScript("(require'jass.slk').buff[" + I2S(id) + "]." + valuename) )
        endfunction
        function s__Util_GetPwx takes real power,real now,real max returns real
            return 1.00 - ( power * Pow(( ( now / max ) - 0.50 ), 2.00) )
        endfunction
        function s__Util_B2S takes boolean b returns string
            if ( b == true ) then
                return "true"
            else
                return "false"
            endif
        endfunction
        function s__Util_Range takes real x,real y,real dis returns nothing
            local integer i
            set i=0
            loop
            exitwhen ( i >= 36 )
                call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\SpiritOfVengeanceMissile\\SpiritOfVengeanceMissile.mdl", x + dis * CosBJ(i * 10), y + dis * SinBJ(i * 10)))
            set i=i + 1
            endloop
        endfunction
        function s__Util_Duang takes real x,real y,real time,real startrange,real endrange,real deep,real loops,real dis returns nothing
            local location d=Location(x, y)
            call TerrainDeformationRippleBJ(time, true, d, startrange, endrange, deep, loops, dis)
            call RemoveLocation(d)
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
//library YDWEGetUnitsOfPlayerMatchingNull:
function YDWEGetUnitsOfPlayerMatchingNull takes player whichPlayer,boolexpr filter returns group
    local group g= CreateGroup()
    call GroupEnumUnitsOfPlayer(g, whichPlayer, filter)
    call DestroyBoolExpr(filter)
    set yd_NullTempGroup=g
    set g=null
    return yd_NullTempGroup
endfunction

//library YDWEGetUnitsOfPlayerMatchingNull ends
//library YDWEJapiEffect:













 function YDWESetEffectLoc takes effect e,location loc returns nothing
		call EXSetEffectXY(e, GetLocationX(loc), GetLocationY(loc))
	endfunction

//library YDWEJapiEffect ends
//library YDWEJapiUnit:




 function YDWEUnitAddStun takes unit u returns nothing
		call EXPauseUnit(u, true)
	endfunction
 function YDWEUnitRemoveStun takes unit u returns nothing
		call EXPauseUnit(u, false)
	endfunction

//library YDWEJapiUnit ends
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
//library Buff:

//processed:     function interface Buff___BuffEventInterface takes Buffs arg0 returns nothing
//processed:     function interface Buff___AddBuffEventInterface takes unit arg0, Buffs arg1 returns nothing
        //public:  //总持续时间
            function s__Buffs_Destroy takes integer this returns nothing
                set s__Buffs_Unit[this]=null
                if ( s__Buffs_Last == this ) then
                    set s__Buffs_Next[s__Buffs_Prev[this]]=0
                    set s__Buffs_Last=s__Buffs_Prev[this]
                else
                    set s__Buffs_Next[s__Buffs_Prev[this]]=s__Buffs_Next[this]
                    set s__Buffs_Prev[s__Buffs_Next[this]]=s__Buffs_Prev[this]
                endif
                call s__Buffs_deallocate(this)
            endfunction
            function s__Buffs_AllRemove takes unit u,integer btype returns nothing
                local integer tmp=s__Buffs_Root
                local integer tmp1
                loop
                exitwhen ( tmp == 0 )
                    set tmp1=s__Buffs_Next[tmp]
                    if ( tmp != s__Buffs_Root ) then
                        if ( s__Buffs_Unit[tmp] == u and ( ( s__Buffs_Type[tmp] == btype ) or btype == - 1 ) ) then
                            call UnitRemoveAbility(s__Buffs_Unit[tmp], s__Buffs_Ability[tmp])
                            call UnitRemoveAbility(s__Buffs_Unit[tmp], s__Buffs_Buff[tmp])
                            if ( s__Buffs_onRemove[tmp] != 0 ) then
                                call sc___prototype20_evaluate((s__Buffs_onRemove[tmp]),tmp)
                            endif
                            call s__Buffs_Destroy(tmp)
                        endif
                    endif
                    set tmp=tmp1
                endloop
            endfunction
            function s__Buffs_Remove takes unit u,integer aid,integer bid returns nothing
                local integer tmp=sc__Buffs_Find(u , aid , bid)
                if ( tmp != 0 ) then
                    call UnitRemoveAbility(u, aid)
                    call UnitRemoveAbility(u, bid)
                    if ( s__Buffs_onRemove[tmp] != 0 ) then
                        call sc___prototype20_evaluate((s__Buffs_onRemove[tmp]),tmp)
                    endif
                    call s__Buffs_Destroy(tmp)
                endif
            endfunction
            function s__Buffs_Find takes unit u,integer aid,integer bid returns integer
                local integer tmp=s__Buffs_Root
                loop
                exitwhen ( tmp == 0 )
                    if ( s__Buffs_Unit[tmp] == u and s__Buffs_Buff[tmp] == bid and s__Buffs_Ability[tmp] == aid ) then
                        exitwhen true
                    else
                        set tmp=s__Buffs_Next[tmp]
                    endif
                endloop
                return tmp
            endfunction
            function s__Buffs_Add takes unit u,integer aid,integer bid,real time,boolean dealy returns integer
                local string target=s__Util_GetAbilityValue(aid , "targs1")
                local integer tmp
                if ( target == "self" ) then
                    set tmp=s__Buffs_Find(u , aid , bid)
                    if ( tmp == 0 ) then
                        set tmp=s__Buffs__allocate()
                        set s__Buffs_NowTime[tmp]=time
                        set s__Buffs_MaxTime[tmp]=time
                        set s__Buffs_Ability[tmp]=aid
                        set s__Buffs_Buff[tmp]=bid
                        set s__Buffs_Unit[tmp]=u
                        set s__Buffs_Obj[tmp]=0
                        set s__Buffs_onTime[tmp]=0
                        set s__Buffs_onEnd[tmp]=0
                        set s__Buffs_onRemove[tmp]=0
                        set s__Buffs_onDelay[tmp]=0
                        set s__Buffs_onFlush[tmp]=0
                        set s__Buffs_Type[tmp]=s__Buffs_TYPE_ADD + s__Buffs_TYPE_DISPEL_FALSE
                        set s__Buffs_Prev[tmp]=s__Buffs_Last
                        set s__Buffs_Next[tmp]=0
                        set s__Buffs_Next[s__Buffs_Last]=tmp
                        set s__Buffs_Last=tmp
                        call UnitAddAbility(u, aid)
                        if ( s__Units_isHero[sc__Units_Get(u)] == true ) then
                            call sc__Buffs_Trigger(s__Buffs_onHeroBuff , u , tmp)
                        else
                            call sc__Buffs_Trigger(s__Buffs_onUnitBuff , u , tmp)
                        endif
                        return tmp
                    else
                        if ( dealy == true ) then
                            set s__Buffs_MaxTime[tmp]=s__Buffs_MaxTime[tmp] + time
                            if ( s__Buffs_onDelay[tmp] != 0 ) then
                                call sc___prototype20_evaluate((s__Buffs_onDelay[tmp]),tmp)
                            endif
                        else
                            set s__Buffs_NowTime[tmp]=time
                            set s__Buffs_MaxTime[tmp]=time
                            if ( s__Buffs_onFlush[tmp] != 0 ) then
                                call sc___prototype20_evaluate((s__Buffs_onFlush[tmp]),tmp)
                            endif
                        endif
                        return tmp
                    endif
                else
                    call sc__Buffs_Skill(u , aid , 1)
                    return s__Buffs_Root
                endif
            endfunction
            function s__Buffs_Skill takes unit u,integer aid,integer lv returns nothing
                call UnitAddAbility(Origin_Magic, aid)
                call SetUnitAbilityLevel(Origin_Magic, aid, lv)
                call sc__Buffs_Trigger(s__Buffs_onUnitSkill , u , aid)
                call IssueTargetOrder(Origin_Magic, s__Util_GetAbilityValue(aid , "Order"), u)
                call UnitRemoveAbility(Origin_Magic, aid)
            endfunction
            function s__Buffs_Trigger takes string eName,unit u,integer m returns nothing
                local integer i
                local integer callback
                set i=1
                loop
                exitwhen ( i >= s__Table__getindex(s__Table__staticgetindex(eName),0) )
                    set callback=(s__Table__getindex(s__Table__staticgetindex(eName),i))
                    call sc___prototype21_evaluate(callback,u , m)
                set i=i + 1
                endloop
            endfunction
            function s__Buffs_On takes string eName,integer callback returns nothing
                if ( s__Table__getindex(s__Table__staticgetindex(eName),0) == 0 ) then
                    call s__Table__setindex(s__Table__staticgetindex(eName),0, 1)
                endif
                call s__Table__setindex(s__Table__staticgetindex(eName),s__Table__getindex(s__Table__staticgetindex(eName),0), callback)
                call s__Table__setindex(s__Table__staticgetindex(eName),0, s__Table__getindex(s__Table__staticgetindex(eName),0) + 1)
            endfunction
        function s__Buffs_onLoop takes nothing returns nothing
            local integer tmp=s__Buffs_Root
            local integer tmp1
            loop
            exitwhen ( tmp == 0 )
                set tmp1=s__Buffs_Next[tmp]
                if ( tmp != s__Buffs_Root ) then
                    if ( s__Buffs_NowTime[tmp] > 0 and IsUnitAliveBJ(s__Buffs_Unit[tmp]) == true ) then
                        set s__Buffs_NowTime[tmp]=s__Buffs_NowTime[tmp] - 0.01
                        if ( s__Buffs_onTime[tmp] != 0 ) then
                            call sc___prototype20_evaluate((s__Buffs_onTime[tmp]),tmp)
                        endif
                    else
                        call UnitRemoveAbility(s__Buffs_Unit[tmp], s__Buffs_Ability[tmp])
                        call UnitRemoveAbility(s__Buffs_Unit[tmp], s__Buffs_Buff[tmp])
                        if ( s__Buffs_onEnd[tmp] != 0 ) then
                            call sc___prototype20_evaluate((s__Buffs_onEnd[tmp]),tmp)
                        endif
                        call s__Buffs_Destroy(tmp)
                    endif
                endif
                set tmp=tmp1
            endloop
        endfunction
        function s__Buffs_onInit takes nothing returns nothing
            set s__Buffs_Root=s__Buffs__allocate()
            set s__Buffs_Last=s__Buffs_Root
        endfunction
    function Buff___onInit takes nothing returns nothing
        call TimerStart(NewTimer(), 0.01, true, function s__Buffs_onLoop)
    endfunction

//library Buff ends
//library Dashs:

//processed:     function interface Dashs___DashEventInterface takes Dash arg0 returns nothing
//processed:     function interface Dashs___DashsEventInterface takes unit arg0, Dash arg1 returns nothing
        //public:  //匀速冲锋
            function s__Dash_AllStop takes unit u returns nothing
                local integer tmp=s__Dash_Root
                local integer tmp1
                loop
                exitwhen ( tmp == 0 )
                    set tmp1=s__Dash_Next[tmp]
                    if ( tmp != s__Dash_Root ) then
                        if ( s__Dash_Unit[tmp] == u ) then
                            call sc__Dash_Stop(tmp)
                        endif
                    endif
                    set tmp=tmp1
                endloop
            endfunction
            function s__Dash_Start takes unit u,real angle,real dis,integer dashtype,real speed,boolean fly,boolean order returns integer
                local integer tmp=s__Dash__allocate()
                set s__Dash_Unit[tmp]=u
                set s__Dash_MaxDis[tmp]=dis
                set s__Dash_NowDis[tmp]=0.0
                set s__Dash_Angle[tmp]=angle
                set s__Dash_Speed[tmp]=speed
                set s__Dash_MaxSpeed[tmp]=speed
                set s__Dash_DashType[tmp]=dashtype
                set s__Dash_X[tmp]=GetUnitX(u)
                set s__Dash_Y[tmp]=GetUnitY(u)
                set s__Dash_LastX[tmp]=s__Dash_X[tmp]
                set s__Dash_LastY[tmp]=s__Dash_Y[tmp]
                set s__Dash_Obj[tmp]=0
                set s__Dash_onMove[tmp]=0
                set s__Dash_onEnd[tmp]=0
                set s__Dash_onRemove[tmp]=0
                set s__Dash_Fly[tmp]=fly
                set s__Dash_Order[tmp]=order
                set s__Dash_Prev[tmp]=s__Dash_Last
                set s__Dash_Next[tmp]=0
                set s__Dash_Next[s__Dash_Last]=tmp
                set s__Dash_Last=tmp
                if ( s__Units_isHero[sc__Units_Get(u)] == true ) then
                    call sc__Dash_Trigger(s__Dash_onHeroDash , u , tmp)
                else
                    call sc__Dash_Trigger(s__Dash_onUnitDash , u , tmp)
                endif
                return tmp
            endfunction
        //private:  //根节点
            function s__Dash_onLoop takes nothing returns nothing
                local integer tmp=s__Dash_Root
                local integer tmp1
                local boolean walk=false
                local real speed
                loop
                exitwhen ( tmp == 0 )
                    set tmp1=s__Dash_Next[tmp]
                    if ( tmp != s__Dash_Root ) then
                        set walk=false
                        set speed=0
                        if ( s__Dash_NowDis[tmp] < s__Dash_MaxDis[tmp] and IsUnitAliveBJ(s__Dash_Unit[tmp]) == true ) then
                            set s__Dash_LastX[tmp]=s__Dash_X[tmp]
                            set s__Dash_LastY[tmp]=s__Dash_Y[tmp]
                            if ( s__Dash_DashType[tmp] == s__Dash_NORMAL ) then
                                set speed=s__Dash_MaxSpeed[tmp]
                            elseif ( s__Dash_DashType[tmp] == s__Dash_PWX ) then
                                set speed=s__Dash_MaxSpeed[tmp] * ( s__Util_GetPwx(3.99 , s__Dash_NowDis[tmp] , s__Dash_MaxDis[tmp]) )
                            elseif ( s__Dash_DashType[tmp] == s__Dash_ADD ) then
                                set speed=s__Dash_MaxSpeed[tmp] * ( s__Util_GetPwx(3.99 , s__Dash_NowDis[tmp] / 2 , s__Dash_MaxDis[tmp]) )
                            elseif ( s__Dash_DashType[tmp] == s__Dash_SUB ) then
                                set speed=s__Dash_MaxSpeed[tmp] * ( 1 - s__Util_GetPwx(3.99 , s__Dash_NowDis[tmp] / 2 , s__Dash_MaxDis[tmp]) )
                            endif
                            set s__Dash_X[tmp]=GetUnitX(s__Dash_Unit[tmp]) + speed * CosBJ(s__Dash_Angle[tmp])
                            set s__Dash_Y[tmp]=GetUnitY(s__Dash_Unit[tmp]) + speed * SinBJ(s__Dash_Angle[tmp])
                            if ( s__Dash_Fly[tmp] == true ) then
                                set walk=true
                            elseif ( speed >= 64 ) then
                                set walk=IsTerrainWalkable(s__Dash_X[tmp] , s__Dash_Y[tmp])
                            else
                                set walk=IsTerrainWalkable(GetUnitX(s__Dash_Unit[tmp]) + 64 * CosBJ(s__Dash_Angle[tmp]) , GetUnitY(s__Dash_Unit[tmp]) + 64 * SinBJ(s__Dash_Angle[tmp]))
                            endif
                            if ( walk == true ) then
                                set walk=RectContainsCoords(gg_rct_main, s__Dash_X[tmp], s__Dash_Y[tmp])
                            endif
                            if ( walk == false or ( s__Dash_DashType[tmp] == s__Dash_SUB and speed < 1.0 ) ) then
                                set s__Dash_NowDis[tmp]=s__Dash_MaxDis[tmp]
                            else
                                set s__Dash_Speed[tmp]=speed
                                set s__Dash_NowDis[tmp]=s__Dash_NowDis[tmp] + speed
                                call sc__Units_Position(sc__Units_Get(s__Dash_Unit[tmp]),s__Dash_X[tmp] , s__Dash_Y[tmp] , s__Dash_Order[tmp])
                                if ( s__Dash_onMove[tmp] != 0 ) then
                                    call sc___prototype20_evaluate((s__Dash_onMove[tmp]),tmp)
                                endif
                            endif
                        else
                            if ( s__Dash_onEnd[tmp] != 0 ) then
                                call sc___prototype20_evaluate((s__Dash_onEnd[tmp]),tmp)
                            endif
                            call sc__Dash_Destroy(tmp)
                        endif
                    endif
                    set tmp=tmp1
                endloop
            endfunction
            function s__Dash_onInit takes nothing returns nothing
                set s__Dash_Root=s__Dash__allocate()
                set s__Dash_Last=s__Dash_Root
            endfunction
        //public:  //冲锋的单位
            function s__Dash_Destroy takes integer this returns nothing
                set s__Dash_Unit[this]=null
                if ( s__Dash_Last == this ) then
                    set s__Dash_Next[s__Dash_Prev[this]]=0
                    set s__Dash_Last=s__Dash_Prev[this]
                else
                    set s__Dash_Next[s__Dash_Prev[this]]=s__Dash_Next[this]
                    set s__Dash_Prev[s__Dash_Next[this]]=s__Dash_Prev[this]
                endif
                call s__Dash_deallocate(this)
            endfunction
            function s__Dash_Stop takes integer this returns nothing
                if ( s__Dash_onRemove[this] != 0 ) then
                    call sc___prototype20_evaluate((s__Dash_onRemove[this]),this)
                endif
                if ( s__Dash_onEnd[this] != 0 ) then
                    call sc___prototype20_evaluate((s__Dash_onEnd[this]),this)
                endif
                call s__Dash_Destroy(this)
            endfunction
            function s__Dash_Trigger takes string eName,unit u,integer m returns nothing
                local integer i
                local integer callback
                set i=1
                loop
                exitwhen ( i >= s__Table__getindex(s__Table__staticgetindex(eName),0) )
                    set callback=(s__Table__getindex(s__Table__staticgetindex(eName),i))
                    call sc___prototype21_evaluate(callback,u , m)
                set i=i + 1
                endloop
            endfunction
            function s__Dash_On takes string eName,integer callback returns nothing
                if ( s__Table__getindex(s__Table__staticgetindex(eName),0) == 0 ) then
                    call s__Table__setindex(s__Table__staticgetindex(eName),0, 1)
                endif
                call s__Table__setindex(s__Table__staticgetindex(eName),s__Table__getindex(s__Table__staticgetindex(eName),0), callback)
                call s__Table__setindex(s__Table__staticgetindex(eName),0, s__Table__getindex(s__Table__staticgetindex(eName),0) + 1)
            endfunction
    function Dashs___onInit takes nothing returns nothing
        call TimerStart(NewTimer(), 0.01, true, function s__Dash_onLoop)
    endfunction

//library Dashs ends
//library Disconnect:

        function Disconnect___anon__12 takes nothing returns nothing
            call AdjustPlayerStateBJ(GetPlayerState(s__Players_player[Disconnect___tmp], PLAYER_STATE_RESOURCE_GOLD) / ( s__Teams_GetTeamNumber(s__Players_player[Disconnect___tmp]) - 1 ), GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD)
        endfunction
    function Disconnect___onDisconnect takes integer e returns nothing
        local integer x
        local unit u
        set Disconnect___tmp=s__Players_Get(s__EventArgs_TriggerPlayer[e])
        set u=s__Units_unit[s__Players_hero[Disconnect___tmp]]
        call ReviveHero(u, GetUnitX(u), GetUnitY(u), false)
        call SetUnitPosition(u, GetRectCenterX(s__Teams_GetTeamRect(s__Players_player[Disconnect___tmp])), GetRectCenterY(s__Teams_GetTeamRect(s__Players_player[Disconnect___tmp])))
        set x=1
        loop
        exitwhen ( x > 6 )
            call UnitRemoveItemFromSlotSwapped(x, u)
        set x=x + 1
        endloop
        call sc__HeroRares_AddRandomHero(u)
        set x=s__Teams_GetTeamNumber(s__Players_player[Disconnect___tmp]) - 1
        if ( x != 0 ) then
            call ForForce(s__Teams_GetTeamForce(s__Players_player[Disconnect___tmp]), function Disconnect___anon__12)
        endif
        call s__Teams_PlayerRemoveForce(s__Players_player[Disconnect___tmp])
        call DisplayTimedTextToForce(s__Teams_GetAllPlayers(), 5.00, s__Players_name[Disconnect___tmp] + " 离开了游戏，金钱将平分给他的队友。")
        set s__Players_isonline[Disconnect___tmp]=false
        call sc__KillUi_FlushPlayerData(s__Players_player[Disconnect___tmp])
        set u=null
    endfunction
    function Disconnect___onInit takes nothing returns nothing
        call sc__Events_On(s__Events_onPlayerDisconnect , (1))
    endfunction

//library Disconnect ends
//library Events:

//processed:     function interface Events__EventInterface takes EventArgs arg0 returns nothing
        function s__EventArgs_create takes nothing returns integer
            local integer e=s__EventArgs__allocate()
            return e
        endfunction
        function s__EventArgs_Destroy takes integer this returns nothing
            set s__EventArgs_KillUnit[this]=null
            set s__EventArgs_SpellTargetUnit[this]=null
            set s__EventArgs_LevelUpUnit[this]=null
            set s__EventArgs_TriggerUnit[this]=null
            set s__EventArgs_DeathUnit[this]=null
            set s__EventArgs_TriggerPlayer[this]=null
            set s__EventArgs_DamageUnit[this]=null
            call s__EventArgs_deallocate(this)
        endfunction
        //public:  //任意单位死亡
            function s__Events_On takes string eName,integer callback returns nothing
                if ( s__Table__getindex(s__Table__staticgetindex(eName),0) == 0 ) then
                    call s__Table__setindex(s__Table__staticgetindex(eName),0, 1)
                endif
                call s__Table__setindex(s__Table__staticgetindex(eName),s__Table__getindex(s__Table__staticgetindex(eName),0), callback)
                call s__Table__setindex(s__Table__staticgetindex(eName),0, s__Table__getindex(s__Table__staticgetindex(eName),0) + 1)
            endfunction
    function Events__Event_onUnitDeath takes nothing returns nothing
        local integer i
        local integer callback
        local integer e=s__EventArgs_create()
        set s__EventArgs_DeathUnit[e]=GetDyingUnit()
        set s__EventArgs_KillUnit[e]=GetKillingUnit()
        set s__EventArgs_DamageUnit[e]=GetEventDamageSource()
        set s__EventArgs_Damage[e]=GetEventDamage()
        set s__EventArgs_RangeDamage[e]=YDWEIsEventRangedDamage()
        set s__EventArgs_AttackDamage[e]=YDWEIsEventAttackDamage()
        set s__EventArgs_MagicDamage[e]=not ( YDWEIsEventPhysicalDamage() )
        set s__EventArgs_TriggerUnit[e]=GetTriggerUnit()
        set s__EventArgs_TriggerPlayer[e]=GetTriggerPlayer()
        set s__EventArgs_SpellTargetUnit[e]=GetSpellTargetUnit()
        set s__EventArgs_SpellTargetX[e]=GetSpellTargetX()
        set s__EventArgs_SpellTargetY[e]=GetSpellTargetY()
        set s__EventArgs_SpellId[e]=GetSpellAbilityId()
        set s__EventArgs_LevelUpUnit[e]=GetLevelingUnit()
        set i=1
        loop
        exitwhen ( i >= s__Table__getindex(s__Table__staticgetindex(s__Events_onUnitDeath),0) )
            set callback=(s__Table__getindex(s__Table__staticgetindex(s__Events_onUnitDeath),i))
            call sc___prototype20_evaluate(callback,e)
        set i=i + 1
        endloop
        call s__EventArgs_Destroy(e)
    endfunction
    function Events__Event_onPlayerDisconnect takes nothing returns nothing
        local integer i
        local integer callback
        local integer e=s__EventArgs_create()
        set s__EventArgs_DeathUnit[e]=GetDyingUnit()
        set s__EventArgs_KillUnit[e]=GetKillingUnit()
        set s__EventArgs_DamageUnit[e]=GetEventDamageSource()
        set s__EventArgs_Damage[e]=GetEventDamage()
        set s__EventArgs_RangeDamage[e]=YDWEIsEventRangedDamage()
        set s__EventArgs_AttackDamage[e]=YDWEIsEventAttackDamage()
        set s__EventArgs_MagicDamage[e]=not ( YDWEIsEventPhysicalDamage() )
        set s__EventArgs_TriggerUnit[e]=GetTriggerUnit()
        set s__EventArgs_TriggerPlayer[e]=GetTriggerPlayer()
        set s__EventArgs_SpellTargetUnit[e]=GetSpellTargetUnit()
        set s__EventArgs_SpellTargetX[e]=GetSpellTargetX()
        set s__EventArgs_SpellTargetY[e]=GetSpellTargetY()
        set s__EventArgs_SpellId[e]=GetSpellAbilityId()
        set s__EventArgs_LevelUpUnit[e]=GetLevelingUnit()
        set i=1
        loop
        exitwhen ( i >= s__Table__getindex(s__Table__staticgetindex(s__Events_onPlayerDisconnect),0) )
            set callback=(s__Table__getindex(s__Table__staticgetindex(s__Events_onPlayerDisconnect),i))
            call sc___prototype20_evaluate(callback,e)
        set i=i + 1
        endloop
        call s__EventArgs_Destroy(e)
    endfunction
    function Events__Event_onUnitDamage takes nothing returns nothing
        local integer i
        local integer callback
        local integer e=s__EventArgs_create()
        set s__EventArgs_DeathUnit[e]=GetDyingUnit()
        set s__EventArgs_KillUnit[e]=GetKillingUnit()
        set s__EventArgs_DamageUnit[e]=GetEventDamageSource()
        set s__EventArgs_Damage[e]=GetEventDamage()
        set s__EventArgs_RangeDamage[e]=YDWEIsEventRangedDamage()
        set s__EventArgs_AttackDamage[e]=YDWEIsEventAttackDamage()
        set s__EventArgs_MagicDamage[e]=not ( YDWEIsEventPhysicalDamage() )
        set s__EventArgs_TriggerUnit[e]=GetTriggerUnit()
        set s__EventArgs_TriggerPlayer[e]=GetTriggerPlayer()
        set s__EventArgs_SpellTargetUnit[e]=GetSpellTargetUnit()
        set s__EventArgs_SpellTargetX[e]=GetSpellTargetX()
        set s__EventArgs_SpellTargetY[e]=GetSpellTargetY()
        set s__EventArgs_SpellId[e]=GetSpellAbilityId()
        set s__EventArgs_LevelUpUnit[e]=GetLevelingUnit()
        set i=1
        loop
        exitwhen ( i >= s__Table__getindex(s__Table__staticgetindex(s__Events_onUnitDamage),0) )
            set callback=(s__Table__getindex(s__Table__staticgetindex(s__Events_onUnitDamage),i))
            call sc___prototype20_evaluate(callback,e)
        set i=i + 1
        endloop
        call s__EventArgs_Destroy(e)
    endfunction
    function Events__Event_onUnitSpell takes nothing returns nothing
        local integer i
        local integer callback
        local integer e=s__EventArgs_create()
        set s__EventArgs_DeathUnit[e]=GetDyingUnit()
        set s__EventArgs_KillUnit[e]=GetKillingUnit()
        set s__EventArgs_DamageUnit[e]=GetEventDamageSource()
        set s__EventArgs_Damage[e]=GetEventDamage()
        set s__EventArgs_RangeDamage[e]=YDWEIsEventRangedDamage()
        set s__EventArgs_AttackDamage[e]=YDWEIsEventAttackDamage()
        set s__EventArgs_MagicDamage[e]=not ( YDWEIsEventPhysicalDamage() )
        set s__EventArgs_TriggerUnit[e]=GetTriggerUnit()
        set s__EventArgs_TriggerPlayer[e]=GetTriggerPlayer()
        set s__EventArgs_SpellTargetUnit[e]=GetSpellTargetUnit()
        set s__EventArgs_SpellTargetX[e]=GetSpellTargetX()
        set s__EventArgs_SpellTargetY[e]=GetSpellTargetY()
        set s__EventArgs_SpellId[e]=GetSpellAbilityId()
        set s__EventArgs_LevelUpUnit[e]=GetLevelingUnit()
        set i=1
        loop
        exitwhen ( i >= s__Table__getindex(s__Table__staticgetindex(s__Events_onUnitSpell),0) )
            set callback=(s__Table__getindex(s__Table__staticgetindex(s__Events_onUnitSpell),i))
            call sc___prototype20_evaluate(callback,e)
        set i=i + 1
        endloop
        call s__EventArgs_Destroy(e)
    endfunction
    function Events__Event_onUnitReadySpell takes nothing returns nothing
        local integer i
        local integer callback
        local integer e=s__EventArgs_create()
        set s__EventArgs_DeathUnit[e]=GetDyingUnit()
        set s__EventArgs_KillUnit[e]=GetKillingUnit()
        set s__EventArgs_DamageUnit[e]=GetEventDamageSource()
        set s__EventArgs_Damage[e]=GetEventDamage()
        set s__EventArgs_RangeDamage[e]=YDWEIsEventRangedDamage()
        set s__EventArgs_AttackDamage[e]=YDWEIsEventAttackDamage()
        set s__EventArgs_MagicDamage[e]=not ( YDWEIsEventPhysicalDamage() )
        set s__EventArgs_TriggerUnit[e]=GetTriggerUnit()
        set s__EventArgs_TriggerPlayer[e]=GetTriggerPlayer()
        set s__EventArgs_SpellTargetUnit[e]=GetSpellTargetUnit()
        set s__EventArgs_SpellTargetX[e]=GetSpellTargetX()
        set s__EventArgs_SpellTargetY[e]=GetSpellTargetY()
        set s__EventArgs_SpellId[e]=GetSpellAbilityId()
        set s__EventArgs_LevelUpUnit[e]=GetLevelingUnit()
        set i=1
        loop
        exitwhen ( i >= s__Table__getindex(s__Table__staticgetindex(s__Events_onUnitReadySpell),0) )
            set callback=(s__Table__getindex(s__Table__staticgetindex(s__Events_onUnitReadySpell),i))
            call sc___prototype20_evaluate(callback,e)
        set i=i + 1
        endloop
        call s__EventArgs_Destroy(e)
    endfunction
    function Events__Event_onUnitStartSpell takes nothing returns nothing
        local integer i
        local integer callback
        local integer e=s__EventArgs_create()
        set s__EventArgs_DeathUnit[e]=GetDyingUnit()
        set s__EventArgs_KillUnit[e]=GetKillingUnit()
        set s__EventArgs_DamageUnit[e]=GetEventDamageSource()
        set s__EventArgs_Damage[e]=GetEventDamage()
        set s__EventArgs_RangeDamage[e]=YDWEIsEventRangedDamage()
        set s__EventArgs_AttackDamage[e]=YDWEIsEventAttackDamage()
        set s__EventArgs_MagicDamage[e]=not ( YDWEIsEventPhysicalDamage() )
        set s__EventArgs_TriggerUnit[e]=GetTriggerUnit()
        set s__EventArgs_TriggerPlayer[e]=GetTriggerPlayer()
        set s__EventArgs_SpellTargetUnit[e]=GetSpellTargetUnit()
        set s__EventArgs_SpellTargetX[e]=GetSpellTargetX()
        set s__EventArgs_SpellTargetY[e]=GetSpellTargetY()
        set s__EventArgs_SpellId[e]=GetSpellAbilityId()
        set s__EventArgs_LevelUpUnit[e]=GetLevelingUnit()
        set i=1
        loop
        exitwhen ( i >= s__Table__getindex(s__Table__staticgetindex(s__Events_onUnitStartSpell),0) )
            set callback=(s__Table__getindex(s__Table__staticgetindex(s__Events_onUnitStartSpell),i))
            call sc___prototype20_evaluate(callback,e)
        set i=i + 1
        endloop
        call s__EventArgs_Destroy(e)
    endfunction
    function Events__Event_onUnitStopSpell takes nothing returns nothing
        local integer i
        local integer callback
        local integer e=s__EventArgs_create()
        set s__EventArgs_DeathUnit[e]=GetDyingUnit()
        set s__EventArgs_KillUnit[e]=GetKillingUnit()
        set s__EventArgs_DamageUnit[e]=GetEventDamageSource()
        set s__EventArgs_Damage[e]=GetEventDamage()
        set s__EventArgs_RangeDamage[e]=YDWEIsEventRangedDamage()
        set s__EventArgs_AttackDamage[e]=YDWEIsEventAttackDamage()
        set s__EventArgs_MagicDamage[e]=not ( YDWEIsEventPhysicalDamage() )
        set s__EventArgs_TriggerUnit[e]=GetTriggerUnit()
        set s__EventArgs_TriggerPlayer[e]=GetTriggerPlayer()
        set s__EventArgs_SpellTargetUnit[e]=GetSpellTargetUnit()
        set s__EventArgs_SpellTargetX[e]=GetSpellTargetX()
        set s__EventArgs_SpellTargetY[e]=GetSpellTargetY()
        set s__EventArgs_SpellId[e]=GetSpellAbilityId()
        set s__EventArgs_LevelUpUnit[e]=GetLevelingUnit()
        set i=1
        loop
        exitwhen ( i >= s__Table__getindex(s__Table__staticgetindex(s__Events_onUnitStopSpell),0) )
            set callback=(s__Table__getindex(s__Table__staticgetindex(s__Events_onUnitStopSpell),i))
            call sc___prototype20_evaluate(callback,e)
        set i=i + 1
        endloop
        call s__EventArgs_Destroy(e)
    endfunction
    function Events__Event_onHeroLevelUp takes nothing returns nothing
        local integer i
        local integer callback
        local integer e=s__EventArgs_create()
        set s__EventArgs_DeathUnit[e]=GetDyingUnit()
        set s__EventArgs_KillUnit[e]=GetKillingUnit()
        set s__EventArgs_DamageUnit[e]=GetEventDamageSource()
        set s__EventArgs_Damage[e]=GetEventDamage()
        set s__EventArgs_RangeDamage[e]=YDWEIsEventRangedDamage()
        set s__EventArgs_AttackDamage[e]=YDWEIsEventAttackDamage()
        set s__EventArgs_MagicDamage[e]=not ( YDWEIsEventPhysicalDamage() )
        set s__EventArgs_TriggerUnit[e]=GetTriggerUnit()
        set s__EventArgs_TriggerPlayer[e]=GetTriggerPlayer()
        set s__EventArgs_SpellTargetUnit[e]=GetSpellTargetUnit()
        set s__EventArgs_SpellTargetX[e]=GetSpellTargetX()
        set s__EventArgs_SpellTargetY[e]=GetSpellTargetY()
        set s__EventArgs_SpellId[e]=GetSpellAbilityId()
        set s__EventArgs_LevelUpUnit[e]=GetLevelingUnit()
        set i=1
        loop
        exitwhen ( i >= s__Table__getindex(s__Table__staticgetindex(s__Events_onHeroLevelUp),0) )
            set callback=(s__Table__getindex(s__Table__staticgetindex(s__Events_onHeroLevelUp),i))
            call sc___prototype20_evaluate(callback,e)
        set i=i + 1
        endloop
        call s__EventArgs_Destroy(e)
    endfunction
    function Events__Event_onUnitDeacy takes nothing returns nothing
        local integer i
        local integer callback
        local integer e=s__EventArgs_create()
        set s__EventArgs_DeathUnit[e]=GetDyingUnit()
        set s__EventArgs_KillUnit[e]=GetKillingUnit()
        set s__EventArgs_DamageUnit[e]=GetEventDamageSource()
        set s__EventArgs_Damage[e]=GetEventDamage()
        set s__EventArgs_RangeDamage[e]=YDWEIsEventRangedDamage()
        set s__EventArgs_AttackDamage[e]=YDWEIsEventAttackDamage()
        set s__EventArgs_MagicDamage[e]=not ( YDWEIsEventPhysicalDamage() )
        set s__EventArgs_TriggerUnit[e]=GetTriggerUnit()
        set s__EventArgs_TriggerPlayer[e]=GetTriggerPlayer()
        set s__EventArgs_SpellTargetUnit[e]=GetSpellTargetUnit()
        set s__EventArgs_SpellTargetX[e]=GetSpellTargetX()
        set s__EventArgs_SpellTargetY[e]=GetSpellTargetY()
        set s__EventArgs_SpellId[e]=GetSpellAbilityId()
        set s__EventArgs_LevelUpUnit[e]=GetLevelingUnit()
        set i=1
        loop
        exitwhen ( i >= s__Table__getindex(s__Table__staticgetindex(s__Events_onUnitDeacy),0) )
            set callback=(s__Table__getindex(s__Table__staticgetindex(s__Events_onUnitDeacy),i))
            call sc___prototype20_evaluate(callback,e)
        set i=i + 1
        endloop
        call s__EventArgs_Destroy(e)
    endfunction
    function Events__onInit takes nothing returns nothing
        local trigger t
        local integer index
        set t=CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_DEATH)
        call TriggerAddAction(t, function Events__Event_onUnitDeath) //end of: RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_UNIT_DEATH","Event_onUnitDeath")
        set t=CreateTrigger() //textmacro instance: RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_UNIT_SPELL_EFFECT","Event_onUnitSpell")
        call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_SPELL_EFFECT)
        call TriggerAddAction(t, function Events__Event_onUnitSpell) //end of: RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_UNIT_SPELL_EFFECT","Event_onUnitSpell")
        set t=CreateTrigger() //textmacro instance: RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_HERO_LEVEL","Event_onHeroLevelUp")
        call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_HERO_LEVEL)
        call TriggerAddAction(t, function Events__Event_onHeroLevelUp) //end of: RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_HERO_LEVEL","Event_onHeroLevelUp")
        set t=CreateTrigger() //textmacro instance: RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_UNIT_SPELL_CHANNEL","Event_onUnitReadySpell")
        call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_SPELL_CHANNEL)
        call TriggerAddAction(t, function Events__Event_onUnitReadySpell) //end of: RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_UNIT_SPELL_CHANNEL","Event_onUnitReadySpell")
        set t=CreateTrigger() //textmacro instance: RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_UNIT_SPELL_CAST","Event_onUnitStartSpell")
        call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_SPELL_CAST)
        call TriggerAddAction(t, function Events__Event_onUnitStartSpell) //end of: RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_UNIT_SPELL_CAST","Event_onUnitStartSpell")
        set t=CreateTrigger() //textmacro instance: RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_UNIT_SPELL_ENDCAST","Event_onUnitStopSpell")
        call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_SPELL_ENDCAST)
        call TriggerAddAction(t, function Events__Event_onUnitStopSpell) //end of: RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_UNIT_SPELL_ENDCAST","Event_onUnitStopSpell")
        set t=CreateTrigger() //textmacro instance: RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_UNIT_DECAY","Event_onUnitDeacy")
        call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_DECAY)
        call TriggerAddAction(t, function Events__Event_onUnitDeacy) //end of: RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_UNIT_DECAY","Event_onUnitDeacy")
        set t=CreateTrigger() //textmacro instance: AllPlayerRegisterEvent("TriggerRegisterPlayerEventLeave","","Event_onPlayerDisconnect")
        set index=0
        loop
        exitwhen ( index > 12 )
            call TriggerRegisterPlayerEventLeave(t, Player(index))
        set index=index + 1
        endloop
        call TriggerAddAction(t, function Events__Event_onPlayerDisconnect) //end of: AllPlayerRegisterEvent("TriggerRegisterPlayerEventLeave","","Event_onPlayerDisconnect")
        set t=CreateTrigger()
        call YDWESyStemAnyUnitDamagedRegistTrigger(t)
        call TriggerAddAction(t, function Events__Event_onUnitDamage)
        set t=null
    endfunction

//library Events ends
//library HitFly:

//processed:     function interface HitFly___HitFlyEventInterface takes HitFlys arg0 returns nothing
        //public:  //上升力  
            function s__HitFlys_Destroy takes integer this returns nothing
                set s__HitFlys_Unit[this]=null
                if ( s__HitFlys_Last == this ) then
                    set s__HitFlys_Next[s__HitFlys_Prev[this]]=0
                    set s__HitFlys_Last=s__HitFlys_Prev[this]
                else
                    set s__HitFlys_Next[s__HitFlys_Prev[this]]=s__HitFlys_Next[this]
                    set s__HitFlys_Prev[s__HitFlys_Next[this]]=s__HitFlys_Prev[this]
                endif
                call s__HitFlys_deallocate(this)
            endfunction
            function s__HitFlys_Remove takes unit u returns nothing
                local integer tmp=sc__HitFlys_Find(u)
                if ( tmp != 0 ) then
                    if ( s__HitFlys_onRemove[tmp] != 0 ) then
                        call sc___prototype20_evaluate((s__HitFlys_onRemove[tmp]),tmp)
                    endif
                    call s__HitFlys_Destroy(tmp)
                endif
            endfunction
            function s__HitFlys_Find takes unit u returns integer
                local integer tmp=s__HitFlys_Root
                loop
                exitwhen ( tmp == 0 )
                    if ( s__HitFlys_Unit[tmp] == u ) then
                        exitwhen true
                    else
                        set tmp=s__HitFlys_Next[tmp]
                    endif
                endloop
                return tmp
            endfunction
            function s__HitFlys_Add takes unit u,real up returns integer
                local integer tmp=s__HitFlys_Find(u)
                if ( tmp == 0 ) then
                    set tmp=s__HitFlys__allocate()
                    set s__HitFlys_Unit[tmp]=u
                    set s__HitFlys_UpPower[tmp]=up
                    set s__HitFlys_Obj[tmp]=0
                    set s__HitFlys_onEnd[tmp]=0
                    set s__HitFlys_onRemove[tmp]=0
                    set s__HitFlys_onDown[tmp]=0
                    set s__HitFlys_Prev[tmp]=s__HitFlys_Last
                    set s__HitFlys_Next[tmp]=0
                    set s__HitFlys_Next[s__HitFlys_Last]=tmp
                    set s__HitFlys_Last=tmp
                    call sc__HitFlys_Trigger(s__HitFlys_onUnitHitFly , tmp)
                else
                    set s__HitFlys_UpPower[tmp]=s__HitFlys_UpPower[tmp] + up
                endif
                return tmp
            endfunction
            function s__HitFlys_Trigger takes string eName,integer m returns nothing
                local integer i
                local integer callback
                set i=1
                loop
                exitwhen ( i >= s__Table__getindex(s__Table__staticgetindex(eName),0) )
                    set callback=(s__Table__getindex(s__Table__staticgetindex(eName),i))
                    call sc___prototype20_evaluate(callback,m)
                set i=i + 1
                endloop
            endfunction
            function s__HitFlys_On takes string eName,integer callback returns nothing
                if ( s__Table__getindex(s__Table__staticgetindex(eName),0) == 0 ) then
                    call s__Table__setindex(s__Table__staticgetindex(eName),0, 1)
                endif
                call s__Table__setindex(s__Table__staticgetindex(eName),s__Table__getindex(s__Table__staticgetindex(eName),0), callback)
                call s__Table__setindex(s__Table__staticgetindex(eName),0, s__Table__getindex(s__Table__staticgetindex(eName),0) + 1)
            endfunction
        function s__HitFlys_onLoop takes nothing returns nothing
            local integer tmp=s__HitFlys_Root
            local integer tmp1
            loop
            exitwhen ( tmp == 0 )
                set tmp1=s__HitFlys_Next[tmp]
                if ( tmp != s__HitFlys_Root ) then
                    if ( GetUnitFlyHeight(s__HitFlys_Unit[tmp]) > 10 or s__HitFlys_UpPower[tmp] > 0 ) then
                        call SetUnitFlyHeight(s__HitFlys_Unit[tmp], GetUnitFlyHeight(s__HitFlys_Unit[tmp]) + s__HitFlys_UpPower[tmp], 0)
                        set s__HitFlys_UpPower[tmp]=s__HitFlys_UpPower[tmp] - s__HitFlys_Power
                        if ( s__HitFlys_Down[tmp] == false ) then
                            if ( s__HitFlys_UpPower[tmp] < 0 ) then
                                set s__HitFlys_Down[tmp]=true
                                if ( s__HitFlys_onDown[tmp] != 0 ) then
                                    call sc___prototype20_evaluate((s__HitFlys_onDown[tmp]),tmp)
                                endif
                            endif
                        endif
                    else
                        call SetUnitFlyHeight(s__HitFlys_Unit[tmp], 0, 0)
                        if ( s__HitFlys_onEnd[tmp] != 0 ) then
                            call sc___prototype20_evaluate((s__HitFlys_onEnd[tmp]),tmp)
                        endif
                        call s__HitFlys_Destroy(tmp)
                    endif
                endif
                set tmp=tmp1
            endloop
        endfunction
        function s__HitFlys_onInit takes nothing returns nothing
            set s__HitFlys_Root=s__HitFlys__allocate()
            set s__HitFlys_Last=s__HitFlys_Root
        endfunction
    function HitFly___onInit takes nothing returns nothing
        call TimerStart(NewTimer(), 0.01, true, function s__HitFlys_onLoop)
    endfunction

//library HitFly ends
//library Press:

//processed:     function interface Press__PressEventInterface takes string arg0 returns nothing  //主要用于同步玩家的按键 //网易提供的事件延迟太高了 //改为使用YDWE-LUA引擎的message.hook实现
//processed:     function interface Press__PressSnycEventInterface takes player arg0, string arg1 returns nothing
        function s__Press_TriggerSnyc takes string eName,player n,string keyName returns nothing
            local integer i
            local integer callback
            set i=1
            loop
            exitwhen ( i >= s__Table__getindex(s__Table__staticgetindex(eName),0) )
                set callback=(s__Table__getindex(s__Table__staticgetindex(eName),i))
                call sc___prototype23_evaluate(callback,n , keyName)
            set i=i + 1
            endloop
        endfunction
        function s__Press_OnSnyc takes string eName,integer callback returns nothing
            if ( s__Table__getindex(s__Table__staticgetindex(eName),0) == 0 ) then
                call s__Table__setindex(s__Table__staticgetindex(eName),0, 1)
            endif
            call s__Table__setindex(s__Table__staticgetindex(eName),s__Table__getindex(s__Table__staticgetindex(eName),0), callback)
            call s__Table__setindex(s__Table__staticgetindex(eName),0, s__Table__getindex(s__Table__staticgetindex(eName),0) + 1)
        endfunction
        function s__Press_Trigger takes string eName,string keyName returns nothing
            local integer i
            local integer callback
            set i=1
            loop
            exitwhen ( i >= s__Table__getindex(s__Table__staticgetindex(eName),0) )
                set callback=(s__Table__getindex(s__Table__staticgetindex(eName),i))
                call sc___prototype22_evaluate(callback,keyName)
            set i=i + 1
            endloop
        endfunction
        function s__Press_On takes string eName,integer callback returns nothing
            if ( s__Table__getindex(s__Table__staticgetindex(eName),0) == 0 ) then
                call s__Table__setindex(s__Table__staticgetindex(eName),0, 1)
            endif
            call s__Table__setindex(s__Table__staticgetindex(eName),s__Table__getindex(s__Table__staticgetindex(eName),0), callback)
            call s__Table__setindex(s__Table__staticgetindex(eName),0, s__Table__getindex(s__Table__staticgetindex(eName),0) + 1)
        endfunction
    function PressSnycLuaCallback takes nothing returns nothing
        if ( PressCode == 1 ) then
            if ( PressType == "key_down" ) then
                call s__Press_Trigger(s__Press_onPressKeyDown , PressName)
                if ( s__Table__getindex(s__Table__staticgetindex(s__Press_onSnycPressKeyDown),0) != 0 ) then
                    call DzSyncData("Press", "D" + PressName)
                endif
            else
                call s__Press_Trigger(s__Press_onPressKeyUp , PressName)
                if ( s__Table__getindex(s__Table__staticgetindex(s__Press_onSnycPressKeyDown),0) != 0 ) then
                    call DzSyncData("Press", "U" + PressName)
                endif
            endif
        endif
    endfunction
    function Press__PressSnycData takes nothing returns nothing
        local player p=DzGetTriggerSyncPlayer()
        local string d=DzGetTriggerSyncData()
        local string t=SubString(d, 0, 1)
        local string msg=SubString(d, 1, StringLength(d))
        if ( t == "D" ) then
            call s__Press_TriggerSnyc(s__Press_onSnycPressKeyDown , p , msg)
        elseif ( t == "U" ) then
            call s__Press_TriggerSnyc(s__Press_onSnycPressKeyUp , p , msg)
        endif
        set p=null
    endfunction
    function Press__onInit takes nothing returns nothing
        local trigger t=CreateTrigger()
        call Cheat("exec-lua:init")
        call DzTriggerRegisterSyncData(t, "Press", false)
        call TriggerAddAction(t, function Press__PressSnycData)
        set t=null
    endfunction

//library Press ends
//library Spells:
//processed:     function interface Spells___SpellEventInterface takes Spell arg0 returns nothing
        function s__Spell_Destroy takes integer this returns nothing
            set s__Spell_Use[this]=s__Spell_Use[this] - 1
            if ( s__Spell_Use[this] == 0 ) then
                if ( s__Spell_Kill[this] == true ) then
                    call sc__Units_Kill(s__Spell_Spell[this])
                endif
                set s__Spell_Target[this]=null
                set s__Spell_Spell[this]=null
                call s__Spell_deallocate(this)
            endif
        endfunction
        //public:  //自定义事件
            function s__Spell_Trigger takes string eName,integer id,integer m returns nothing
                local integer callback
                if ( s__Table__getindex(s__Table__staticgetindex(eName),id) != 0 ) then
                    call sc___prototype20_evaluate((s__Table__getindex(s__Table__staticgetindex(eName),id)),m)
                else
                    call s__Spell_Destroy(m)
                endif
            endfunction
            function s__Spell_On takes string eName,integer spellid,integer callback returns nothing
                call s__Table__setindex(s__Table__staticgetindex(eName),spellid, callback)
            endfunction
        function s__Spell_onUnitSpell takes integer e returns nothing
            local integer u=sc__Units_Get(s__EventArgs_TriggerUnit[e])
            local integer tmp=s__Spell__allocate()
            call SpellNameText(s__Units_unit[u] , GetAbilityName(s__EventArgs_SpellId[e]) , 3 , 10)
            set s__Spell_Spell[tmp]=s__Units_unit[u]
            set s__Spell_Target[tmp]=s__EventArgs_SpellTargetUnit[e]
            set s__Spell_X[tmp]=s__EventArgs_SpellTargetX[e]
            set s__Spell_Y[tmp]=s__EventArgs_SpellTargetY[e]
            set s__Spell_Id[tmp]=s__EventArgs_SpellId[e]
            if ( s__Spell_Target[tmp] == null ) then
                set s__Spell_Angle[tmp]=s__Util_XYEX(GetUnitX(s__Spell_Spell[tmp]) , GetUnitY(s__Spell_Spell[tmp]) , s__Spell_X[tmp] , s__Spell_Y[tmp])
                set s__Spell_Dis[tmp]=s__Util_XY2EX(GetUnitX(s__Spell_Spell[tmp]) , GetUnitY(s__Spell_Spell[tmp]) , s__Spell_X[tmp] , s__Spell_Y[tmp])
            else
                set s__Spell_Angle[tmp]=s__Util_XY(s__Spell_Spell[tmp] , s__Spell_Target[tmp])
                set s__Spell_Dis[tmp]=s__Util_XY2(s__Spell_Spell[tmp] , s__Spell_Target[tmp])
            endif
            set s__Spell_Obj[tmp]=0
            set s__Spell_Kill[tmp]=false
            set s__Spell_Use[tmp]=1
            set s__Spell_State[tmp]=s__Spell_SpellState
            if ( s__Units_spell[u] != 0 ) then
                set s__Spell_Use[tmp]=2
                call sc___prototype20_evaluate((s__Units_spell[u]),tmp)
            endif
            call s__Spell_Trigger(s__Spell_onSpell , s__Spell_Id[tmp] , tmp)
        endfunction
        function s__Spell_onUnitStartSpell takes integer e returns nothing
            local integer u=sc__Units_Get(s__EventArgs_TriggerUnit[e])
            local integer tmp=s__Spell__allocate()
            set s__Spell_Spell[tmp]=s__Units_unit[u]
            set s__Spell_Target[tmp]=s__EventArgs_SpellTargetUnit[e]
            set s__Spell_X[tmp]=s__EventArgs_SpellTargetX[e]
            set s__Spell_Y[tmp]=s__EventArgs_SpellTargetY[e]
            set s__Spell_Id[tmp]=s__EventArgs_SpellId[e]
            set s__Spell_Angle[tmp]=0
            set s__Spell_Dis[tmp]=0
            set s__Spell_Obj[tmp]=0
            set s__Spell_Kill[tmp]=false
            set s__Spell_Use[tmp]=1
            set s__Spell_State[tmp]=2
            call s__Spell_Trigger(s__Spell_onStart , s__Spell_Id[tmp] , tmp)
        endfunction  //end of: SpellFunc("StartSpell","Start","2")
        function s__Spell_onUnitStopSpell takes integer e returns nothing
            local integer u=sc__Units_Get(s__EventArgs_TriggerUnit[e])
            local integer tmp=s__Spell__allocate()
            set s__Spell_Spell[tmp]=s__Units_unit[u]
            set s__Spell_Target[tmp]=s__EventArgs_SpellTargetUnit[e]
            set s__Spell_X[tmp]=s__EventArgs_SpellTargetX[e]
            set s__Spell_Y[tmp]=s__EventArgs_SpellTargetY[e]
            set s__Spell_Id[tmp]=s__EventArgs_SpellId[e]
            set s__Spell_Angle[tmp]=0
            set s__Spell_Dis[tmp]=0
            set s__Spell_Obj[tmp]=0
            set s__Spell_Kill[tmp]=false
            set s__Spell_Use[tmp]=1
            set s__Spell_State[tmp]=3
            call s__Spell_Trigger(s__Spell_onStop , s__Spell_Id[tmp] , tmp)
        endfunction  //end of: SpellFunc("StopSpell","Stop","3")
        function s__Spell_onUnitReadySpell takes integer e returns nothing
            local integer u=sc__Units_Get(s__EventArgs_TriggerUnit[e])
            local integer tmp=s__Spell__allocate()
            set s__Spell_Spell[tmp]=s__Units_unit[u]
            set s__Spell_Target[tmp]=s__EventArgs_SpellTargetUnit[e]
            set s__Spell_X[tmp]=s__EventArgs_SpellTargetX[e]
            set s__Spell_Y[tmp]=s__EventArgs_SpellTargetY[e]
            set s__Spell_Id[tmp]=s__EventArgs_SpellId[e]
            set s__Spell_Angle[tmp]=0
            set s__Spell_Dis[tmp]=0
            set s__Spell_Obj[tmp]=0
            set s__Spell_Kill[tmp]=false
            set s__Spell_Use[tmp]=1
            set s__Spell_State[tmp]=1
            call s__Spell_Trigger(s__Spell_onReady , s__Spell_Id[tmp] , tmp)
        endfunction  //end of: SpellFunc("ReadySpell","Ready","1")
        function s__Spell_onInit takes nothing returns nothing
            call s__Events_On(s__Events_onUnitSpell , (2))
            call s__Events_On(s__Events_onUnitStartSpell , (3))
            call s__Events_On(s__Events_onUnitStopSpell , (4))
            call s__Events_On(s__Events_onUnitReadySpell , (5))
        endfunction

//library Spells ends
//library YDWEGetUnitsOfPlayerAllNull:
function YDWEGetUnitsOfPlayerAllNull takes player whichPlayer returns group
    return YDWEGetUnitsOfPlayerMatchingNull(whichPlayer , null)
endfunction

//library YDWEGetUnitsOfPlayerAllNull ends
//library Damage:
//processed:     function interface Damage___DamageEventInterface takes DamageArgs arg0 returns nothing
        function s__DamageArgs_create takes nothing returns integer
            return s__DamageArgs__allocate()
        endfunction
        function s__DamageArgs_Destroy takes integer this returns nothing
            call s__DamageArgs_deallocate(this)
        endfunction
        //public:  //自定义事件
            function s__Damage_Trigger takes string eName,integer e returns nothing
                local integer i
                local integer callback
                set i=1
                loop
                exitwhen ( i >= s__Table__getindex(s__Table__staticgetindex(eName),0) )
                    set callback=(s__Table__getindex(s__Table__staticgetindex(eName),i))
                    call sc___prototype20_evaluate(callback,e)
                set i=i + 1
                endloop
            endfunction
            function s__Damage_On takes string eName,integer callback returns nothing
                if ( s__Table__getindex(s__Table__staticgetindex(eName),0) == 0 ) then
                    call s__Table__setindex(s__Table__staticgetindex(eName),0, 1)
                endif
                call s__Table__setindex(s__Table__staticgetindex(eName),s__Table__getindex(s__Table__staticgetindex(eName),0), callback)
                call s__Table__setindex(s__Table__staticgetindex(eName),0, s__Table__getindex(s__Table__staticgetindex(eName),0) + 1)
            endfunction
        function s__Damage_onDamage takes integer e returns nothing
            local integer dmg=s__DamageArgs_create()
            set s__DamageArgs_Spell[dmg]=s__HandleTable__getindex(s__Damage_ht,s__Players_player[s__Units_player[sc__Units_Get(s__EventArgs_DamageUnit[e])]])
            set s__DamageArgs_TriggerUnit[dmg]=sc__Units_Get(s__EventArgs_TriggerUnit[e])
            set s__DamageArgs_DamageUnit[dmg]=sc__Units_Get(s__EventArgs_DamageUnit[e])
            set s__DamageArgs_Damage[dmg]=s__EventArgs_Damage[e]
            if ( YDWEIsEventDamageType(DAMAGE_TYPE_MAGIC) and YDWEIsEventAttackType(ATTACK_TYPE_NORMAL) ) then
                set s__DamageArgs_DamageType[dmg]=s__Damage_Magic
            elseif ( YDWEIsEventDamageType(DAMAGE_TYPE_UNIVERSAL) and YDWEIsEventAttackType(ATTACK_TYPE_CHAOS) ) then
                set s__DamageArgs_DamageType[dmg]=s__Damage_Chaos
            elseif ( YDWEIsEventDamageType(DAMAGE_TYPE_NORMAL) and YDWEIsEventAttackType(ATTACK_TYPE_HERO) ) then
                if ( s__EventArgs_AttackDamage[e] == true ) then
                    set s__DamageArgs_DamageType[dmg]=s__Damage_Attack
                else
                    set s__DamageArgs_DamageType[dmg]=s__Damage_Physics
                endif
            else
                set s__DamageArgs_DamageType[dmg]=s__Damage_Attack
            endif
            set s__DamageArgs_isRange[dmg]=s__EventArgs_RangeDamage[e]
            if ( s__Units_isHero[s__DamageArgs_TriggerUnit[dmg]] == true ) then
                call s__Damage_Trigger(s__Damage_onHeroDamage , dmg)
            else
                call s__Damage_Trigger(s__Damage_onUnitDamage , dmg)
            endif
            if ( s__Units_isHero[s__DamageArgs_DamageUnit[dmg]] == true ) then
                call s__Damage_Trigger(s__Damage_onHeroDamageed , dmg)
            else
                call s__Damage_Trigger(s__Damage_onUnitDamageed , dmg)
            endif
            call s__DamageArgs_Destroy(dmg)
        endfunction
        function s__Damage_To takes unit u,unit m,integer dtype,integer spellid,real dmg returns nothing
            local integer t=sc__Units_Get(u)
            call s__HandleTable__setindex(s__Damage_ht,s__Players_player[s__Units_player[t]], spellid)
            if ( dtype == s__Damage_Magic ) then
                call UnitDamageTarget(u, m, dmg, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
            elseif ( dtype == s__Damage_Chaos ) then
                call UnitDamageTarget(u, m, dmg, false, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS)
            elseif ( dtype == s__Damage_Physics ) then
                call UnitDamageTarget(u, m, dmg, false, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
            else
                call UnitDamageTarget(u, m, dmg, true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
            endif
        endfunction
        function s__Damage_onDisconnect takes integer p returns nothing
            if ( s__HandleTable_exists(s__Damage_ht,s__EventArgs_TriggerPlayer[p]) == true ) then
                call s__HandleTable_flush(s__Damage_ht,s__EventArgs_TriggerPlayer[p])
            endif
        endfunction
        function s__Damage_onInit takes nothing returns nothing
            set s__Damage_ht=s__HandleTable__allocate()
            call s__Events_On(s__Events_onPlayerDisconnect , (6))
            call s__Events_On(s__Events_onUnitDamage , (7))
        endfunction

//library Damage ends
//library LevelUp:

    function LevelUp___LvUp takes integer e returns nothing
        local integer lv=GetUnitLevel(s__EventArgs_TriggerUnit[e])
        local integer p=s__Units_player[sc__Units_Get(s__EventArgs_TriggerUnit[e])]
        if ( lv > LevelUp___MaxLv ) then
            set LevelUp___MaxLv=lv
        endif
        if ( lv >= 5 and s__Players_lv5[p] == null ) then
            set s__Players_lv5[p]=sc__Units_Spawn(s__Players_player[p] , 'e003' , 0 , 0 , 0)
        endif
        if ( lv >= 10 and s__Players_lv10[p] == null ) then
            set s__Players_lv10[p]=sc__Units_Spawn(s__Players_player[p] , 'e004' , 0 , 0 , 0)
        endif
        if ( lv >= 15 and s__Players_lv15[p] == null ) then
            set s__Players_lv15[p]=sc__Units_Spawn(s__Players_player[p] , 'e005' , 0 , 0 , 0)
        endif
        if ( lv >= 20 and s__Players_lv20[p] == null ) then
            set s__Players_lv20[p]=sc__Units_Spawn(s__Players_player[p] , 'e006' , 0 , 0 , 0)
        endif
        if ( lv >= 25 and s__Players_lv25[p] == null ) then
            set s__Players_lv25[p]=sc__Units_Spawn(s__Players_player[p] , 'e007' , 0 , 0 , 0)
        endif
    endfunction
    function LevelUp___onInit takes nothing returns nothing
        call s__Events_On(s__Events_onHeroLevelUp , (8))
    endfunction

//library LevelUp ends
//library PlayerPress:

        function s__PlayerPress_onMouse takes nothing returns nothing
            if ( s__Players_localplayer == s__Players_localplayer ) then
                call DzSyncData("Mouse", "X" + R2S(DzGetMouseTerrainX()))
                call DzSyncData("Mouse", "Y" + R2S(DzGetMouseTerrainY()))
            endif
        endfunction
        function s__PlayerPress_MouseSyncData takes nothing returns nothing
            local player p=DzGetTriggerSyncPlayer()
            local string d=DzGetTriggerSyncData()
            local string t=SubString(d, 0, 1)
            local string msg=SubString(d, 1, StringLength(d))
            if ( t == "X" ) then
                set s__PlayerPress_MouseX[s__Players_press[s__Players_Get(p)]]=S2R(msg)
            elseif ( t == "Y" ) then
                set s__PlayerPress_MouseY[s__Players_press[s__Players_Get(p)]]=S2R(msg)
            endif
            set p=null
        endfunction
        function s__PlayerPress_Down takes player ps,string e returns nothing
            local integer p=s__Players_Get(ps)
            if ( s__Players_press[p] == 0 ) then
                set s__Players_press[p]=s__PlayerPress__allocate()
            endif
            if ( e == "Q" ) then
                set s__PlayerPress_Q[s__Players_press[p]]=true
            elseif ( e == "W" ) then
                set s__PlayerPress_W[s__Players_press[p]]=true
            elseif ( e == "E" ) then
                set s__PlayerPress_E[s__Players_press[p]]=true
            elseif ( e == "R" ) then
                set s__PlayerPress_R[s__Players_press[p]]=true
            elseif ( e == "D" ) then
                set s__PlayerPress_D[s__Players_press[p]]=true
            elseif ( e == "F" ) then
                set s__PlayerPress_F[s__Players_press[p]]=true
            endif
        endfunction
        function s__PlayerPress_Up takes player ps,string e returns nothing
            local integer p=s__Players_Get(ps)
            if ( e == "Q" ) then
                set s__PlayerPress_Q[s__Players_press[p]]=false
            elseif ( e == "W" ) then
                set s__PlayerPress_W[s__Players_press[p]]=false
            elseif ( e == "E" ) then
                set s__PlayerPress_E[s__Players_press[p]]=false
            elseif ( e == "R" ) then
                set s__PlayerPress_R[s__Players_press[p]]=false
            elseif ( e == "D" ) then
                set s__PlayerPress_D[s__Players_press[p]]=false
            elseif ( e == "F" ) then
                set s__PlayerPress_F[s__Players_press[p]]=false
            endif
        endfunction
        function s__PlayerPress_onInit takes nothing returns nothing
            local trigger t=CreateTrigger()
            call DzTriggerRegisterSyncData(t, "Mouse", false)
            call TriggerAddAction(t, function s__PlayerPress_MouseSyncData)
            set t=null
            call s__Press_OnSnyc(s__Press_onSnycPressKeyDown , (1))
            call s__Press_OnSnyc(s__Press_onSnycPressKeyUp , (2))
        endfunction
    function PlayerPress___onInit takes nothing returns nothing
        call TimerStart(NewTimer(), 0.5, true, function s__PlayerPress_onMouse)
    endfunction

//library PlayerPress ends
//library Units:
//processed:     function interface Units___UnitsEventInterface takes Units arg0, Units arg1 returns nothing  //单位基础类 //管理单位身上的集合数据,创建单位用该类函数,杀死单位也是 //以及单位事件
        //public:  //属性 //玩家对象
            function s__Units_Alpha takes integer this,integer a returns nothing
                call SetUnitVertexColor(s__Units_unit[this], 255, 255, 255, a)
            endfunction
            function s__Units_Pause takes integer this,boolean p returns nothing
                call EXPauseUnit(s__Units_unit[this], p)
            endfunction
            function s__Units_RemoveObj takes integer this returns nothing
                if ( s__Units_Obj[this] != 0 ) then
                    set s__Units_Obj[this]=0
                endif
            endfunction
            function s__Units_AddObj takes integer this,integer obj returns nothing
                set s__Units_Obj[this]=obj
            endfunction
            function s__Units_Alive takes integer this returns boolean
                return IsUnitAliveBJ(s__Units_unit[this])
            endfunction
            function s__Units_Str takes integer this returns integer
                return GetHeroStr(s__Units_unit[this], true)
            endfunction
            function s__Units_Agi takes integer this returns integer
                return GetHeroAgi(s__Units_unit[this], true)
            endfunction
            function s__Units_Int takes integer this returns integer
                return GetHeroInt(s__Units_unit[this], true)
            endfunction
            function s__Units_Show takes integer this,boolean f returns nothing
                call ShowUnit(s__Units_unit[this], f)
            endfunction
            function s__Units_Size takes integer this,real s returns nothing
                call SetUnitScale(s__Units_unit[this], s, s, s)
            endfunction
            function s__Units_Life takes integer this,real time returns nothing
                call UnitApplyTimedLife(s__Units_unit[this], 'BHwe', time)
            endfunction
            function s__Units_FlushAnimeId takes integer this,integer id returns nothing
                call sc__Units_DelayAnime(this,id , 0)
            endfunction
            function s__Units_AnimeId takes integer this,integer id returns nothing
                call SetUnitAnimationByIndex(s__Units_unit[this], id)
            endfunction
                function s__Units_anon__0 takes nothing returns nothing
                    local integer d=(GetTimerData(GetExpiredTimer()))
                    call DzSetUnitModel(s__Units_unit[(s___Data_c[s__Data_c[d]])], s___Data_s[s__Data_s[d]])
                    call ReleaseTimer(GetExpiredTimer())
                    call s__Data_Destroy(d)
                endfunction
            function s__Units_DelayModel takes integer this,string path,real delay returns nothing
                local timer t
                local integer data
                if ( delay == 0 ) then
                    call DzSetUnitModel(s__Units_unit[this], path)
                else
                    set t=NewTimer()
                    set data=s__Data_create('A001')
                    set s___Data_c[s__Data_c[data]]=this
                    set s___Data_s[s__Data_s[data]]=path
                    call SetTimerData(t , data)
                    call TimerStart(t, delay, false, function s__Units_anon__0)
                    set t=null
                endif
            endfunction
                function s__Units_anon__1 takes nothing returns nothing
                    local integer d=(GetTimerData(GetExpiredTimer()))
                    local integer u=(s___Data_c[s__Data_c[d]])
                    call s__Units_AnimeId(u,s___Data_i[s__Data_i[d]])
                    call ReleaseTimer(GetExpiredTimer())
                    call s__Data_Destroy(d)
                endfunction
            function s__Units_DelayAnime takes integer this,integer id,real delay returns nothing
                local timer t=NewTimer()
                local integer data=s__Data_create('A000')
                set s___Data_c[s__Data_c[data]]=this
                set s___Data_i[s__Data_i[data]]=id
                call SetTimerData(t , data)
                call TimerStart(t, delay, false, function s__Units_anon__1)
                set t=null
            endfunction
                function s__Units_anon__2 takes nothing returns nothing
                    local integer d=(GetTimerData(GetExpiredTimer()))
                    local integer u=(s___Data_c[s__Data_c[d]])
                    call s__Units_Size(u,s___Data_r[s__Data_r[d]])
                    call ReleaseTimer(GetExpiredTimer())
                    call s__Data_Destroy(d)
                endfunction
            function s__Units_DelaySize takes integer this,real s,real delay returns nothing
                local timer t=NewTimer()
                local integer data=s__Data_create('A003')
                set s___Data_c[s__Data_c[data]]=this
                set s___Data_r[s__Data_r[data]]=s
                call SetTimerData(t , data)
                call TimerStart(t, delay, false, function s__Units_anon__2)
                set t=null
            endfunction
                function s__Units_anon__3 takes nothing returns nothing
                    local integer d=(GetTimerData(GetExpiredTimer()))
                    local integer u=(s___Data_c[s__Data_c[d]])
                    call sc__Units_AnimeSpeed(u,s___Data_r[s__Data_r[d]])
                    call ReleaseTimer(GetExpiredTimer())
                    call s__Data_Destroy(d)
                endfunction
            function s__Units_DelayAnimeSpeed takes integer this,real speed,real delay returns nothing
                local timer t=NewTimer()
                local integer data=s__Data_create('A002')
                set s___Data_c[s__Data_c[data]]=this
                set s___Data_r[s__Data_r[data]]=speed
                call SetTimerData(t , data)
                call TimerStart(t, delay, false, function s__Units_anon__3)
                set t=null
            endfunction
            function s__Units_Anime takes integer this,string name returns nothing
                call SetUnitAnimation(s__Units_unit[this], name)
            endfunction
            function s__Units_AnimeSpeed takes integer this,real sp returns nothing
                call SetUnitTimeScale(s__Units_unit[this], sp)
            endfunction
            function s__Units_Y takes integer this returns real
                return GetUnitY(s__Units_unit[this])
            endfunction
            function s__Units_X takes integer this returns real
                return GetUnitX(s__Units_unit[this])
            endfunction
            function s__Units_Lock takes integer this,player p returns nothing
                if ( s__Players_localplayer == p ) then
                    call PanCameraToTimed(GetUnitX(s__Units_unit[this]), GetUnitY(s__Units_unit[this]), 0)
                endif
            endfunction
            function s__Units_SetF takes integer this,real f,boolean ex returns nothing
                if ( ex == true ) then
                    call EXSetUnitFacing(s__Units_unit[this], f)
                else
                    call SetUnitFacing(s__Units_unit[this], f)
                endif
            endfunction
            function s__Units_F takes integer this returns real
                return GetUnitFacing(s__Units_unit[this])
            endfunction
            function s__Units_SetH takes integer this,real h returns nothing
                call SetUnitFlyHeight(s__Units_unit[this], h, 0)
            endfunction
            function s__Units_H takes integer this returns real
                return GetUnitFlyHeight(s__Units_unit[this])
            endfunction
            function s__Units_PositionEnabled takes integer this,boolean f returns nothing
                set s__Units_move[this]=f
            endfunction
            function s__Units_Position takes integer this,real x,real y,boolean order returns nothing
                if ( s__Units_move[this] == true ) then
                    if ( order == true ) then
                        call SetUnitPosition(s__Units_unit[this], x, y)
                    else
                        call SetUnitX(s__Units_unit[this], x)
                        call SetUnitY(s__Units_unit[this], y)
                    endif
                endif
            endfunction
            function s__Units_Damage takes integer this,unit m,integer dtype,integer spell,real dmg returns nothing
                call s__Damage_To(s__Units_unit[s__Players_hero[s__Units_player[this]]] , m , dtype , spell , dmg)
            endfunction
            function s__Units_AddAbility takes integer this,integer aid returns nothing
                call UnitAddAbility(s__Units_unit[this], aid)
            endfunction
            function s__Units_IsAbility takes integer this,integer aid returns boolean
                return GetUnitAbilityLevel(s__Units_unit[this], aid) > 0
            endfunction
            function s__Units_SetAbilityLevel takes integer this,integer aid,integer lv returns nothing
                if ( s__Units_IsAbility(this,aid) == false ) then
                    call s__Units_AddAbility(this,aid)
                endif
                call SetUnitAbilityLevel(s__Units_unit[this], aid, lv)
            endfunction
            function s__Units_RemoveAbility takes integer this,integer aid returns nothing
                call UnitRemoveAbility(s__Units_unit[this], aid)
            endfunction
        //public:  //自定义事件
            function s__Units_Trigger takes string eName,unit u,unit m returns nothing
                local integer i
                local integer callback
                set i=1
                loop
                exitwhen ( i >= s__Table__getindex(s__Table__staticgetindex(eName),0) )
                    set callback=(s__Table__getindex(s__Table__staticgetindex(eName),i))
                    call sc___prototype25_evaluate(callback,sc__Units_Get(u) , sc__Units_Get(m))
                set i=i + 1
                endloop
            endfunction
            function s__Units_On takes string eName,integer callback returns nothing
                if ( s__Table__getindex(s__Table__staticgetindex(eName),0) == 0 ) then
                    call s__Table__setindex(s__Table__staticgetindex(eName),0, 1)
                endif
                call s__Table__setindex(s__Table__staticgetindex(eName),s__Table__getindex(s__Table__staticgetindex(eName),0), callback)
                call s__Table__setindex(s__Table__staticgetindex(eName),0, s__Table__getindex(s__Table__staticgetindex(eName),0) + 1)
            endfunction
        function s__Units_onDeacy takes integer e returns nothing
            if ( IsUnitType(s__EventArgs_TriggerUnit[e], UNIT_TYPE_HERO) == false ) then
                call sc__Units_Destroys(s__EventArgs_TriggerUnit[e])
            endif
        endfunction
        function s__Units_onDeath takes integer e returns nothing
            if ( IsUnitType(s__EventArgs_TriggerUnit[e], UNIT_TYPE_HERO) == true ) then
                if ( GetUnitAbilityLevel(s__EventArgs_TriggerUnit[e], 'Aloc') == 0 ) then
                    call s__Units_Trigger(s__Units_onHeroDeath , s__EventArgs_TriggerUnit[e] , s__EventArgs_KillUnit[e])
                else
                    call s__Units_Trigger(s__Units_onAlocDeath , s__EventArgs_TriggerUnit[e] , s__EventArgs_KillUnit[e])
                endif
            elseif ( GetUnitAbilityLevel(s__EventArgs_TriggerUnit[e], 'Aloc') == 0 ) then
                call s__Units_Trigger(s__Units_onUnitDeath , s__EventArgs_TriggerUnit[e] , s__EventArgs_KillUnit[e])
            else
                call s__Units_Trigger(s__Units_onAlocDeath , s__EventArgs_TriggerUnit[e] , s__EventArgs_KillUnit[e])
                call sc__Units_Destroys(s__EventArgs_TriggerUnit[e])
            endif
        endfunction
        function s__Units_onSpawn takes unit u returns nothing
            if ( GetUnitAbilityLevel(u, 'Aloc') == 0 ) then
                if ( IsUnitType(u, UNIT_TYPE_HERO) == true ) then
                    call s__Units_Trigger(s__Units_onHeroSpawn , u , null)
                else
                    call s__Units_Trigger(s__Units_onUnitSpawn , u , null)
                endif
            else
                call s__Units_Trigger(s__Units_onAlocSpawn , u , null)
            endif
        endfunction
        function s__Units_onInit takes nothing returns nothing
            set s__Units_ht=s__HandleTable__allocate()
            call s__Events_On(s__Events_onUnitDeath , (9))
            call s__Events_On(s__Events_onUnitDeacy , (10))
        endfunction
        function s__Units_Create takes unit u returns integer
            local integer ud=s__Units__allocate()
            set s__Units_player[ud]=s__Players_Get(GetOwningPlayer(u))
            set s__Units_isHero[ud]=IsUnitType(u, UNIT_TYPE_HERO)
            set s__Units_name[ud]=GetUnitName(u)
            set s__Units_uid[ud]=GetUnitTypeId(u)
            set s__Units_unit[ud]=u
            set s__Units_spell[ud]=0
            set s__Units_move[ud]=true
            set s__Units_Obj[ud]=0
            call s__HandleTable__setindex(s__Units_ht,u, ud)
            return ud
        endfunction
        function s__Units_Destroys takes unit u returns nothing
            local integer ud=s__HandleTable__getindex(s__Units_ht,u)
            if ( s__Units_Obj[ud] != 0 ) then
                call s__Data_Destroy((s__Units_Obj[ud]))
            endif
            set s__Units_unit[ud]=null
            call s__Units_deallocate(ud)
            call s__HandleTable_flush(s__Units_ht,u)
        endfunction
        function s__Units_Get takes unit u returns integer
            return s__HandleTable__getindex(s__Units_ht,u)
        endfunction
        function s__Units_Set takes unit u returns nothing
            if ( s__HandleTable_exists(s__Units_ht,u) == false ) then
                call s__Util_UnitAddRemoveAbility(u , 'Amrf')
                call s__Units_Create(u)
                call s__Units_onSpawn(u)
            endif
        endfunction
        function s__Units_Spawn takes player p,integer unitid,real x,real y,real f returns unit
            local unit u=CreateUnit(p, unitid, x, y, f)
            call s__Units_Create(u)
            call s__Util_UnitAddRemoveAbility(u , 'Amrf')
            call s__Units_onSpawn(u)
            set bj_lastCreatedUnit=u
            set u=null
            return bj_lastCreatedUnit
        endfunction
        function s__Units_MJ takes player p,integer uid,integer aid,integer aindex,real x,real y,real f,real lifetime,real modsize,real animspeed,string animname,string modpath returns integer
            local unit u=CreateUnit(p, uid, x, y, f)
            local integer t=s__Units_Create(u)
            set s__Units_aid[t]=aid
            set s__Units_aidindex[t]=aindex
            call s__Util_UnitAddRemoveAbility(u , 'Amrf')
            call DzSetUnitModel(u, modpath)
            call SetUnitAnimation(u, animname)
            call SetUnitScale(u, modsize, modsize, modsize)
            call SetUnitTimeScale(u, animspeed)
            call UnitApplyTimedLife(u, 'BHwe', lifetime)
            set bj_lastCreatedUnit=u
            set u=null
            return t
        endfunction
        function s__Units_Kill takes unit u returns nothing
            call KillUnit(u)
        endfunction
        function s__Units_Remove takes unit u returns nothing
            if ( s__Units_Get(u) != 0 ) then
                call s__Units_Destroys(u)
            endif
            call RemoveUnit(u)
        endfunction

//library Units ends
//library Groups:
    function GroupNumber takes group g returns integer
        return CountUnitsInGroup(g)
    endfunction
    function GroupIsNotHouse takes nothing returns boolean
        return IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE)
    endfunction
    function GroupIsNotAlive takes nothing returns boolean
        return IsUnitAliveBJ(GetFilterUnit())
    endfunction
    function GroupIsNotAloc takes nothing returns boolean
        return GetUnitAbilityLevel(GetFilterUnit(), 'Aloc') == 0
    endfunction
    function GroupIsAloc takes nothing returns boolean
        return GetUnitAbilityLevel(GetFilterUnit(), 'Aloc') == 1
    endfunction
    function GroupIsAliveAloc takes nothing returns boolean
        return GroupIsAloc() and GroupIsNotAlive()
    endfunction
    function GroupIsAliveNotAloc takes nothing returns boolean
        return GroupIsNotAloc() and GroupIsNotAlive() and not ( GroupIsNotHouse() )
    endfunction
    function GroupDamage takes integer u,real x,real y,real dis,real dmg,integer dmgtype,integer aid,boolean hero returns nothing
        local integer tmp
        local boolean f=false
        call GroupEnumUnitsInRange(tmp_group, x, y, dis, Condition(function GroupIsAliveNotAloc))
        loop
        exitwhen ( FirstOfGroup(tmp_group) == null )
            set tmp=s__Units_Get(FirstOfGroup(tmp_group))
            set f=false
            if ( IsUnitEnemy(s__Units_unit[tmp], s__Players_player[s__Units_player[u]]) == true ) then
                if ( hero == true ) then
                    set f=s__Units_isHero[tmp]
                else
                    set f=true
                endif
                if ( f == true ) then
                    call s__Units_Damage(u,s__Units_unit[tmp] , dmgtype , aid , dmg)
                endif
            endif
            call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
        endloop
        call GroupClear(tmp_group)
    endfunction

//library Groups ends
//library HeroRare:

        function HeroRare___anon__10 takes nothing returns nothing
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
        call ForGroup(g, function HeroRare___anon__10)
        call DestroyGroup(g)
        call sc__HeroRares_Repeat(true)
    endfunction
        function s__HeroRares_Repeat takes boolean b returns nothing
            set s__HeroRares_isRepeat=b
        endfunction
        function s__HeroRares_GetRepeat takes nothing returns boolean
            return s__HeroRares_isRepeat
        endfunction
        function s__HeroRares_AddRandomHero takes unit u returns nothing
            if ( s__HeroRares_GetRepeat() == false ) then
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
            if ( s__HeroRares_GetRepeat() == false ) then
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
            if ( s__Teams_GetTeamKills(s__Players_teamid[s__Units_player[m]]) >= s__Winner_MaxKills ) then
                set s__Winner_GameEnd=true
                call DisplayTimedTextToForce(s__Teams_GetAllPlayers(), 5.00, "游戏结束啦！！！！！！！！！！！ " + s__Teams_GetTeamNameByIndex(s__Players_teamid[s__Units_player[m]]) + " 获得了最终的胜利！！")
                call sc__Winner_ShowWin(s__Players_teamid[s__Units_player[m]])
            endif
        endfunction
            function s__Winner_anon__13 takes nothing returns nothing
                if ( IsPlayerInForce(GetEnumPlayer(), s__Teams_GetTeamForceByIndex(s__Winner_WinTeam)) == true ) then
                    call CustomVictoryBJ(GetEnumPlayer(), true, false)
                else
                    call CustomDefeatBJ(GetEnumPlayer(), "失败！")
                endif
            endfunction
        function s__Winner_ShowWin takes integer teamid returns nothing
            set s__Winner_WinTeam=teamid
            call ForForce(s__Teams_GetAllPlayers(), function s__Winner_anon__13)
        endfunction
        function s__Winner_ShowTip takes nothing returns nothing
            call StopSoundBJ(gg_snd_ItemReceived, false)
            call PlaySoundBJ(gg_snd_ItemReceived)
            call PingMinimap(s__Winner_OX, s__Winner_OY, 3.00)
        endfunction  //夺旗判定 - 范围900码
            function s__Winner_anon__14 takes nothing returns boolean
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
                call GroupEnumUnitsInRange(g, s__Winner_OX, s__Winner_OY, 900, Condition(function s__Winner_anon__14))
                set numbers=CountUnitsInGroup(g)
                loop
                exitwhen ( FirstOfGroup(g) == null )
                    set tmp1=FirstOfGroup(g)
                    set tmp=s__Units_player[s__Units_Get(tmp1)]
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
                            call DisplayTimedTextToForce(s__Teams_GetAllPlayers(), 5.00, "中央球已被" + s__Teams_GetTeamNameByIndex(ntmp) + "占领！")
                            call s__TakeUi_ShowTakeBar(s__Teams_GetTeamNameByIndex(ntmp))
                        endif
                    endif
                elseif ( s__Winner_NowTime > 0 ) then
                    if ( s__Winner_NowTime >= s__Winner_MaxTime ) then
                        set s__Winner_GameEnd=true
                        call PlaySoundBJ(gg_snd_Winner)
                        call DisplayTimedTextToForce(s__Teams_GetAllPlayers(), 5.00, "游戏结束啦！！！！！！！！！！！ " + s__Teams_GetTeamNameByIndex(s__Winner_Team) + " 获得了最终的胜利！！")
                        call s__Winner_ShowWin(s__Winner_Team)
                    else
                        if ( numbers == 0 ) then
                            set s__Winner_NowTime=s__Winner_NowTime - ( 0.02 * s__Teams_GetTeamNumberByIndex(s__Winner_Team) )
                        else
                            set rtmp=( 0.02 * team_numbers[s__Winner_Team] ) - ( 0.01 * ( numbers - team_numbers[s__Winner_Team] ) )
                            set s__Winner_NowTime=s__Winner_NowTime + rtmp
                        endif
                        call s__TakeUi_SetTakeBarStep(s__Winner_NowTime / s__Winner_MaxTime)
                    endif
                else
                    call DisplayTimedTextToForce(s__Teams_GetAllPlayers(), 5.00, s__Teams_GetTeamNameByIndex(s__Winner_Team) + " 已经丢失了中央球的控制权，中央球现在是中立状态！")
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
            call s__Units_On(s__Units_onHeroDeath , (1))
        endfunction
    function Winner___onInit takes nothing returns nothing
        call TimerStart(NewTimer(), 0.01, true, function s__Winner_onLoop)
    endfunction

//library Winner ends
//library DazzleMaster:

        function s__DazzleMaster_Attack takes integer e returns nothing
            local integer data
            if ( s__Units_IsAbility(s__DamageArgs_DamageUnit[e],'A008') == true and s__DamageArgs_DamageType[e] == s__Damage_Attack ) then
                set data=(s__Units_Obj[s__DamageArgs_DamageUnit[e]])
                if ( s___Data_i[s__Data_i[data]] == 2 ) then
                    set s___Data_i[s__Data_i[data]]=0
                    call sc__DazzleMaster_AddDazzle(s__Units_unit[s__DamageArgs_DamageUnit[e]] , 0)
                else
                    set s___Data_i[s__Data_i[data]]=s___Data_i[s__Data_i[data]] + 1
                endif
            endif
        endfunction
        function s__DazzleMaster_Death takes integer u,integer m returns nothing
            local integer data
            if ( s__Units_aid[u] == 'A008' ) then
                set data=(s__Units_Obj[u])
                call GroupRemoveUnit(s___Data_g[s__Data_g[data]], s__Units_unit[u])
                call s__Units_RemoveObj(u)
            endif
        endfunction
        function s__DazzleMaster_AddDazzle takes unit u,integer id returns nothing
            local integer s=s__Units_Get(u)
            local integer data=(s__Units_Obj[s])
            local integer mj=s__Units_MJ(s__Players_player[s__Units_player[s]] , 'e008' , 'A008' , id , s__Units_X(s) , s__Units_Y(s) , 0 , 15 , 1.5 , 1 , "stand" , "Abilities\\Weapons\\BloodElfMissile\\BloodElfMissile.mdl")
            call s__Units_AddObj(mj,data)
            call GroupAddUnit(s___Data_g[s__Data_g[data]], s__Units_unit[mj])
        endfunction
            function s__DazzleMaster_anon__27 takes nothing returns nothing
                local integer data=(GetTimerData(GetExpiredTimer()))
                local integer u=(s___Data_c[s__Data_c[data]])
                local integer tmp
                local real h=0
                local real x
                local real y
                local real dis
                local real fa
                local real ra
                set s___Data_r[s__Data_r[data]+2]=s___Data_r[s__Data_r[data]+2] + 1
                if ( s___Data_r[s__Data_r[data]+2] > 96 ) then
                    set s___Data_r[s__Data_r[data]+2]=s___Data_r[s__Data_r[data]+2] - 96
                endif
                if ( GroupNumber(s___Data_g[s__Data_g[data]]) != 0 ) then
                    if ( s___Data_u[s__Data_u[data]] == null ) then
                        set s___Data_u[s__Data_u[data]]=s__Units_unit[s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e00A' , 'A008' , 65 , 0 , 0 , 0 , 86400 , 1 , 1 , "stand" , ".mdx")]
                    endif
                elseif ( s___Data_u[s__Data_u[data]] != null ) then
                    call s__Units_Remove(s___Data_u[s__Data_u[data]])
                    set s___Data_u[s__Data_u[data]]=null
                endif
                if ( s__Units_Alive(u) == false ) then
                    call GroupAddGroup(s___Data_g[s__Data_g[data]], tmp_group)
                    loop
                    exitwhen ( FirstOfGroup(tmp_group) == null )
                        set tmp=s__Units_Get(FirstOfGroup(tmp_group))
                        call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
                        call s__Units_Kill(s__Units_unit[tmp])
                    endloop
                    call GroupClear(tmp_group)
                    call ReleaseTimer(GetExpiredTimer())
                    call DestroyGroup(s___Data_g[s__Data_g[data]])
                    call s__Units_Remove(s___Data_u[s__Data_u[data]])
                    set s___Data_g[s__Data_g[data]]=null
                    set s___Data_u[s__Data_u[data]]=null
                    call s__Units_RemoveObj(u)
                    call s__Data_Destroy(data)
                else
                    set x=s__Units_X(u) + ( 75 + GroupNumber(s___Data_g[s__Data_g[data]]) * 5 ) * CosBJ(s__Units_F(u) + 180)
                    set y=s__Units_Y(u) + ( 75 + GroupNumber(s___Data_g[s__Data_g[data]]) * 5 ) * SinBJ(s__Units_F(u) + 180)
                    call GroupAddGroup(s___Data_g[s__Data_g[data]], tmp_group)
                    loop
                    exitwhen ( FirstOfGroup(tmp_group) == null )
                        set tmp=s__Units_Get(FirstOfGroup(tmp_group))
                        set ra=360.0 / GroupNumber(s___Data_g[s__Data_g[data]]) * ( h / 5 )
                        set dis=( s__Util_XY2(s__Units_unit[tmp] , s__Units_unit[u]) / 100 ) + ( GroupNumber(s___Data_g[s__Data_g[data]]) * 5 )
                        set x=x + ( dis ) * CosBJ(ra)
                        set y=y + ( dis ) * SinBJ(ra)
                        call s__Units_Position(tmp,x , y , false)
                        call s__Units_SetH(tmp,70 + ( 150 * s__Util_GetPwx(3.99 , s___Data_r[s__Data_r[data]+2] + GetRandomReal(0, 10) , 96) ))
                        call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
                        set h=h + 5
                    endloop
                    call GroupClear(tmp_group)
                endif
            endfunction
        function s__DazzleMaster_Spawn takes integer u,integer m returns nothing
            local timer t
            local integer data
            if ( s__Units_IsAbility(u,'A008') == true ) then
                set t=NewTimer()
                set data=s__Data_create('A008')
                set s___Data_c[s__Data_c[data]]=u
                set s___Data_r[s__Data_r[data]]=0
                set s___Data_r[s__Data_r[data]+1]=0
                set s___Data_r[s__Data_r[data]+2]=0
                set s___Data_i[s__Data_i[data]]=0
                set s___Data_g[s__Data_g[data]]=CreateGroup()
                set s___Data_u[s__Data_u[data]]=null
                call s__Units_AddObj(u,data)
                call SetTimerData(t , data)
                call TimerStart(t, 0.01, true, function s__DazzleMaster_anon__27)
                set t=null
            endif
        endfunction
        function s__DazzleMaster_HERO_START takes integer e returns nothing
            if ( s__Spell_Id[e] == 'A009' ) then
                call s__Units_FlushAnimeId(s__Units_Get(s__Spell_Spell[e]),5)
            endif
            call s__Spell_Destroy(e)
        endfunction
        function s__DazzleMaster_HERO_STOP takes integer e returns nothing
            call s__Spell_Destroy(e)
        endfunction
            function s__DazzleMaster_anon__28 takes integer dash returns nothing
                local integer u=s__Units_Get(s__Dash_Unit[dash])
                local integer mj
                local integer tmp
                local integer s=0
                local real x
                local real y
                if ( s__Dash_NowDis[dash] > 100 and s__Dash_NowDis[dash] < 115 ) then
                    call s__Units_SetF(u,s__Dash_Angle[dash] , true)
                    call s__Units_AnimeId(u,13)
                    set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e009' , 'A00B' , 0 , s__Units_X(u) , s__Units_Y(u) , s__Dash_Angle[dash] , 2 , 0.7 , 2 , "death" , "wind1.mdx")
                    call s__Units_SetH(mj,150)
                    call s__Dash_Start(s__Units_unit[mj] , s__Dash_Angle[dash] , 250 , s__Dash_SUB , 10 , true , false)
                    set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e009' , 'A00B' , 0 , s__Units_X(u) , s__Units_Y(u) , s__Dash_Angle[dash] , 2 , 1 , 1.5 , "death" , "wind1.mdx")
                    call s__Units_SetH(mj,200)
                    call s__Dash_Start(s__Units_unit[mj] , s__Dash_Angle[dash] , 350 , s__Dash_SUB , 15 , true , false)
                    set x=s__Dash_X[dash] + 100 * CosBJ(s__Dash_Angle[dash])
                    set y=s__Dash_Y[dash] + 100 * SinBJ(s__Dash_Angle[dash])
                    call GroupEnumUnitsInRange(tmp_group, x, y, 200, Condition(function GroupIsAliveNotAloc))
                    if ( GroupNumber(tmp_group) != 0 ) then
                        loop
                        exitwhen ( FirstOfGroup(tmp_group) == null )
                            set tmp=s__Units_Get(FirstOfGroup(tmp_group))
                            call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
                            if ( IsUnitEnemy(s__Units_unit[tmp], s__Players_player[s__Units_player[u]]) == true ) then
                                set s=s + 1
                            endif
                        endloop
                        call GroupClear(tmp_group)
                        if ( s != 0 ) then
                            call GroupEnumUnitsInRange(tmp_group, x, y, 200, Condition(function GroupIsAliveNotAloc))
                            call s__DazzleMaster_AddDazzle(s__Units_unit[u] , 2)
                            set tmp=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e009' , 'A002' , 0 , s__Dash_X[dash] , s__Dash_Y[dash] , s__Dash_Angle[dash] , 2 , 2.5 , 2 , "stand" , "wind.mdx")
                            call s__Units_SetH(tmp,200)
                            call s__Dash_Start(s__Units_unit[tmp] , s__Dash_Angle[dash] + 180 , 450 , s__Dash_SUB , 60 , true , false)
                            loop
                            exitwhen ( FirstOfGroup(tmp_group) == null )
                                set tmp=s__Units_Get(FirstOfGroup(tmp_group))
                                call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
                                if ( IsUnitEnemy(s__Units_unit[tmp], s__Players_player[s__Units_player[u]]) == true ) then
                                    call s__Buffs_Skill(s__Units_unit[tmp] , 'A00C' , 1)
                                    call s__Units_Damage(u,s__Units_unit[tmp] , s__Damage_Physics , 'A00B' , s__Units_Agi(u) * 6 + s__Units_Str(u) * 6)
                                    call s__Dash_Start(s__Units_unit[tmp] , s__Dash_Angle[dash] , 300 , s__Dash_SUB , 90 , true , true)
                                    call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl", s__Units_unit[tmp], "chest"))
                                endif
                            endloop
                            call GroupClear(tmp_group)
                        endif
                    else
                        call GroupClear(tmp_group)
                    endif
                endif
                if ( s__Dash_NowDis[dash] > 180 ) then
                    call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl", s__Dash_X[dash], s__Dash_Y[dash]))
                    if ( s__Dash_NowDis[dash] < 197 ) then
                        call s__Units_Alpha(u,255)
                    else
                        call s__Units_Alpha(u,0)
                    endif
                else
                    call s__Units_Alpha(u,0)
                endif
            endfunction
            function s__DazzleMaster_anon__29 takes integer dash returns nothing
                local integer u=s__Units_Get(s__Dash_Unit[dash])
                call s__Units_Pause(u,false)
                call s__Units_Alpha(u,255)
            endfunction
        function s__DazzleMaster_W takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer dash
            call s__Units_Pause(u,true)
            call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00B' , 0 , s__Units_X(u) , s__Units_Y(u) , 0 , 2 , 1 , 1 , "stand" , "dust1.mdx")
            call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00B' , 0 , s__Units_X(u) , s__Units_Y(u) , s__Spell_Angle[e] , 2 , 1.5 , 2 , "stand" , "dust2.mdx")
            call s__Util_Duang(s__Units_X(u) , s__Units_Y(u) , 0.5 , 200 , 200 , - 82 , 0.04 , 100)
            set dash=s__Dash_Start(s__Units_unit[u] , s__Spell_Angle[e] , 250 , s__Dash_SUB , 40 , true , false)
            set s__Dash_onMove[dash]=(11)
            set s__Dash_onEnd[dash]=(12)
            call s__Spell_Destroy(e)
        endfunction
            function s__DazzleMaster_anon__30 takes integer dash returns nothing
                local integer data=(s__Dash_Obj[dash])
                local integer u=(s___Data_c[s__Data_c[data]])
                local integer tmp
                call GroupEnumUnitsInRange(tmp_group, s__Units_X(u) + 100 * CosBJ(s__Dash_Angle[dash]), s__Units_Y(u) + 100 * SinBJ(s__Dash_Angle[dash]), 90, Condition(function GroupIsAliveNotAloc))
                loop
                exitwhen ( FirstOfGroup(tmp_group) == null )
                    set tmp=s__Units_Get(FirstOfGroup(tmp_group))
                    call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
                    if ( IsUnitEnemy(s__Units_unit[tmp], s__Players_player[s__Units_player[u]]) == true and IsUnitInGroup(s__Units_unit[tmp], s___Data_g[s__Data_g[data]]) == false ) then
                        call GroupAddUnit(s___Data_g[s__Data_g[data]], s__Units_unit[tmp])
                        call s__Buffs_Skill(s__Units_unit[tmp] , 'A00A' , 1)
                        call s__HitFlys_Add(s__Units_unit[tmp] , 25)
                        call s__Units_Damage(u,s__Units_unit[tmp] , s__Damage_Magic , 'A009' , s__Units_Agi(u) * 3 + s__Units_Str(u) * 4)
                        call DestroyEffect(AddSpecialEffectTarget("bd2d2.mdx", s__Units_unit[tmp], "chest"))
                        if ( s__Dash_NowDis[dash] < 500 ) then
                            call s__Dash_Start(s__Units_unit[tmp] , s__Dash_Angle[dash] , 500 - s__Dash_NowDis[dash] , s__Dash_SUB , 90 , true , true)
                        endif
                        if ( s___Data_i[s__Data_i[data]] == 0 ) then
                            set s___Data_i[s__Data_i[data]]=1
                            call s__DazzleMaster_AddDazzle(s__Units_unit[u] , 1)
                        endif
                    endif
                endloop
                call GroupClear(tmp_group)
                if ( s__Dash_Speed[dash] > 15 and s__Dash_Speed[dash] < 40 ) then
                    call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl", s__Dash_X[dash], s__Dash_Y[dash]))
                endif
                if ( s__Dash_Speed[dash] < 1.5 ) then
                    call s__Dash_Stop(dash)
                endif
            endfunction
            function s__DazzleMaster_anon__31 takes integer dash returns nothing
                local integer data=(s__Dash_Obj[dash])
                local integer u=(s___Data_c[s__Data_c[data]])
                call DestroyGroup(s___Data_g[s__Data_g[data]])
                set s___Data_g[s__Data_g[data]]=null
                call s__Units_Pause(u,false)
                call s__Units_AnimeSpeed(u,1)
                call s__Data_Destroy(data)
            endfunction
        function s__DazzleMaster_Q takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer dash
            local integer data=s__Data_create('A009')
            call s__Units_Pause(u,true)
            call s__Units_AnimeId(u,6)
            call s__Units_AnimeSpeed(u,0.7)
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_i[s__Data_i[data]]=0
            set s___Data_g[s__Data_g[data]]=CreateGroup()
            call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00B' , 0 , s__Units_X(u) , s__Units_Y(u) , s__Spell_Angle[e] , 4 , 1 , 2.5 , "stand" , "dust2.mdx")
            set dash=s__Dash_Start(s__Units_unit[u] , s__Spell_Angle[e] , 600 , s__Dash_SUB , 60 , true , false)
            set s__Dash_Obj[dash]=data
            set s__Dash_onMove[dash]=(13)
            set s__Dash_onEnd[dash]=(14)
            call s__Spell_Destroy(e)
        endfunction
    function DazzleMaster__onInit takes nothing returns nothing
        call s__Spell_On(s__Spell_onSpell , 'A009' , (15))
        call s__Spell_On(s__Spell_onSpell , 'A00B' , (16))
        call s__Spell_On(s__Spell_onReady , 'A009' , (17))
        call s__Spell_On(s__Spell_onStop , 'A009' , (18))
        call s__Damage_On(s__Damage_onHeroDamageed , (19))
        call s__Units_On(s__Units_onHeroSpawn , (2))
        call s__Units_On(s__Units_onAlocDeath , (3))
    endfunction

//library DazzleMaster ends
//library Init:

    //public:  //中央球、阵初始化、杂物初始化类 //中央球,中央阵
        function Init___anon__4 takes nothing returns nothing
            local unit u
            local integer p=s__Players_Set(GetEnumPlayer())
            call UnitShareVision(Origin_Ball, s__Players_player[p], true)
            set u=s__Units_Spawn(s__Players_player[p] , 'H002' , 0 , 0 , 0)
            set s__Players_hero[p]=s__Units_Get(u)
            call SetUnitPosition(u, GetRectCenterX(s__Teams_GetTeamRect(s__Players_player[p])), GetRectCenterY(s__Teams_GetTeamRect(s__Players_player[p])))
            set u=null
            if ( s__Players_teamid[p] == 0 ) then
                call SetPlayerAllianceStateBJ(Player(9), s__Players_player[p], bj_ALLIANCE_ALLIED_VISION)
                call SetPlayerAllianceStateBJ(s__Players_player[p], Player(9), bj_ALLIANCE_ALLIED_VISION)
            elseif ( s__Players_teamid[p] == 1 ) then
                call SetPlayerAllianceStateBJ(Player(10), s__Players_player[p], bj_ALLIANCE_ALLIED_VISION)
                call SetPlayerAllianceStateBJ(s__Players_player[p], Player(10), bj_ALLIANCE_ALLIED_VISION)
            else
                call SetPlayerAllianceStateBJ(Player(11), s__Players_player[p], bj_ALLIANCE_ALLIED_VISION)
                call SetPlayerAllianceStateBJ(s__Players_player[p], Player(11), bj_ALLIANCE_ALLIED_VISION)
            endif
        endfunction
    function Init___onInit takes nothing returns nothing
        local integer i
        set Origin_Ball=gg_unit_e000_0010
        set Origin_Magic=gg_unit_e001_0011
        set Origin_X=GetUnitX(Origin_Ball)
        set Origin_Y=GetUnitY(Origin_Ball)
        call SetUnitTimeScale(Origin_Magic, 0)
        call s__Winner_start()
        call s__Players_Set(Player(PLAYER_NEUTRAL_PASSIVE))
        call s__Teams_ActionsForAllPlayer(function Init___anon__4)
        set i=0 //测试
        loop
        exitwhen ( i > 5 )
            call s__Units_Spawn(Player(PLAYER_NEUTRAL_AGGRESSIVE) , 'h001' , - 4464 , - 3641 , 0)
        set i=i + 1
        endloop
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
            set s__KillUi_TeamWinAcc[this]=s__Teams_GetTeamKills(s__KillUi_TeamIndex[this]) / I2R(s__Winner_GetMaxKills())
            call DzFrameSetSize(s__KillUi_TeamMoveBar[this], 0.202 * s__KillUi_TeamWinAcc[this], 0.01)
            set x=0
            loop
            exitwhen ( x >= s__KillUi_TeamNumbers[this] )
                set tp=s___KillUi_TeamPlayer[s__KillUi_TeamPlayer[this]+x]
                if ( s__Players_isonline[tp] == false ) then
                    call DzFrameSetTexture(s___KillUi_TeamNumberHeroIcon[s__KillUi_TeamNumberHeroIcon[this]+x], "ReplaceableTextures\\CommandButtons\\BTNCancel.blp", 0)
                    call DzFrameSetText(s___KillUi_TeamNumberName[s__KillUi_TeamNumberName[this]+x], "[离线]" + DzFrameGetText(s___KillUi_TeamNumberName[s__KillUi_TeamNumberName[this]+x]))
                else
                    call DzFrameSetTexture(s___KillUi_TeamNumberHeroIcon[s__KillUi_TeamNumberHeroIcon[this]+x], s__Util_GetUnitValue(s__Units_uid[s__Players_hero[tp]] , "Art"), 0)
                endif
                call DzFrameSetText(s___KillUi_TeamNumberInfo[s__KillUi_TeamNumberInfo[this]+x], "击杀/死亡   " + I2S(s__Players_kills[tp]) + "/" + I2S(s__Players_deaths[tp]))
                call DzFrameSetText(s___KillUi_TeamNumberHeroName[s__KillUi_TeamNumberHeroName[this]+x], s__Units_name[s__Players_hero[tp]])
            set x=x + 1
            endloop
        endfunction
            function s__KillUi_anon__15 takes nothing returns nothing
                set s___KillUi_TeamPlayer[s__KillUi_TeamPlayer[s__KillUi_tmp]+s__KillUi_TeamNumbers[s__KillUi_tmp]]=s__Players_Get(GetEnumPlayer())
                set s__KillUi_TeamNumbers[s__KillUi_tmp]=s__KillUi_TeamNumbers[s__KillUi_tmp] + 1
            endfunction
        function s__KillUi_create takes integer tid,integer index returns integer
            local integer i
            set s__KillUi_tmp=s__KillUi__allocate()
            set s__KillUi_TeamIndex[s__KillUi_tmp]=tid
            call ForForce(s__Teams_GetTeamForceByIndex(tid), function s__KillUi_anon__15)
            set s__KillUi_KillBackgroundMaxHeight=s__KillUi_KillBackgroundMaxHeight + 0.007
            set s__KillUi_TeamName[s__KillUi_tmp]=DzCreateFrameByTagName("TEXT", "TEAMNAME_TITLE_" + I2S(tid), s__KillUi_KillBackgroundMaxLine, "TextInfo", 0)
            call DzFrameSetSize(s__KillUi_TeamName[s__KillUi_tmp], 0.2, 0.1)
            call DzFrameSetPoint(s__KillUi_TeamName[s__KillUi_tmp], 0, s__KillUi_KillBackgroundMaxLine, 0, 0.01, - s__KillUi_KillBackgroundMaxHeight)
            call DzFrameSetText(s__KillUi_TeamName[s__KillUi_tmp], s__Teams_GetTeamNameByIndex(tid))
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
                call DzFrameSetTexture(s___KillUi_TeamNumberHeroIcon[s__KillUi_TeamNumberHeroIcon[s__KillUi_tmp]+i], s__Util_GetUnitValue(s__Units_uid[s__Players_hero[s___KillUi_TeamPlayer[s__KillUi_TeamPlayer[s__KillUi_tmp]+i]]] , "Art"), 0)
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
            call DzFrameSetText(s__KillUi_KillBackgroundText, " 杀敌数   " + s__Teams_GetTeamNameByIndex(0) + ":" + I2S(s__Teams_GetTeamKills(0)) + "    " + s__Teams_GetTeamNameByIndex(1) + ":" + I2S(s__Teams_GetTeamKills(1)) + "    " + s__Teams_GetTeamNameByIndex(2) + ":" + I2S(s__Teams_GetTeamKills(2)) + "    胜利:" + I2S(s__Winner_GetMaxKills()) + "    ↓F2↓")
            if ( tid != - 1 ) then
                call s__KillUi_FlushData(tid)
            endif
        endfunction
        function s__KillUi_Show takes string e returns nothing
            if ( e == "F2" ) then
                call DzFrameShow(s__KillUi_KillBackgroundMaxLine, true)
            endif
        endfunction
        function s__KillUi_Hide takes string e returns nothing
            if ( e == "F2" ) then
                call DzFrameShow(s__KillUi_KillBackgroundMaxLine, false)
            endif
        endfunction
        function s__KillUi_onInit takes nothing returns nothing
            set s__KillUi_KillBackground=DzCreateFrameByTagName("BACKDROP", "KillBackground", DzGetGameUI(), "Panel", 0)
            call DzFrameSetSize(s__KillUi_KillBackground, 0.254, 0.024)
            call DzFrameSetPoint(s__KillUi_KillBackground, 3, DzFrameGetUpperButtonBarButton(0), 5, 0.458, 0.00)
            call DzFrameSetTexture(s__KillUi_KillBackground, "UI_RightUpperBackground.blp", 0)
            set s__KillUi_KillBackgroundText=DzCreateFrameByTagName("TEXT", "KillBackgroundText", s__KillUi_KillBackground, "TextInfo", 0)
            call DzFrameSetPoint(s__KillUi_KillBackgroundText, 3, s__KillUi_KillBackground, 3, 0.001, - 0.004)
            call DzFrameSetSize(s__KillUi_KillBackgroundText, 0.3, 0.021)
            set s__KillUi_KillBackgroundMaxLine=DzCreateFrameByTagName("BACKDROP", "KillBackgroundMaxLine", s__KillUi_KillBackground, "ShowInfo", 0)
            call DzFrameSetSize(s__KillUi_KillBackgroundMaxLine, 0.254, 0.37)
            call DzFrameSetPoint(s__KillUi_KillBackgroundMaxLine, 1, s__KillUi_KillBackground, 7, 0, 0.006)
            call DzFrameSetTexture(s__KillUi_KillBackgroundMaxLine, "UI_RightDownPanelLine.blp", 0)
            set s__KillUi_KillBackgroundMaxBorder=DzCreateFrameByTagName("BACKDROP", "KillBackgroundMaxBorder", s__KillUi_KillBackgroundMaxLine, "ShowInfo", 0)
            call DzFrameSetSize(s__KillUi_KillBackgroundMaxBorder, 0.254, 0.005)
            call DzFrameSetPoint(s__KillUi_KillBackgroundMaxBorder, 1, s__KillUi_KillBackgroundMaxLine, 7, 0, 0)
            call DzFrameSetTexture(s__KillUi_KillBackgroundMaxBorder, "UI_RightDownPanelBorder.blp", 0) //----最大化状态
            call DzFrameShow(s__KillUi_KillBackgroundMaxLine, false)
            call s__Press_On(s__Press_onPressKeyDown , (1))
            call s__Press_On(s__Press_onPressKeyUp , (2))
        endfunction
        function KillUi___anon__16 takes nothing returns nothing
            call s__KillUi_FlushKillData(- 1)
            call ReleaseTimer(GetExpiredTimer())
        endfunction  //-----最小化状态
        function KillUi___anon__17 takes nothing returns nothing
            local integer i
            local integer index=0
            set i=0
            loop
            exitwhen ( i >= 3 )
                set s__s__KillUi_KillTeam[i]= - 1
                if ( s__Teams_GetTeamNumberByIndex(i) != 0 ) then
                    set s__s__KillUi_KillTeam[i]= s__KillUi_create(i , index)
                    set index=index + 1
                endif
            set i=i + 1
            endloop
            call ReleaseTimer(GetExpiredTimer())
            call DzFrameSetSize(s__KillUi_KillBackgroundMaxLine, 0.254, s__KillUi_KillBackgroundMaxHeight)
        endfunction
    function KillUi___onInit takes nothing returns nothing
        call TimerStart(NewTimer(), 0.05, false, function KillUi___anon__16)
        call TimerStart(NewTimer(), 0.06, false, function KillUi___anon__17)
    endfunction

//library KillUi ends
//library OrdinaryWizard:
            function s__OrdinaryWizard___OrdinaryWizard_anon__20 takes integer dash returns nothing
                local integer data=(s__Dash_Obj[dash])
                local integer e=(s___Data_c[s__Data_c[data]])
                local integer u=s__Units_Get(s__Spell_Spell[e])
                if ( s__Dash_DashType[dash] == s__Dash_PWX ) then
                    if ( s___Data_r[s__Data_r[data]] < 700 ) then
                        set s___Data_r[s__Data_r[data]]=s___Data_r[s__Data_r[data]] + 8
                        set s__Dash_Angle[dash]=s__Dash_Angle[dash] + 8
                        if ( s___Data_r[s__Data_r[data]] > 300 ) then
                            call s__Units_SetH(u,1000 * s__Util_GetPwx(3.99 , s___Data_r[s__Data_r[data]] - 400 , 1400))
                            call s__Units_SetF(u,s__Dash_Angle[dash] , true)
                        endif
                    else
                        set s__Dash_Angle[dash]=s__Util_XYEX(s__Dash_X[dash] , s__Dash_Y[dash] , s__Spell_X[e] , s__Spell_Y[e])
                        set s___Data_r[s__Data_r[data]+1]=s__Util_XY2EX(s__Dash_X[dash] , s__Dash_Y[dash] , s__Spell_X[e] , s__Spell_Y[e])
                        set s__Dash_NowDis[dash]=0
                        set s__Dash_MaxDis[dash]=s___Data_r[s__Data_r[data]+1]
                        set s__Dash_MaxSpeed[dash]=130
                        set s__Dash_DashType[dash]=s__Dash_ADD
                        call s__Units_SetF(u,s__Dash_Angle[dash] , false)
                        call s__Units_Anime(u,"attack")
                    endif
                else
                    call s__Units_SetH(u,1000 * ( 1 - s__Util_GetPwx(3.99 , s__Dash_NowDis[dash] / 2 , s__Dash_MaxDis[dash]) ))
                    if ( s__Dash_MaxDis[dash] - s__Dash_NowDis[dash] < 200 ) then
                        set s___Data_r[s__Data_r[data]+2]=1
                        call s__Dash_Stop(dash)
                    endif
                endif
            endfunction
            function s__OrdinaryWizard___OrdinaryWizard_anon__21 takes integer dash returns nothing
                local integer data=(s__Dash_Obj[dash])
                local integer e=(s___Data_c[s__Data_c[data]])
                local integer u=s__Units_Get(s__Spell_Spell[e])
                local integer mj
                local real x=s__Units_X(u)
                local real y=s__Units_Y(u)
                local integer i
                if ( s___Data_r[s__Data_r[data]+2] == 1 ) then
                    call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A006' , 0 , x , y , 0 , 4 , 1.75 , 0.5 , "stand" , "Abilities\\Spells\\Other\\Doom\\DoomDeath.mdl")
                    call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A006' , 0 , x , y , 0 , 3.5 , 1.25 , 2 , "birth" , "Abilities\\Spells\\Human\\FlameStrike\\FlameStrike.mdl")
                    call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A006' , 0 , x , y , 0 , 3.5 , 2 , 1.5 , "death" , "Abilities\\Spells\\Other\\Volcano\\VolcanoMissile.mdl")
                    call s__Units_DelayModel(u,"units\\human\\HeroBloodElf\\HeroBloodElf.mdx" , 0.3)
                    call GroupDamage(u , x , y , 300 , s__Units_Int(s__Players_hero[s__Units_player[u]]) * 20.0 , s__Damage_Magic , 'A006' , false)
                    if ( s__Players_lv15[s__Units_player[u]] != null ) then //是否触发E
                        if ( s__Units_IsAbility(u,'B000') == false ) then
                            call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A006' , 0 , x , y , 0 , 5 , 1 , 1.5 , "death" , "fire3.mdx")
                            call s__Buffs_Add(s__Units_unit[u] , 'A000' , 'B000' , 1 , false)
                            set i=0
                            loop
                            exitwhen ( i >= 12 )
                                set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A005' , 0 , x , y , I2R(i) * 30 , 1.5 , 2.5 , 1 , "stand" , "Environment\\UndeadBuildingFire\\UndeadLargeBuildingFire1.mdl")
                                call s__Dash_Start(s__Units_unit[mj] , s__Units_F(mj) , 600 , s__Dash_SUB , 40 , true , false)
                            set i=i + 1
                            endloop
                        endif
                    endif
                else
                    call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A006' , 0 , s__Units_X(u) , s__Units_Y(u) , s__Spell_Angle[e] , 2 , 2.5 , 1 , "death" , "Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile.mdl")
                    call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Human\\MarkOfChaos\\MarkOfChaosTarget.mdl", s__Units_X(u), s__Units_Y(u)))
                    call DzSetUnitModel(s__Units_unit[u], "units\\human\\HeroBloodElf\\HeroBloodElf.mdx")
                endif
                call s__Units_SetH(u,0)
                call s__Units_AnimeSpeed(u,1)
                call s__Units_Pause(u,false)
                call s__Spell_Destroy(e)
                call s__Data_Destroy(data)
            endfunction
        function s__OrdinaryWizard___OrdinaryWizard_R takes integer e returns nothing
            local integer i
            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer dash
            local integer data
            call s__Units_Pause(u,true)
            call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A006' , 0 , s__Units_X(u) , s__Units_Y(u) , s__Spell_Angle[e] , 2 , 2.5 , 1 , "death" , "Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile.mdl")
            set i=0
            loop
            exitwhen ( i >= 2 )
                call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Human\\MarkOfChaos\\MarkOfChaosTarget.mdl", s__Units_X(u), s__Units_Y(u)))
            set i=i + 1
            endloop
            call s__Units_DelayModel(u,"units\\human\\phoenix\\phoenix.mdx" , 0)
            set data=s__Data_create('A006')
            set s___Data_c[s__Data_c[data]]=e
            set s___Data_r[s__Data_r[data]]=0
            set dash=s__Dash_Start(s__Units_unit[u] , s__Spell_Angle[e] , 3500 , s__Dash_PWX , 90 , true , false)
            set s__Dash_Obj[dash]=data
            set s__Dash_onMove[dash]=(20)
            set s__Dash_onEnd[dash]=(21)
        endfunction
        function s__OrdinaryWizard___OrdinaryWizard_E takes integer u,integer m returns nothing
            if ( s__Units_aid[u] == 'A005' and s__Units_aidindex[u] == 0 ) then
                call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Other\\Doom\\DoomDeath.mdl", s__Units_X(u), s__Units_Y(u)))
                call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Other\\Incinerate\\FireLordDeathExplode.mdl", s__Units_X(u), s__Units_Y(u)))
                call GroupDamage(u , s__Units_X(u) , s__Units_Y(u) , 150 , s__Units_Int(s__Players_hero[s__Units_player[u]]) * 2.0 , s__Damage_Magic , 0 , false)
            endif
        endfunction
            function s__OrdinaryWizard___OrdinaryWizard_anon__22 takes nothing returns nothing
                local integer i
                local integer e=(GetTimerData(GetExpiredTimer()))
                local integer u=s__Units_Get(s__Spell_Spell[e])
                local integer mj
                if ( s__Units_Alive(u) == true ) then
                    call s__Util_Duang(s__Units_X(u) , s__Units_Y(u) , 0.8 , 300 , 300 , - 140 , 0.05 , 75)
                    set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A004' , 1 , s__Units_X(u) , s__Units_Y(u) , 0 , 2 , 1 , 1.5 , "birth" , "fire1.mdx")
                    call s__Units_SetH(mj,50)
                    call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Other\\Doom\\DoomDeath.mdl", s__Units_X(u), s__Units_Y(u)))
                    call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Other\\Volcano\\VolcanoMissile.mdl", s__Units_X(u), s__Units_Y(u)))
                    call GroupEnumUnitsInRange(tmp_group, s__Units_X(u), s__Units_Y(u), 300, Condition(function GroupIsAliveNotAloc))
                    loop
                    exitwhen ( FirstOfGroup(tmp_group) == null )
                        set mj=s__Units_Get(FirstOfGroup(tmp_group))
                        if ( IsUnitEnemy(s__Units_unit[mj], s__Players_player[s__Units_player[u]]) == true ) then
                            call s__Dash_Start(s__Units_unit[mj] , s__Util_XY(s__Units_unit[u] , s__Units_unit[mj]) , 400 , s__Dash_SUB , 70 , true , true)
                            call s__Units_Damage(u,s__Units_unit[mj] , s__Damage_Magic , 'A004' , s__Units_Int(u) * 10)
                        endif
                        call GroupRemoveUnit(tmp_group, s__Units_unit[mj])
                    endloop
                    call GroupClear(tmp_group)
                    if ( s__Players_lv15[s__Units_player[u]] != null ) then //是否触发E
                        if ( s__Units_IsAbility(u,'B000') == false ) then
                            call s__Buffs_Add(s__Units_unit[u] , 'A000' , 'B000' , 2 , false)
                            set i=0
                            loop
                            exitwhen ( i >= 6 )
                                set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A005' , 0 , s__Units_X(u) , s__Units_Y(u) , I2R(i) * 60 , 1.5 , 2.5 , 1 , "stand" , "Environment\\UndeadBuildingFire\\UndeadLargeBuildingFire1.mdl")
                                call s__Dash_Start(s__Units_unit[mj] , s__Units_F(mj) , 300 , s__Dash_PWX , 20 , true , false)
                            set i=i + 1
                            endloop
                        endif
                    endif
                endif
                call s__Units_AnimeSpeed(u,1)
                call s__Units_PositionEnabled(u,true)
                call s__Units_Pause(u,false)
                call s__Spell_Destroy(e)
                call ReleaseTimer(GetExpiredTimer())
            endfunction
        function s__OrdinaryWizard___OrdinaryWizard_W takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer mj
            local timer t=NewTimer()
            call s__Units_Pause(u,true)
            call s__Units_AnimeId(u,6)
            call s__Units_AnimeSpeed(u,2)
            set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A004' , 0 , s__Units_X(u) , s__Units_Y(u) , 0 , 2 , 1.5 , 1.5 , "birth" , "fire2.mdx")
            call s__Units_DelayAnime(mj,2 , 0.4)
            call s__Units_PositionEnabled(u,false)
            call SetTimerData(t , e)
            call GroupEnumUnitsInRange(tmp_group, s__Units_X(u), s__Units_Y(u), 300, Condition(function GroupIsAliveNotAloc))
            loop
            exitwhen ( FirstOfGroup(tmp_group) == null )
                set mj=s__Units_Get(FirstOfGroup(tmp_group))
                if ( IsUnitEnemy(s__Units_unit[mj], s__Players_player[s__Units_player[u]]) == true ) then
                    set s__Buffs_Type[s__Buffs_Add(s__Units_unit[mj] , 'A007' , 'B001' , 1.5 , false)]=s__Buffs_TYPE_SUB + s__Buffs_TYPE_DISPEL_TRUE
                endif
                call GroupRemoveUnit(tmp_group, s__Units_unit[mj])
            endloop
            call GroupClear(tmp_group)
            call TimerStart(t, 0.4, false, function s__OrdinaryWizard___OrdinaryWizard_anon__22)
            set t=null
        endfunction
            function s__OrdinaryWizard___OrdinaryWizard_anon__23 takes integer da returns nothing
                call s__Units_Anime(s__Units_Get(s__Dash_Unit[da]),"death")
            endfunction
            function s__OrdinaryWizard___OrdinaryWizard_anon__24 takes integer da returns nothing
                local integer u=(s__Dash_Obj[da])
                local integer tmp
                call GroupEnumUnitsInRange(tmp_group, s__Units_X(u), s__Units_Y(u), 150, Condition(function GroupIsAliveNotAloc))
                loop
                exitwhen ( FirstOfGroup(tmp_group) == null )
                    set tmp=s__Units_Get(FirstOfGroup(tmp_group))
                    if ( IsUnitEnemy(s__Units_unit[tmp], s__Players_player[s__Units_player[u]]) == true ) then
                        call s__Units_Position(tmp,s__Units_X(u) , s__Units_Y(u) , true)
                    endif
                    call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
                endloop
                call GroupClear(tmp_group)
                if ( s__Dash_Speed[da] < 3 ) then
                    call s__Dash_Stop(da)
                    call s__Units_Anime(u,"death")
                endif
            endfunction  //地裂结束
            function s__OrdinaryWizard___OrdinaryWizard_anon__25 takes integer d returns nothing
                local integer u=(s__Dash_Obj[d])
                local integer tmp=s__Units_Get(s__Dash_Unit[d])
                local real dis
                local real f
                if ( s__Dash_NowDis[d] > 200 ) then
                    if ( s__Players_lv15[s__Units_player[u]] != null ) then //是否触发E
                        if ( s__Units_IsAbility(u,'B000') == false ) then
                            set dis=GetRandomReal(0, 150)
                            set f=GetRandomReal(0, 360)
                            call s__Buffs_Add(s__Units_unit[u] , 'A000' , 'B000' , 0.03 , false)
                            call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A005' , 0 , s__Units_X(tmp) + dis * CosBJ(f) , s__Units_Y(tmp) + dis * SinBJ(f) , f , 1.5 , 2.5 , 1 , "stand" , "Environment\\UndeadBuildingFire\\UndeadLargeBuildingFire1.mdl")
                        endif
                    endif
                    call GroupEnumUnitsInRange(tmp_group, s__Units_X(tmp), s__Units_Y(tmp), 75, Condition(function GroupIsAliveNotAloc))
                    loop
                    exitwhen ( FirstOfGroup(tmp_group) == null )
                        set tmp=s__Units_Get(FirstOfGroup(tmp_group))
                        if ( IsUnitEnemy(s__Units_unit[tmp], s__Players_player[s__Units_player[u]]) == true ) then
                            call s__Dash_Stop(d)
                            exitwhen true
                        endif
                        call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
                    endloop
                    call GroupClear(tmp_group)
                endif
            endfunction
            function s__OrdinaryWizard___OrdinaryWizard_anon__26 takes integer d returns nothing
                local integer i
                local integer u=s__Units_Get(s__Dash_Unit[d])
                local integer tmp
                local real x
                local real y
                local effect e
                call s__Units_Anime(u,"death")
                call GroupEnumUnitsInRange(tmp_group, s__Units_X(u), s__Units_Y(u), 250, Condition(function GroupIsAliveNotAloc))
                set i=CountUnitsInGroup(tmp_group)
                call GroupClear(tmp_group)
                if ( i != 0 ) then
                    call s__Units_Position(u,s__Units_X(u) + 100 * CosBJ(s__Dash_Angle[d]) , s__Units_Y(u) + 100 * SinBJ(s__Dash_Angle[d]) , false)
                    set x=s__Units_X(u)
                    set y=s__Units_Y(u)
                    call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\FragDriller\\FragDriller.mdl", x, y))
                    set e=AddSpecialEffect("abilities\\weapons\\DemolisherMissile\\DemolisherMissile.mdl", x, y)
                    call EXSetEffectSize(e, 2)
                    call DestroyEffect(e)
                    set e=AddSpecialEffect("Abilities\\Weapons\\DemolisherFireMissile\\DemolisherFireMissile.mdl", x, y)
                    call EXSetEffectSize(e, 2)
                    call EXSetEffectSpeed(e, 2.5)
                    call DestroyEffect(e)
                    set e=null
                    call GroupDamage(u , x , y , 250 , s__Units_Int(s__Players_hero[s__Units_player[u]]) * 5.0 , s__Damage_Magic , 'A002' , false)
                    set u=(s__Dash_Obj[d])
                    if ( s__Players_lv15[s__Units_player[u]] != null ) then //是否触发E
                        call s__Buffs_Add(s__Units_unit[u] , 'A000' , 'B000' , 7 , false)
                        set i=0
                        loop
                        exitwhen ( i >= 4 )
                            set tmp=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A005' , 0 , x , y , I2R(i) * 90 , 1.5 , 2.5 , 1 , "stand" , "Environment\\UndeadBuildingFire\\UndeadLargeBuildingFire1.mdl")
                            call s__Dash_Start(s__Units_unit[tmp] , s__Units_F(tmp) , 300 , s__Dash_ADD , 30 , true , false)
                        set i=i + 1
                        endloop
                    endif
                endif
            endfunction  //火球结束
        function s__OrdinaryWizard___OrdinaryWizard_Q takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            local real x=s__Units_X(u)
            local real y=s__Units_Y(u)
            local real f=s__Spell_Angle[e]
            local integer dash
            local integer mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e009' , 'A002' , 0 , x + 100 * CosBJ(f) , y + 100 * SinBJ(f) , f , 2 , 2 , 1.5 , "stand" , "wind.mdx")
            call s__Units_SetH(mj,200)
            set dash=s__Dash_Start(s__Units_unit[mj] , f , 450 , s__Dash_SUB , 60 , true , false)
            set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A002' , 1 , x + 100 * CosBJ(f) , y + 100 * SinBJ(f) , f , 2 , 1.4 , 1 , "stand" , "dust.mdx")
            call s__Units_SetH(mj,50)
            set dash=s__Dash_Start(s__Units_unit[mj] , f , 1600 , s__Dash_SUB , 70 , true , false)
            set s__Dash_Obj[dash]=mj
            set s__Dash_onEnd[dash]=(22)
            set s__Dash_onMove[dash]=(23)
            call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl", x + 100 * CosBJ(f), y + 100 * SinBJ(f)))
            call DestroyEffect(AddSpecialEffectTarget("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl", s__Units_unit[u], "hand right"))
            set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A002' , 2 , x + 100 * CosBJ(f) , y + 100 * SinBJ(f) , f , 1.5 , 2 , 1 , "stand" , "Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl")
            call s__Units_SetH(mj,120)
            call SetUnitPosition(s__Units_unit[mj], s__Units_X(mj), s__Units_Y(mj))
            set dash=s__Dash_Start(s__Units_unit[mj] , f , 1300 , s__Dash_ADD , 50 , true , false)
            set s__Dash_Obj[dash]=u
            set s__Dash_NowDis[dash]=10
            set s__Dash_onMove[dash]=(24)
            set s__Dash_onEnd[dash]=(25)
            call s__Units_AnimeSpeed(u,1)
            call s__Spell_Destroy(e)
        endfunction
        function s__OrdinaryWizard___OrdinaryWizard_HERO_START takes integer e returns nothing
            if ( s__Spell_Id[e] == 'A002' ) then
                call s__Units_AnimeSpeed(s__Units_Get(s__Spell_Spell[e]),2.5)
                call s__Units_FlushAnimeId(s__Units_Get(s__Spell_Spell[e]),5)
            endif
            if ( s__Spell_Id[e] == 'A006' ) then
                call s__Units_FlushAnimeId(s__Units_Get(s__Spell_Spell[e]),3)
                call s__Units_AnimeSpeed(s__Units_Get(s__Spell_Spell[e]),1.5)
            endif
            call s__Spell_Destroy(e)
        endfunction
        function s__OrdinaryWizard___OrdinaryWizard_HERO_STOP takes integer e returns nothing
            call s__Units_AnimeSpeed(s__Units_Get(s__Spell_Spell[e]),1)
            call s__Spell_Destroy(e)
        endfunction
        function s__OrdinaryWizard___OrdinaryWizard_onInit takes nothing returns nothing
            call s__Spell_On(s__Spell_onSpell , 'A002' , (26))
            call s__Spell_On(s__Spell_onSpell , 'A004' , (27))
            call s__Spell_On(s__Spell_onSpell , 'A006' , (28))
            call s__Spell_On(s__Spell_onStart , 'A002' , (29))
            call s__Spell_On(s__Spell_onStop , 'A002' , (30))
            call s__Spell_On(s__Spell_onStart , 'A006' , (29))
            call s__Spell_On(s__Spell_onStop , 'A006' , (30))
            call s__Units_On(s__Units_onAlocDeath , (4))
        endfunction

//library OrdinaryWizard ends
//library Camera:

        function Camera___anon__9 takes nothing returns nothing
            call SetCameraField(CAMERA_FIELD_TARGET_DISTANCE, 2250.00, 0) //游戏时间轴，方便计算时间;
            set GameTime=GameTime + 0.01
        endfunction
    function Camera___onInit takes nothing returns nothing
        call CameraSetSmoothingFactor(998.00)
        call TimerStart(NewTimer(), 0.01, true, function Camera___anon__9)
    endfunction

//library Camera ends
//library Respawn:

        //public:
        function s__Respawn___Respawn_Spawn takes player p returns nothing
            local integer hid=0
            local integer money=0
            local integer ps=s__Players_Get(p)
            local integer r=s__Players_respawn[ps]
            set s__Players_isdeath[ps]=false
            call sc__Respawn___Respawn_Show(p , false)
            if ( s__Respawn___Respawn_RespawnSelect[r] == 1 ) then
                set hid=s__Units_uid[s__Players_hero[ps]]
                set money=s__Respawn___Respawn_RespawnSaveMoney[r]
            elseif ( s__Respawn___Respawn_RespawnSelect[r] == 2 ) then
                set hid=s__Players_nextherotype[ps]
                set money=s__Respawn___Respawn_RespawnSaveMoney[r] * 2
            endif
            call s__HeroRares_AddRandomHero(s__Units_unit[s__Players_hero[ps]])
            if ( s__Respawn___Respawn_RespawnSelect[r] == 0 ) then
                set s__Players_hero[ps]=s__Units_Get(s__HeroRares_GetRandomHero(s__Players_player[ps] , s__Players_randomhero[ps]))
            else
                set s__Players_hero[ps]=s__Units_Get(s__Units_Spawn(s__Players_player[ps] , hid , 0 , 0 , 0))
            endif
            call s__Units_Position(s__Players_hero[ps],GetRectCenterX(s__Teams_GetTeamRect(s__Players_player[ps])) , GetRectCenterY(s__Teams_GetTeamRect(s__Players_player[ps])) , true)
            call s__Players_AddMoney(ps,- money)
            call s__Units_Lock(s__Players_hero[ps],p)
            set s__Players_respawn[ps]=0
            call s__Respawn___Respawn_deallocate(r)
        endfunction
            function s__Respawn___Respawn_anon__18 takes nothing returns nothing
                local integer p=s__Players_Get(GetEnumPlayer())
                local integer r=(s__Players_respawn[p])
                if ( s__Respawn___Respawn_RespawnTime[r] > 0 ) then
                    set s__Respawn___Respawn_RespawnTime[r]=s__Respawn___Respawn_RespawnTime[r] - 1
                    call sc__Respawn___Respawn_Flush(s__Players_player[p])
                elseif ( s__Players_isdeath[p] == true ) then
                    call s__Respawn___Respawn_Spawn(s__Players_player[p])
                endif
            endfunction
        function s__Respawn___Respawn_Time takes nothing returns nothing
            call ForForce(s__Teams_GetAllPlayers(), function s__Respawn___Respawn_anon__18)
        endfunction
            function s__Respawn___Respawn_anon__19 takes nothing returns nothing
                call AdjustPlayerStateBJ(300, GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD)
            endfunction
        function s__Respawn___Respawn_Death takes integer u,integer m returns nothing
            local integer r=s__Respawn___Respawn__allocate()
            if ( s__Players_teamid[s__Units_player[u]] != s__Players_teamid[s__Units_player[m]] and s__Units_unit[m] != null ) then
                set s__Players_lifekill[s__Units_player[m]]=s__Players_lifekill[s__Units_player[m]] + 1
                call ForForce(s__Teams_GetTeamForce(s__Players_player[s__Units_player[m]]), function s__Respawn___Respawn_anon__19)
                call DisplayTimedTextToForce(s__Teams_GetAllPlayers(), 5.00, s__Players_name[s__Units_player[m]] + " 及友军因击杀 " + s__Players_name[s__Units_player[u]] + " 而获得了|cffffcc00$300|r")
                if ( s__Players_randomhero[s__Units_player[m]] > 0 ) then
                    set s__Players_randomhero[s__Units_player[m]]=s__Players_randomhero[s__Units_player[m]] - 5.0
                endif
            endif
            if ( s__Players_randomhero[s__Units_player[u]] < 100 ) then
                set s__Players_randomhero[s__Units_player[u]]=s__Players_randomhero[s__Units_player[u]] + 5.0
            endif
            set s__Respawn___Respawn_RespawnTime[r]=s__Respawn___Respawn_MaxRespawnTime
            set s__Respawn___Respawn_RespawnSaveMoney[r]=200 + R2I(( s__Players_lifekill[s__Units_player[u]] * 300 ) * 1.2)
            set s__Respawn___Respawn_RespawnSelect[r]=0
            set s__Respawn___Respawn_RespawnSelectLast[r]=0
            set s__Players_isdeath[s__Units_player[u]]=true
            set s__Players_lifekill[s__Units_player[u]]=0
            set s__Players_respawn[s__Units_player[u]]=r
            call sc__Respawn___Respawn_Show(s__Players_player[s__Units_player[u]] , true)
        endfunction
        function s__Respawn___Respawn_Flush takes player ps returns nothing
            local integer p=s__Players_Get(ps)
            local integer r=s__Players_respawn[p]
            if ( ps == s__Players_localplayer ) then
                call DzFrameSetText(s__Respawn___Respawn_DeathUIMainSave, "(|cff00ff00W|r)保留当前英雄复活(需要|cffffcc00$" + I2S(s__Respawn___Respawn_RespawnSaveMoney[r]) + "|r)")
            endif
            if ( s__Players_Money(p) >= s__Respawn___Respawn_RespawnSaveMoney[r] ) then
                if ( ps == s__Players_localplayer ) then
                    call DzFrameShow(s__Respawn___Respawn_DeathUIMainSaveLine, false)
                endif
            else
                if ( s__Respawn___Respawn_RespawnSelect[r] == 1 ) then
                    set s__Respawn___Respawn_RespawnSelect[r]=s__Respawn___Respawn_RespawnSelectLast[r]
                endif
                if ( ps == s__Players_localplayer ) then
                    call DzFrameShow(s__Respawn___Respawn_DeathUIMainSaveLine, true)
                endif
            endif
            if ( s__Players_nextherotype[p] == 0 ) then
                if ( ps == s__Players_localplayer ) then
                    call DzFrameSetText(s__Respawn___Respawn_DeathUIMainBuy, "(|cff00ff00E|r)使用指定的英雄复活(未指定/$0)")
                    call DzFrameShow(s__Respawn___Respawn_DeathUIMainBuyLine, true)
                endif
                if ( s__Respawn___Respawn_RespawnSelect[r] == 2 ) then
                    set s__Respawn___Respawn_RespawnSelect[r]=s__Respawn___Respawn_RespawnSelectLast[r]
                endif
            else
                if ( ps == s__Players_localplayer ) then
                    call DzFrameSetText(s__Respawn___Respawn_DeathUIMainBuy, "(|cff00ff00E|r)使用指定的英雄复活(" + s__Util_GetUnitValue(s__Players_nextherotype[p] , "Name") + "/$" + I2S(s__Respawn___Respawn_RespawnSaveMoney[r] * 2) + ")")
                endif
                if ( s__Players_Money(p) >= ( s__Respawn___Respawn_RespawnSaveMoney[r] * 2 ) ) then
                    if ( ps == s__Players_localplayer ) then
                        call DzFrameShow(s__Respawn___Respawn_DeathUIMainBuyLine, false)
                    endif
                elseif ( s__Respawn___Respawn_RespawnSelect[r] == 2 ) then
                    set s__Respawn___Respawn_RespawnSelect[r]=s__Respawn___Respawn_RespawnSelectLast[r]
                endif
            endif
            if ( s__Respawn___Respawn_RespawnSelectLast[r] != s__Respawn___Respawn_RespawnSelect[r] ) then
                set s__Respawn___Respawn_RespawnSelectLast[r]=s__Respawn___Respawn_RespawnSelect[r]
            endif
            if ( ps == s__Players_localplayer ) then
                call DzFrameSetText(s__Respawn___Respawn_DeathUIMainSelect, "已选择:|cff00ff00" + s__s__Respawn___Respawn_RespawnType[s__Respawn___Respawn_RespawnSelect[r]] + "|r")
                call DzFrameSetSize(s__Respawn___Respawn_DeathUIMainMoveBar, 0.001 + ( 0.136 * ( 1 - ( s__Respawn___Respawn_RespawnTime[r] / s__Respawn___Respawn_MaxRespawnTime ) ) ), 0.006)
            endif
        endfunction
        function s__Respawn___Respawn_Show takes player p,boolean show returns nothing
            local integer ps=s__Players_Get(p)
            if ( s__Players_localplayer == p ) then
                set s__Respawn___Respawn_RespawnShow=show
                call DzFrameShow(s__Respawn___Respawn_DeathUIMainTop, show)
                call s__Respawn___Respawn_Flush(p)
            endif
        endfunction
        function s__Respawn___Respawn_Press takes string e returns nothing
            local integer p=s__Players_Get(s__Players_localplayer)
            local integer r=s__Players_respawn[p]
            if ( s__Players_isdeath[p] == true ) then
                if ( e == "C" ) then
                    if ( s__Respawn___Respawn_RespawnShow == false ) then
                        call s__Respawn___Respawn_Show(s__Players_player[p] , true)
                    else
                        call s__Respawn___Respawn_Show(s__Players_player[p] , false)
                    endif
                endif
            endif
        endfunction
        function s__Respawn___Respawn_PressSnyc takes player ps,string e returns nothing
            local integer p=s__Players_Get(ps)
            local integer r=s__Players_respawn[p]
            if ( s__Players_isdeath[p] == true ) then
                if ( e == "Q" ) then
                    set s__Respawn___Respawn_RespawnSelect[r]=0
                    call s__Respawn___Respawn_Flush(s__Players_player[p])
                elseif ( e == "W" ) then
                    set s__Respawn___Respawn_RespawnSelect[r]=1
                    call s__Respawn___Respawn_Flush(s__Players_player[p])
                elseif ( e == "E" ) then
                    set s__Respawn___Respawn_RespawnSelect[r]=2
                    call s__Respawn___Respawn_Flush(s__Players_player[p])
                endif
            endif
        endfunction
        function s__Respawn___Respawn_onInit takes nothing returns nothing
            set s__Respawn___Respawn_DeathUIMainTop=DzCreateFrameByTagName("BACKDROP", "DeathUIMainTop", DzGetGameUI(), "Panel", 0)
            call DzFrameSetSize(s__Respawn___Respawn_DeathUIMainTop, 0.18, 0.003)
            call DzFrameSetPoint(s__Respawn___Respawn_DeathUIMainTop, 4, DzGetGameUI(), 4, 0, 0.18)
            call DzFrameSetTexture(s__Respawn___Respawn_DeathUIMainTop, "UI_TopBorder.blp", 0)
            set s__Respawn___Respawn_DeathUIMainLine=DzCreateFrameByTagName("BACKDROP", "DeathUIMainLine", s__Respawn___Respawn_DeathUIMainTop, "ShowInfo", 0)
            call DzFrameSetSize(s__Respawn___Respawn_DeathUIMainLine, 0.18, 0.2)
            call DzFrameSetPoint(s__Respawn___Respawn_DeathUIMainLine, 1, s__Respawn___Respawn_DeathUIMainTop, 7, 0, 0)
            call DzFrameSetTexture(s__Respawn___Respawn_DeathUIMainLine, "UI_RightDownPanelLine.blp", 0)
            set s__Respawn___Respawn_DeathUIMainDown=DzCreateFrameByTagName("BACKDROP", "DeathUIMainDown", s__Respawn___Respawn_DeathUIMainLine, "ShowInfo", 0)
            call DzFrameSetSize(s__Respawn___Respawn_DeathUIMainDown, 0.18, 0.005)
            call DzFrameSetPoint(s__Respawn___Respawn_DeathUIMainDown, 1, s__Respawn___Respawn_DeathUIMainLine, 7, 0, 0)
            call DzFrameSetTexture(s__Respawn___Respawn_DeathUIMainDown, "UI_RightDownPanelBorder.blp", 0)
            set s__Respawn___Respawn_DeathUIMainTitle=DzCreateFrameByTagName("TEXT", "DeathUIMainTitle", s__Respawn___Respawn_DeathUIMainLine, "TextInfo", 0)
            call DzFrameSetSize(s__Respawn___Respawn_DeathUIMainTitle, 0.18, 0.12)
            call DzFrameSetPoint(s__Respawn___Respawn_DeathUIMainTitle, 1, s__Respawn___Respawn_DeathUIMainLine, 1, 0.045, - 0.01)
            call DzFrameSetText(s__Respawn___Respawn_DeathUIMainTitle, "↓请选择复活方式↓  \n按|cff00ff00C|r键可以开关该面板")
            set s__Respawn___Respawn_DeathUIMainRoll=DzCreateFrameByTagName("TEXT", "DeathUIMainRoll", s__Respawn___Respawn_DeathUIMainLine, "TextInfo", 0)
            call DzFrameSetSize(s__Respawn___Respawn_DeathUIMainRoll, 0.18, 0.12)
            call DzFrameSetPoint(s__Respawn___Respawn_DeathUIMainRoll, 1, s__Respawn___Respawn_DeathUIMainLine, 1, 0.005, - 0.04)
            call DzFrameSetText(s__Respawn___Respawn_DeathUIMainRoll, "(|cff00ff00Q|r)随机抽取一个新的英雄复活")
            set s__Respawn___Respawn_DeathUIMainSave=DzCreateFrameByTagName("TEXT", "DeathUIMainSave", s__Respawn___Respawn_DeathUIMainLine, "TextInfo", 0)
            call DzFrameSetSize(s__Respawn___Respawn_DeathUIMainSave, 0.18, 0.12)
            call DzFrameSetPoint(s__Respawn___Respawn_DeathUIMainSave, 1, s__Respawn___Respawn_DeathUIMainLine, 1, 0.005, - 0.067)
            call DzFrameSetText(s__Respawn___Respawn_DeathUIMainSave, "(|cff00ff00W|r)保留当前英雄复活(需要|cffffcc00$0|r)")
            set s__Respawn___Respawn_DeathUIMainSaveLine=DzCreateFrameByTagName("BACKDROP", "DeathUIMainSaveLine", s__Respawn___Respawn_DeathUIMainLine, "ShowInfo", 0)
            call DzFrameSetSize(s__Respawn___Respawn_DeathUIMainSaveLine, 0.097, 0.002)
            call DzFrameSetPoint(s__Respawn___Respawn_DeathUIMainSaveLine, 1, s__Respawn___Respawn_DeathUIMainLine, 1, - 0.036, - 0.072)
            call DzFrameSetTexture(s__Respawn___Respawn_DeathUIMainSaveLine, "UI_WHITEBLOCK.blp", 0)
            set s__Respawn___Respawn_DeathUIMainBuy=DzCreateFrameByTagName("TEXT", "DeathUIMainBuy", s__Respawn___Respawn_DeathUIMainLine, "TextInfo", 0)
            call DzFrameSetSize(s__Respawn___Respawn_DeathUIMainBuy, 0.18, 0.12)
            call DzFrameSetPoint(s__Respawn___Respawn_DeathUIMainBuy, 1, s__Respawn___Respawn_DeathUIMainLine, 1, 0.005, - 0.097)
            call DzFrameSetText(s__Respawn___Respawn_DeathUIMainBuy, "(|cff00ff00E|r)使用指定的英雄复活(未指定/$0)")
            set s__Respawn___Respawn_DeathUIMainBuyLine=DzCreateFrameByTagName("BACKDROP", "DeathUIMainBuyLine", s__Respawn___Respawn_DeathUIMainLine, "ShowInfo", 0)
            call DzFrameSetSize(s__Respawn___Respawn_DeathUIMainBuyLine, 0.087, 0.002)
            call DzFrameSetPoint(s__Respawn___Respawn_DeathUIMainBuyLine, 1, s__Respawn___Respawn_DeathUIMainLine, 1, - 0.041, - 0.103)
            call DzFrameSetTexture(s__Respawn___Respawn_DeathUIMainBuyLine, "UI_WHITEBLOCK.blp", 0)
            set s__Respawn___Respawn_DeathUIMainTip=DzCreateFrameByTagName("TEXT", "DeathUIMainTip", s__Respawn___Respawn_DeathUIMainLine, "TextInfo", 0)
            call DzFrameSetSize(s__Respawn___Respawn_DeathUIMainTip, 0.18, 0.12)
            call DzFrameSetPoint(s__Respawn___Respawn_DeathUIMainTip, 1, s__Respawn___Respawn_DeathUIMainLine, 1, 0.005, - 0.122)
            call DzFrameSetText(s__Respawn___Respawn_DeathUIMainTip, "按下绿色按键选择对应复活方式\n有白色线条挡住的不可选择\n如不选择,复活时将自动选择抽取复活")
            set s__Respawn___Respawn_DeathUIMainSelect=DzCreateFrameByTagName("TEXT", "DeathUIMainDeath", s__Respawn___Respawn_DeathUIMainLine, "TextInfo", 0)
            call DzFrameSetSize(s__Respawn___Respawn_DeathUIMainSelect, 0.18, 0.12)
            call DzFrameSetPoint(s__Respawn___Respawn_DeathUIMainSelect, 1, s__Respawn___Respawn_DeathUIMainLine, 1, 0.005, - 0.182)
            call DzFrameSetText(s__Respawn___Respawn_DeathUIMainSelect, "|cffff0000死亡|r")
            set s__Respawn___Respawn_DeathUIMainSelect=DzCreateFrameByTagName("TEXT", "DeathUIMainSpawn", s__Respawn___Respawn_DeathUIMainLine, "TextInfo", 0)
            call DzFrameSetSize(s__Respawn___Respawn_DeathUIMainSelect, 0.18, 0.12)
            call DzFrameSetPoint(s__Respawn___Respawn_DeathUIMainSelect, 1, s__Respawn___Respawn_DeathUIMainLine, 1, 0.159, - 0.182)
            call DzFrameSetText(s__Respawn___Respawn_DeathUIMainSelect, "|cff00ff00复活|r")
            set s__Respawn___Respawn_DeathUIMainSelect=DzCreateFrameByTagName("TEXT", "DeathUIMainSelect", s__Respawn___Respawn_DeathUIMainLine, "TextInfo", 0)
            call DzFrameSetSize(s__Respawn___Respawn_DeathUIMainSelect, 0.18, 0.12)
            call DzFrameSetPoint(s__Respawn___Respawn_DeathUIMainSelect, 1, s__Respawn___Respawn_DeathUIMainLine, 1, 0.005, - 0.167)
            call DzFrameSetText(s__Respawn___Respawn_DeathUIMainSelect, "已选择:|cff00ff00抽取复活|r")
            set s__Respawn___Respawn_DeathUIMainMoveBar=DzCreateFrameByTagName("BACKDROP", "DeathUIMainMoveBar", s__Respawn___Respawn_DeathUIMainLine, "ShowInfo", 0)
            call DzFrameSetSize(s__Respawn___Respawn_DeathUIMainMoveBar, 0.001, 0.006)
            call DzFrameSetPoint(s__Respawn___Respawn_DeathUIMainMoveBar, 0, s__Respawn___Respawn_DeathUIMainLine, 1, - 0.068, - 0.185)
            call DzFrameSetTexture(s__Respawn___Respawn_DeathUIMainMoveBar, "UI_WHITEBLOCK.blp", 0)
            set s__s__Respawn___Respawn_RespawnType[0]= "抽取复活"
            set s__s__Respawn___Respawn_RespawnType[1]= "保留复活"
            set s__s__Respawn___Respawn_RespawnType[2]= "指定复活"
            call DzFrameShow(s__Respawn___Respawn_DeathUIMainTop, false)
            call s__Units_On(s__Units_onHeroDeath , (5))
            call s__Press_On(s__Press_onPressKeyDown , (3))
            call s__Press_OnSnyc(s__Press_onSnycPressKeyDown , (3))
        endfunction
    function Respawn___onInit takes nothing returns nothing
        call TimerStart(NewTimer(), 1, true, function s__Respawn___Respawn_Time)
    endfunction

//library Respawn ends
//===========================================================================
// 
// 抢地盘
// 
//   Warcraft III map script
//   Generated by the Warcraft III World Editor
//   Date: Thu Dec 06 23:48:01 2018
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
function CreateBuildingsForPlayer9 takes nothing returns nothing
    local player p= Player(9)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'n000', - 4672.0, - 5056.0, 270.000)
endfunction
//===========================================================================
function CreateUnitsForPlayer9 takes nothing returns nothing
    local player p= Player(9)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'e002', - 4273.7, - 4718.7, 198.452)
endfunction
//===========================================================================
function CreateBuildingsForPlayer10 takes nothing returns nothing
    local player p= Player(10)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'n000', - 64.0, 4864.0, 270.000)
endfunction
//===========================================================================
function CreateUnitsForPlayer10 takes nothing returns nothing
    local player p= Player(10)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'e002', - 185.0, 4358.3, 198.452)
endfunction
//===========================================================================
function CreateBuildingsForPlayer11 takes nothing returns nothing
    local player p= Player(11)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'n000', 4928.0, - 5184.0, 270.000)
endfunction
//===========================================================================
function CreateUnitsForPlayer11 takes nothing returns nothing
    local player p= Player(11)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'e002', 4540.2, - 4867.2, 198.452)
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
    set u=CreateUnit(p, 'H002', - 6.8, - 178.3, 251.900)
endfunction
//===========================================================================
function CreatePlayerBuildings takes nothing returns nothing
    call CreateBuildingsForPlayer9()
    call CreateBuildingsForPlayer10()
    call CreateBuildingsForPlayer11()
endfunction
//===========================================================================
function CreatePlayerUnits takes nothing returns nothing
    call CreateUnitsForPlayer9()
    call CreateUnitsForPlayer10()
    call CreateUnitsForPlayer11()
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
    set gg_rct_B_TEAM=Rect(- 544.0, 4032.0, 160.0, 4640.0)
    set gg_rct_C_TEAM=Rect(4096.0, - 5056.0, 4736.0, - 4448.0)
    set gg_rct_main=Rect(- 5344.0, - 5600.0, 5344.0, 5088.0)
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
// BEGIN IMPORT OF C:\Users\ushiop\Desktop\war3\project\map/script/TerrainPathability.j
 

// END IMPORT OF C:\Users\ushiop\Desktop\war3\project\map/script/TerrainPathability.j
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
    return ( ( YDWEIsEventAttackDamage() == true ) )
endfunction
function Trig_initActions takes nothing returns nothing
    call DzLoadToc("resource\\UI.toc")
    call SetUnitUserData(gg_unit_e000_0010, 0)
    call SetUnitUserData(gg_unit_e001_0011, 0)
    call BJDebugMsg(( EXExecuteScript("(require'jass.slk').unit[" + I2S('hrif') + "].Art") ))
    call EXEffectMatReset(bj_lastCreatedEffect)
    call YDWEUnitAddStun(GetTriggerUnit())
endfunction
//===========================================================================
function InitTrig_init takes nothing returns nothing
    set gg_trg_init=CreateTrigger()
    call DisableTrigger(gg_trg_init)
    call DoNothing()
    call YDWESyStemAnyUnitDamagedRegistTrigger(gg_trg_init)
    call TriggerAddCondition(gg_trg_init, Condition(function Trig_initConditions))
    call TriggerAddAction(gg_trg_init, function Trig_initActions)
endfunction
//===========================================================================
// Trigger: 未命名触发器 001
//===========================================================================
function Trig____________________001Actions takes nothing returns nothing
    call SetUnitManaPercentBJ(FirstOfGroup(YDWEGetUnitsOfPlayerAllNull(Player(0))), 100)
    call UnitResetCooldown(FirstOfGroup(YDWEGetUnitsOfPlayerAllNull(Player(0))))
    call SetHeroLevel(FirstOfGroup(YDWEGetUnitsOfPlayerAllNull(Player(0))), 25, true)
    call SetUnitAnimationByIndex(FirstOfGroup(YDWEGetUnitsOfPlayerAllNull(Player(0))), GetUnitUserData(FirstOfGroup(YDWEGetUnitsOfPlayerAllNull(Player(0)))))
    call BJDebugMsg(I2S(GetUnitUserData(FirstOfGroup(YDWEGetUnitsOfPlayerAllNull(Player(0))))))
    call SetUnitUserData(FirstOfGroup(YDWEGetUnitsOfPlayerAllNull(Player(0))), ( GetUnitUserData(FirstOfGroup(YDWEGetUnitsOfPlayerAllNull(Player(0)))) + 1 ))
endfunction
//===========================================================================
function InitTrig____________________001 takes nothing returns nothing
    set gg_trg____________________001=CreateTrigger()
    call DoNothing()
    call TriggerRegisterPlayerEventEndCinematic(gg_trg____________________001, Player(0))
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

call ExecuteFunc("jasshelper__initstructs548236718")
call ExecuteFunc("Teams___onInit")
call ExecuteFunc("TerrainPathability__Init")
call ExecuteFunc("TimerUtils__init")
call ExecuteFunc("Tree___onInit")
call ExecuteFunc("Buff___onInit")
call ExecuteFunc("Dashs___onInit")
call ExecuteFunc("Disconnect___onInit")
call ExecuteFunc("Events__onInit")
call ExecuteFunc("HitFly___onInit")
call ExecuteFunc("Press__onInit")
call ExecuteFunc("LevelUp___onInit")
call ExecuteFunc("PlayerPress___onInit")
call ExecuteFunc("HeroRare___onInit")
call ExecuteFunc("Winner___onInit")
call ExecuteFunc("DazzleMaster__onInit")
call ExecuteFunc("Init___onInit")
call ExecuteFunc("KillUi___onInit")
call ExecuteFunc("Camera___onInit")
call ExecuteFunc("Respawn___onInit")

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
function sa__Respawn___Respawn_Flush takes nothing returns boolean
local player ps=f__arg_player1
            local integer p=s__Players_Get(ps)
            local integer r=s__Players_respawn[p]
            if ( ps == s__Players_localplayer ) then
                call DzFrameSetText(s__Respawn___Respawn_DeathUIMainSave, "(|cff00ff00W|r)保留当前英雄复活(需要|cffffcc00$" + I2S(s__Respawn___Respawn_RespawnSaveMoney[r]) + "|r)")
            endif
            if ( s__Players_Money(p) >= s__Respawn___Respawn_RespawnSaveMoney[r] ) then
                if ( ps == s__Players_localplayer ) then
                    call DzFrameShow(s__Respawn___Respawn_DeathUIMainSaveLine, false)
                endif
            else
                if ( s__Respawn___Respawn_RespawnSelect[r] == 1 ) then
                    set s__Respawn___Respawn_RespawnSelect[r]=s__Respawn___Respawn_RespawnSelectLast[r]
                endif
                if ( ps == s__Players_localplayer ) then
                    call DzFrameShow(s__Respawn___Respawn_DeathUIMainSaveLine, true)
                endif
            endif
            if ( s__Players_nextherotype[p] == 0 ) then
                if ( ps == s__Players_localplayer ) then
                    call DzFrameSetText(s__Respawn___Respawn_DeathUIMainBuy, "(|cff00ff00E|r)使用指定的英雄复活(未指定/$0)")
                    call DzFrameShow(s__Respawn___Respawn_DeathUIMainBuyLine, true)
                endif
                if ( s__Respawn___Respawn_RespawnSelect[r] == 2 ) then
                    set s__Respawn___Respawn_RespawnSelect[r]=s__Respawn___Respawn_RespawnSelectLast[r]
                endif
            else
                if ( ps == s__Players_localplayer ) then
                    call DzFrameSetText(s__Respawn___Respawn_DeathUIMainBuy, "(|cff00ff00E|r)使用指定的英雄复活(" + s__Util_GetUnitValue(s__Players_nextherotype[p] , "Name") + "/$" + I2S(s__Respawn___Respawn_RespawnSaveMoney[r] * 2) + ")")
                endif
                if ( s__Players_Money(p) >= ( s__Respawn___Respawn_RespawnSaveMoney[r] * 2 ) ) then
                    if ( ps == s__Players_localplayer ) then
                        call DzFrameShow(s__Respawn___Respawn_DeathUIMainBuyLine, false)
                    endif
                elseif ( s__Respawn___Respawn_RespawnSelect[r] == 2 ) then
                    set s__Respawn___Respawn_RespawnSelect[r]=s__Respawn___Respawn_RespawnSelectLast[r]
                endif
            endif
            if ( s__Respawn___Respawn_RespawnSelectLast[r] != s__Respawn___Respawn_RespawnSelect[r] ) then
                set s__Respawn___Respawn_RespawnSelectLast[r]=s__Respawn___Respawn_RespawnSelect[r]
            endif
            if ( ps == s__Players_localplayer ) then
                call DzFrameSetText(s__Respawn___Respawn_DeathUIMainSelect, "已选择:|cff00ff00" + s__s__Respawn___Respawn_RespawnType[s__Respawn___Respawn_RespawnSelect[r]] + "|r")
                call DzFrameSetSize(s__Respawn___Respawn_DeathUIMainMoveBar, 0.001 + ( 0.136 * ( 1 - ( s__Respawn___Respawn_RespawnTime[r] / s__Respawn___Respawn_MaxRespawnTime ) ) ), 0.006)
            endif
   return true
endfunction
function sa__Respawn___Respawn_Show takes nothing returns boolean
local player p=f__arg_player1
local boolean show=f__arg_boolean1
            local integer ps=s__Players_Get(p)
            if ( s__Players_localplayer == p ) then
                set s__Respawn___Respawn_RespawnShow=show
                call DzFrameShow(s__Respawn___Respawn_DeathUIMainTop, show)
                call s__Respawn___Respawn_Flush(p)
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
            set s__KillUi_TeamWinAcc[this]=s__Teams_GetTeamKills(s__KillUi_TeamIndex[this]) / I2R(s__Winner_GetMaxKills())
            call DzFrameSetSize(s__KillUi_TeamMoveBar[this], 0.202 * s__KillUi_TeamWinAcc[this], 0.01)
            set x=0
            loop
            exitwhen ( x >= s__KillUi_TeamNumbers[this] )
                set tp=s___KillUi_TeamPlayer[s__KillUi_TeamPlayer[this]+x]
                if ( s__Players_isonline[tp] == false ) then
                    call DzFrameSetTexture(s___KillUi_TeamNumberHeroIcon[s__KillUi_TeamNumberHeroIcon[this]+x], "ReplaceableTextures\\CommandButtons\\BTNCancel.blp", 0)
                    call DzFrameSetText(s___KillUi_TeamNumberName[s__KillUi_TeamNumberName[this]+x], "[离线]" + DzFrameGetText(s___KillUi_TeamNumberName[s__KillUi_TeamNumberName[this]+x]))
                else
                    call DzFrameSetTexture(s___KillUi_TeamNumberHeroIcon[s__KillUi_TeamNumberHeroIcon[this]+x], s__Util_GetUnitValue(s__Units_uid[s__Players_hero[tp]] , "Art"), 0)
                endif
                call DzFrameSetText(s___KillUi_TeamNumberInfo[s__KillUi_TeamNumberInfo[this]+x], "击杀/死亡   " + I2S(s__Players_kills[tp]) + "/" + I2S(s__Players_deaths[tp]))
                call DzFrameSetText(s___KillUi_TeamNumberHeroName[s__KillUi_TeamNumberHeroName[this]+x], s__Units_name[s__Players_hero[tp]])
            set x=x + 1
            endloop
   return true
endfunction
function sa__KillUi_FlushKillData takes nothing returns boolean
local integer tid=f__arg_integer1
            call DzFrameSetText(s__KillUi_KillBackgroundText, " 杀敌数   " + s__Teams_GetTeamNameByIndex(0) + ":" + I2S(s__Teams_GetTeamKills(0)) + "    " + s__Teams_GetTeamNameByIndex(1) + ":" + I2S(s__Teams_GetTeamKills(1)) + "    " + s__Teams_GetTeamNameByIndex(2) + ":" + I2S(s__Teams_GetTeamKills(2)) + "    胜利:" + I2S(s__Winner_GetMaxKills()) + "    ↓F2↓")
            if ( tid != - 1 ) then
                call s__KillUi_FlushData(tid)
            endif
   return true
endfunction
function sa__DazzleMaster_AddDazzle takes nothing returns boolean
    call s__DazzleMaster_AddDazzle(f__arg_unit1,f__arg_integer1)
   return true
endfunction
function sa__Winner_ShowWin takes nothing returns boolean
local integer teamid=f__arg_integer1
            set s__Winner_WinTeam=teamid
            call ForForce(s__Teams_GetAllPlayers(), function s__Winner_anon__13)
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
function sa__Units_DelayAnime takes nothing returns boolean
local integer this=f__arg_this
local integer id=f__arg_integer1
local real delay=f__arg_real1
                local timer t=NewTimer()
                local integer data=s__Data_create('A000')
                set s___Data_c[s__Data_c[data]]=this
                set s___Data_i[s__Data_i[data]]=id
                call SetTimerData(t , data)
                call TimerStart(t, delay, false, function s__Units_anon__1)
                set t=null
   return true
endfunction
function sa__Units_AnimeSpeed takes nothing returns boolean
local integer this=f__arg_this
local real sp=f__arg_real1
                call SetUnitTimeScale(s__Units_unit[this], sp)
   return true
endfunction
function sa__Units_Position takes nothing returns boolean
local integer this=f__arg_this
local real x=f__arg_real1
local real y=f__arg_real2
local boolean order=f__arg_boolean1
                if ( s__Units_move[this] == true ) then
                    if ( order == true ) then
                        call SetUnitPosition(s__Units_unit[this], x, y)
                    else
                        call SetUnitX(s__Units_unit[this], x)
                        call SetUnitY(s__Units_unit[this], y)
                    endif
                endif
   return true
endfunction
function sa__Units_Destroys takes nothing returns boolean
    call s__Units_Destroys(f__arg_unit1)
   return true
endfunction
function sa__Units_Get takes nothing returns boolean
    set f__result_integer=s__Units_Get(f__arg_unit1)
   return true
endfunction
function sa__Units_Spawn takes nothing returns boolean
local player p=f__arg_player1
local integer unitid=f__arg_integer1
local real x=f__arg_real1
local real y=f__arg_real2
local real f=f__arg_real3
            local unit u=CreateUnit(p, unitid, x, y, f)
            call s__Units_Create(u)
            call s__Util_UnitAddRemoveAbility(u , 'Amrf')
            call s__Units_onSpawn(u)
            set bj_lastCreatedUnit=u
            set u=null
set f__result_unit= bj_lastCreatedUnit
   return true
endfunction
function sa__Units_Kill takes nothing returns boolean
    call s__Units_Kill(f__arg_unit1)
   return true
endfunction
function sa__HitFlys_Find takes nothing returns boolean
    set f__result_integer=s__HitFlys_Find(f__arg_unit1)
   return true
endfunction
function sa__HitFlys_Trigger takes nothing returns boolean
local string eName=f__arg_string1
local integer m=f__arg_integer1
                local integer i
                local integer callback
                set i=1
                loop
                exitwhen ( i >= s__Table__getindex(s__Table__staticgetindex(eName),0) )
                    set callback=(s__Table__getindex(s__Table__staticgetindex(eName),i))
                    call sc___prototype20_evaluate(callback,m)
                set i=i + 1
                endloop
   return true
endfunction
function sa__Events_On takes nothing returns boolean
local string eName=f__arg_string1
local integer callback=f__arg_integer1
                if ( s__Table__getindex(s__Table__staticgetindex(eName),0) == 0 ) then
                    call s__Table__setindex(s__Table__staticgetindex(eName),0, 1)
                endif
                call s__Table__setindex(s__Table__staticgetindex(eName),s__Table__getindex(s__Table__staticgetindex(eName),0), callback)
                call s__Table__setindex(s__Table__staticgetindex(eName),0, s__Table__getindex(s__Table__staticgetindex(eName),0) + 1)
   return true
endfunction
function sa__Dash_Destroy takes nothing returns boolean
local integer this=f__arg_this
                set s__Dash_Unit[this]=null
                if ( s__Dash_Last == this ) then
                    set s__Dash_Next[s__Dash_Prev[this]]=0
                    set s__Dash_Last=s__Dash_Prev[this]
                else
                    set s__Dash_Next[s__Dash_Prev[this]]=s__Dash_Next[this]
                    set s__Dash_Prev[s__Dash_Next[this]]=s__Dash_Prev[this]
                endif
                call s__Dash_deallocate(this)
   return true
endfunction
function sa__Dash_Stop takes nothing returns boolean
local integer this=f__arg_this
                if ( s__Dash_onRemove[this] != 0 ) then
                    call sc___prototype20_evaluate((s__Dash_onRemove[this]),this)
                endif
                if ( s__Dash_onEnd[this] != 0 ) then
                    call sc___prototype20_evaluate((s__Dash_onEnd[this]),this)
                endif
                call s__Dash_Destroy(this)
   return true
endfunction
function sa__Dash_Trigger takes nothing returns boolean
    call s__Dash_Trigger(f__arg_string1,f__arg_unit1,f__arg_integer1)
   return true
endfunction
function sa__Buffs_Find takes nothing returns boolean
    set f__result_integer=s__Buffs_Find(f__arg_unit1,f__arg_integer1,f__arg_integer2)
   return true
endfunction
function sa__Buffs_Skill takes nothing returns boolean
    call s__Buffs_Skill(f__arg_unit1,f__arg_integer1,f__arg_integer2)
   return true
endfunction
function sa__Buffs_Trigger takes nothing returns boolean
    call s__Buffs_Trigger(f__arg_string1,f__arg_unit1,f__arg_integer1)
   return true
endfunction
function sa__Table__GTable_onDestroy takes nothing returns boolean
local integer this=f__arg_this
            call s__Table__GTable_reset(this)
   return true
endfunction
function sa__HandleTable__getindex takes nothing returns boolean
local integer this=f__arg_this
local handle key=f__arg_handle1
set f__result_integer= LoadInteger(Table__ht, (this), GetHandleId(key))
   return true
endfunction
function sa__HandleTable__setindex takes nothing returns boolean
local integer this=f__arg_this
local handle key=f__arg_handle1
local integer value=f__arg_integer1
            call SaveInteger(Table__ht, (this), GetHandleId(key), value)
   return true
endfunction
function sa___prototype20_Disconnect___onDisconnect takes nothing returns boolean
 local integer e=f__arg_integer1

        local integer x
        local unit u
        set Disconnect___tmp=s__Players_Get(s__EventArgs_TriggerPlayer[e])
        set u=s__Units_unit[s__Players_hero[Disconnect___tmp]]
        call ReviveHero(u, GetUnitX(u), GetUnitY(u), false)
        call SetUnitPosition(u, GetRectCenterX(s__Teams_GetTeamRect(s__Players_player[Disconnect___tmp])), GetRectCenterY(s__Teams_GetTeamRect(s__Players_player[Disconnect___tmp])))
        set x=1
        loop
        exitwhen ( x > 6 )
            call UnitRemoveItemFromSlotSwapped(x, u)
        set x=x + 1
        endloop
        call sc__HeroRares_AddRandomHero(u)
        set x=s__Teams_GetTeamNumber(s__Players_player[Disconnect___tmp]) - 1
        if ( x != 0 ) then
            call ForForce(s__Teams_GetTeamForce(s__Players_player[Disconnect___tmp]), function Disconnect___anon__12)
        endif
        call s__Teams_PlayerRemoveForce(s__Players_player[Disconnect___tmp])
        call DisplayTimedTextToForce(s__Teams_GetAllPlayers(), 5.00, s__Players_name[Disconnect___tmp] + " 离开了游戏，金钱将平分给他的队友。")
        set s__Players_isonline[Disconnect___tmp]=false
        call sc__KillUi_FlushPlayerData(s__Players_player[Disconnect___tmp])
        set u=null
    return true
endfunction
function sa___prototype20_LevelUp___LvUp takes nothing returns boolean
 local integer e=f__arg_integer1

        local integer lv=GetUnitLevel(s__EventArgs_TriggerUnit[e])
        local integer p=s__Units_player[sc__Units_Get(s__EventArgs_TriggerUnit[e])]
        if ( lv > LevelUp___MaxLv ) then
            set LevelUp___MaxLv=lv
        endif
        if ( lv >= 5 and s__Players_lv5[p] == null ) then
            set s__Players_lv5[p]=sc__Units_Spawn(s__Players_player[p] , 'e003' , 0 , 0 , 0)
        endif
        if ( lv >= 10 and s__Players_lv10[p] == null ) then
            set s__Players_lv10[p]=sc__Units_Spawn(s__Players_player[p] , 'e004' , 0 , 0 , 0)
        endif
        if ( lv >= 15 and s__Players_lv15[p] == null ) then
            set s__Players_lv15[p]=sc__Units_Spawn(s__Players_player[p] , 'e005' , 0 , 0 , 0)
        endif
        if ( lv >= 20 and s__Players_lv20[p] == null ) then
            set s__Players_lv20[p]=sc__Units_Spawn(s__Players_player[p] , 'e006' , 0 , 0 , 0)
        endif
        if ( lv >= 25 and s__Players_lv25[p] == null ) then
            set s__Players_lv25[p]=sc__Units_Spawn(s__Players_player[p] , 'e007' , 0 , 0 , 0)
        endif
    return true
endfunction
function sa___prototype20_s__Spell_onUnitSpell takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=sc__Units_Get(s__EventArgs_TriggerUnit[e])
            local integer tmp=s__Spell__allocate()
            call SpellNameText(s__Units_unit[u] , GetAbilityName(s__EventArgs_SpellId[e]) , 3 , 10)
            set s__Spell_Spell[tmp]=s__Units_unit[u]
            set s__Spell_Target[tmp]=s__EventArgs_SpellTargetUnit[e]
            set s__Spell_X[tmp]=s__EventArgs_SpellTargetX[e]
            set s__Spell_Y[tmp]=s__EventArgs_SpellTargetY[e]
            set s__Spell_Id[tmp]=s__EventArgs_SpellId[e]
            if ( s__Spell_Target[tmp] == null ) then
                set s__Spell_Angle[tmp]=s__Util_XYEX(GetUnitX(s__Spell_Spell[tmp]) , GetUnitY(s__Spell_Spell[tmp]) , s__Spell_X[tmp] , s__Spell_Y[tmp])
                set s__Spell_Dis[tmp]=s__Util_XY2EX(GetUnitX(s__Spell_Spell[tmp]) , GetUnitY(s__Spell_Spell[tmp]) , s__Spell_X[tmp] , s__Spell_Y[tmp])
            else
                set s__Spell_Angle[tmp]=s__Util_XY(s__Spell_Spell[tmp] , s__Spell_Target[tmp])
                set s__Spell_Dis[tmp]=s__Util_XY2(s__Spell_Spell[tmp] , s__Spell_Target[tmp])
            endif
            set s__Spell_Obj[tmp]=0
            set s__Spell_Kill[tmp]=false
            set s__Spell_Use[tmp]=1
            set s__Spell_State[tmp]=s__Spell_SpellState
            if ( s__Units_spell[u] != 0 ) then
                set s__Spell_Use[tmp]=2
                call sc___prototype20_evaluate((s__Units_spell[u]),tmp)
            endif
            call s__Spell_Trigger(s__Spell_onSpell , s__Spell_Id[tmp] , tmp)
    return true
endfunction
function sa___prototype20_s__Spell_onUnitStartSpell takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=sc__Units_Get(s__EventArgs_TriggerUnit[e])
            local integer tmp=s__Spell__allocate()
            set s__Spell_Spell[tmp]=s__Units_unit[u]
            set s__Spell_Target[tmp]=s__EventArgs_SpellTargetUnit[e]
            set s__Spell_X[tmp]=s__EventArgs_SpellTargetX[e]
            set s__Spell_Y[tmp]=s__EventArgs_SpellTargetY[e]
            set s__Spell_Id[tmp]=s__EventArgs_SpellId[e]
            set s__Spell_Angle[tmp]=0
            set s__Spell_Dis[tmp]=0
            set s__Spell_Obj[tmp]=0
            set s__Spell_Kill[tmp]=false
            set s__Spell_Use[tmp]=1
            set s__Spell_State[tmp]=2
            call s__Spell_Trigger(s__Spell_onStart , s__Spell_Id[tmp] , tmp)
    return true
endfunction
function sa___prototype20_s__Spell_onUnitStopSpell takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=sc__Units_Get(s__EventArgs_TriggerUnit[e])
            local integer tmp=s__Spell__allocate()
            set s__Spell_Spell[tmp]=s__Units_unit[u]
            set s__Spell_Target[tmp]=s__EventArgs_SpellTargetUnit[e]
            set s__Spell_X[tmp]=s__EventArgs_SpellTargetX[e]
            set s__Spell_Y[tmp]=s__EventArgs_SpellTargetY[e]
            set s__Spell_Id[tmp]=s__EventArgs_SpellId[e]
            set s__Spell_Angle[tmp]=0
            set s__Spell_Dis[tmp]=0
            set s__Spell_Obj[tmp]=0
            set s__Spell_Kill[tmp]=false
            set s__Spell_Use[tmp]=1
            set s__Spell_State[tmp]=3
            call s__Spell_Trigger(s__Spell_onStop , s__Spell_Id[tmp] , tmp)
    return true
endfunction
function sa___prototype20_s__Spell_onUnitReadySpell takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=sc__Units_Get(s__EventArgs_TriggerUnit[e])
            local integer tmp=s__Spell__allocate()
            set s__Spell_Spell[tmp]=s__Units_unit[u]
            set s__Spell_Target[tmp]=s__EventArgs_SpellTargetUnit[e]
            set s__Spell_X[tmp]=s__EventArgs_SpellTargetX[e]
            set s__Spell_Y[tmp]=s__EventArgs_SpellTargetY[e]
            set s__Spell_Id[tmp]=s__EventArgs_SpellId[e]
            set s__Spell_Angle[tmp]=0
            set s__Spell_Dis[tmp]=0
            set s__Spell_Obj[tmp]=0
            set s__Spell_Kill[tmp]=false
            set s__Spell_Use[tmp]=1
            set s__Spell_State[tmp]=1
            call s__Spell_Trigger(s__Spell_onReady , s__Spell_Id[tmp] , tmp)
    return true
endfunction
function sa___prototype20_s__Damage_onDisconnect takes nothing returns boolean
 local integer p=f__arg_integer1

            if ( s__HandleTable_exists(s__Damage_ht,s__EventArgs_TriggerPlayer[p]) == true ) then
                call s__HandleTable_flush(s__Damage_ht,s__EventArgs_TriggerPlayer[p])
            endif
    return true
endfunction
function sa___prototype20_s__Damage_onDamage takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer dmg=s__DamageArgs_create()
            set s__DamageArgs_Spell[dmg]=s__HandleTable__getindex(s__Damage_ht,s__Players_player[s__Units_player[sc__Units_Get(s__EventArgs_DamageUnit[e])]])
            set s__DamageArgs_TriggerUnit[dmg]=sc__Units_Get(s__EventArgs_TriggerUnit[e])
            set s__DamageArgs_DamageUnit[dmg]=sc__Units_Get(s__EventArgs_DamageUnit[e])
            set s__DamageArgs_Damage[dmg]=s__EventArgs_Damage[e]
            if ( YDWEIsEventDamageType(DAMAGE_TYPE_MAGIC) and YDWEIsEventAttackType(ATTACK_TYPE_NORMAL) ) then
                set s__DamageArgs_DamageType[dmg]=s__Damage_Magic
            elseif ( YDWEIsEventDamageType(DAMAGE_TYPE_UNIVERSAL) and YDWEIsEventAttackType(ATTACK_TYPE_CHAOS) ) then
                set s__DamageArgs_DamageType[dmg]=s__Damage_Chaos
            elseif ( YDWEIsEventDamageType(DAMAGE_TYPE_NORMAL) and YDWEIsEventAttackType(ATTACK_TYPE_HERO) ) then
                if ( s__EventArgs_AttackDamage[e] == true ) then
                    set s__DamageArgs_DamageType[dmg]=s__Damage_Attack
                else
                    set s__DamageArgs_DamageType[dmg]=s__Damage_Physics
                endif
            else
                set s__DamageArgs_DamageType[dmg]=s__Damage_Attack
            endif
            set s__DamageArgs_isRange[dmg]=s__EventArgs_RangeDamage[e]
            if ( s__Units_isHero[s__DamageArgs_TriggerUnit[dmg]] == true ) then
                call s__Damage_Trigger(s__Damage_onHeroDamage , dmg)
            else
                call s__Damage_Trigger(s__Damage_onUnitDamage , dmg)
            endif
            if ( s__Units_isHero[s__DamageArgs_DamageUnit[dmg]] == true ) then
                call s__Damage_Trigger(s__Damage_onHeroDamageed , dmg)
            else
                call s__Damage_Trigger(s__Damage_onUnitDamageed , dmg)
            endif
            call s__DamageArgs_Destroy(dmg)
    return true
endfunction
function sa___prototype23_s__PlayerPress_Down takes nothing returns boolean
 local player ps=f__arg_player1
 local string e=f__arg_string1

            local integer p=s__Players_Get(ps)
            if ( s__Players_press[p] == 0 ) then
                set s__Players_press[p]=s__PlayerPress__allocate()
            endif
            if ( e == "Q" ) then
                set s__PlayerPress_Q[s__Players_press[p]]=true
            elseif ( e == "W" ) then
                set s__PlayerPress_W[s__Players_press[p]]=true
            elseif ( e == "E" ) then
                set s__PlayerPress_E[s__Players_press[p]]=true
            elseif ( e == "R" ) then
                set s__PlayerPress_R[s__Players_press[p]]=true
            elseif ( e == "D" ) then
                set s__PlayerPress_D[s__Players_press[p]]=true
            elseif ( e == "F" ) then
                set s__PlayerPress_F[s__Players_press[p]]=true
            endif
    return true
endfunction
function sa___prototype23_s__PlayerPress_Up takes nothing returns boolean
 local player ps=f__arg_player1
 local string e=f__arg_string1

            local integer p=s__Players_Get(ps)
            if ( e == "Q" ) then
                set s__PlayerPress_Q[s__Players_press[p]]=false
            elseif ( e == "W" ) then
                set s__PlayerPress_W[s__Players_press[p]]=false
            elseif ( e == "E" ) then
                set s__PlayerPress_E[s__Players_press[p]]=false
            elseif ( e == "R" ) then
                set s__PlayerPress_R[s__Players_press[p]]=false
            elseif ( e == "D" ) then
                set s__PlayerPress_D[s__Players_press[p]]=false
            elseif ( e == "F" ) then
                set s__PlayerPress_F[s__Players_press[p]]=false
            endif
    return true
endfunction
function sa___prototype28_s__Units_Damage takes nothing returns boolean
    call s__Units_Damage(f__arg_integer1,f__arg_unit1,f__arg_integer2,f__arg_integer3,f__arg_real1)
    return true
endfunction
function sa___prototype20_s__Units_onDeath takes nothing returns boolean
 local integer e=f__arg_integer1

            if ( IsUnitType(s__EventArgs_TriggerUnit[e], UNIT_TYPE_HERO) == true ) then
                if ( GetUnitAbilityLevel(s__EventArgs_TriggerUnit[e], 'Aloc') == 0 ) then
                    call s__Units_Trigger(s__Units_onHeroDeath , s__EventArgs_TriggerUnit[e] , s__EventArgs_KillUnit[e])
                else
                    call s__Units_Trigger(s__Units_onAlocDeath , s__EventArgs_TriggerUnit[e] , s__EventArgs_KillUnit[e])
                endif
            elseif ( GetUnitAbilityLevel(s__EventArgs_TriggerUnit[e], 'Aloc') == 0 ) then
                call s__Units_Trigger(s__Units_onUnitDeath , s__EventArgs_TriggerUnit[e] , s__EventArgs_KillUnit[e])
            else
                call s__Units_Trigger(s__Units_onAlocDeath , s__EventArgs_TriggerUnit[e] , s__EventArgs_KillUnit[e])
                call sc__Units_Destroys(s__EventArgs_TriggerUnit[e])
            endif
    return true
endfunction
function sa___prototype20_s__Units_onDeacy takes nothing returns boolean
 local integer e=f__arg_integer1

            if ( IsUnitType(s__EventArgs_TriggerUnit[e], UNIT_TYPE_HERO) == false ) then
                call sc__Units_Destroys(s__EventArgs_TriggerUnit[e])
            endif
    return true
endfunction
function sa___prototype25_s__Winner_Death takes nothing returns boolean
 local integer u=f__arg_integer1
 local integer m=f__arg_integer2

            set s__Players_deaths[s__Units_player[u]]=s__Players_deaths[s__Units_player[u]] + 1
            call sc__KillUi_FlushPlayerData(s__Players_player[s__Units_player[u]])
            if ( s__Players_teamid[s__Units_player[u]] != s__Players_teamid[s__Units_player[m]] and s__Units_unit[m] != null ) then
                set s__Players_kills[s__Units_player[m]]=s__Players_kills[s__Units_player[m]] + 1
                call s__Teams_AddTeamKills(s__Players_teamid[s__Units_player[m]] , 1)
                call sc__KillUi_FlushKillData(s__Players_teamid[s__Units_player[m]])
            endif
            if ( s__Teams_GetTeamKills(s__Players_teamid[s__Units_player[m]]) >= s__Winner_MaxKills ) then
                set s__Winner_GameEnd=true
                call DisplayTimedTextToForce(s__Teams_GetAllPlayers(), 5.00, "游戏结束啦！！！！！！！！！！！ " + s__Teams_GetTeamNameByIndex(s__Players_teamid[s__Units_player[m]]) + " 获得了最终的胜利！！")
                call sc__Winner_ShowWin(s__Players_teamid[s__Units_player[m]])
            endif
    return true
endfunction
function sa___prototype20_s__DazzleMaster_anon__28 takes nothing returns boolean
 local integer dash=f__arg_integer1

                local integer u=s__Units_Get(s__Dash_Unit[dash])
                local integer mj
                local integer tmp
                local integer s=0
                local real x
                local real y
                if ( s__Dash_NowDis[dash] > 100 and s__Dash_NowDis[dash] < 115 ) then
                    call s__Units_SetF(u,s__Dash_Angle[dash] , true)
                    call s__Units_AnimeId(u,13)
                    set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e009' , 'A00B' , 0 , s__Units_X(u) , s__Units_Y(u) , s__Dash_Angle[dash] , 2 , 0.7 , 2 , "death" , "wind1.mdx")
                    call s__Units_SetH(mj,150)
                    call s__Dash_Start(s__Units_unit[mj] , s__Dash_Angle[dash] , 250 , s__Dash_SUB , 10 , true , false)
                    set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e009' , 'A00B' , 0 , s__Units_X(u) , s__Units_Y(u) , s__Dash_Angle[dash] , 2 , 1 , 1.5 , "death" , "wind1.mdx")
                    call s__Units_SetH(mj,200)
                    call s__Dash_Start(s__Units_unit[mj] , s__Dash_Angle[dash] , 350 , s__Dash_SUB , 15 , true , false)
                    set x=s__Dash_X[dash] + 100 * CosBJ(s__Dash_Angle[dash])
                    set y=s__Dash_Y[dash] + 100 * SinBJ(s__Dash_Angle[dash])
                    call GroupEnumUnitsInRange(tmp_group, x, y, 200, Condition(function GroupIsAliveNotAloc))
                    if ( GroupNumber(tmp_group) != 0 ) then
                        loop
                        exitwhen ( FirstOfGroup(tmp_group) == null )
                            set tmp=s__Units_Get(FirstOfGroup(tmp_group))
                            call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
                            if ( IsUnitEnemy(s__Units_unit[tmp], s__Players_player[s__Units_player[u]]) == true ) then
                                set s=s + 1
                            endif
                        endloop
                        call GroupClear(tmp_group)
                        if ( s != 0 ) then
                            call GroupEnumUnitsInRange(tmp_group, x, y, 200, Condition(function GroupIsAliveNotAloc))
                            call s__DazzleMaster_AddDazzle(s__Units_unit[u] , 2)
                            set tmp=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e009' , 'A002' , 0 , s__Dash_X[dash] , s__Dash_Y[dash] , s__Dash_Angle[dash] , 2 , 2.5 , 2 , "stand" , "wind.mdx")
                            call s__Units_SetH(tmp,200)
                            call s__Dash_Start(s__Units_unit[tmp] , s__Dash_Angle[dash] + 180 , 450 , s__Dash_SUB , 60 , true , false)
                            loop
                            exitwhen ( FirstOfGroup(tmp_group) == null )
                                set tmp=s__Units_Get(FirstOfGroup(tmp_group))
                                call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
                                if ( IsUnitEnemy(s__Units_unit[tmp], s__Players_player[s__Units_player[u]]) == true ) then
                                    call s__Buffs_Skill(s__Units_unit[tmp] , 'A00C' , 1)
                                    call s__Units_Damage(u,s__Units_unit[tmp] , s__Damage_Physics , 'A00B' , s__Units_Agi(u) * 6 + s__Units_Str(u) * 6)
                                    call s__Dash_Start(s__Units_unit[tmp] , s__Dash_Angle[dash] , 300 , s__Dash_SUB , 90 , true , true)
                                    call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl", s__Units_unit[tmp], "chest"))
                                endif
                            endloop
                            call GroupClear(tmp_group)
                        endif
                    else
                        call GroupClear(tmp_group)
                    endif
                endif
                if ( s__Dash_NowDis[dash] > 180 ) then
                    call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl", s__Dash_X[dash], s__Dash_Y[dash]))
                    if ( s__Dash_NowDis[dash] < 197 ) then
                        call s__Units_Alpha(u,255)
                    else
                        call s__Units_Alpha(u,0)
                    endif
                else
                    call s__Units_Alpha(u,0)
                endif
    return true
endfunction
function sa___prototype20_s__DazzleMaster_anon__29 takes nothing returns boolean
 local integer dash=f__arg_integer1

                local integer u=s__Units_Get(s__Dash_Unit[dash])
                call s__Units_Pause(u,false)
                call s__Units_Alpha(u,255)
    return true
endfunction
function sa___prototype20_s__DazzleMaster_anon__30 takes nothing returns boolean
 local integer dash=f__arg_integer1

                local integer data=(s__Dash_Obj[dash])
                local integer u=(s___Data_c[s__Data_c[data]])
                local integer tmp
                call GroupEnumUnitsInRange(tmp_group, s__Units_X(u) + 100 * CosBJ(s__Dash_Angle[dash]), s__Units_Y(u) + 100 * SinBJ(s__Dash_Angle[dash]), 90, Condition(function GroupIsAliveNotAloc))
                loop
                exitwhen ( FirstOfGroup(tmp_group) == null )
                    set tmp=s__Units_Get(FirstOfGroup(tmp_group))
                    call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
                    if ( IsUnitEnemy(s__Units_unit[tmp], s__Players_player[s__Units_player[u]]) == true and IsUnitInGroup(s__Units_unit[tmp], s___Data_g[s__Data_g[data]]) == false ) then
                        call GroupAddUnit(s___Data_g[s__Data_g[data]], s__Units_unit[tmp])
                        call s__Buffs_Skill(s__Units_unit[tmp] , 'A00A' , 1)
                        call s__HitFlys_Add(s__Units_unit[tmp] , 25)
                        call s__Units_Damage(u,s__Units_unit[tmp] , s__Damage_Magic , 'A009' , s__Units_Agi(u) * 3 + s__Units_Str(u) * 4)
                        call DestroyEffect(AddSpecialEffectTarget("bd2d2.mdx", s__Units_unit[tmp], "chest"))
                        if ( s__Dash_NowDis[dash] < 500 ) then
                            call s__Dash_Start(s__Units_unit[tmp] , s__Dash_Angle[dash] , 500 - s__Dash_NowDis[dash] , s__Dash_SUB , 90 , true , true)
                        endif
                        if ( s___Data_i[s__Data_i[data]] == 0 ) then
                            set s___Data_i[s__Data_i[data]]=1
                            call s__DazzleMaster_AddDazzle(s__Units_unit[u] , 1)
                        endif
                    endif
                endloop
                call GroupClear(tmp_group)
                if ( s__Dash_Speed[dash] > 15 and s__Dash_Speed[dash] < 40 ) then
                    call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl", s__Dash_X[dash], s__Dash_Y[dash]))
                endif
                if ( s__Dash_Speed[dash] < 1.5 ) then
                    call s__Dash_Stop(dash)
                endif
    return true
endfunction
function sa___prototype20_s__DazzleMaster_anon__31 takes nothing returns boolean
 local integer dash=f__arg_integer1

                local integer data=(s__Dash_Obj[dash])
                local integer u=(s___Data_c[s__Data_c[data]])
                call DestroyGroup(s___Data_g[s__Data_g[data]])
                set s___Data_g[s__Data_g[data]]=null
                call s__Units_Pause(u,false)
                call s__Units_AnimeSpeed(u,1)
                call s__Data_Destroy(data)
    return true
endfunction
function sa___prototype20_s__DazzleMaster_Q takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer dash
            local integer data=s__Data_create('A009')
            call s__Units_Pause(u,true)
            call s__Units_AnimeId(u,6)
            call s__Units_AnimeSpeed(u,0.7)
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_i[s__Data_i[data]]=0
            set s___Data_g[s__Data_g[data]]=CreateGroup()
            call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00B' , 0 , s__Units_X(u) , s__Units_Y(u) , s__Spell_Angle[e] , 4 , 1 , 2.5 , "stand" , "dust2.mdx")
            set dash=s__Dash_Start(s__Units_unit[u] , s__Spell_Angle[e] , 600 , s__Dash_SUB , 60 , true , false)
            set s__Dash_Obj[dash]=data
            set s__Dash_onMove[dash]=(13)
            set s__Dash_onEnd[dash]=(14)
            call s__Spell_Destroy(e)
    return true
endfunction
function sa___prototype20_s__DazzleMaster_W takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer dash
            call s__Units_Pause(u,true)
            call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00B' , 0 , s__Units_X(u) , s__Units_Y(u) , 0 , 2 , 1 , 1 , "stand" , "dust1.mdx")
            call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00B' , 0 , s__Units_X(u) , s__Units_Y(u) , s__Spell_Angle[e] , 2 , 1.5 , 2 , "stand" , "dust2.mdx")
            call s__Util_Duang(s__Units_X(u) , s__Units_Y(u) , 0.5 , 200 , 200 , - 82 , 0.04 , 100)
            set dash=s__Dash_Start(s__Units_unit[u] , s__Spell_Angle[e] , 250 , s__Dash_SUB , 40 , true , false)
            set s__Dash_onMove[dash]=(11)
            set s__Dash_onEnd[dash]=(12)
            call s__Spell_Destroy(e)
    return true
endfunction
function sa___prototype20_s__DazzleMaster_HERO_START takes nothing returns boolean
 local integer e=f__arg_integer1

            if ( s__Spell_Id[e] == 'A009' ) then
                call s__Units_FlushAnimeId(s__Units_Get(s__Spell_Spell[e]),5)
            endif
            call s__Spell_Destroy(e)
    return true
endfunction
function sa___prototype20_s__DazzleMaster_HERO_STOP takes nothing returns boolean
 local integer e=f__arg_integer1

            call s__Spell_Destroy(e)
    return true
endfunction
function sa___prototype20_s__DazzleMaster_Attack takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer data
            if ( s__Units_IsAbility(s__DamageArgs_DamageUnit[e],'A008') == true and s__DamageArgs_DamageType[e] == s__Damage_Attack ) then
                set data=(s__Units_Obj[s__DamageArgs_DamageUnit[e]])
                if ( s___Data_i[s__Data_i[data]] == 2 ) then
                    set s___Data_i[s__Data_i[data]]=0
                    call sc__DazzleMaster_AddDazzle(s__Units_unit[s__DamageArgs_DamageUnit[e]] , 0)
                else
                    set s___Data_i[s__Data_i[data]]=s___Data_i[s__Data_i[data]] + 1
                endif
            endif
    return true
endfunction
function sa___prototype25_s__DazzleMaster_Spawn takes nothing returns boolean
 local integer u=f__arg_integer1
 local integer m=f__arg_integer2

            local timer t
            local integer data
            if ( s__Units_IsAbility(u,'A008') == true ) then
                set t=NewTimer()
                set data=s__Data_create('A008')
                set s___Data_c[s__Data_c[data]]=u
                set s___Data_r[s__Data_r[data]]=0
                set s___Data_r[s__Data_r[data]+1]=0
                set s___Data_r[s__Data_r[data]+2]=0
                set s___Data_i[s__Data_i[data]]=0
                set s___Data_g[s__Data_g[data]]=CreateGroup()
                set s___Data_u[s__Data_u[data]]=null
                call s__Units_AddObj(u,data)
                call SetTimerData(t , data)
                call TimerStart(t, 0.01, true, function s__DazzleMaster_anon__27)
                set t=null
            endif
    return true
endfunction
function sa___prototype25_s__DazzleMaster_Death takes nothing returns boolean
 local integer u=f__arg_integer1
 local integer m=f__arg_integer2

            local integer data
            if ( s__Units_aid[u] == 'A008' ) then
                set data=(s__Units_Obj[u])
                call GroupRemoveUnit(s___Data_g[s__Data_g[data]], s__Units_unit[u])
                call s__Units_RemoveObj(u)
            endif
    return true
endfunction
function sa___prototype22_s__KillUi_Show takes nothing returns boolean
 local string e=f__arg_string1

            if ( e == "F2" ) then
                call DzFrameShow(s__KillUi_KillBackgroundMaxLine, true)
            endif
    return true
endfunction
function sa___prototype22_s__KillUi_Hide takes nothing returns boolean
 local string e=f__arg_string1

            if ( e == "F2" ) then
                call DzFrameShow(s__KillUi_KillBackgroundMaxLine, false)
            endif
    return true
endfunction
function sa___prototype20_s__OrdinaryWizard___OrdinaryWizard_anon__20 takes nothing returns boolean
 local integer dash=f__arg_integer1

                local integer data=(s__Dash_Obj[dash])
                local integer e=(s___Data_c[s__Data_c[data]])
                local integer u=s__Units_Get(s__Spell_Spell[e])
                if ( s__Dash_DashType[dash] == s__Dash_PWX ) then
                    if ( s___Data_r[s__Data_r[data]] < 700 ) then
                        set s___Data_r[s__Data_r[data]]=s___Data_r[s__Data_r[data]] + 8
                        set s__Dash_Angle[dash]=s__Dash_Angle[dash] + 8
                        if ( s___Data_r[s__Data_r[data]] > 300 ) then
                            call s__Units_SetH(u,1000 * s__Util_GetPwx(3.99 , s___Data_r[s__Data_r[data]] - 400 , 1400))
                            call s__Units_SetF(u,s__Dash_Angle[dash] , true)
                        endif
                    else
                        set s__Dash_Angle[dash]=s__Util_XYEX(s__Dash_X[dash] , s__Dash_Y[dash] , s__Spell_X[e] , s__Spell_Y[e])
                        set s___Data_r[s__Data_r[data]+1]=s__Util_XY2EX(s__Dash_X[dash] , s__Dash_Y[dash] , s__Spell_X[e] , s__Spell_Y[e])
                        set s__Dash_NowDis[dash]=0
                        set s__Dash_MaxDis[dash]=s___Data_r[s__Data_r[data]+1]
                        set s__Dash_MaxSpeed[dash]=130
                        set s__Dash_DashType[dash]=s__Dash_ADD
                        call s__Units_SetF(u,s__Dash_Angle[dash] , false)
                        call s__Units_Anime(u,"attack")
                    endif
                else
                    call s__Units_SetH(u,1000 * ( 1 - s__Util_GetPwx(3.99 , s__Dash_NowDis[dash] / 2 , s__Dash_MaxDis[dash]) ))
                    if ( s__Dash_MaxDis[dash] - s__Dash_NowDis[dash] < 200 ) then
                        set s___Data_r[s__Data_r[data]+2]=1
                        call s__Dash_Stop(dash)
                    endif
                endif
    return true
endfunction
function sa___prototype20_s__OrdinaryWizard___OrdinaryWizard_anon__21 takes nothing returns boolean
 local integer dash=f__arg_integer1

                local integer data=(s__Dash_Obj[dash])
                local integer e=(s___Data_c[s__Data_c[data]])
                local integer u=s__Units_Get(s__Spell_Spell[e])
                local integer mj
                local real x=s__Units_X(u)
                local real y=s__Units_Y(u)
                local integer i
                if ( s___Data_r[s__Data_r[data]+2] == 1 ) then
                    call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A006' , 0 , x , y , 0 , 4 , 1.75 , 0.5 , "stand" , "Abilities\\Spells\\Other\\Doom\\DoomDeath.mdl")
                    call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A006' , 0 , x , y , 0 , 3.5 , 1.25 , 2 , "birth" , "Abilities\\Spells\\Human\\FlameStrike\\FlameStrike.mdl")
                    call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A006' , 0 , x , y , 0 , 3.5 , 2 , 1.5 , "death" , "Abilities\\Spells\\Other\\Volcano\\VolcanoMissile.mdl")
                    call s__Units_DelayModel(u,"units\\human\\HeroBloodElf\\HeroBloodElf.mdx" , 0.3)
                    call GroupDamage(u , x , y , 300 , s__Units_Int(s__Players_hero[s__Units_player[u]]) * 20.0 , s__Damage_Magic , 'A006' , false)
                    if ( s__Players_lv15[s__Units_player[u]] != null ) then //是否触发E
                        if ( s__Units_IsAbility(u,'B000') == false ) then
                            call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A006' , 0 , x , y , 0 , 5 , 1 , 1.5 , "death" , "fire3.mdx")
                            call s__Buffs_Add(s__Units_unit[u] , 'A000' , 'B000' , 1 , false)
                            set i=0
                            loop
                            exitwhen ( i >= 12 )
                                set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A005' , 0 , x , y , I2R(i) * 30 , 1.5 , 2.5 , 1 , "stand" , "Environment\\UndeadBuildingFire\\UndeadLargeBuildingFire1.mdl")
                                call s__Dash_Start(s__Units_unit[mj] , s__Units_F(mj) , 600 , s__Dash_SUB , 40 , true , false)
                            set i=i + 1
                            endloop
                        endif
                    endif
                else
                    call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A006' , 0 , s__Units_X(u) , s__Units_Y(u) , s__Spell_Angle[e] , 2 , 2.5 , 1 , "death" , "Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile.mdl")
                    call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Human\\MarkOfChaos\\MarkOfChaosTarget.mdl", s__Units_X(u), s__Units_Y(u)))
                    call DzSetUnitModel(s__Units_unit[u], "units\\human\\HeroBloodElf\\HeroBloodElf.mdx")
                endif
                call s__Units_SetH(u,0)
                call s__Units_AnimeSpeed(u,1)
                call s__Units_Pause(u,false)
                call s__Spell_Destroy(e)
                call s__Data_Destroy(data)
    return true
endfunction
function sa___prototype20_s__OrdinaryWizard___OrdinaryWizard_anon__23 takes nothing returns boolean
 local integer da=f__arg_integer1

                call s__Units_Anime(s__Units_Get(s__Dash_Unit[da]),"death")
    return true
endfunction
function sa___prototype20_s__OrdinaryWizard___OrdinaryWizard_anon__24 takes nothing returns boolean
 local integer da=f__arg_integer1

                local integer u=(s__Dash_Obj[da])
                local integer tmp
                call GroupEnumUnitsInRange(tmp_group, s__Units_X(u), s__Units_Y(u), 150, Condition(function GroupIsAliveNotAloc))
                loop
                exitwhen ( FirstOfGroup(tmp_group) == null )
                    set tmp=s__Units_Get(FirstOfGroup(tmp_group))
                    if ( IsUnitEnemy(s__Units_unit[tmp], s__Players_player[s__Units_player[u]]) == true ) then
                        call s__Units_Position(tmp,s__Units_X(u) , s__Units_Y(u) , true)
                    endif
                    call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
                endloop
                call GroupClear(tmp_group)
                if ( s__Dash_Speed[da] < 3 ) then
                    call s__Dash_Stop(da)
                    call s__Units_Anime(u,"death")
                endif
    return true
endfunction
function sa___prototype20_s__OrdinaryWizard___OrdinaryWizard_anon__25 takes nothing returns boolean
 local integer d=f__arg_integer1

                local integer u=(s__Dash_Obj[d])
                local integer tmp=s__Units_Get(s__Dash_Unit[d])
                local real dis
                local real f
                if ( s__Dash_NowDis[d] > 200 ) then
                    if ( s__Players_lv15[s__Units_player[u]] != null ) then //是否触发E
                        if ( s__Units_IsAbility(u,'B000') == false ) then
                            set dis=GetRandomReal(0, 150)
                            set f=GetRandomReal(0, 360)
                            call s__Buffs_Add(s__Units_unit[u] , 'A000' , 'B000' , 0.03 , false)
                            call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A005' , 0 , s__Units_X(tmp) + dis * CosBJ(f) , s__Units_Y(tmp) + dis * SinBJ(f) , f , 1.5 , 2.5 , 1 , "stand" , "Environment\\UndeadBuildingFire\\UndeadLargeBuildingFire1.mdl")
                        endif
                    endif
                    call GroupEnumUnitsInRange(tmp_group, s__Units_X(tmp), s__Units_Y(tmp), 75, Condition(function GroupIsAliveNotAloc))
                    loop
                    exitwhen ( FirstOfGroup(tmp_group) == null )
                        set tmp=s__Units_Get(FirstOfGroup(tmp_group))
                        if ( IsUnitEnemy(s__Units_unit[tmp], s__Players_player[s__Units_player[u]]) == true ) then
                            call s__Dash_Stop(d)
                            exitwhen true
                        endif
                        call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
                    endloop
                    call GroupClear(tmp_group)
                endif
    return true
endfunction
function sa___prototype20_s__OrdinaryWizard___OrdinaryWizard_anon__26 takes nothing returns boolean
 local integer d=f__arg_integer1

                local integer i
                local integer u=s__Units_Get(s__Dash_Unit[d])
                local integer tmp
                local real x
                local real y
                local effect e
                call s__Units_Anime(u,"death")
                call GroupEnumUnitsInRange(tmp_group, s__Units_X(u), s__Units_Y(u), 250, Condition(function GroupIsAliveNotAloc))
                set i=CountUnitsInGroup(tmp_group)
                call GroupClear(tmp_group)
                if ( i != 0 ) then
                    call s__Units_Position(u,s__Units_X(u) + 100 * CosBJ(s__Dash_Angle[d]) , s__Units_Y(u) + 100 * SinBJ(s__Dash_Angle[d]) , false)
                    set x=s__Units_X(u)
                    set y=s__Units_Y(u)
                    call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\FragDriller\\FragDriller.mdl", x, y))
                    set e=AddSpecialEffect("abilities\\weapons\\DemolisherMissile\\DemolisherMissile.mdl", x, y)
                    call EXSetEffectSize(e, 2)
                    call DestroyEffect(e)
                    set e=AddSpecialEffect("Abilities\\Weapons\\DemolisherFireMissile\\DemolisherFireMissile.mdl", x, y)
                    call EXSetEffectSize(e, 2)
                    call EXSetEffectSpeed(e, 2.5)
                    call DestroyEffect(e)
                    set e=null
                    call GroupDamage(u , x , y , 250 , s__Units_Int(s__Players_hero[s__Units_player[u]]) * 5.0 , s__Damage_Magic , 'A002' , false)
                    set u=(s__Dash_Obj[d])
                    if ( s__Players_lv15[s__Units_player[u]] != null ) then //是否触发E
                        call s__Buffs_Add(s__Units_unit[u] , 'A000' , 'B000' , 7 , false)
                        set i=0
                        loop
                        exitwhen ( i >= 4 )
                            set tmp=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A005' , 0 , x , y , I2R(i) * 90 , 1.5 , 2.5 , 1 , "stand" , "Environment\\UndeadBuildingFire\\UndeadLargeBuildingFire1.mdl")
                            call s__Dash_Start(s__Units_unit[tmp] , s__Units_F(tmp) , 300 , s__Dash_ADD , 30 , true , false)
                        set i=i + 1
                        endloop
                    endif
                endif
    return true
endfunction
function sa___prototype20_s__OrdinaryWizard___OrdinaryWizard_Q takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            local real x=s__Units_X(u)
            local real y=s__Units_Y(u)
            local real f=s__Spell_Angle[e]
            local integer dash
            local integer mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e009' , 'A002' , 0 , x + 100 * CosBJ(f) , y + 100 * SinBJ(f) , f , 2 , 2 , 1.5 , "stand" , "wind.mdx")
            call s__Units_SetH(mj,200)
            set dash=s__Dash_Start(s__Units_unit[mj] , f , 450 , s__Dash_SUB , 60 , true , false)
            set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A002' , 1 , x + 100 * CosBJ(f) , y + 100 * SinBJ(f) , f , 2 , 1.4 , 1 , "stand" , "dust.mdx")
            call s__Units_SetH(mj,50)
            set dash=s__Dash_Start(s__Units_unit[mj] , f , 1600 , s__Dash_SUB , 70 , true , false)
            set s__Dash_Obj[dash]=mj
            set s__Dash_onEnd[dash]=(22)
            set s__Dash_onMove[dash]=(23)
            call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl", x + 100 * CosBJ(f), y + 100 * SinBJ(f)))
            call DestroyEffect(AddSpecialEffectTarget("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl", s__Units_unit[u], "hand right"))
            set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A002' , 2 , x + 100 * CosBJ(f) , y + 100 * SinBJ(f) , f , 1.5 , 2 , 1 , "stand" , "Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl")
            call s__Units_SetH(mj,120)
            call SetUnitPosition(s__Units_unit[mj], s__Units_X(mj), s__Units_Y(mj))
            set dash=s__Dash_Start(s__Units_unit[mj] , f , 1300 , s__Dash_ADD , 50 , true , false)
            set s__Dash_Obj[dash]=u
            set s__Dash_NowDis[dash]=10
            set s__Dash_onMove[dash]=(24)
            set s__Dash_onEnd[dash]=(25)
            call s__Units_AnimeSpeed(u,1)
            call s__Spell_Destroy(e)
    return true
endfunction
function sa___prototype20_s__OrdinaryWizard___OrdinaryWizard_W takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer mj
            local timer t=NewTimer()
            call s__Units_Pause(u,true)
            call s__Units_AnimeId(u,6)
            call s__Units_AnimeSpeed(u,2)
            set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A004' , 0 , s__Units_X(u) , s__Units_Y(u) , 0 , 2 , 1.5 , 1.5 , "birth" , "fire2.mdx")
            call s__Units_DelayAnime(mj,2 , 0.4)
            call s__Units_PositionEnabled(u,false)
            call SetTimerData(t , e)
            call GroupEnumUnitsInRange(tmp_group, s__Units_X(u), s__Units_Y(u), 300, Condition(function GroupIsAliveNotAloc))
            loop
            exitwhen ( FirstOfGroup(tmp_group) == null )
                set mj=s__Units_Get(FirstOfGroup(tmp_group))
                if ( IsUnitEnemy(s__Units_unit[mj], s__Players_player[s__Units_player[u]]) == true ) then
                    set s__Buffs_Type[s__Buffs_Add(s__Units_unit[mj] , 'A007' , 'B001' , 1.5 , false)]=s__Buffs_TYPE_SUB + s__Buffs_TYPE_DISPEL_TRUE
                endif
                call GroupRemoveUnit(tmp_group, s__Units_unit[mj])
            endloop
            call GroupClear(tmp_group)
            call TimerStart(t, 0.4, false, function s__OrdinaryWizard___OrdinaryWizard_anon__22)
            set t=null
    return true
endfunction
function sa___prototype20_s__OrdinaryWizard___OrdinaryWizard_R takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer i
            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer dash
            local integer data
            call s__Units_Pause(u,true)
            call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A006' , 0 , s__Units_X(u) , s__Units_Y(u) , s__Spell_Angle[e] , 2 , 2.5 , 1 , "death" , "Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile.mdl")
            set i=0
            loop
            exitwhen ( i >= 2 )
                call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Human\\MarkOfChaos\\MarkOfChaosTarget.mdl", s__Units_X(u), s__Units_Y(u)))
            set i=i + 1
            endloop
            call s__Units_DelayModel(u,"units\\human\\phoenix\\phoenix.mdx" , 0)
            set data=s__Data_create('A006')
            set s___Data_c[s__Data_c[data]]=e
            set s___Data_r[s__Data_r[data]]=0
            set dash=s__Dash_Start(s__Units_unit[u] , s__Spell_Angle[e] , 3500 , s__Dash_PWX , 90 , true , false)
            set s__Dash_Obj[dash]=data
            set s__Dash_onMove[dash]=(20)
            set s__Dash_onEnd[dash]=(21)
    return true
endfunction
function sa___prototype20_s__OrdinaryWizard___OrdinaryWizard_HERO_START takes nothing returns boolean
 local integer e=f__arg_integer1

            if ( s__Spell_Id[e] == 'A002' ) then
                call s__Units_AnimeSpeed(s__Units_Get(s__Spell_Spell[e]),2.5)
                call s__Units_FlushAnimeId(s__Units_Get(s__Spell_Spell[e]),5)
            endif
            if ( s__Spell_Id[e] == 'A006' ) then
                call s__Units_FlushAnimeId(s__Units_Get(s__Spell_Spell[e]),3)
                call s__Units_AnimeSpeed(s__Units_Get(s__Spell_Spell[e]),1.5)
            endif
            call s__Spell_Destroy(e)
    return true
endfunction
function sa___prototype20_s__OrdinaryWizard___OrdinaryWizard_HERO_STOP takes nothing returns boolean
 local integer e=f__arg_integer1

            call s__Units_AnimeSpeed(s__Units_Get(s__Spell_Spell[e]),1)
            call s__Spell_Destroy(e)
    return true
endfunction
function sa___prototype25_s__OrdinaryWizard___OrdinaryWizard_E takes nothing returns boolean
 local integer u=f__arg_integer1
 local integer m=f__arg_integer2

            if ( s__Units_aid[u] == 'A005' and s__Units_aidindex[u] == 0 ) then
                call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Other\\Doom\\DoomDeath.mdl", s__Units_X(u), s__Units_Y(u)))
                call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Other\\Incinerate\\FireLordDeathExplode.mdl", s__Units_X(u), s__Units_Y(u)))
                call GroupDamage(u , s__Units_X(u) , s__Units_Y(u) , 150 , s__Units_Int(s__Players_hero[s__Units_player[u]]) * 2.0 , s__Damage_Magic , 0 , false)
            endif
    return true
endfunction
function sa___prototype25_s__Respawn___Respawn_Death takes nothing returns boolean
 local integer u=f__arg_integer1
 local integer m=f__arg_integer2

            local integer r=s__Respawn___Respawn__allocate()
            if ( s__Players_teamid[s__Units_player[u]] != s__Players_teamid[s__Units_player[m]] and s__Units_unit[m] != null ) then
                set s__Players_lifekill[s__Units_player[m]]=s__Players_lifekill[s__Units_player[m]] + 1
                call ForForce(s__Teams_GetTeamForce(s__Players_player[s__Units_player[m]]), function s__Respawn___Respawn_anon__19)
                call DisplayTimedTextToForce(s__Teams_GetAllPlayers(), 5.00, s__Players_name[s__Units_player[m]] + " 及友军因击杀 " + s__Players_name[s__Units_player[u]] + " 而获得了|cffffcc00$300|r")
                if ( s__Players_randomhero[s__Units_player[m]] > 0 ) then
                    set s__Players_randomhero[s__Units_player[m]]=s__Players_randomhero[s__Units_player[m]] - 5.0
                endif
            endif
            if ( s__Players_randomhero[s__Units_player[u]] < 100 ) then
                set s__Players_randomhero[s__Units_player[u]]=s__Players_randomhero[s__Units_player[u]] + 5.0
            endif
            set s__Respawn___Respawn_RespawnTime[r]=s__Respawn___Respawn_MaxRespawnTime
            set s__Respawn___Respawn_RespawnSaveMoney[r]=200 + R2I(( s__Players_lifekill[s__Units_player[u]] * 300 ) * 1.2)
            set s__Respawn___Respawn_RespawnSelect[r]=0
            set s__Respawn___Respawn_RespawnSelectLast[r]=0
            set s__Players_isdeath[s__Units_player[u]]=true
            set s__Players_lifekill[s__Units_player[u]]=0
            set s__Players_respawn[s__Units_player[u]]=r
            call sc__Respawn___Respawn_Show(s__Players_player[s__Units_player[u]] , true)
    return true
endfunction
function sa___prototype22_s__Respawn___Respawn_Press takes nothing returns boolean
 local string e=f__arg_string1

            local integer p=s__Players_Get(s__Players_localplayer)
            local integer r=s__Players_respawn[p]
            if ( s__Players_isdeath[p] == true ) then
                if ( e == "C" ) then
                    if ( s__Respawn___Respawn_RespawnShow == false ) then
                        call s__Respawn___Respawn_Show(s__Players_player[p] , true)
                    else
                        call s__Respawn___Respawn_Show(s__Players_player[p] , false)
                    endif
                endif
            endif
    return true
endfunction
function sa___prototype23_s__Respawn___Respawn_PressSnyc takes nothing returns boolean
 local player ps=f__arg_player1
 local string e=f__arg_string1

            local integer p=s__Players_Get(ps)
            local integer r=s__Players_respawn[p]
            if ( s__Players_isdeath[p] == true ) then
                if ( e == "Q" ) then
                    set s__Respawn___Respawn_RespawnSelect[r]=0
                    call s__Respawn___Respawn_Flush(s__Players_player[p])
                elseif ( e == "W" ) then
                    set s__Respawn___Respawn_RespawnSelect[r]=1
                    call s__Respawn___Respawn_Flush(s__Players_player[p])
                elseif ( e == "E" ) then
                    set s__Respawn___Respawn_RespawnSelect[r]=2
                    call s__Respawn___Respawn_Flush(s__Players_player[p])
                endif
            endif
    return true
endfunction

function jasshelper__initstructs548236718 takes nothing returns nothing
    set st__Respawn___Respawn_Flush=CreateTrigger()
    call TriggerAddCondition(st__Respawn___Respawn_Flush,Condition( function sa__Respawn___Respawn_Flush))
    set st__Respawn___Respawn_Show=CreateTrigger()
    call TriggerAddCondition(st__Respawn___Respawn_Show,Condition( function sa__Respawn___Respawn_Show))
    set st__KillUi_FlushPlayerData=CreateTrigger()
    call TriggerAddCondition(st__KillUi_FlushPlayerData,Condition( function sa__KillUi_FlushPlayerData))
    set st__KillUi_FlushData=CreateTrigger()
    call TriggerAddCondition(st__KillUi_FlushData,Condition( function sa__KillUi_FlushData))
    set st__KillUi_FlushKillData=CreateTrigger()
    call TriggerAddCondition(st__KillUi_FlushKillData,Condition( function sa__KillUi_FlushKillData))
    set st__DazzleMaster_AddDazzle=CreateTrigger()
    call TriggerAddCondition(st__DazzleMaster_AddDazzle,Condition( function sa__DazzleMaster_AddDazzle))
    set st__Winner_ShowWin=CreateTrigger()
    call TriggerAddCondition(st__Winner_ShowWin,Condition( function sa__Winner_ShowWin))
    set st__HeroRares_Repeat=CreateTrigger()
    call TriggerAddCondition(st__HeroRares_Repeat,Condition( function sa__HeroRares_Repeat))
    set st__HeroRares_AddRandomHero=CreateTrigger()
    call TriggerAddCondition(st__HeroRares_AddRandomHero,Condition( function sa__HeroRares_AddRandomHero))
    set st__Units_DelayAnime=CreateTrigger()
    call TriggerAddCondition(st__Units_DelayAnime,Condition( function sa__Units_DelayAnime))
    set st__Units_AnimeSpeed=CreateTrigger()
    call TriggerAddCondition(st__Units_AnimeSpeed,Condition( function sa__Units_AnimeSpeed))
    set st__Units_Position=CreateTrigger()
    call TriggerAddCondition(st__Units_Position,Condition( function sa__Units_Position))
    set st__Units_Destroys=CreateTrigger()
    call TriggerAddCondition(st__Units_Destroys,Condition( function sa__Units_Destroys))
    set st__Units_Get=CreateTrigger()
    call TriggerAddCondition(st__Units_Get,Condition( function sa__Units_Get))
    set st__Units_Spawn=CreateTrigger()
    call TriggerAddCondition(st__Units_Spawn,Condition( function sa__Units_Spawn))
    set st__Units_Kill=CreateTrigger()
    call TriggerAddCondition(st__Units_Kill,Condition( function sa__Units_Kill))
    set st__HitFlys_Find=CreateTrigger()
    call TriggerAddCondition(st__HitFlys_Find,Condition( function sa__HitFlys_Find))
    set st__HitFlys_Trigger=CreateTrigger()
    call TriggerAddCondition(st__HitFlys_Trigger,Condition( function sa__HitFlys_Trigger))
    set st__Events_On=CreateTrigger()
    call TriggerAddCondition(st__Events_On,Condition( function sa__Events_On))
    set st__Dash_Destroy=CreateTrigger()
    call TriggerAddCondition(st__Dash_Destroy,Condition( function sa__Dash_Destroy))
    set st__Dash_Stop=CreateTrigger()
    call TriggerAddCondition(st__Dash_Stop,Condition( function sa__Dash_Stop))
    set st__Dash_Trigger=CreateTrigger()
    call TriggerAddCondition(st__Dash_Trigger,Condition( function sa__Dash_Trigger))
    set st__Buffs_Find=CreateTrigger()
    call TriggerAddCondition(st__Buffs_Find,Condition( function sa__Buffs_Find))
    set st__Buffs_Skill=CreateTrigger()
    call TriggerAddCondition(st__Buffs_Skill,Condition( function sa__Buffs_Skill))
    set st__Buffs_Trigger=CreateTrigger()
    call TriggerAddCondition(st__Buffs_Trigger,Condition( function sa__Buffs_Trigger))
    set st__Table__GTable_onDestroy[9]=CreateTrigger()
    set st__Table__GTable_onDestroy[10]=st__Table__GTable_onDestroy[9]
    set st__Table__GTable_onDestroy[11]=st__Table__GTable_onDestroy[9]
    set st__Table__GTable_onDestroy[12]=st__Table__GTable_onDestroy[9]
    call TriggerAddCondition(st__Table__GTable_onDestroy[9],Condition( function sa__Table__GTable_onDestroy))
    set st__HandleTable__getindex=CreateTrigger()
    call TriggerAddCondition(st__HandleTable__getindex,Condition( function sa__HandleTable__getindex))
    set st__HandleTable__setindex=CreateTrigger()
    call TriggerAddCondition(st__HandleTable__setindex,Condition( function sa__HandleTable__setindex))
    set st___prototype20[1]=CreateTrigger()
    call TriggerAddAction(st___prototype20[1],function sa___prototype20_Disconnect___onDisconnect)
    call TriggerAddCondition(st___prototype20[1],Condition(function sa___prototype20_Disconnect___onDisconnect))
    set st___prototype20[8]=CreateTrigger()
    call TriggerAddAction(st___prototype20[8],function sa___prototype20_LevelUp___LvUp)
    call TriggerAddCondition(st___prototype20[8],Condition(function sa___prototype20_LevelUp___LvUp))
    set st___prototype20[2]=CreateTrigger()
    call TriggerAddAction(st___prototype20[2],function sa___prototype20_s__Spell_onUnitSpell)
    call TriggerAddCondition(st___prototype20[2],Condition(function sa___prototype20_s__Spell_onUnitSpell))
    set st___prototype20[3]=CreateTrigger()
    call TriggerAddAction(st___prototype20[3],function sa___prototype20_s__Spell_onUnitStartSpell)
    call TriggerAddCondition(st___prototype20[3],Condition(function sa___prototype20_s__Spell_onUnitStartSpell))
    set st___prototype20[4]=CreateTrigger()
    call TriggerAddAction(st___prototype20[4],function sa___prototype20_s__Spell_onUnitStopSpell)
    call TriggerAddCondition(st___prototype20[4],Condition(function sa___prototype20_s__Spell_onUnitStopSpell))
    set st___prototype20[5]=CreateTrigger()
    call TriggerAddAction(st___prototype20[5],function sa___prototype20_s__Spell_onUnitReadySpell)
    call TriggerAddCondition(st___prototype20[5],Condition(function sa___prototype20_s__Spell_onUnitReadySpell))
    set st___prototype20[6]=CreateTrigger()
    call TriggerAddAction(st___prototype20[6],function sa___prototype20_s__Damage_onDisconnect)
    call TriggerAddCondition(st___prototype20[6],Condition(function sa___prototype20_s__Damage_onDisconnect))
    set st___prototype20[7]=CreateTrigger()
    call TriggerAddAction(st___prototype20[7],function sa___prototype20_s__Damage_onDamage)
    call TriggerAddCondition(st___prototype20[7],Condition(function sa___prototype20_s__Damage_onDamage))
    set st___prototype23[1]=CreateTrigger()
    call TriggerAddAction(st___prototype23[1],function sa___prototype23_s__PlayerPress_Down)
    call TriggerAddCondition(st___prototype23[1],Condition(function sa___prototype23_s__PlayerPress_Down))
    set st___prototype23[2]=CreateTrigger()
    call TriggerAddAction(st___prototype23[2],function sa___prototype23_s__PlayerPress_Up)
    call TriggerAddCondition(st___prototype23[2],Condition(function sa___prototype23_s__PlayerPress_Up))
    set st___prototype28[1]=CreateTrigger()
    call TriggerAddAction(st___prototype28[1],function sa___prototype28_s__Units_Damage)
    call TriggerAddCondition(st___prototype28[1],Condition(function sa___prototype28_s__Units_Damage))
    set st___prototype20[9]=CreateTrigger()
    call TriggerAddAction(st___prototype20[9],function sa___prototype20_s__Units_onDeath)
    call TriggerAddCondition(st___prototype20[9],Condition(function sa___prototype20_s__Units_onDeath))
    set st___prototype20[10]=CreateTrigger()
    call TriggerAddAction(st___prototype20[10],function sa___prototype20_s__Units_onDeacy)
    call TriggerAddCondition(st___prototype20[10],Condition(function sa___prototype20_s__Units_onDeacy))
    set st___prototype25[1]=CreateTrigger()
    call TriggerAddAction(st___prototype25[1],function sa___prototype25_s__Winner_Death)
    call TriggerAddCondition(st___prototype25[1],Condition(function sa___prototype25_s__Winner_Death))
    set st___prototype20[11]=CreateTrigger()
    call TriggerAddAction(st___prototype20[11],function sa___prototype20_s__DazzleMaster_anon__28)
    call TriggerAddCondition(st___prototype20[11],Condition(function sa___prototype20_s__DazzleMaster_anon__28))
    set st___prototype20[12]=CreateTrigger()
    call TriggerAddAction(st___prototype20[12],function sa___prototype20_s__DazzleMaster_anon__29)
    call TriggerAddCondition(st___prototype20[12],Condition(function sa___prototype20_s__DazzleMaster_anon__29))
    set st___prototype20[13]=CreateTrigger()
    call TriggerAddAction(st___prototype20[13],function sa___prototype20_s__DazzleMaster_anon__30)
    call TriggerAddCondition(st___prototype20[13],Condition(function sa___prototype20_s__DazzleMaster_anon__30))
    set st___prototype20[14]=CreateTrigger()
    call TriggerAddAction(st___prototype20[14],function sa___prototype20_s__DazzleMaster_anon__31)
    call TriggerAddCondition(st___prototype20[14],Condition(function sa___prototype20_s__DazzleMaster_anon__31))
    set st___prototype20[15]=CreateTrigger()
    call TriggerAddAction(st___prototype20[15],function sa___prototype20_s__DazzleMaster_Q)
    call TriggerAddCondition(st___prototype20[15],Condition(function sa___prototype20_s__DazzleMaster_Q))
    set st___prototype20[16]=CreateTrigger()
    call TriggerAddAction(st___prototype20[16],function sa___prototype20_s__DazzleMaster_W)
    call TriggerAddCondition(st___prototype20[16],Condition(function sa___prototype20_s__DazzleMaster_W))
    set st___prototype20[17]=CreateTrigger()
    call TriggerAddAction(st___prototype20[17],function sa___prototype20_s__DazzleMaster_HERO_START)
    call TriggerAddCondition(st___prototype20[17],Condition(function sa___prototype20_s__DazzleMaster_HERO_START))
    set st___prototype20[18]=CreateTrigger()
    call TriggerAddAction(st___prototype20[18],function sa___prototype20_s__DazzleMaster_HERO_STOP)
    call TriggerAddCondition(st___prototype20[18],Condition(function sa___prototype20_s__DazzleMaster_HERO_STOP))
    set st___prototype20[19]=CreateTrigger()
    call TriggerAddAction(st___prototype20[19],function sa___prototype20_s__DazzleMaster_Attack)
    call TriggerAddCondition(st___prototype20[19],Condition(function sa___prototype20_s__DazzleMaster_Attack))
    set st___prototype25[2]=CreateTrigger()
    call TriggerAddAction(st___prototype25[2],function sa___prototype25_s__DazzleMaster_Spawn)
    call TriggerAddCondition(st___prototype25[2],Condition(function sa___prototype25_s__DazzleMaster_Spawn))
    set st___prototype25[3]=CreateTrigger()
    call TriggerAddAction(st___prototype25[3],function sa___prototype25_s__DazzleMaster_Death)
    call TriggerAddCondition(st___prototype25[3],Condition(function sa___prototype25_s__DazzleMaster_Death))
    set st___prototype22[1]=CreateTrigger()
    call TriggerAddAction(st___prototype22[1],function sa___prototype22_s__KillUi_Show)
    call TriggerAddCondition(st___prototype22[1],Condition(function sa___prototype22_s__KillUi_Show))
    set st___prototype22[2]=CreateTrigger()
    call TriggerAddAction(st___prototype22[2],function sa___prototype22_s__KillUi_Hide)
    call TriggerAddCondition(st___prototype22[2],Condition(function sa___prototype22_s__KillUi_Hide))
    set st___prototype20[20]=CreateTrigger()
    call TriggerAddAction(st___prototype20[20],function sa___prototype20_s__OrdinaryWizard___OrdinaryWizard_anon__20)
    call TriggerAddCondition(st___prototype20[20],Condition(function sa___prototype20_s__OrdinaryWizard___OrdinaryWizard_anon__20))
    set st___prototype20[21]=CreateTrigger()
    call TriggerAddAction(st___prototype20[21],function sa___prototype20_s__OrdinaryWizard___OrdinaryWizard_anon__21)
    call TriggerAddCondition(st___prototype20[21],Condition(function sa___prototype20_s__OrdinaryWizard___OrdinaryWizard_anon__21))
    set st___prototype20[22]=CreateTrigger()
    call TriggerAddAction(st___prototype20[22],function sa___prototype20_s__OrdinaryWizard___OrdinaryWizard_anon__23)
    call TriggerAddCondition(st___prototype20[22],Condition(function sa___prototype20_s__OrdinaryWizard___OrdinaryWizard_anon__23))
    set st___prototype20[23]=CreateTrigger()
    call TriggerAddAction(st___prototype20[23],function sa___prototype20_s__OrdinaryWizard___OrdinaryWizard_anon__24)
    call TriggerAddCondition(st___prototype20[23],Condition(function sa___prototype20_s__OrdinaryWizard___OrdinaryWizard_anon__24))
    set st___prototype20[24]=CreateTrigger()
    call TriggerAddAction(st___prototype20[24],function sa___prototype20_s__OrdinaryWizard___OrdinaryWizard_anon__25)
    call TriggerAddCondition(st___prototype20[24],Condition(function sa___prototype20_s__OrdinaryWizard___OrdinaryWizard_anon__25))
    set st___prototype20[25]=CreateTrigger()
    call TriggerAddAction(st___prototype20[25],function sa___prototype20_s__OrdinaryWizard___OrdinaryWizard_anon__26)
    call TriggerAddCondition(st___prototype20[25],Condition(function sa___prototype20_s__OrdinaryWizard___OrdinaryWizard_anon__26))
    set st___prototype20[26]=CreateTrigger()
    call TriggerAddAction(st___prototype20[26],function sa___prototype20_s__OrdinaryWizard___OrdinaryWizard_Q)
    call TriggerAddCondition(st___prototype20[26],Condition(function sa___prototype20_s__OrdinaryWizard___OrdinaryWizard_Q))
    set st___prototype20[27]=CreateTrigger()
    call TriggerAddAction(st___prototype20[27],function sa___prototype20_s__OrdinaryWizard___OrdinaryWizard_W)
    call TriggerAddCondition(st___prototype20[27],Condition(function sa___prototype20_s__OrdinaryWizard___OrdinaryWizard_W))
    set st___prototype20[28]=CreateTrigger()
    call TriggerAddAction(st___prototype20[28],function sa___prototype20_s__OrdinaryWizard___OrdinaryWizard_R)
    call TriggerAddCondition(st___prototype20[28],Condition(function sa___prototype20_s__OrdinaryWizard___OrdinaryWizard_R))
    set st___prototype20[29]=CreateTrigger()
    call TriggerAddAction(st___prototype20[29],function sa___prototype20_s__OrdinaryWizard___OrdinaryWizard_HERO_START)
    call TriggerAddCondition(st___prototype20[29],Condition(function sa___prototype20_s__OrdinaryWizard___OrdinaryWizard_HERO_START))
    set st___prototype20[30]=CreateTrigger()
    call TriggerAddAction(st___prototype20[30],function sa___prototype20_s__OrdinaryWizard___OrdinaryWizard_HERO_STOP)
    call TriggerAddCondition(st___prototype20[30],Condition(function sa___prototype20_s__OrdinaryWizard___OrdinaryWizard_HERO_STOP))
    set st___prototype25[4]=CreateTrigger()
    call TriggerAddAction(st___prototype25[4],function sa___prototype25_s__OrdinaryWizard___OrdinaryWizard_E)
    call TriggerAddCondition(st___prototype25[4],Condition(function sa___prototype25_s__OrdinaryWizard___OrdinaryWizard_E))
    set st___prototype25[5]=CreateTrigger()
    call TriggerAddAction(st___prototype25[5],function sa___prototype25_s__Respawn___Respawn_Death)
    call TriggerAddCondition(st___prototype25[5],Condition(function sa___prototype25_s__Respawn___Respawn_Death))
    set st___prototype22[3]=CreateTrigger()
    call TriggerAddAction(st___prototype22[3],function sa___prototype22_s__Respawn___Respawn_Press)
    call TriggerAddCondition(st___prototype22[3],Condition(function sa___prototype22_s__Respawn___Respawn_Press))
    set st___prototype23[3]=CreateTrigger()
    call TriggerAddAction(st___prototype23[3],function sa___prototype23_s__Respawn___Respawn_PressSnyc)
    call TriggerAddCondition(st___prototype23[3],Condition(function sa___prototype23_s__Respawn___Respawn_PressSnyc))


















































    call ExecuteFunc("s__Players_onInit")
    call ExecuteFunc("s__Table__GTable_onInit")
    call ExecuteFunc("s__TakeUi_onInit")
    call ExecuteFunc("s__Buffs_onInit")
    call ExecuteFunc("s__Dash_onInit")
    call ExecuteFunc("s__HitFlys_onInit")
    call ExecuteFunc("s__Spell_onInit")
    call ExecuteFunc("s__Damage_onInit")
    call ExecuteFunc("s__PlayerPress_onInit")
    call ExecuteFunc("s__Units_onInit")
    call ExecuteFunc("s__KillUi_onInit")
    call ExecuteFunc("s__OrdinaryWizard___OrdinaryWizard_onInit")
    call ExecuteFunc("s__Respawn___Respawn_onInit")
endfunction

