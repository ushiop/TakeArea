globals
//globals from BuyStrAgiInt:
constant boolean LIBRARY_BuyStrAgiInt=true
//endglobals from BuyStrAgiInt
//globals from BzAPI:
constant boolean LIBRARY_BzAPI=true
trigger array BzAPI__DamageEventQueue
integer BzAPI__DamageEventNumber= 0
//endglobals from BzAPI
//globals from Data:
constant boolean LIBRARY_Data=true
//endglobals from Data
//globals from SpellNameText:
constant boolean LIBRARY_SpellNameText=true
//endglobals from SpellNameText
//globals from Stack:
constant boolean LIBRARY_Stack=true
//endglobals from Stack
//globals from Table:
constant boolean LIBRARY_Table=true
constant integer Table___MAX_INSTANCES=8100
        //Feel free to change max instances if necessary, it will only affect allocation
        //speed which shouldn't matter that much.

    //=========================================================
hashtable Table___ht=InitHashtable()
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
constant real TerrainPathability___MAX_RANGE= 10.0
constant integer TerrainPathability___DUMMY_ITEM_ID= 'wolg'
item TerrainPathability___Item= null
rect TerrainPathability___Find= null
item array TerrainPathability___Hid
integer TerrainPathability___HidMax= 0
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
//globals from YDWEAbilityState:
constant boolean LIBRARY_YDWEAbilityState=true
constant integer YDWEAbilityState__ABILITY_STATE_COOLDOWN= 1
constant integer YDWEAbilityState__ABILITY_DATA_TARGS= 100
constant integer YDWEAbilityState__ABILITY_DATA_CAST= 101
constant integer YDWEAbilityState__ABILITY_DATA_DUR= 102
constant integer YDWEAbilityState__ABILITY_DATA_HERODUR= 103
constant integer YDWEAbilityState__ABILITY_DATA_COST= 104
constant integer YDWEAbilityState__ABILITY_DATA_COOL= 105
constant integer YDWEAbilityState__ABILITY_DATA_AREA= 106
constant integer YDWEAbilityState__ABILITY_DATA_RNG= 107
constant integer YDWEAbilityState__ABILITY_DATA_DATA_A= 108
constant integer YDWEAbilityState__ABILITY_DATA_DATA_B= 109
constant integer YDWEAbilityState__ABILITY_DATA_DATA_C= 110
constant integer YDWEAbilityState__ABILITY_DATA_DATA_D= 111
constant integer YDWEAbilityState__ABILITY_DATA_DATA_E= 112
constant integer YDWEAbilityState__ABILITY_DATA_DATA_F= 113
constant integer YDWEAbilityState__ABILITY_DATA_DATA_G= 114
constant integer YDWEAbilityState__ABILITY_DATA_DATA_H= 115
constant integer YDWEAbilityState__ABILITY_DATA_DATA_I= 116
constant integer YDWEAbilityState__ABILITY_DATA_UNITID= 117

constant integer YDWEAbilityState__ABILITY_DATA_HOTKET= 200
constant integer YDWEAbilityState__ABILITY_DATA_UNHOTKET= 201
constant integer YDWEAbilityState__ABILITY_DATA_RESEARCH_HOTKEY= 202
constant integer YDWEAbilityState__ABILITY_DATA_NAME= 203
constant integer YDWEAbilityState__ABILITY_DATA_ART= 204
constant integer YDWEAbilityState__ABILITY_DATA_TARGET_ART= 205
constant integer YDWEAbilityState__ABILITY_DATA_CASTER_ART= 206
constant integer YDWEAbilityState__ABILITY_DATA_EFFECT_ART= 207
constant integer YDWEAbilityState__ABILITY_DATA_AREAEFFECT_ART= 208
constant integer YDWEAbilityState__ABILITY_DATA_MISSILE_ART= 209
constant integer YDWEAbilityState__ABILITY_DATA_SPECIAL_ART= 210
constant integer YDWEAbilityState__ABILITY_DATA_LIGHTNING_EFFECT= 211
constant integer YDWEAbilityState__ABILITY_DATA_BUFF_TIP= 212
constant integer YDWEAbilityState__ABILITY_DATA_BUFF_UBERTIP= 213
constant integer YDWEAbilityState__ABILITY_DATA_RESEARCH_TIP= 214
constant integer YDWEAbilityState__ABILITY_DATA_TIP= 215
constant integer YDWEAbilityState__ABILITY_DATA_UNTIP= 216
constant integer YDWEAbilityState__ABILITY_DATA_RESEARCH_UBERTIP= 217
constant integer YDWEAbilityState__ABILITY_DATA_UBERTIP= 218
constant integer YDWEAbilityState__ABILITY_DATA_UNUBERTIP= 219
constant integer YDWEAbilityState__ABILITY_DATA_UNART= 220
//endglobals from YDWEAbilityState
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
//globals from Events:
constant boolean LIBRARY_Events=true
//endglobals from Events
//globals from HitFly:
constant boolean LIBRARY_HitFly=true
//endglobals from HitFly
//globals from Players:
constant boolean LIBRARY_Players=true
//endglobals from Players
//globals from Press:
constant boolean LIBRARY_Press=true
string PressType=""
string PressName=""
integer PressCode=0
gamecache gc
string array keys
string array keynames
//endglobals from Press
//globals from SoundUtils:
constant boolean LIBRARY_SoundUtils=true
hashtable SoundUtils___ht= InitHashtable()
hashtable SoundUtils___st= InitHashtable()
hashtable SoundUtils___rt= InitHashtable()
hashtable SoundUtils___kt= InitHashtable()
//endglobals from SoundUtils
//globals from Spells:
constant boolean LIBRARY_Spells=true
//endglobals from Spells
//globals from YDWEGetUnitsOfPlayerAllNull:
constant boolean LIBRARY_YDWEGetUnitsOfPlayerAllNull=true
//endglobals from YDWEGetUnitsOfPlayerAllNull
//globals from BuyNextHero:
constant boolean LIBRARY_BuyNextHero=true
//endglobals from BuyNextHero
//globals from Damage:
constant boolean LIBRARY_Damage=true
//endglobals from Damage
//globals from Disconnect:
constant boolean LIBRARY_Disconnect=true
integer Disconnect___tmp
//endglobals from Disconnect
//globals from LevelUp:
constant boolean LIBRARY_LevelUp=true
integer LevelUp___MaxLv=1
//endglobals from LevelUp
//globals from PlayerChat:
constant boolean LIBRARY_PlayerChat=true
//endglobals from PlayerChat
//globals from PlayerPress:
constant boolean LIBRARY_PlayerPress=true
//endglobals from PlayerPress
//globals from Units:
constant boolean LIBRARY_Units=true
//endglobals from Units
//globals from Groups:
constant boolean LIBRARY_Groups=true
group tmp_group=CreateGroup()
unit LAST_FIND_UNIT=null
group Groups___tmp_find_group=CreateGroup()
group Groups___tmp_create_group=CreateGroup()
group Groups___tmp_damage_group=CreateGroup()
group Groups___tmp_random_group=CreateGroup()
//endglobals from Groups
//globals from HeroRare:
constant boolean LIBRARY_HeroRare=true
// processed:     unitpool  array HeroRare___HeroRare[3]
unit HeroRare_LastRandomUnit
integer array HeroType
//endglobals from HeroRare
//globals from Winner:
constant boolean LIBRARY_Winner=true
//endglobals from Winner
//globals from Ai:
constant boolean LIBRARY_Ai=true
//endglobals from Ai
//globals from BlackSaber:
constant boolean LIBRARY_BlackSaber=true
//endglobals from BlackSaber
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
//globals from SL:
constant boolean LIBRARY_SL=true
//endglobals from SL
//globals from SwordMaster:
constant boolean LIBRARY_SwordMaster=true
//endglobals from SwordMaster
//globals from WindWalk:
constant boolean LIBRARY_WindWalk=true
//endglobals from WindWalk
//globals from YeG:
constant boolean LIBRARY_YeG=true
// processed:     rect  array YeG___rec[2]
//endglobals from YeG
//globals from ZZ:
constant boolean LIBRARY_ZZ=true
//endglobals from ZZ
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
constant integer si__Stack=8
integer si__Stack_F=0
integer si__Stack_I=0
integer array si__Stack_V
constant integer s__Stack_EMPTY=0x28829022
integer array s__Stack_size
integer array s__Stack_top
integer s__Stack_free= 1
integer array s__Stack_next
integer array s__Stack_value
constant integer si__Table___GTable=9
integer si__Table___GTable_F=0
integer si__Table___GTable_I=0
integer array si__Table___GTable_V
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
unit array s__EventArgs_BuyingUnit
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
item array s__EventArgs_BuyItem
string array s__EventArgs_ChatString
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
constant string s__Events_onUnitSellItem="Events.onUnitSellItem"
constant string s__Events_onPlayerChat="Events.onPlayerChat"
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
constant integer si__Players=21
integer si__Players_F=0
integer si__Players_I=0
integer array si__Players_V
integer s__Players_ht
player s__Players_localplayer
integer array s__Players_playerid
string array s__Players_playerids
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
timer array s__Players_duangtimer
real array s__Players_duanglv
real array s__Players_duangtime
constant integer si__Press=22
integer si__Press_F=0
integer si__Press_I=0
integer array si__Press_V
constant string s__Press_onSnycPressKeyDown="Press.onSnycPressKeyDown" //目前仅提供了F2 Q W E R D F C 空格的按键捕捉 
constant string s__Press_onSnycPressKeyUp="Press.onSnycPressKeyUp"
constant integer si__SoundUtils___soundhelper=23
integer si__SoundUtils___soundhelper_F=0
integer si__SoundUtils___soundhelper_I=0
integer array si__SoundUtils___soundhelper_V
integer array s__SoundUtils___soundhelper_sta
string array s__SoundUtils___soundhelper_fileName
integer array s__SoundUtils___soundhelper_duration
boolean array s__SoundUtils___soundhelper_looping
boolean array s__SoundUtils___soundhelper_is3D
boolean array s__SoundUtils___soundhelper_stopwhenoutofrange
integer array s__SoundUtils___soundhelper_fadeInRate
integer array s__SoundUtils___soundhelper_fadeOutRate
string array s__SoundUtils___soundhelper_eaxSetting
constant integer si__SoundUtils___soundrecycler=24
integer si__SoundUtils___soundrecycler_F=0
integer si__SoundUtils___soundrecycler_I=0
integer array si__SoundUtils___soundrecycler_V
timer array s__SoundUtils___soundrecycler_t
sound array s__SoundUtils___soundrecycler_s
integer array s__SoundUtils___soundrecycler_sh
boolean array s__SoundUtils___soundrecycler_stopped
constant integer si__Spell=25
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
constant integer si__DamageArgs=26
integer si__DamageArgs_F=0
integer si__DamageArgs_I=0
integer array si__DamageArgs_V
real array s__DamageArgs_Damage
integer array s__DamageArgs_TriggerUnit
integer array s__DamageArgs_DamageUnit
integer array s__DamageArgs_Spell
integer array s__DamageArgs_DamageType
boolean array s__DamageArgs_isRange
constant integer si__Damage=27
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
constant integer si__PlayerPress=28
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
constant integer si__Units=29
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
integer array s__Units_pauses
integer array s__Units_moves
integer array s__Units_ai
real array s__Units_createtime
constant string s__Units_onUnitDeath="Units.UnitDeath"
constant string s__Units_onHeroDeath="Units.HeroDeath"
constant string s__Units_onUnitSpawn="Units.UnitSpawn"
constant string s__Units_onHeroSpawn="Units.HeroSpawn"
constant string s__Units_onAlocDeath="Units.AlocDeath"
constant string s__Units_onAlocSpawn="Units.AlocSpawn"
constant integer si__HeroRares=30
integer si__HeroRares_F=0
integer si__HeroRares_I=0
integer array si__HeroRares_V
boolean s__HeroRares_isRepeat=false
constant integer si__Winner=31
integer si__Winner_F=0
integer si__Winner_I=0
integer array si__Winner_V
boolean s__Winner_GameEnd=false
integer s__Winner_MaxKills=100
real s__Winner_OX
real s__Winner_OY
real s__Winner_NowTime=0
real s__Winner_MaxTime=120
integer s__Winner_Team=- 1
integer s__Winner_WinTeam=- 1
constant integer si__BlackSaber__BlackSaber=32
integer si__BlackSaber__BlackSaber_F=0
integer si__BlackSaber__BlackSaber_I=0
integer array si__BlackSaber__BlackSaber_V
integer s__BlackSaber__BlackSaber_Q_HIT
constant integer si__DazzleMaster___DazzleMaster=33
integer si__DazzleMaster___DazzleMaster_F=0
integer si__DazzleMaster___DazzleMaster_I=0
integer array si__DazzleMaster___DazzleMaster_V
constant integer si__KillUi=34
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
constant integer si__OrdinaryWizard___OrdinaryWizard=41
integer si__OrdinaryWizard___OrdinaryWizard_F=0
integer si__OrdinaryWizard___OrdinaryWizard_I=0
integer array si__OrdinaryWizard___OrdinaryWizard_V
constant integer si__SL__SL=42
integer si__SL__SL_F=0
integer si__SL__SL_I=0
integer array si__SL__SL_V
constant integer si__SwordMaster__SwordMaster=43
integer si__SwordMaster__SwordMaster_F=0
integer si__SwordMaster__SwordMaster_I=0
integer array si__SwordMaster__SwordMaster_V
constant integer si__WindWalk__WindWalk=44
integer si__WindWalk__WindWalk_F=0
integer si__WindWalk__WindWalk_I=0
integer array si__WindWalk__WindWalk_V
constant integer si__ZZ__ZZ=45
integer si__ZZ__ZZ_F=0
integer si__ZZ__ZZ_I=0
integer array si__ZZ__ZZ_V
constant integer si__Respawn___Respawn=46
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
integer array s__TimerUtils___data
timer array s__TimerUtils___tT
unitpool array s__HeroRare___HeroRare
rect array s__YeG___rec
string array s__s__DazzleMaster___DazzleMaster_DazzlePath
string array s__s__DazzleMaster___DazzleMaster_DazzleName
integer array s__s__DazzleMaster___DazzleMaster_E_sound
integer array s__s__KillUi_KillTeam
string array s__s__Respawn___Respawn_RespawnType
integer array si__Table___GTable_type
trigger array st__Table___GTable_onDestroy
trigger st__Stack_onDestroy
trigger st__Buffs_Find
trigger st__Buffs_Skill
trigger st__Buffs_Trigger
trigger st__Dash_Destroy
trigger st__Dash_Stop
trigger st__Dash_Trigger
trigger st__Events_On
trigger st__HitFlys_Find
trigger st__HitFlys_Trigger
trigger st__Players_AddMoney
trigger st__SoundUtils___soundrecycler_onDestroy
trigger st__PlayerPress_create
trigger st__Units_Alpha
trigger st__Units_Str
trigger st__Units_Agi
trigger st__Units_Int
trigger st__Units_DelayAnime
trigger st__Units_AnimeSpeed
trigger st__Units_Y
trigger st__Units_X
trigger st__Units_SetH
trigger st__Units_Position
trigger st__Units_Destroys
trigger st__Units_Get
trigger st__Units_Spawn
trigger st__Units_MJ
trigger st__Units_Kill
trigger st__HeroRares_Repeat
trigger st__HeroRares_AddRandomHero
trigger st__Winner_ShowWin
trigger st__DazzleMaster___DazzleMaster_AddDazzle
trigger st__DazzleMaster___DazzleMaster_Q
trigger st__KillUi_FlushPlayerData
trigger st__KillUi_FlushData
trigger st__KillUi_FlushKillData
trigger st__Respawn___Respawn_Flush
trigger st__Respawn___Respawn_Show
trigger array st___prototype1
trigger array st___prototype32
trigger array st___prototype34
trigger array st___prototype35
trigger array st___prototype36
trigger array st___prototype37
trigger array st___prototype46
trigger array st___prototype54
unit f__arg_unit1
integer f__arg_integer1
integer f__arg_integer2
integer f__arg_integer3
string f__arg_string1
string f__arg_string2
boolean f__arg_boolean1
boolean f__arg_boolean2
real f__arg_real1
real f__arg_real2
real f__arg_real3
real f__arg_real4
real f__arg_real5
real f__arg_real6
player f__arg_player1
sound f__arg_sound1
integer f__arg_this
integer f__result_integer
real f__result_real
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
	native EXGetUnitAbility takes unit u, integer abilcode returns ability
	native EXGetUnitAbilityByIndex takes unit u, integer index returns ability
	native EXGetAbilityId takes ability abil returns integer
	native EXGetAbilityState takes ability abil, integer state_type returns real
	native EXSetAbilityState takes ability abil, integer state_type, real value returns boolean
	native EXGetAbilityDataReal takes ability abil, integer level, integer data_type returns real
	native EXSetAbilityDataReal takes ability abil, integer level, integer data_type, real value returns boolean
	native EXGetAbilityDataInteger takes ability abil, integer level, integer data_type returns integer
	native EXSetAbilityDataInteger takes ability abil, integer level, integer data_type, integer value returns boolean
	native EXGetAbilityDataString takes ability abil, integer level, integer data_type returns string
	native EXSetAbilityDataString takes ability abil, integer level, integer data_type, string value returns boolean
	native EXSetAbilityAEmeDataA takes ability abil, integer unitid returns boolean
	native EXGetItemDataString takes integer itemcode, integer data_type returns string
	native EXSetItemDataString takes integer itemcode, integer data_type, string value returns boolean
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

//Generated allocator of ZZ__ZZ
function s__ZZ__ZZ__allocate takes nothing returns integer
 local integer this=si__ZZ__ZZ_F
    if (this!=0) then
        set si__ZZ__ZZ_F=si__ZZ__ZZ_V[this]
    else
        set si__ZZ__ZZ_I=si__ZZ__ZZ_I+1
        set this=si__ZZ__ZZ_I
    endif
    if (this>8190) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: ZZ__ZZ")
        return 0
    endif

    set si__ZZ__ZZ_V[this]=-1
 return this
endfunction

//Generated destructor of ZZ__ZZ
function s__ZZ__ZZ_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: ZZ__ZZ")
        return
    elseif (si__ZZ__ZZ_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: ZZ__ZZ")
        return
    endif
    set si__ZZ__ZZ_V[this]=si__ZZ__ZZ_F
    set si__ZZ__ZZ_F=this
endfunction

//Generated allocator of WindWalk__WindWalk
function s__WindWalk__WindWalk__allocate takes nothing returns integer
 local integer this=si__WindWalk__WindWalk_F
    if (this!=0) then
        set si__WindWalk__WindWalk_F=si__WindWalk__WindWalk_V[this]
    else
        set si__WindWalk__WindWalk_I=si__WindWalk__WindWalk_I+1
        set this=si__WindWalk__WindWalk_I
    endif
    if (this>8190) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: WindWalk__WindWalk")
        return 0
    endif

    set si__WindWalk__WindWalk_V[this]=-1
 return this
endfunction

//Generated destructor of WindWalk__WindWalk
function s__WindWalk__WindWalk_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: WindWalk__WindWalk")
        return
    elseif (si__WindWalk__WindWalk_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: WindWalk__WindWalk")
        return
    endif
    set si__WindWalk__WindWalk_V[this]=si__WindWalk__WindWalk_F
    set si__WindWalk__WindWalk_F=this
endfunction

//Generated allocator of SwordMaster__SwordMaster
function s__SwordMaster__SwordMaster__allocate takes nothing returns integer
 local integer this=si__SwordMaster__SwordMaster_F
    if (this!=0) then
        set si__SwordMaster__SwordMaster_F=si__SwordMaster__SwordMaster_V[this]
    else
        set si__SwordMaster__SwordMaster_I=si__SwordMaster__SwordMaster_I+1
        set this=si__SwordMaster__SwordMaster_I
    endif
    if (this>8190) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: SwordMaster__SwordMaster")
        return 0
    endif

    set si__SwordMaster__SwordMaster_V[this]=-1
 return this
endfunction

//Generated destructor of SwordMaster__SwordMaster
function s__SwordMaster__SwordMaster_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: SwordMaster__SwordMaster")
        return
    elseif (si__SwordMaster__SwordMaster_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: SwordMaster__SwordMaster")
        return
    endif
    set si__SwordMaster__SwordMaster_V[this]=si__SwordMaster__SwordMaster_F
    set si__SwordMaster__SwordMaster_F=this
endfunction

//Generated allocator of SL__SL
function s__SL__SL__allocate takes nothing returns integer
 local integer this=si__SL__SL_F
    if (this!=0) then
        set si__SL__SL_F=si__SL__SL_V[this]
    else
        set si__SL__SL_I=si__SL__SL_I+1
        set this=si__SL__SL_I
    endif
    if (this>8190) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: SL__SL")
        return 0
    endif

    set si__SL__SL_V[this]=-1
 return this
endfunction

//Generated destructor of SL__SL
function s__SL__SL_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: SL__SL")
        return
    elseif (si__SL__SL_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: SL__SL")
        return
    endif
    set si__SL__SL_V[this]=si__SL__SL_F
    set si__SL__SL_F=this
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

//Generated method caller for DazzleMaster___DazzleMaster.AddDazzle
function sc__DazzleMaster___DazzleMaster_AddDazzle takes unit u,integer id returns nothing
    set f__arg_unit1=u
    set f__arg_integer1=id
    call TriggerEvaluate(st__DazzleMaster___DazzleMaster_AddDazzle)
endfunction

//Generated method caller for DazzleMaster___DazzleMaster.Q
function sc__DazzleMaster___DazzleMaster_Q takes integer e returns nothing
    set f__arg_integer1=e
    call TriggerEvaluate(st__DazzleMaster___DazzleMaster_Q)
endfunction

//Generated allocator of DazzleMaster___DazzleMaster
function s__DazzleMaster___DazzleMaster__allocate takes nothing returns integer
 local integer this=si__DazzleMaster___DazzleMaster_F
    if (this!=0) then
        set si__DazzleMaster___DazzleMaster_F=si__DazzleMaster___DazzleMaster_V[this]
    else
        set si__DazzleMaster___DazzleMaster_I=si__DazzleMaster___DazzleMaster_I+1
        set this=si__DazzleMaster___DazzleMaster_I
    endif
    if (this>8190) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: DazzleMaster___DazzleMaster")
        return 0
    endif

    set si__DazzleMaster___DazzleMaster_V[this]=-1
 return this
endfunction

//Generated destructor of DazzleMaster___DazzleMaster
function s__DazzleMaster___DazzleMaster_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: DazzleMaster___DazzleMaster")
        return
    elseif (si__DazzleMaster___DazzleMaster_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: DazzleMaster___DazzleMaster")
        return
    endif
    set si__DazzleMaster___DazzleMaster_V[this]=si__DazzleMaster___DazzleMaster_F
    set si__DazzleMaster___DazzleMaster_F=this
endfunction

//Generated allocator of BlackSaber__BlackSaber
function s__BlackSaber__BlackSaber__allocate takes nothing returns integer
 local integer this=si__BlackSaber__BlackSaber_F
    if (this!=0) then
        set si__BlackSaber__BlackSaber_F=si__BlackSaber__BlackSaber_V[this]
    else
        set si__BlackSaber__BlackSaber_I=si__BlackSaber__BlackSaber_I+1
        set this=si__BlackSaber__BlackSaber_I
    endif
    if (this>8190) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: BlackSaber__BlackSaber")
        return 0
    endif

    set si__BlackSaber__BlackSaber_V[this]=-1
 return this
endfunction

//Generated destructor of BlackSaber__BlackSaber
function s__BlackSaber__BlackSaber_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: BlackSaber__BlackSaber")
        return
    elseif (si__BlackSaber__BlackSaber_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: BlackSaber__BlackSaber")
        return
    endif
    set si__BlackSaber__BlackSaber_V[this]=si__BlackSaber__BlackSaber_F
    set si__BlackSaber__BlackSaber_F=this
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

//Generated method caller for Units.Alpha
function sc__Units_Alpha takes integer this,integer a returns nothing
                call SetUnitVertexColor(s__Units_unit[this], 255, 255, 255, a)
endfunction

//Generated method caller for Units.Str
function sc__Units_Str takes integer this,boolean f returns integer
                return GetHeroStr(s__Units_unit[s__Players_hero[s__Units_player[this]]], f)
endfunction

//Generated method caller for Units.Agi
function sc__Units_Agi takes integer this,boolean f returns integer
                return GetHeroAgi(s__Units_unit[s__Players_hero[s__Units_player[this]]], f)
endfunction

//Generated method caller for Units.Int
function sc__Units_Int takes integer this,boolean f returns integer
                return GetHeroInt(s__Units_unit[s__Players_hero[s__Units_player[this]]], f)
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

//Generated method caller for Units.Y
function sc__Units_Y takes integer this returns real
                return GetUnitY(s__Units_unit[this])
endfunction

//Generated method caller for Units.X
function sc__Units_X takes integer this returns real
                return GetUnitX(s__Units_unit[this])
endfunction

//Generated method caller for Units.SetH
function sc__Units_SetH takes integer this,real h returns nothing
                call SetUnitFlyHeight(s__Units_unit[this], h, 0)
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

//Generated method caller for Units.MJ
function sc__Units_MJ takes player p,integer uid,integer aid,integer aindex,real x,real y,real f,real lifetime,real modsize,real animspeed,string animname,string modpath returns integer
    set f__arg_player1=p
    set f__arg_integer1=uid
    set f__arg_integer2=aid
    set f__arg_integer3=aindex
    set f__arg_real1=x
    set f__arg_real2=y
    set f__arg_real3=f
    set f__arg_real4=lifetime
    set f__arg_real5=modsize
    set f__arg_real6=animspeed
    set f__arg_string1=animname
    set f__arg_string2=modpath
    call TriggerEvaluate(st__Units_MJ)
 return f__result_integer
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

//Generated method caller for PlayerPress.create
function sc__PlayerPress_create takes nothing returns integer
    call TriggerEvaluate(st__PlayerPress_create)
 return f__result_integer
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

//Generated method caller for SoundUtils___soundrecycler.onDestroy
function sc__SoundUtils___soundrecycler_onDestroy takes integer this returns nothing
    set f__arg_this=this
    call TriggerEvaluate(st__SoundUtils___soundrecycler_onDestroy)
endfunction

//Generated allocator of SoundUtils___soundrecycler
function s__SoundUtils___soundrecycler__allocate takes nothing returns integer
 local integer this=si__SoundUtils___soundrecycler_F
    if (this!=0) then
        set si__SoundUtils___soundrecycler_F=si__SoundUtils___soundrecycler_V[this]
    else
        set si__SoundUtils___soundrecycler_I=si__SoundUtils___soundrecycler_I+1
        set this=si__SoundUtils___soundrecycler_I
    endif
    if (this>8190) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: SoundUtils___soundrecycler")
        return 0
    endif

   set s__SoundUtils___soundrecycler_t[this]= null
   set s__SoundUtils___soundrecycler_s[this]= null
   set s__SoundUtils___soundrecycler_sh[this]= 0
   set s__SoundUtils___soundrecycler_stopped[this]= false
    set si__SoundUtils___soundrecycler_V[this]=-1
 return this
endfunction

//Generated destructor of SoundUtils___soundrecycler
function sc__SoundUtils___soundrecycler_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: SoundUtils___soundrecycler")
        return
    elseif (si__SoundUtils___soundrecycler_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: SoundUtils___soundrecycler")
        return
    endif
    set f__arg_this=this
    call TriggerEvaluate(st__SoundUtils___soundrecycler_onDestroy)
    set si__SoundUtils___soundrecycler_V[this]=si__SoundUtils___soundrecycler_F
    set si__SoundUtils___soundrecycler_F=this
endfunction

//Generated allocator of SoundUtils___soundhelper
function s__SoundUtils___soundhelper__allocate takes nothing returns integer
 local integer this=si__SoundUtils___soundhelper_F
    if (this!=0) then
        set si__SoundUtils___soundhelper_F=si__SoundUtils___soundhelper_V[this]
    else
        set si__SoundUtils___soundhelper_I=si__SoundUtils___soundhelper_I+1
        set this=si__SoundUtils___soundhelper_I
    endif
    if (this>8190) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: SoundUtils___soundhelper")
        return 0
    endif

   set s__SoundUtils___soundhelper_fileName[this]= ""
   set s__SoundUtils___soundhelper_duration[this]= 0
   set s__SoundUtils___soundhelper_looping[this]= false
   set s__SoundUtils___soundhelper_is3D[this]= false
   set s__SoundUtils___soundhelper_stopwhenoutofrange[this]= false
   set s__SoundUtils___soundhelper_fadeInRate[this]= 0
   set s__SoundUtils___soundhelper_fadeOutRate[this]= 0
   set s__SoundUtils___soundhelper_eaxSetting[this]= ""
    set si__SoundUtils___soundhelper_V[this]=-1
 return this
endfunction

//Generated destructor of SoundUtils___soundhelper
function s__SoundUtils___soundhelper_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: SoundUtils___soundhelper")
        return
    elseif (si__SoundUtils___soundhelper_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: SoundUtils___soundhelper")
        return
    endif
    set si__SoundUtils___soundhelper_V[this]=si__SoundUtils___soundhelper_F
    set si__SoundUtils___soundhelper_F=this
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

//Generated method caller for Players.AddMoney
function sc__Players_AddMoney takes integer this,integer addm returns nothing
                call AdjustPlayerStateBJ(addm, s__Players_player[this], PLAYER_STATE_RESOURCE_GOLD)
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

   set s__Players_duangtimer[this]=null
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

//Generated method caller for Table___GTable.onDestroy
function sc__Table___GTable_onDestroy takes integer this returns nothing
    set f__arg_this=this
    call TriggerEvaluate(st__Table___GTable_onDestroy[9])
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
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: Table___GTable")
        return 0
    endif

    set si__Table___GTable_type[this]=9
    set si__Table___GTable_V[this]=-1
 return this
endfunction

//Generated destructor of Table___GTable
function sc__Table___GTable_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: Table___GTable")
        return
    elseif (si__Table___GTable_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: Table___GTable")
        return
    endif
    set f__arg_this=this
    call TriggerEvaluate(st__Table___GTable_onDestroy[si__Table___GTable_type[this]])
    set si__Table___GTable_V[this]=si__Table___GTable_F
    set si__Table___GTable_F=this
endfunction

//Generated method caller for Stack.onDestroy
function sc__Stack_onDestroy takes integer this returns nothing
            local integer n
            // Remove all remaining indexes from the stack.
            loop
                // Get the top index.
                set n=s__Stack_top[this]
                exitwhen n == 0
                // Remove it from the stack.
                set s__Stack_top[this]=s__Stack_next[n]
                // Add it to the list of free indexes.
                set s__Stack_next[n]=s__Stack_free
                set s__Stack_free=n
            endloop
endfunction

//Generated allocator of Stack
function s__Stack__allocate takes nothing returns integer
 local integer this=si__Stack_F
    if (this!=0) then
        set si__Stack_F=si__Stack_V[this]
    else
        set si__Stack_I=si__Stack_I+1
        set this=si__Stack_I
    endif
    if (this>8190) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Unable to allocate id for an object of type: Stack")
        return 0
    endif

   set s__Stack_size[this]= 0
   set s__Stack_top[this]= 0
    set si__Stack_V[this]=-1
 return this
endfunction

//Generated destructor of Stack
function sc__Stack_deallocate takes integer this returns nothing
    if this==null then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: Stack")
        return
    elseif (si__Stack_V[this]!=-1) then
            call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: Stack")
        return
    endif
    set f__arg_this=this
    call TriggerEvaluate(st__Stack_onDestroy)
    set si__Stack_V[this]=si__Stack_F
    set si__Stack_F=this
endfunction

//Generated allocator of HandleTable
function s__HandleTable__allocate takes nothing returns integer
 local integer this=s__Table___GTable__allocate()
 local integer kthis
    if(this==0) then
        return 0
    endif
    set si__Table___GTable_type[this]=12
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
    set si__Table___GTable_type[this]=10
    set kthis=this

 return this
endfunction


//Generated allocator of StringTable
function s__StringTable__allocate takes nothing returns integer
 local integer this=s__Table___GTable__allocate()
 local integer kthis
    if(this==0) then
        return 0
    endif
    set si__Table___GTable_type[this]=11
    set kthis=this

 return this
endfunction

function sc___prototype1_execute takes integer i,integer a1 returns nothing
    set f__arg_integer1=a1

    call TriggerExecute(st___prototype1[i])
endfunction
function sc___prototype1_evaluate takes integer i,integer a1 returns nothing
    set f__arg_integer1=a1

    call TriggerEvaluate(st___prototype1[i])

endfunction
function sc___prototype32_execute takes integer i,unit a1 returns nothing
    set f__arg_unit1=a1

    call TriggerExecute(st___prototype32[i])
endfunction
function sc___prototype32_evaluate takes integer i,unit a1 returns nothing
    set f__arg_unit1=a1

    call TriggerEvaluate(st___prototype32[i])

endfunction
function sc___prototype34_execute takes integer i,unit a1,integer a2 returns nothing
    set f__arg_unit1=a1
    set f__arg_integer1=a2

    call TriggerExecute(st___prototype34[i])
endfunction
function sc___prototype34_evaluate takes integer i,unit a1,integer a2 returns nothing
    set f__arg_unit1=a1
    set f__arg_integer1=a2

    call TriggerEvaluate(st___prototype34[i])

endfunction
function sc___prototype35_execute takes integer i,player a1,string a2 returns nothing
    set f__arg_player1=a1
    set f__arg_string1=a2

    call TriggerExecute(st___prototype35[i])
endfunction
function sc___prototype35_evaluate takes integer i,player a1,string a2 returns nothing
    set f__arg_player1=a1
    set f__arg_string1=a2

    call TriggerEvaluate(st___prototype35[i])

endfunction
function sc___prototype36_execute takes integer i,sound a1,boolean a2,boolean a3 returns nothing
    set f__arg_sound1=a1
    set f__arg_boolean1=a2
    set f__arg_boolean2=a3

    call TriggerExecute(st___prototype36[i])
endfunction
function sc___prototype36_evaluate takes integer i,sound a1,boolean a2,boolean a3 returns nothing
    set f__arg_sound1=a1
    set f__arg_boolean1=a2
    set f__arg_boolean2=a3

    call TriggerEvaluate(st___prototype36[i])

endfunction
function sc___prototype37_execute takes integer i,sound a1 returns nothing
    set f__arg_sound1=a1

    call TriggerExecute(st___prototype37[i])
endfunction
function sc___prototype37_evaluate takes integer i,sound a1 returns nothing
    set f__arg_sound1=a1

    call TriggerEvaluate(st___prototype37[i])

endfunction
function sc___prototype46_execute takes integer i,integer a1,integer a2 returns nothing
    set f__arg_integer1=a1
    set f__arg_integer2=a2

    call TriggerExecute(st___prototype46[i])
endfunction
function sc___prototype46_evaluate takes integer i,integer a1,integer a2 returns nothing
    set f__arg_integer1=a1
    set f__arg_integer2=a2

    call TriggerEvaluate(st___prototype46[i])

endfunction
function sc___prototype54_execute takes integer i,integer a1,unit a2,integer a3,integer a4,real a5 returns nothing
    set f__arg_integer1=a1
    set f__arg_unit1=a2
    set f__arg_integer2=a3
    set f__arg_integer3=a4
    set f__arg_real1=a5

    call TriggerExecute(st___prototype54[i])
endfunction
function sc___prototype54_evaluate takes integer i,integer a1,unit a2,integer a3,integer a4,real a5 returns nothing
    set f__arg_integer1=a1
    set f__arg_unit1=a2
    set f__arg_integer2=a3
    set f__arg_integer3=a4
    set f__arg_real1=a5

    call TriggerEvaluate(st___prototype54[i])

endfunction
function h__StopSound takes sound a0, boolean a1, boolean a2 returns nothing
    //hook: SoundUtils___HookStopSound
    call sc___prototype36_evaluate(1,a0,a1,a2)
call StopSound(a0,a1,a2)
endfunction
function h__KillSoundWhenDone takes sound a0 returns nothing
    //hook: SoundUtils___HookKillSoundWhenDone
    call sc___prototype37_evaluate(1,a0)
call KillSoundWhenDone(a0)
endfunction

//library BuyStrAgiInt:

    function BuyStrAgiInt___Buy takes integer e returns nothing
        local integer id
        local integer add
        local integer p
        if ( GetItemType(s__EventArgs_BuyItem[e]) == ITEM_TYPE_PERMANENT ) then
            set id=GetItemTypeId(s__EventArgs_BuyItem[e])
            set p=s__Units_player[sc__Units_Get(s__EventArgs_BuyingUnit[e])]
            call RemoveItem(s__EventArgs_BuyItem[e])
            if ( id == 'I003' or id == 'I004' ) then
                if ( sc__Units_Str(s__Players_hero[p],false) > 10 ) then
                    set add=10
                else
                    set add=0
                    call sc__Players_AddMoney(p,20)
                endif
                call ModifyHeroStat(bj_HEROSTAT_STR, s__Units_unit[s__Players_hero[p]], bj_MODIFYMETHOD_SUB, add)
                if ( id == 'I003' ) then
                    call ModifyHeroStat(bj_HEROSTAT_AGI, s__Units_unit[s__Players_hero[p]], bj_MODIFYMETHOD_ADD, add)
                    call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Items\\AIam\\AIamTarget.mdl", sc__Units_X(s__Players_hero[p]), sc__Units_Y(s__Players_hero[p])))
                else
                    call ModifyHeroStat(bj_HEROSTAT_INT, s__Units_unit[s__Players_hero[p]], bj_MODIFYMETHOD_ADD, add)
                    call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Items\\AIim\\AIimTarget.mdl", sc__Units_X(s__Players_hero[p]), sc__Units_Y(s__Players_hero[p])))
                endif
            endif
            if ( id == 'I005' or id == 'I006' ) then
                if ( sc__Units_Agi(s__Players_hero[p],false) > 10 ) then
                    set add=10
                else
                    set add=0
                    call sc__Players_AddMoney(p,20)
                endif
                call ModifyHeroStat(bj_HEROSTAT_AGI, s__Units_unit[s__Players_hero[p]], bj_MODIFYMETHOD_SUB, add)
                if ( id == 'I005' ) then
                    call ModifyHeroStat(bj_HEROSTAT_STR, s__Units_unit[s__Players_hero[p]], bj_MODIFYMETHOD_ADD, add)
                    call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", sc__Units_X(s__Players_hero[p]), sc__Units_Y(s__Players_hero[p])))
                else
                    call ModifyHeroStat(bj_HEROSTAT_INT, s__Units_unit[s__Players_hero[p]], bj_MODIFYMETHOD_ADD, add)
                    call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Items\\AIim\\AIimTarget.mdl", sc__Units_X(s__Players_hero[p]), sc__Units_Y(s__Players_hero[p])))
                endif
            endif
            if ( id == 'I007' or id == 'I008' ) then
                if ( sc__Units_Int(s__Players_hero[p],false) > 10 ) then
                    set add=10
                else
                    set add=0
                    call sc__Players_AddMoney(p,20)
                endif
                call ModifyHeroStat(bj_HEROSTAT_INT, s__Units_unit[s__Players_hero[p]], bj_MODIFYMETHOD_SUB, add)
                if ( id == 'I007' ) then
                    call ModifyHeroStat(bj_HEROSTAT_STR, s__Units_unit[s__Players_hero[p]], bj_MODIFYMETHOD_ADD, add)
                    call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", sc__Units_X(s__Players_hero[p]), sc__Units_Y(s__Players_hero[p])))
                else
                    call ModifyHeroStat(bj_HEROSTAT_AGI, s__Units_unit[s__Players_hero[p]], bj_MODIFYMETHOD_ADD, add)
                    call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Items\\AIam\\AIamTarget.mdl", sc__Units_X(s__Players_hero[p]), sc__Units_Y(s__Players_hero[p])))
                endif
            endif
            call DisplayTimedTextFromPlayer(s__Players_player[p], 0, 0, 5, "属性转换完成~！现在的属性是: 力量(" + I2S(sc__Units_Str(s__Players_hero[p],true)) + ")  敏捷(" + I2S(sc__Units_Agi(s__Players_hero[p],true)) + ")   智力(" + I2S(sc__Units_Int(s__Players_hero[p],true)) + ")")
        endif
    endfunction
    function BuyStrAgiInt___onInit takes nothing returns nothing
        call sc__Events_On(s__Events_onUnitSellItem , (1))
    endfunction

//library BuyStrAgiInt ends
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
    function SpellText takes unit ua,integer aid,real time,real text returns nothing
        local integer u=sc__Units_Get(ua)
        local integer mj
        if ( aid == 'A006' or aid == 'A00M' ) then
            if ( aid == 'A006' ) then
                set mj=sc__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , aid , 999 , sc__Units_X(u) , sc__Units_Y(u) , 0 , 1 , 0.75 , 1 , "birth" , "skill_name_huangyanluo.mdx")
            endif
            if ( aid == 'A00M' ) then
                set mj=sc__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , aid , 999 , sc__Units_X(u) , sc__Units_Y(u) , 0 , 1 , 0.75 , 1 , "birth" , "skill_name_fengzhiqixi.mdx")
            endif
            call sc__Units_SetH(mj,75)
            call sc__Units_DelayAnime(mj,2 , 0.7)
        else
            call SpellNameText(s__Units_unit[u] , GetAbilityName(aid) , time , text)
        endif
    endfunction
    function TextForPlayer takes player p,unit u,string name,real time,real text,real face returns nothing
        local texttag t=CreateTextTagUnitBJ(name, u, 0, text, 100, 100, 0, 0)
        call SetTextTagLifespan(t, time)
        call SetTextTagVisibility(t, true)
        call SetTextTagVelocityBJ(t, 128.00, face)
        call SetTextTagPermanent(t, false)
        call SetTextTagFadepoint(t, time * 0.1)
        if ( GetLocalPlayer() == p ) then
            call SetTextTagVisibility(t, true)
        else
            call SetTextTagVisibility(t, false)
        endif
        set t=null
    endfunction

//library SpellNameText ends
//library Stack:

//*****************************************************************
//*  STACK
//*
//*  written by: Anitarf
//*
//*  This is an efficient implementation of a stack in vJass. Since
//*  it is based on a linked list, I decided to add common list
//*  methods to the data structure so it can function both as
//*  a stack and a simple linked list.
//*
//*  As a linked list, it has less functionality than Ammorth's
//*  LinkedList, but is considerably faster. Note only that most of
//*  the list methods have O(n) time complexity so they may not be
//*  suitable for operations on very large lists, however due to
//*  their simplicity the list would need to be really large for
//*  this to become a problem.
//*
//*  All stack methods are of course O(1) and as fast as possible.
//*  If you just need a stack, this is definitely the best choice.
//*
//*   set s=Stack.create()  - Instanceates a new Stack object.
//*   call s.destroy()      - Destroys the Stack.
//*
//*  Stack syntax:
//*   call s.push(123)      - Pushes the value 123 on the stack.
//*                           A stack may contain multiple
//*                           instances of the same value.
//*   set i=s.peek()        - Reads the top value of the stack
//*                           and stores it to the variable i.
//*   set i=s.pop()         - Removes the top value from the stack
//*                           and stores it to the variable i.
//*   s.peek()==Stack.EMPTY - Checks if the stack is empty.
//*
//*  List syntax:
//*   call s.add(123)       - Adds the value 123 to the list.
//*                           A list may contain multiple
//*                           instances of the same value.
//*   s.size                - The total number of values on the list.
//*   s.contains(123)       - Checks if the value 123 is on the list.
//*   set n=s.count(123)    - Stores the number of times the value
//*                           123 is on the list to the variable n.
//*   call s.remove(123)    - Removes one instance of the value 123
//*                           from the list. Returns false if
//*                           the value was not found on the list.
//*   call s.purge(123)     - Removes all instances of the value 123
//*                           from the list. Returns the number of
//*                           values that were removed.
//*   set i=s.first         - Reads the first value from the list
//*                           and stores it to the variable i.
//*   set i=s.random        - Reads a random value from the list
//*                           and stores it to the variable i.
//*   set s2=s.copy()       - Makes a copy of the list and stores
//*                           it to the variable s2.
//*   call s.enum(Func,b)   - Calls function Func for all values
//*                           on the list. The function must follow
//*                           the Enum function interface.
//*                           b is a boolean value, if it is true
//*                           then the values will be enumerated
//*                           top to bottom, if false then bottom
//*                           to top.
//*****************************************************************

//processed:     function interface Stack_Enum takes integer value returns nothing

        // Use a totally random number here, the more improbable someone uses it, the better.
        // This is the value that is returned by .pop and .peek methods and .first and .random operators when called on an empty stack.

        // End of calibration.

        
        function s__Stack_push takes integer this,integer i returns nothing
            // Get an index from the list of free indexes.
            local integer n=s__Stack_free
            set s__Stack_free=s__Stack_next[n]
            // Extend the list of free indexes if needed.
            if s__Stack_free == 0 then
                set s__Stack_free=n + 1
            endif
            // Store the value to the index.
            set s__Stack_value[n]=i
            // Add index to the top of the stack.
            set s__Stack_next[n]=s__Stack_top[this]
            set s__Stack_top[this]=n
            set s__Stack_size[this]=s__Stack_size[this] + 1
        endfunction
        function s__Stack_pop takes integer this returns integer
            // Get the top index of stack.
            local integer n=s__Stack_top[this]
            // Safety check in case a user pops an empty stack.
            if n == 0 then
                 call BJDebugMsg("stack warning: .pop called on an empty stack!")
                return s__Stack_EMPTY
            endif
            // Remove the top index from stack.
            set s__Stack_top[this]=s__Stack_next[n]
            set s__Stack_size[this]=s__Stack_size[this] - 1
            // Add the index to the list of free indexes.
            set s__Stack_next[n]=s__Stack_free
            set s__Stack_free=n
            // Return the value.
            return s__Stack_value[n]
        endfunction
        function s__Stack_peek takes integer this returns integer
            // Read the value of the top index.
            return s__Stack_value[s__Stack_top[this]]
        endfunction


        function s__Stack_add takes integer this,integer value returns nothing
            call s__Stack_push(this,value)
        endfunction
        function s__Stack_contains takes integer this,integer value returns boolean
            // Get the first index of the list.
            local integer i=s__Stack_top[this]
            // Search through the list.
            loop
                // Stop the search when the end of the list is reached.
                exitwhen i == 0
                // Stop the search if the value is found.
                if s__Stack_value[i] == value then
                    return true
                endif
                // Get the next index of the list.
                set i=s__Stack_next[i]
            endloop
            return false
        endfunction
        function s__Stack_count takes integer this,integer value returns integer
            local integer count=0
            // Get the first index of the list.
            local integer i=s__Stack_top[this]
            // Search through the list.
            loop
                // Stop the search when the end of the list is reached.
                exitwhen i == 0
                // Increase the count if the value is found.
                if s__Stack_value[i] == value then
                    set count=count + 1
                endif
                // Get the next index of the list.
                set i=s__Stack_next[i]
            endloop
            return count
        endfunction
        function s__Stack__get_first takes integer this returns integer
            return s__Stack_peek(this)
        endfunction
        function s__Stack__get_random takes integer this returns integer
            local integer r=GetRandomInt(1, s__Stack_size[this])
            // Get the first index of the list.
            local integer i=s__Stack_top[this]
            // Loop through the list.
            loop
                // Stop the loop after a random amount of repeats.
                set r=r - 1
                exitwhen r == 0 or i == 0
                // Get the next index of the list.
                set i=s__Stack_next[i]
            endloop
            return s__Stack_value[i]
        endfunction
        function s__Stack_remove takes integer this,integer value returns boolean
            // Get the first index of the list.
            local integer i1=s__Stack_top[this]
            local integer i2
            // Check if the first index holds the value.
            if s__Stack_value[i1] == value then
                call s__Stack_pop(this)
                return true
            endif
            // Search through the rest of the list.
            loop
                set i2=s__Stack_next[i1]
                // Stop the search when the end of the list is reached.
                exitwhen i2 == 0
                // Check if the next index holds the value.
                if s__Stack_value[i2] == value then
                    // Remove the index from the stack.
                    set s__Stack_next[i1]=s__Stack_next[i2]
                    // Add the removed index to the list of free indexes.
                    set s__Stack_next[i2]=s__Stack_free
                    set s__Stack_free=i2
                    set s__Stack_size[this]=s__Stack_size[this] - 1
                    return true
                endif
                set i1=i2
            endloop
            return false
        endfunction
        function s__Stack_purge takes integer this,integer value returns integer
            local integer count=0
            local integer i1
            local integer i2
            // If the first index holds the value, pop it.
            loop
                // If the list is empty, return.
                if s__Stack_top[this] == 0 then
                    return count
                endif
                // Repeat until the first index doesn't hold the value.
                exitwhen s__Stack_value[s__Stack_top[this]] != value
                call s__Stack_pop(this)
                set count=count + 1
            endloop
            // Get the first index of the list.
            set i1=s__Stack_top[this]
            // Search through the rest of the list.
            loop
                set i2=s__Stack_next[i1]
                // Stop the search when the end of the list is reached.
                exitwhen i2 == 0
                // Check if the next index holds the value.
                if s__Stack_value[i2] == value then
                    // Remove the index from the stack.
                    set s__Stack_next[i1]=s__Stack_next[i2]
                    // Add the removed index to the list of free indexes.
                    set s__Stack_next[i2]=s__Stack_free
                    set s__Stack_free=i2
                    set s__Stack_size[this]=s__Stack_size[this] - 1
                    set count=count + 1
                else
                    set i1=i2
                endif
            endloop
            return count
        endfunction
        function s__Stack_enum takes integer this,integer f,boolean top2bottom returns nothing
            local integer array value
            // Get the first index of the list.
            local integer i1=s__Stack_top[this]
            local integer i2=0
            // Populate the array.
            loop
                exitwhen i1 == 0
                set value[i2]=s__Stack_value[i1]
                set i2=i2 + 1
                set i1=s__Stack_next[i1]
            endloop
            // Call the Enum function for each value in the array.
            set i1=i2 - 1
            loop
                exitwhen i2 == 0
                set i2=i2 - 1
                // Enumerate in which direction?
                if top2bottom then
                    call sc___prototype1_evaluate(f,value[i1 - i2])
                else
                    call sc___prototype1_evaluate(f,value[i2])
                endif
            endloop
        endfunction
        function s__Stack_copy takes integer this returns integer
            local integer that=s__Stack__allocate()
            // Get the first index of the list.
            local integer i1=s__Stack_top[this]
            local integer i2
            // Add a dummy index to the top of the new list.
            call s__Stack_push(that,0)
            set i2=s__Stack_top[that]
            loop
                exitwhen i1 == 0
                // Get an index from the list of free indexes and add it at the end of the list.
                set s__Stack_next[i2]=s__Stack_free
                set i2=s__Stack_next[i2]
                set s__Stack_free=s__Stack_next[i2]
                // Extend the list of free indexes if needed.
                if s__Stack_free == 0 then
                    set s__Stack_free=i2 + 1
                endif
                // Copy the value to the new index.
                set s__Stack_value[i2]=s__Stack_value[i1]
                set i1=s__Stack_next[i1]
            endloop
            // End the new list correctly.
            set s__Stack_next[i2]=0
            // Remove the dummy index.
            call s__Stack_pop(that)
            // Copy the size value to the new list.
            set s__Stack_size[that]=s__Stack_size[this]
            return that
        endfunction


        function s__Stack_onDestroy takes integer this returns nothing
            local integer n
            // Remove all remaining indexes from the stack.
            loop
                // Get the top index.
                set n=s__Stack_top[this]
                exitwhen n == 0
                // Remove it from the stack.
                set s__Stack_top[this]=s__Stack_next[n]
                // Add it to the list of free indexes.
                set s__Stack_next[n]=s__Stack_free
                set s__Stack_free=n
            endloop
        endfunction

//Generated destructor of Stack
function s__Stack_deallocate takes integer this returns nothing
    if this==null then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: Stack")
        return
    elseif (si__Stack_V[this]!=-1) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: Stack")
        return
    endif
    call s__Stack_onDestroy(this)
    set si__Stack_V[this]=si__Stack_F
    set si__Stack_F=this
endfunction
        function s__Stack_onInit takes nothing returns nothing
            // Store the EMPTY value to index 0 to make .peek inline friendly.
            set s__Stack_value[0]=s__Stack_EMPTY
        endfunction

//library Stack ends
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
            call s__Table___GTable_reset(this)
        endfunction

        //=============================================================
        // initialize it all.
        //
        function s__Table___GTable_onInit takes nothing returns nothing
            //set ht = InitHashtable()
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
            call s__Table___GTable_reset((- StringHash(firstkey)))
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
            call s__Table___GTable_reset((- StringHash(firstkey)))
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
            call s__Table___GTable_reset((- StringHash(firstkey)))
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
                call DzFrameSetText(s__TakeUi_TakeRightText, "中央区域尚未被占领")
                call DzFrameShow(s__TakeUi_TakeMoveBar, false)
            else
                call DzFrameSetPoint(s__TakeUi_TakeRightText, 3, s__TakeUi_TakeBackground, 3, 0.302, - 0.003)
                call DzFrameSetText(s__TakeUi_TakeRightText, str + "占领中")
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
            call DzFrameSetText(s__TakeUi_TakeRightText, "中央区域尚未被占领")
            set s__TakeUi_TakeMoveBar=DzCreateFrameByTagName("BACKDROP", "TakeMoveBar", s__TakeUi_TakeBackground, "ShowInfo", 0) //争夺进度条 //进度0%的位置: Point(0.3,0.001),Size(0.001,0.009) //进度100%的位置: Point(0.021,0.001),Size(0.279,0.009)
            call DzFrameSetPoint(s__TakeUi_TakeMoveBar, 3, s__TakeUi_TakeBackground, 3, 0.3, 0.001)
            call DzFrameSetSize(s__TakeUi_TakeMoveBar, 0.001, 0.009)
            call DzFrameSetTexture(s__TakeUi_TakeMoveBar, "UI_LeftUpperMoveBar.blp", 0)
            call DzFrameShow(s__TakeUi_TakeMoveBar, false)
        endfunction

//library TakeUi ends
//library Teams:

    //private:  //玩家阵营相关内容初始化类 //玩家组
        function Teams___anon__9 takes nothing returns boolean
            return GetPlayerSlotState(GetFilterPlayer()) == PLAYER_SLOT_STATE_PLAYING
        endfunction
        function Teams___anon__10 takes nothing returns boolean
            return IsPlayerInForce(GetFilterPlayer(), Teams___AllPlayers) == true and GetPlayerTeam(GetFilterPlayer()) == 0
        endfunction
        function Teams___anon__11 takes nothing returns boolean
            return IsPlayerInForce(GetFilterPlayer(), Teams___AllPlayers) == true and GetPlayerTeam(GetFilterPlayer()) == 1
        endfunction
        function Teams___anon__12 takes nothing returns boolean
            return IsPlayerInForce(GetFilterPlayer(), Teams___AllPlayers) == true and GetPlayerTeam(GetFilterPlayer()) == 2
        endfunction
    function Teams___onInit takes nothing returns nothing
        set Teams___AllPlayers=GetPlayersMatching(Condition(function Teams___anon__9))
        set s__Teams___Team_Players[0]= GetPlayersMatching(Condition(function Teams___anon__10))
        set s__Teams___Team_Players[1]= GetPlayersMatching(Condition(function Teams___anon__11))
        set s__Teams___Team_Players[2]= GetPlayersMatching(Condition(function Teams___anon__12))
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
        function s__Teams_GetAllPlayersNumber takes nothing returns integer
            return CountPlayersInForceBJ(Teams___AllPlayers)
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

    function TerrainPathability___HideItem takes nothing returns nothing
        if IsItemVisible(GetEnumItem()) then
            set TerrainPathability___Hid[TerrainPathability___HidMax]=GetEnumItem()
            call SetItemVisible(TerrainPathability___Hid[TerrainPathability___HidMax], false)
            set TerrainPathability___HidMax=TerrainPathability___HidMax + 1
        endif
    endfunction

    function IsTerrainWalkable takes real x,real y returns boolean
        //Hide any items in the area to avoid conflicts with our item
        call MoveRectTo(TerrainPathability___Find, x, y)
        call EnumItemsInRect(TerrainPathability___Find, null, function TerrainPathability___HideItem)
        //Try to move the test item and get its coords
        call SetItemPosition(TerrainPathability___Item, x, y) //Unhides the item
        set TerrainPathability_X=GetItemX(TerrainPathability___Item)
        set TerrainPathability_Y=GetItemY(TerrainPathability___Item)
//#         static if LIBRARY_IsTerrainWalkable then
//#             //This is for compatibility with the IsTerrainWalkable library
//#             set IsTerrainWalkable_X = TerrainPathability_X
//#             set IsTerrainWalkable_Y = TerrainPathability_Y
//#         endif
        call SetItemVisible(TerrainPathability___Item, false) //Hide it again
        //Unhide any items hidden at the start
        loop
            exitwhen TerrainPathability___HidMax <= 0
            set TerrainPathability___HidMax=TerrainPathability___HidMax - 1
            call SetItemVisible(TerrainPathability___Hid[TerrainPathability___HidMax], true)
            set TerrainPathability___Hid[TerrainPathability___HidMax]=null
        endloop
        //Return walkability
        return ( TerrainPathability_X - x ) * ( TerrainPathability_X - x ) + ( TerrainPathability_Y - y ) * ( TerrainPathability_Y - y ) <= TerrainPathability___MAX_RANGE * TerrainPathability___MAX_RANGE and not IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY)
    endfunction

    function TerrainPathability___Init takes nothing returns nothing
        set TerrainPathability___Find=Rect(0., 0., 128., 128.)
        set TerrainPathability___Item=CreateItem(TerrainPathability___DUMMY_ITEM_ID, 0, 0)
        call SetItemVisible(TerrainPathability___Item, false)
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
//#         static if TimerUtils___USE_HASH_TABLE  then
//#             // new blue
//#             call SaveInteger(TimerUtils___ht,0,GetHandleId(t), value)
//#             
//#         elseif  TimerUtils___USE_FLEXIBLE_OFFSET  then
                // orange
//#             static if  true  then
                    if ( GetHandleId(t) - TimerUtils___VOFFSET < 0 ) then
                        call BJDebugMsg("SetTimerData: Wrong handle id, only use SetTimerData on timers created by NewTimer")
                    endif
//#             endif
                set s__TimerUtils___data[GetHandleId(t) - TimerUtils___VOFFSET]= value
//#         else
//#             // new red
//#             static if  true  then
//#                 if(GetHandleId(t)-TimerUtils___OFFSET<0) then
//#                     call BJDebugMsg("SetTimerData: Wrong handle id, only use SetTimerData on timers created by NewTimer")
//#                 endif
//#             endif
//#             set TimerUtils___data[GetHandleId(t)-TimerUtils___OFFSET]=value
//#         endif        
    endfunction

    function GetTimerData takes timer t returns integer
//#         static if TimerUtils___USE_HASH_TABLE  then
//#             // new blue
//#             return LoadInteger(TimerUtils___ht,0,GetHandleId(t) )
//#             
//#         elseif  TimerUtils___USE_FLEXIBLE_OFFSET  then
                // orange
//#             static if  true  then
                    if ( GetHandleId(t) - TimerUtils___VOFFSET < 0 ) then
                        call BJDebugMsg("SetTimerData: Wrong handle id, only use SetTimerData on timers created by NewTimer")
                    endif
//#             endif
                return s__TimerUtils___data[GetHandleId(t) - TimerUtils___VOFFSET]
//#         else
//#             // new red
//#             static if  true  then
//#                 if(GetHandleId(t)-TimerUtils___OFFSET<0) then
//#                     call BJDebugMsg("SetTimerData: Wrong handle id, only use SetTimerData on timers created by NewTimer")
//#                 endif
//#             endif
//#             return TimerUtils___data[GetHandleId(t)-TimerUtils___OFFSET]
//#         endif        
    endfunction

    //==========================================================================================

    //==========================================================================================
    function NewTimer takes nothing returns timer
        if ( TimerUtils___tN == 0 ) then
            //If this happens then the QUANTITY rule has already been broken, try to fix the
            // issue, else fail.
             call BJDebugMsg("NewTimer: Warning, Exceeding TimerUtils_QUANTITY, make sure all timers are getting recycled correctly")
//#             static if  not TimerUtils___USE_HASH_TABLE  then
                     call BJDebugMsg("In case of errors, please increase it accordingly, or set TimerUtils_USE_HASH_TABLE to true")
                    set s__TimerUtils___tT[0]= CreateTimer()
//#                 static if  TimerUtils___USE_FLEXIBLE_OFFSET  then
                        if ( GetHandleId(s__TimerUtils___tT[0]) - TimerUtils___VOFFSET < 0 ) or ( GetHandleId(s__TimerUtils___tT[0]) - TimerUtils___VOFFSET >= TimerUtils___ARRAY_SIZE ) then
                            //all right, couldn't fix it
                            call BJDebugMsg("NewTimer: Unable to allocate a timer, you should probably set TimerUtils_USE_HASH_TABLE to true or fix timer leaks.")
                            return null
                        endif
//#                 else
//#                     if (GetHandleId(TimerUtils___tT[0])-TimerUtils___OFFSET<0) or (GetHandleId(TimerUtils___tT[0])-TimerUtils___OFFSET>=TimerUtils___ARRAY_SIZE) then
//#                         //all right, couldn't fix it
//#                         call BJDebugMsg("NewTimer: Unable to allocate a timer, you should probably set TimerUtils_USE_HASH_TABLE to true or fix timer leaks.")
//#                         return null
//#                     endif
//#                 endif
//#             endif
        else
            set TimerUtils___tN=TimerUtils___tN - 1
        endif
        call SetTimerData(s__TimerUtils___tT[TimerUtils___tN] , 0)
     return s__TimerUtils___tT[TimerUtils___tN]
    endfunction

    //==========================================================================================
    function ReleaseTimer takes timer t returns nothing
        if ( t == null ) then
             call BJDebugMsg("Warning: attempt to release a null timer")
            return
        endif
        if ( TimerUtils___tN == TimerUtils___ARRAY_SIZE ) then
             call BJDebugMsg("Warning: Timer stack is full, destroying timer!!")

            //stack is full, the map already has much more troubles than the chance of bug
            call DestroyTimer(t)
        else
            call PauseTimer(t)
            if ( GetTimerData(t) == TimerUtils___HELD ) then
                 call BJDebugMsg("Warning: ReleaseTimer: Double free!")
                return
            endif
            call SetTimerData(t , TimerUtils___HELD)
            set s__TimerUtils___tT[TimerUtils___tN]= t
            set TimerUtils___tN=TimerUtils___tN + 1
        endif
    endfunction

    function TimerUtils___init takes nothing returns nothing
     local integer i=0
     local integer o=- 1
     local boolean oops= false
     
//#         static if  TimerUtils___USE_HASH_TABLE   then
//#             set TimerUtils___ht = InitHashtable()
//#             loop
//#                 exitwhen(i==TimerUtils___QUANTITY)
//#                 set TimerUtils___tT[i]=CreateTimer()
//#                 call SetTimerData(TimerUtils___tT[i], TimerUtils___HELD)
//#                 set i=i+1
//#             endloop
//#             set TimerUtils___tN = TimerUtils___QUANTITY
//#         else
                loop
                    set i=0
                    loop
                        exitwhen ( i == TimerUtils___QUANTITY )
                        set s__TimerUtils___tT[i]= CreateTimer()
                        if ( i == 0 ) then
                            set TimerUtils___VOFFSET=GetHandleId(s__TimerUtils___tT[i])
//#                         static if TimerUtils___USE_FLEXIBLE_OFFSET  then
                                set o=TimerUtils___VOFFSET
//#                         else
//#                             set o=TimerUtils___OFFSET
//#                         endif
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
                     call BJDebugMsg("TimerUtils_init: Failed a initialization attempt, will try again")
                endloop
                
                if ( oops ) then
//#                 static if   TimerUtils___USE_FLEXIBLE_OFFSET  then
                         call BJDebugMsg("The problem has been fixed.")
                        //If this message doesn't appear then there is so much
                        //handle id fragmentation that it was impossible to preload
                        //so many timers and the thread crashed! Therefore this
                        //debug message is useful.
//#                 elseif(true) then
//#                     call BJDebugMsg("There were problems and the new timer limit is "+I2S(i))
//#                     call BJDebugMsg("This is a rare ocurrence, if the timer limit is too low:")
//#                     call BJDebugMsg("a) Change USE_FLEXIBLE_OFFSET to true (reduces performance a little)")
//#                     call BJDebugMsg("b) or try changing OFFSET to "+I2S(TimerUtils___VOFFSET) )
//#                 endif
                endif
//#         endif

    endfunction


//library TimerUtils ends
//library Tree:

        function Tree___anon__15 takes nothing returns nothing
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
        call TriggerAddAction(t, function Tree___anon__15)
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
        function s__Util_FAN takes unit u,unit m,real a,real r returns boolean
            return CosBJ(s__Util_XY(u , m) - a) >= CosBJ(r)
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
//library YDWEAbilityState:











 function YDWEGetUnitAbilityState takes unit u,integer abilcode,integer state_type returns real
		return EXGetAbilityState(EXGetUnitAbility(u, abilcode), state_type)
	endfunction
 function YDWEGetUnitAbilityDataInteger takes unit u,integer abilcode,integer level,integer data_type returns integer
		return EXGetAbilityDataInteger(EXGetUnitAbility(u, abilcode), level, data_type)
	endfunction
 function YDWEGetUnitAbilityDataReal takes unit u,integer abilcode,integer level,integer data_type returns real
		return EXGetAbilityDataReal(EXGetUnitAbility(u, abilcode), level, data_type)
	endfunction
 function YDWEGetUnitAbilityDataString takes unit u,integer abilcode,integer level,integer data_type returns string
		return EXGetAbilityDataString(EXGetUnitAbility(u, abilcode), level, data_type)
	endfunction
 function YDWESetUnitAbilityState takes unit u,integer abilcode,integer state_type,real value returns boolean
		return EXSetAbilityState(EXGetUnitAbility(u, abilcode), state_type, value)
	endfunction
 function YDWESetUnitAbilityDataInteger takes unit u,integer abilcode,integer level,integer data_type,integer value returns boolean
		return EXSetAbilityDataInteger(EXGetUnitAbility(u, abilcode), level, data_type, value)
	endfunction
 function YDWESetUnitAbilityDataReal takes unit u,integer abilcode,integer level,integer data_type,real value returns boolean
		return EXSetAbilityDataReal(EXGetUnitAbility(u, abilcode), level, data_type, value)
	endfunction
 function YDWESetUnitAbilityDataString takes unit u,integer abilcode,integer level,integer data_type,string value returns boolean
		return EXSetAbilityDataString(EXGetUnitAbility(u, abilcode), level, data_type, value)
	endfunction

 function YDWEUnitTransform takes unit u,integer abilcode,integer targetid returns nothing
		call UnitAddAbility(u, abilcode)
		call EXSetAbilityDataInteger(EXGetUnitAbility(u, abilcode), 1, YDWEAbilityState__ABILITY_DATA_UNITID, GetUnitTypeId(u))
		call EXSetAbilityAEmeDataA(EXGetUnitAbility(u, abilcode), GetUnitTypeId(u))
		call UnitRemoveAbility(u, abilcode)
		call UnitAddAbility(u, abilcode)
		call EXSetAbilityAEmeDataA(EXGetUnitAbility(u, abilcode), targetid)
		call UnitRemoveAbility(u, abilcode)
	endfunction


 function YDWEGetItemDataString takes integer itemcode,integer data_type returns string
		return EXGetItemDataString(itemcode, data_type)
	endfunction
 function YDWESetItemDataString takes integer itemcode,integer data_type,string value returns boolean
		return EXSetItemDataString(itemcode, data_type, value)
	endfunction

//library YDWEAbilityState ends
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
                                call sc___prototype1_evaluate((s__Buffs_onRemove[tmp]),tmp)
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
                        call sc___prototype1_evaluate((s__Buffs_onRemove[tmp]),tmp)
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
                                call sc___prototype1_evaluate((s__Buffs_onDelay[tmp]),tmp)
                            endif
                        else
                            set s__Buffs_NowTime[tmp]=time
                            set s__Buffs_MaxTime[tmp]=time
                            if ( s__Buffs_onFlush[tmp] != 0 ) then
                                call sc___prototype1_evaluate((s__Buffs_onFlush[tmp]),tmp)
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
                    call sc___prototype34_evaluate(callback,u , m)
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
                            call sc___prototype1_evaluate((s__Buffs_onTime[tmp]),tmp)
                        endif
                    else
                        call UnitRemoveAbility(s__Buffs_Unit[tmp], s__Buffs_Ability[tmp])
                        call UnitRemoveAbility(s__Buffs_Unit[tmp], s__Buffs_Buff[tmp])
                        if ( s__Buffs_onEnd[tmp] != 0 ) then
                            call sc___prototype1_evaluate((s__Buffs_onEnd[tmp]),tmp)
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
                                    call sc___prototype1_evaluate((s__Dash_onMove[tmp]),tmp)
                                endif
                            endif
                        else
                            if ( s__Dash_onEnd[tmp] != 0 ) then
                                call sc___prototype1_evaluate((s__Dash_onEnd[tmp]),tmp)
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
                    call sc___prototype1_evaluate((s__Dash_onRemove[this]),this)
                endif
                if ( s__Dash_onEnd[this] != 0 ) then
                    call sc___prototype1_evaluate((s__Dash_onEnd[this]),this)
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
                    call sc___prototype34_evaluate(callback,u , m)
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
//library Events:

//processed:     function interface Events___EventInterface takes EventArgs arg0 returns nothing
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
            set s__EventArgs_BuyingUnit[this]=null
            set s__EventArgs_BuyItem[this]=null
            set s__EventArgs_ChatString[this]=null
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
    function Events___Event_onUnitDeath takes nothing returns nothing
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
        set s__EventArgs_BuyingUnit[e]=GetBuyingUnit()
        set s__EventArgs_BuyItem[e]=GetSoldItem()
        set s__EventArgs_ChatString[e]=GetEventPlayerChatString()
        set i=1
        loop
        exitwhen ( i >= s__Table__getindex(s__Table__staticgetindex(s__Events_onUnitDeath),0) )
            set callback=(s__Table__getindex(s__Table__staticgetindex(s__Events_onUnitDeath),i))
            call sc___prototype1_evaluate(callback,e)
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
        set s__EventArgs_BuyingUnit[e]=GetBuyingUnit()
        set s__EventArgs_BuyItem[e]=GetSoldItem()
        set s__EventArgs_ChatString[e]=GetEventPlayerChatString()
        set i=1
        loop
        exitwhen ( i >= s__Table__getindex(s__Table__staticgetindex(s__Events_onPlayerDisconnect),0) )
            set callback=(s__Table__getindex(s__Table__staticgetindex(s__Events_onPlayerDisconnect),i))
            call sc___prototype1_evaluate(callback,e)
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
        set s__EventArgs_BuyingUnit[e]=GetBuyingUnit()
        set s__EventArgs_BuyItem[e]=GetSoldItem()
        set s__EventArgs_ChatString[e]=GetEventPlayerChatString()
        set i=1
        loop
        exitwhen ( i >= s__Table__getindex(s__Table__staticgetindex(s__Events_onUnitDamage),0) )
            set callback=(s__Table__getindex(s__Table__staticgetindex(s__Events_onUnitDamage),i))
            call sc___prototype1_evaluate(callback,e)
        set i=i + 1
        endloop
        call s__EventArgs_Destroy(e)
    endfunction
    function Events___Event_onUnitSpell takes nothing returns nothing
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
        set s__EventArgs_BuyingUnit[e]=GetBuyingUnit()
        set s__EventArgs_BuyItem[e]=GetSoldItem()
        set s__EventArgs_ChatString[e]=GetEventPlayerChatString()
        set i=1
        loop
        exitwhen ( i >= s__Table__getindex(s__Table__staticgetindex(s__Events_onUnitSpell),0) )
            set callback=(s__Table__getindex(s__Table__staticgetindex(s__Events_onUnitSpell),i))
            call sc___prototype1_evaluate(callback,e)
        set i=i + 1
        endloop
        call s__EventArgs_Destroy(e)
    endfunction
    function Events___Event_onUnitReadySpell takes nothing returns nothing
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
        set s__EventArgs_BuyingUnit[e]=GetBuyingUnit()
        set s__EventArgs_BuyItem[e]=GetSoldItem()
        set s__EventArgs_ChatString[e]=GetEventPlayerChatString()
        set i=1
        loop
        exitwhen ( i >= s__Table__getindex(s__Table__staticgetindex(s__Events_onUnitReadySpell),0) )
            set callback=(s__Table__getindex(s__Table__staticgetindex(s__Events_onUnitReadySpell),i))
            call sc___prototype1_evaluate(callback,e)
        set i=i + 1
        endloop
        call s__EventArgs_Destroy(e)
    endfunction
    function Events___Event_onUnitStartSpell takes nothing returns nothing
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
        set s__EventArgs_BuyingUnit[e]=GetBuyingUnit()
        set s__EventArgs_BuyItem[e]=GetSoldItem()
        set s__EventArgs_ChatString[e]=GetEventPlayerChatString()
        set i=1
        loop
        exitwhen ( i >= s__Table__getindex(s__Table__staticgetindex(s__Events_onUnitStartSpell),0) )
            set callback=(s__Table__getindex(s__Table__staticgetindex(s__Events_onUnitStartSpell),i))
            call sc___prototype1_evaluate(callback,e)
        set i=i + 1
        endloop
        call s__EventArgs_Destroy(e)
    endfunction
    function Events___Event_onUnitStopSpell takes nothing returns nothing
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
        set s__EventArgs_BuyingUnit[e]=GetBuyingUnit()
        set s__EventArgs_BuyItem[e]=GetSoldItem()
        set s__EventArgs_ChatString[e]=GetEventPlayerChatString()
        set i=1
        loop
        exitwhen ( i >= s__Table__getindex(s__Table__staticgetindex(s__Events_onUnitStopSpell),0) )
            set callback=(s__Table__getindex(s__Table__staticgetindex(s__Events_onUnitStopSpell),i))
            call sc___prototype1_evaluate(callback,e)
        set i=i + 1
        endloop
        call s__EventArgs_Destroy(e)
    endfunction
    function Events___Event_onHeroLevelUp takes nothing returns nothing
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
        set s__EventArgs_BuyingUnit[e]=GetBuyingUnit()
        set s__EventArgs_BuyItem[e]=GetSoldItem()
        set s__EventArgs_ChatString[e]=GetEventPlayerChatString()
        set i=1
        loop
        exitwhen ( i >= s__Table__getindex(s__Table__staticgetindex(s__Events_onHeroLevelUp),0) )
            set callback=(s__Table__getindex(s__Table__staticgetindex(s__Events_onHeroLevelUp),i))
            call sc___prototype1_evaluate(callback,e)
        set i=i + 1
        endloop
        call s__EventArgs_Destroy(e)
    endfunction
    function Events___Event_onUnitDeacy takes nothing returns nothing
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
        set s__EventArgs_BuyingUnit[e]=GetBuyingUnit()
        set s__EventArgs_BuyItem[e]=GetSoldItem()
        set s__EventArgs_ChatString[e]=GetEventPlayerChatString()
        set i=1
        loop
        exitwhen ( i >= s__Table__getindex(s__Table__staticgetindex(s__Events_onUnitDeacy),0) )
            set callback=(s__Table__getindex(s__Table__staticgetindex(s__Events_onUnitDeacy),i))
            call sc___prototype1_evaluate(callback,e)
        set i=i + 1
        endloop
        call s__EventArgs_Destroy(e)
    endfunction
    function Events___Event_onUnitSellItem takes nothing returns nothing
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
        set s__EventArgs_BuyingUnit[e]=GetBuyingUnit()
        set s__EventArgs_BuyItem[e]=GetSoldItem()
        set s__EventArgs_ChatString[e]=GetEventPlayerChatString()
        set i=1
        loop
        exitwhen ( i >= s__Table__getindex(s__Table__staticgetindex(s__Events_onUnitSellItem),0) )
            set callback=(s__Table__getindex(s__Table__staticgetindex(s__Events_onUnitSellItem),i))
            call sc___prototype1_evaluate(callback,e)
        set i=i + 1
        endloop
        call s__EventArgs_Destroy(e)
    endfunction
    function Events___Event_onPlayerChat takes nothing returns nothing
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
        set s__EventArgs_BuyingUnit[e]=GetBuyingUnit()
        set s__EventArgs_BuyItem[e]=GetSoldItem()
        set s__EventArgs_ChatString[e]=GetEventPlayerChatString()
        set i=1
        loop
        exitwhen ( i >= s__Table__getindex(s__Table__staticgetindex(s__Events_onPlayerChat),0) )
            set callback=(s__Table__getindex(s__Table__staticgetindex(s__Events_onPlayerChat),i))
            call sc___prototype1_evaluate(callback,e)
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
        set t=CreateTrigger() //textmacro instance: RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_UNIT_SPELL_EFFECT","Event_onUnitSpell")
        call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_SPELL_EFFECT)
        call TriggerAddAction(t, function Events___Event_onUnitSpell) //end of: RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_UNIT_SPELL_EFFECT","Event_onUnitSpell")
        set t=CreateTrigger() //textmacro instance: RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_HERO_LEVEL","Event_onHeroLevelUp")
        call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_HERO_LEVEL)
        call TriggerAddAction(t, function Events___Event_onHeroLevelUp) //end of: RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_HERO_LEVEL","Event_onHeroLevelUp")
        set t=CreateTrigger() //textmacro instance: RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_UNIT_SPELL_CHANNEL","Event_onUnitReadySpell")
        call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_SPELL_CHANNEL)
        call TriggerAddAction(t, function Events___Event_onUnitReadySpell) //end of: RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_UNIT_SPELL_CHANNEL","Event_onUnitReadySpell")
        set t=CreateTrigger() //textmacro instance: RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_UNIT_SPELL_CAST","Event_onUnitStartSpell")
        call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_SPELL_CAST)
        call TriggerAddAction(t, function Events___Event_onUnitStartSpell) //end of: RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_UNIT_SPELL_CAST","Event_onUnitStartSpell")
        set t=CreateTrigger() //textmacro instance: RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_UNIT_SPELL_ENDCAST","Event_onUnitStopSpell")
        call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_SPELL_ENDCAST)
        call TriggerAddAction(t, function Events___Event_onUnitStopSpell) //end of: RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_UNIT_SPELL_ENDCAST","Event_onUnitStopSpell")
        set t=CreateTrigger() //textmacro instance: RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_UNIT_DECAY","Event_onUnitDeacy")
        call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_DECAY)
        call TriggerAddAction(t, function Events___Event_onUnitDeacy) //end of: RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_UNIT_DECAY","Event_onUnitDeacy")
        set t=CreateTrigger() //textmacro instance: RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_UNIT_SELL_ITEM","Event_onUnitSellItem")
        call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_SELL_ITEM)
        call TriggerAddAction(t, function Events___Event_onUnitSellItem) //end of: RegisterEvent("TriggerRegisterAnyUnitEventBJ","EVENT_PLAYER_UNIT_SELL_ITEM","Event_onUnitSellItem")
        set t=CreateTrigger() //textmacro instance: AllPlayerRegisterEvent("TriggerRegisterPlayerEventLeave","","Event_onPlayerDisconnect","")
        set index=0
        loop
        exitwhen ( index > 12 )
            call TriggerRegisterPlayerEventLeave(t, Player(index))
        set index=index + 1
        endloop
        call TriggerAddAction(t, function Events___Event_onPlayerDisconnect) //end of: AllPlayerRegisterEvent("TriggerRegisterPlayerEventLeave","","Event_onPlayerDisconnect","")
        set t=CreateTrigger() //textmacro instance: AllPlayerRegisterEvent("TriggerRegisterPlayerChatEvent","","Event_onPlayerChat",",\"\",false")
        set index=0
        loop
        exitwhen ( index > 12 )
            call TriggerRegisterPlayerChatEvent(t, Player(index), "", false)
        set index=index + 1
        endloop
        call TriggerAddAction(t, function Events___Event_onPlayerChat) //end of: AllPlayerRegisterEvent("TriggerRegisterPlayerChatEvent","","Event_onPlayerChat",",\"\",false")
        set t=CreateTrigger()
        call YDWESyStemAnyUnitDamagedRegistTrigger(t)
        call TriggerAddAction(t, function Events___Event_onUnitDamage)
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
                        call sc___prototype1_evaluate((s__HitFlys_onRemove[tmp]),tmp)
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
                    call sc___prototype1_evaluate(callback,m)
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
                                    call sc___prototype1_evaluate((s__HitFlys_onDown[tmp]),tmp)
                                endif
                            endif
                        endif
                    else
                        call SetUnitFlyHeight(s__HitFlys_Unit[tmp], 0, 0)
                        if ( s__HitFlys_onEnd[tmp] != 0 ) then
                            call sc___prototype1_evaluate((s__HitFlys_onEnd[tmp]),tmp)
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
//library Players:
        //public:  //玩家ID
                function s__Players_anon__1 takes nothing returns nothing
                    local integer p=(GetTimerData(GetExpiredTimer()))
                    call CameraSetEQNoiseForPlayer(s__Players_player[p], s__Players_duanglv[p])
                    set s__Players_duangtime[p]=s__Players_duangtime[p] - 0.01
                    if ( s__Players_duangtime[p] <= 0 ) then
                        set s__Players_duangtimer[p]=null
                        set s__Players_duanglv[p]=0
                        set s__Players_duangtime[p]=0
                        call CameraClearNoiseForPlayer(s__Players_player[p])
                        call ReleaseTimer(GetExpiredTimer())
                    endif
                endfunction
            function s__Players_Duang takes integer this,real lv,real time returns nothing
                if ( s__Players_duangtimer[this] == null ) then
                    set s__Players_duangtimer[this]=NewTimer()
                    call SetTimerData(s__Players_duangtimer[this] , this)
                    call TimerStart(s__Players_duangtimer[this], 0.01, true, function s__Players_anon__1)
                endif
                set s__Players_duanglv[this]=s__Players_duanglv[this] + lv
                set s__Players_duangtime[this]=s__Players_duangtime[this] + time
            endfunction
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
            set s__Players_playerids[p]=I2S(GetPlayerId(ps))
            set s__Players_teamid[p]=GetPlayerTeam(ps)
            set s__Players_isai[p]=GetPlayerController(ps) == MAP_CONTROL_COMPUTER
            set s__Players_isonline[p]=true
            set s__Players_randomhero[p]=100
            set s__Players_lifekill[p]=0
            set s__Players_nextherotype[p]=- 1
            set s__Players_isdeath[p]=false
            set s__Players_press[p]=sc__PlayerPress_create()
            call s__HandleTable__setindex(s__Players_ht,ps, p)
            return p
        endfunction
        function s__Players_Get takes player p returns integer
            return s__HandleTable__getindex(s__Players_ht,p)
        endfunction
        function s__Players_onInit takes nothing returns nothing
            set s__Players_ht=s__HandleTable__allocate()
            set s__Players_localplayer=GetLocalPlayer()
        endfunction

//library Players ends
//library Press:

//processed:     function interface Press___PressSnycEventInterface takes player arg0, string arg1 returns nothing  //主要用于同步玩家的按键 //网易提供的事件延迟太高了 //改为使用YDWE-LUA引擎的message.hook+GC实现
        function s__Press_TriggerSnyc takes string eName,player n,string keyName returns nothing
            local integer i
            local integer callback
            set i=1
            loop
            exitwhen ( i >= s__Table__getindex(s__Table__staticgetindex(eName),0) )
                set callback=(s__Table__getindex(s__Table__staticgetindex(eName),i))
                call sc___prototype35_evaluate(callback,n , keyName)
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
        function Press___anon__0 takes nothing returns nothing
            local integer p=s__Players_Get(GetEnumPlayer())
            local integer i
            local integer s
            set i=0
            loop
            exitwhen ( i >= 9 )
                set s=GetStoredInteger(gc, s__Players_playerids[p], keys[i])
                if ( s != 0 ) then
                    if ( s == 1 ) then
                        call s__Press_TriggerSnyc(s__Press_onSnycPressKeyUp , s__Players_player[p] , keynames[i])
                    else
                        call s__Press_TriggerSnyc(s__Press_onSnycPressKeyDown , s__Players_player[p] , keynames[i])
                    endif
                    call StoreInteger(gc, s__Players_playerids[p], keys[i], 0)
                endif
            set i=i + 1
            endloop
        endfunction
    function GCSnyc takes nothing returns nothing
        call s__Teams_ActionsForAllPlayer(function Press___anon__0)
    endfunction
    function Press___onInit takes nothing returns nothing
        set keys[0]="769"
        set keynames[0]="F2"
        set keys[1]="81"
        set keynames[1]="Q"
        set keys[2]="87"
        set keynames[2]="W"
        set keys[3]="69"
        set keynames[3]="E"
        set keys[4]="82"
        set keynames[4]="R"
        set keys[5]="68"
        set keynames[5]="D"
        set keys[6]="70"
        set keynames[6]="F"
        set keys[7]="67"
        set keynames[7]="C"
        set keys[8]="32"
        set keynames[8]="SPACE"
        set gc=InitGameCache("press")
        call Cheat("exec-lua:init")
        call TimerStart(NewTimer(), 0.01, true, function GCSnyc)
    endfunction

//library Press ends
//library SoundUtils:
//******************************************************************************
//* BY: Rising_Dusk
//* 
//* Sounds are a very picky datatype in WC3. They have many quirks that one must
//* account for in order to use them, and simply using the internal WE Sound
//* Editor isn't enough because the sounds it makes can't be played multiple
//* times at once. 3-D sounds are also very tricky because there are different
//* WC3 sound options that a user can have activated where certain sounds will
//* or will not work. This library attempts to streamline the handling of sounds
//* so that it is less likely to confuse you or cause problems.
//* 
//* The .mp3 format can be used for 3-D sounds, but there is one problem that
//* must be noted. If your computer supports the "Dolby Surround" sound option
//* in WC3 and you have it selected, then .mp3 files will work for 3-D sounds.
//* If you don't, however, they may not work depending on what you do have
//* selected and what is available for your computer. The .wav format works on
//* all possible settings, making them excellent for general use. This library
//* can interface with sounds of either type.
//* 
//* Known issues with sounds that this library resolves:
//*     - A given sound variable can only be played once at a time. In order to
//*       play a sound type multiple times at once, you need multiple variables.
//*     - A sound cannot be played at the same instant that it is created.
//* 
//* The DefineSound function defines a sound type based on some basic parameters
//* the user provides. DefineSoundEx is available if the user wants control over
//* all possible parameters, though they won't have an impact most of the time.
//* The duration parameter for DefineSound and DefineSoundEx is in milliseconds,
//* which is consistent with Blizzard's natives. To get the duration of a given
//* sound, open up the WE's Sound Editor, navigate to your sound, and select
//* "Add as Sound." In doing so, it will show its duration in seconds. Multiply
//* that number by 1000 and use it as the duration argument.
//* 
//* This library returns a sound variable with RunSound that you can change the
//* settings of using the standard JASS sound API. The library assigns default
//* values to the parameters for 2-D and 3-D sounds, that way they will run
//* without any further help.
//* 
//* The library automatically allocates, runs, and recycles a sound when you
//* call RunSound. This library will not automatically recycle looping sounds,
//* so you will need to call ReleaseSound on the looping sound when you want it
//* to end.
//* 
//******************************************************************************
//* 
//*    > function DefineSound takes string fileName, integer duration, ...
//*        boolean looping, boolean is3D returns integer
//* 
//* This function defines a sound type with a short list of parameters. The
//* returned integer serves as a SOUND_TYPE for running this type of sound at
//* any other point in a map.
//* 
//*    > function DefineSoundEx takes string fileName, integer duration, ...
//*        boolean looping, boolean is3D, boolean stopwhenoutofrange, ...
//*        integer fadeInRate, integer fadeOutRate, string eaxSetting ...
//*        returns integer
//* 
//* This function serves an identical purpose to DefineSound, but gives the user
//* full control over the entire list of parameters. Similar to DefineSound, the
//* returned integer serves as a SOUND_TYPE for running this type of sound.
//* 
//*    > function RunSound takes integer soundRef returns sound
//* 
//* This function runs a sound with the parameters held within the soundRef
//* integer argument. The soundRef argument is the returned value of DefineSound
//* or DefineSoundEx.
//* 
//*    > function RunSoundOnUnit takes integer soundRef, unit whichUnit returns sound
//* 
//* The same as RunSound, just this function runs a sound of a given type on a
//* specified unit.
//* 
//*    > function RunSoundAtPoint takes integer soundRef, real x, real y, real z returns sound
//* 
//* The same as RunSound, just this function runs a sound of a given type at a
//* specified point in 3D space.
//* 
//*    > function RunSoundForPlayer takes integer soundRef, player p returns sound
//* 
//* The same as RunSound, just this function runs a sound of a given type only
//* for the specified player.
//* 
//*    > function ReleaseSound takes sound s returns boolean
//* 
//* This function need only be called on looping sounds. If a sound is not
//* looping, it will be released and recycled on its own. This function should
//* be used on looping sounds when you want them to end.
//* 
//* Example usage:
//*     set SOUND_TYPE = DefineSound("Sound\\Path.wav", 300, false, true)
//*     call RunSound(SOUND_TYPE)
//*     call RunSoundOnUnit(SOUND_TYPE, SomeUnit)
//*     call RunSoundAtPoint(SOUND_TYPE, x, y, z)
//*     call RunSoundForPlayer(SOUND_TYPE, Player(5))
//*     call ReleaseSound(SomeLoopingSound)
//* 

//Struct for each sound type
    //Stack associated to each struct
    
    //Sound Settings for this sound type
    
    function s__SoundUtils___soundhelper_create takes string fileName,integer duration,boolean looping,boolean is3D,boolean stopwhenoutofrange,integer fadeInRate,integer fadeOutRate,string eaxSetting returns integer
        local integer sh= s__SoundUtils___soundhelper__allocate()
        //Load the parameters so the sound can be created later as necessary
        set s__SoundUtils___soundhelper_fileName[sh]=fileName
        set s__SoundUtils___soundhelper_duration[sh]=duration
        set s__SoundUtils___soundhelper_looping[sh]=looping
        set s__SoundUtils___soundhelper_is3D[sh]=is3D
        set s__SoundUtils___soundhelper_stopwhenoutofrange[sh]=stopwhenoutofrange
        set s__SoundUtils___soundhelper_fadeInRate[sh]=fadeInRate
        set s__SoundUtils___soundhelper_fadeOutRate[sh]=fadeOutRate
        set s__SoundUtils___soundhelper_eaxSetting[sh]=eaxSetting
        //Create the stack for the struct
        set s__SoundUtils___soundhelper_sta[sh]=s__Stack__allocate()
        return sh
    endfunction

//Struct for holding data for the sound recycling
    
    function s__SoundUtils___soundrecycler_create takes sound whichSound,integer soundRef returns integer
        local integer sr= s__SoundUtils___soundrecycler__allocate()
        set s__SoundUtils___soundrecycler_t[sr]=NewTimer()
        set s__SoundUtils___soundrecycler_s[sr]=whichSound
        set s__SoundUtils___soundrecycler_sh[sr]=soundRef
        call SetTimerData(s__SoundUtils___soundrecycler_t[sr] , (sr))
        
        //Hook the value to the soundRef and whichSound
        call SaveInteger(SoundUtils___rt, soundRef, GetHandleId(whichSound), (sr))
        return sr
    endfunction
    function s__SoundUtils___soundrecycler_onDestroy takes integer this returns nothing
        call RemoveSavedInteger(SoundUtils___rt, s__SoundUtils___soundrecycler_sh[this], GetHandleId(s__SoundUtils___soundrecycler_s[this]))
        call ReleaseTimer(s__SoundUtils___soundrecycler_t[this])
    endfunction

//Generated destructor of SoundUtils___soundrecycler
function s__SoundUtils___soundrecycler_deallocate takes integer this returns nothing
    if this==null then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Attempt to destroy a null struct of type: SoundUtils___soundrecycler")
        return
    elseif (si__SoundUtils___soundrecycler_V[this]!=-1) then
        call DisplayTimedTextToPlayer(GetLocalPlayer(),0,0,1000.,"Double free of type: SoundUtils___soundrecycler")
        return
    endif
    call s__SoundUtils___soundrecycler_onDestroy(this)
    set si__SoundUtils___soundrecycler_V[this]=si__SoundUtils___soundrecycler_F
    set si__SoundUtils___soundrecycler_F=this
endfunction

//******************************************************************************

function SoundUtils___HookStopSound takes sound soundHandle,boolean killWhenDone,boolean fadeOut returns nothing
    local integer id= GetHandleId(soundHandle)
    local integer soundRef= 0
    local integer sr= 0
    if HaveSavedInteger(SoundUtils___ht, 0, id) then //Sound is from stacks
        set soundRef=LoadInteger(SoundUtils___ht, 0, id)
        if HaveSavedInteger(SoundUtils___rt, soundRef, id) then //Sound has a recycler
            set sr=(LoadInteger(SoundUtils___rt, soundRef, id))
            set s__SoundUtils___soundrecycler_stopped[sr]=true
        endif
        if killWhenDone then
             call BJDebugMsg("SoundUtils_Warning: (StopSound) Destroying a sound in the stack")
        endif
    endif
endfunction

//processed hook: hook StopSound SoundUtils___HookStopSound

function SoundUtils___HookKillSoundWhenDone takes sound soundHandle returns nothing
    if HaveSavedInteger(SoundUtils___ht, 0, GetHandleId(soundHandle)) then
        call BJDebugMsg("SoundUtils_Warning: (KillSoundWhenDone) Destroying a sound in the stack")
    endif
endfunction

//processed hook:  hook KillSoundWhenDone SoundUtils___HookKillSoundWhenDone

//******************************************************************************

function DefineSoundEx takes string fileName,integer duration,boolean looping,boolean is3D,boolean stopwhenoutofrange,integer fadeInRate,integer fadeOutRate,string eaxSetting returns integer
    return (s__SoundUtils___soundhelper_create(fileName , duration , looping , is3D , stopwhenoutofrange , fadeInRate , fadeOutRate , eaxSetting))
endfunction
function DefineSound takes string fileName,integer duration,boolean looping,boolean is3D returns integer
    return DefineSoundEx(fileName , duration , looping , is3D , true , 10 , 10 , "CombatSoundsEAX")
endfunction

function ReleaseSound takes sound s returns boolean
    local integer id= GetHandleId(s)
    local integer soundRef= 0
    local integer sh= 0
    local integer sr= 0
    
    if s == null then
         call BJDebugMsg("SoundUtils_Error: Cannot recycle a null sound")
        return false
    elseif not HaveSavedInteger(SoundUtils___ht, 0, id) then
         call BJDebugMsg("SoundUtils_Error: Cannot recycle a sound not allocated by RunSound")
        return false
    endif
    
    set soundRef=LoadInteger(SoundUtils___ht, 0, id)
    set sh=(soundRef)
    
    call h__StopSound(s, false, true) //Stop the sound
    call s__Stack_push(s__SoundUtils___soundhelper_sta[sh],id) //Return it to the stack
    call SaveSoundHandle(SoundUtils___st, soundRef, id, s) //Save it to hashtable
    if not s__SoundUtils___soundhelper_looping[sh] then
        //soundrecycler only exists for non-looping sounds
        set sr=(LoadInteger(SoundUtils___rt, soundRef, id))
        call s__SoundUtils___soundrecycler_deallocate(sr) //Destroy recycler helper
    endif
    return true
endfunction

function SoundUtils___Recycle takes nothing returns nothing
    local integer sr= (GetTimerData(GetExpiredTimer()))
    local integer sh= (s__SoundUtils___soundrecycler_sh[sr])
    local integer id= GetHandleId(s__SoundUtils___soundrecycler_s[sr])
    
    call h__StopSound(s__SoundUtils___soundrecycler_s[sr], false, true) //Stop the sound
    call s__Stack_push(s__SoundUtils___soundhelper_sta[sh],id) //Return it to the stack
    call SaveSoundHandle(SoundUtils___st, (sh), id, s__SoundUtils___soundrecycler_s[sr]) //Save it to hashtable
    call s__SoundUtils___soundrecycler_deallocate(sr) //Destroy recycler helper
endfunction

function SoundUtils___Run takes nothing returns nothing
    local integer sr= (GetTimerData(GetExpiredTimer()))
    local integer sh= (s__SoundUtils___soundrecycler_sh[sr])
    
    if not s__SoundUtils___soundrecycler_stopped[sr] then
        call StartSound(s__SoundUtils___soundrecycler_s[sr]) //Play sound here
    endif
    if not s__SoundUtils___soundhelper_looping[sh] and not s__SoundUtils___soundrecycler_stopped[sr] then
        call TimerStart(s__SoundUtils___soundrecycler_t[sr], s__SoundUtils___soundhelper_duration[sh] * 0.001, false, function SoundUtils___Recycle)
    else
        call s__SoundUtils___soundrecycler_deallocate(sr)
    endif
endfunction

function RunSound takes integer soundRef returns sound
    local sound s= null
    local integer i= 0
    local integer sh= (soundRef)
    local integer sr= 0
    
    if soundRef <= 0 then
         call BJDebugMsg("SoundUtils_Error: Cannot run sound of undefined type")
        return null
    endif
    //Check if the stack is empty
    if s__Stack_peek(s__SoundUtils___soundhelper_sta[sh]) == s__Stack_EMPTY then
        //Create a new sound for the stack
        set s=CreateSound(s__SoundUtils___soundhelper_fileName[sh], s__SoundUtils___soundhelper_looping[sh], s__SoundUtils___soundhelper_is3D[sh], s__SoundUtils___soundhelper_stopwhenoutofrange[sh], s__SoundUtils___soundhelper_fadeInRate[sh], s__SoundUtils___soundhelper_fadeOutRate[sh], s__SoundUtils___soundhelper_eaxSetting[sh])
        //Attach the type to the sound for future reference
        call SaveInteger(SoundUtils___ht, 0, GetHandleId(s), (sh))
        call SetSoundDuration(s, s__SoundUtils___soundhelper_duration[sh])
        
        //Stuff that must be performed immediately upon creation of sounds
        call SetSoundChannel(s, 0)
        call SetSoundVolume(s, 127)
        call SetSoundPitch(s, 1.)
        if s__SoundUtils___soundhelper_is3D[sh] then
            //These are settings necessary for 3-D sounds to function properly
            //You can change them at will outside of this function
            call SetSoundDistances(s, 2000., 3000.)
            call SetSoundDistanceCutoff(s, 2250.)
            call SetSoundConeAngles(s, 0., 0., 127)
            call SetSoundConeOrientation(s, 0., 0., 0.)
        endif
        
        //Start sound after a delay because it was created here
        set sr=s__SoundUtils___soundrecycler_create(s , soundRef)
        call TimerStart(s__SoundUtils___soundrecycler_t[sr], 0.001, false, function SoundUtils___Run)
    else
        //Allocate a sound from the stack
        set i=s__Stack_pop(s__SoundUtils___soundhelper_sta[sh])
        if not HaveSavedHandle(SoundUtils___st, soundRef, i) then
             call BJDebugMsg("SoundUtils_Error: No sound in given stack member")
            return null
        endif
        set s=LoadSoundHandle(SoundUtils___st, soundRef, i)
        call RemoveSavedInteger(SoundUtils___st, soundRef, i)
        call SetSoundVolume(s, 127) //Start volume at max
        
        //Start it here since it wasn't created here
        call StartSound(s)
        //Recycle the sound in a timer callback after it's finished if nonlooping
        if not s__SoundUtils___soundhelper_looping[sh] then
            set sr=s__SoundUtils___soundrecycler_create(s , soundRef)
            call TimerStart(s__SoundUtils___soundrecycler_t[sr], s__SoundUtils___soundhelper_duration[sh] * 0.001, false, function SoundUtils___Recycle)
        endif
    endif
    return s
endfunction

function RunSoundOnUnit takes integer soundRef,unit whichUnit returns sound
    local sound s= RunSound(soundRef)
    call AttachSoundToUnit(s, whichUnit)
    return s
endfunction

function RunSoundAtPoint takes integer soundRef,real x,real y,real z returns sound
    local sound s= RunSound(soundRef)
    call SetSoundPosition(s, x, y, z)
    return s
endfunction

function RunSoundForPlayer takes integer soundRef,player p returns sound
    local sound s= RunSound(soundRef)
    if GetLocalPlayer() != p then
        call SetSoundVolume(s, 0)
    else
        call SetSoundVolume(s, 127)
    endif
    return s
endfunction

//library SoundUtils ends
//library Spells:
//processed:     function interface Spells___SpellEventInterface takes Spell arg0 returns nothing
        function s__Spell_Destroy takes integer this returns nothing
            set s__Spell_Use[this]=s__Spell_Use[this] - 1
            if ( s__Spell_Use[this] == 0 ) then
                call BJDebugMsg(GetAbilityName(s__Spell_Id[this]) + "结束-阶段:" + I2S(s__Spell_State[this]))
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
                    call sc___prototype1_evaluate((s__Table__getindex(s__Table__staticgetindex(eName),id)),m)
                else
                    call s__Spell_Destroy(m)
                endif
            endfunction
            function s__Spell_On takes string eName,integer spellid,integer callback returns nothing
                call s__Table__setindex(s__Table__staticgetindex(eName),spellid, callback)
            endfunction
        function s__Spell_onUnitSpell takes integer e returns nothing
            local integer u=sc__Units_Get(s__EventArgs_TriggerUnit[e])
            local integer tmp
            if ( GetUnitAbilityLevel(s__EventArgs_TriggerUnit[e], 'Aloc') == 0 ) then
                set tmp=s__Spell__allocate()
                call SpellText(s__Units_unit[u] , s__EventArgs_SpellId[e] , 3 , 10)
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
                call BJDebugMsg(GetAbilityName(s__Spell_Id[tmp]) + "生成-阶段:" + I2S(s__Spell_State[tmp]))
                if ( s__Units_spell[u] != 0 ) then
                    set s__Spell_Use[tmp]=2
                    call sc___prototype1_evaluate((s__Units_spell[u]),tmp)
                endif
                call s__Spell_Trigger(s__Spell_onSpell , s__Spell_Id[tmp] , tmp)
            endif
        endfunction
        function s__Spell_onUnitStartSpell takes integer e returns nothing
            local integer u=sc__Units_Get(s__EventArgs_TriggerUnit[e])
            local integer tmp
            if ( GetUnitAbilityLevel(s__EventArgs_TriggerUnit[e], 'Aloc') == 0 ) then
                set tmp=s__Spell__allocate()
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
                set s__Spell_State[tmp]=2
                call BJDebugMsg(GetAbilityName(s__Spell_Id[tmp]) + "生成-阶段:" + I2S(s__Spell_State[tmp]))
                call s__Spell_Trigger(s__Spell_onStart , s__Spell_Id[tmp] , tmp)
            endif
        endfunction  //end of: SpellFunc("StartSpell","Start","2")
        function s__Spell_onUnitStopSpell takes integer e returns nothing
            local integer u=sc__Units_Get(s__EventArgs_TriggerUnit[e])
            local integer tmp
            if ( GetUnitAbilityLevel(s__EventArgs_TriggerUnit[e], 'Aloc') == 0 ) then
                set tmp=s__Spell__allocate()
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
                set s__Spell_State[tmp]=3
                call BJDebugMsg(GetAbilityName(s__Spell_Id[tmp]) + "生成-阶段:" + I2S(s__Spell_State[tmp]))
                call s__Spell_Trigger(s__Spell_onStop , s__Spell_Id[tmp] , tmp)
            endif
        endfunction  //end of: SpellFunc("StopSpell","Stop","3")
        function s__Spell_onUnitReadySpell takes integer e returns nothing
            local integer u=sc__Units_Get(s__EventArgs_TriggerUnit[e])
            local integer tmp
            if ( GetUnitAbilityLevel(s__EventArgs_TriggerUnit[e], 'Aloc') == 0 ) then
                set tmp=s__Spell__allocate()
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
                set s__Spell_State[tmp]=1
                call BJDebugMsg(GetAbilityName(s__Spell_Id[tmp]) + "生成-阶段:" + I2S(s__Spell_State[tmp]))
                call s__Spell_Trigger(s__Spell_onReady , s__Spell_Id[tmp] , tmp)
            endif
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
//library BuyNextHero:

    function BuyNextHero___Buy takes integer e returns nothing
        local integer id
        local integer p
        if ( GetItemType(s__EventArgs_BuyItem[e]) == ITEM_TYPE_POWERUP ) then
            set id=S2I(GetItemName(s__EventArgs_BuyItem[e]))
            set p=s__Units_player[sc__Units_Get(s__EventArgs_BuyingUnit[e])]
            call RemoveItem(s__EventArgs_BuyItem[e])
            set s__Players_nextherotype[p]=HeroType[id]
            call DisplayTextToPlayer(s__Players_player[p], 0, 0, "你已指定复活英雄为 '" + s__Util_GetUnitValue(s__Players_nextherotype[p] , "Name") + " ',请确保死亡时金钱充足~~")
        endif
    endfunction
    function BuyNextHero___onInit takes nothing returns nothing
        call s__Events_On(s__Events_onUnitSellItem , (6))
    endfunction

//library BuyNextHero ends
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
                    call sc___prototype1_evaluate(callback,e)
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
            local integer dmg
            if ( s__EventArgs_Damage[e] > 0 ) then
                set dmg=s__DamageArgs_create()
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
            endif
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
            call s__Events_On(s__Events_onPlayerDisconnect , (7))
            call s__Events_On(s__Events_onUnitDamage , (8))
        endfunction

//library Damage ends
//library Disconnect:

        function Disconnect___anon__16 takes nothing returns nothing
            local integer u=(GetTimerData(GetExpiredTimer()))
            call sc__HeroRares_AddRandomHero(s__Units_unit[u])
            call ReleaseTimer(GetExpiredTimer())
        endfunction
        function Disconnect___anon__17 takes nothing returns nothing
            call AdjustPlayerStateBJ(GetPlayerState(s__Players_player[Disconnect___tmp], PLAYER_STATE_RESOURCE_GOLD) / ( s__Teams_GetTeamNumber(s__Players_player[Disconnect___tmp]) - 1 ), GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD)
        endfunction
    function Disconnect___onDisconnect takes integer e returns nothing
        local integer x
        local unit u
        local timer t
        set Disconnect___tmp=s__Players_Get(s__EventArgs_TriggerPlayer[e])
        set u=s__Units_unit[s__Players_hero[Disconnect___tmp]]
        set s__Players_hero[Disconnect___tmp]=0
        call ReviveHero(u, GetUnitX(u), GetUnitY(u), false)
        call SetUnitPosition(u, GetRectCenterX(s__Teams_GetTeamRect(s__Players_player[Disconnect___tmp])), GetRectCenterY(s__Teams_GetTeamRect(s__Players_player[Disconnect___tmp])))
        set x=1
        loop
        exitwhen ( x > 6 )
            call UnitRemoveItemFromSlotSwapped(x, u)
        set x=x + 1
        endloop
        call sc__Units_Kill(u)
        set t=NewTimer()
        call SetTimerData(t , sc__Units_Get(u))
        call TimerStart(t, 3, false, function Disconnect___anon__16)
        set t=null
        set x=s__Teams_GetTeamNumber(s__Players_player[Disconnect___tmp]) - 1
        if ( x != 0 ) then
            call ForForce(s__Teams_GetTeamForce(s__Players_player[Disconnect___tmp]), function Disconnect___anon__17)
        endif
        call s__Teams_PlayerRemoveForce(s__Players_player[Disconnect___tmp])
        call DisplayTimedTextToForce(s__Teams_GetAllPlayers(), 5.00, s__Players_name[Disconnect___tmp] + " 离开了游戏，金钱将平分给他的队友。")
        set s__Players_isonline[Disconnect___tmp]=false
        call sc__KillUi_FlushPlayerData(s__Players_player[Disconnect___tmp])
        set u=null
    endfunction
    function Disconnect___onInit takes nothing returns nothing
        call s__Events_On(s__Events_onPlayerDisconnect , (9))
    endfunction

//library Disconnect ends
//library LevelUp:

        function LevelUp___anon__25 takes nothing returns nothing
            local integer p=s__Players_Get(GetEnumPlayer())
            if ( s__Players_isai[p] == true ) then
                call SetHeroLevel(s__Units_unit[s__Players_hero[p]], LevelUp___MaxLv, true)
            endif
        endfunction
    function LevelUp___LvUp takes integer e returns nothing
        local integer lv=GetUnitLevel(s__EventArgs_TriggerUnit[e])
        local integer p=s__Units_player[sc__Units_Get(s__EventArgs_TriggerUnit[e])]
        if ( lv > LevelUp___MaxLv ) then
            set LevelUp___MaxLv=lv
            call ForForce(s__Teams_GetAllPlayers(), function LevelUp___anon__25)
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
        call s__Events_On(s__Events_onHeroLevelUp , (10))
    endfunction

//library LevelUp ends
//library PlayerChat:

    function PlayerChat___Chat takes integer e returns nothing
        local integer p=s__Players_Get(s__EventArgs_TriggerPlayer[e])
        if ( s__EventArgs_ChatString[e] == "-PC" ) then
            if ( s__Players_isai[p] == true ) then
                set s__Players_isai[p]=false
                call DisplayTextToPlayer(s__Players_player[p], 0, 0, "你已关闭电脑托管~!")
            else
                set s__Players_isai[p]=true
                call DisplayTextToPlayer(s__Players_player[p], 0, 0, "你已开启电脑托管~!")
            endif
        endif
    endfunction
    function PlayerChat___onInit takes nothing returns nothing
        call s__Events_On(s__Events_onPlayerChat , (11))
    endfunction

//library PlayerChat ends
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
        function s__PlayerPress_create takes nothing returns integer
            local integer p=s__PlayerPress__allocate()
            set s__PlayerPress_Q[p]=false
            set s__PlayerPress_W[p]=false
            set s__PlayerPress_E[p]=false
            set s__PlayerPress_R[p]=false
            set s__PlayerPress_D[p]=false
            set s__PlayerPress_F[p]=false
            set s__PlayerPress_MouseX[p]=0
            set s__PlayerPress_MouseY[p]=0
            return p
        endfunction
        function s__PlayerPress_Down takes player ps,string e returns nothing
            local integer p=s__Players_Get(ps)
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
            function s__Units_SetMP takes integer this,real r returns nothing
                call SetUnitState(s__Units_unit[this], UNIT_STATE_MANA, r)
            endfunction
            function s__Units_SetHP takes integer this,real r returns nothing
                call SetUnitState(s__Units_unit[this], UNIT_STATE_LIFE, r)
            endfunction
            function s__Units_MaxMP takes integer this returns real
                return GetUnitState(s__Units_unit[this], UNIT_STATE_MAX_MANA)
            endfunction
            function s__Units_MaxHP takes integer this returns real
                return GetUnitState(s__Units_unit[this], UNIT_STATE_MAX_LIFE)
            endfunction
            function s__Units_MP takes integer this returns real
                return GetUnitState(s__Units_unit[this], UNIT_STATE_MANA)
            endfunction
            function s__Units_HP takes integer this returns real
                return GetUnitState(s__Units_unit[this], UNIT_STATE_LIFE)
            endfunction
                function s__Units_anon__2 takes nothing returns nothing
                    local integer data=(GetTimerData(GetExpiredTimer()))
                    local integer u=(s___Data_c[s__Data_c[data]])
                    if ( s___Data_r[s__Data_r[data]+3] <= 0 ) then
                        call sc__Units_Alpha(u,s___Data_i[s__Data_i[data]+2])
                        call s__Data_Destroy(data)
                        call ReleaseTimer(GetExpiredTimer())
                    else
                        set s___Data_r[s__Data_r[data]+3]=s___Data_r[s__Data_r[data]+3] - 0.01
                        set s___Data_i[s__Data_i[data]+1]=s___Data_i[s__Data_i[data]+1] + s___Data_i[s__Data_i[data]]
                        call sc__Units_Alpha(u,s___Data_i[s__Data_i[data]+1])
                    endif
                endfunction
            function s__Units_DelayAlpha takes integer this,integer nowA,integer maxA,real time returns nothing
                local timer t=NewTimer()
                local integer data=s__Data_create('A010')
                set s___Data_c[s__Data_c[data]]=this
                set s___Data_i[s__Data_i[data]]=R2I(( maxA - nowA ) / ( time / 0.01 ))
                set s___Data_i[s__Data_i[data]+1]=nowA
                set s___Data_i[s__Data_i[data]+2]=maxA
                set s___Data_r[s__Data_r[data]+3]=time
                call sc__Units_Alpha(this,nowA)
                call SetTimerData(t , data)
                call TimerStart(t, 0.01, true, function s__Units_anon__2)
                set t=null
            endfunction
            function s__Units_Alpha takes integer this,integer a returns nothing
                call SetUnitVertexColor(s__Units_unit[this], 255, 255, 255, a)
            endfunction
            function s__Units_Pause takes integer this,boolean p returns nothing
                if ( p == true ) then
                    if ( s__Units_pauses[this] == 0 ) then
                        call EXPauseUnit(s__Units_unit[this], p)
                    endif
                    set s__Units_pauses[this]=s__Units_pauses[this] + 1
                else
                    set s__Units_pauses[this]=s__Units_pauses[this] - 1
                    if ( s__Units_pauses[this] == 0 ) then
                        call EXPauseUnit(s__Units_unit[this], p)
                    endif
                endif
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
            function s__Units_Str takes integer this,boolean f returns integer
                return GetHeroStr(s__Units_unit[s__Players_hero[s__Units_player[this]]], f)
            endfunction
            function s__Units_Agi takes integer this,boolean f returns integer
                return GetHeroAgi(s__Units_unit[s__Players_hero[s__Units_player[this]]], f)
            endfunction
            function s__Units_Int takes integer this,boolean f returns integer
                return GetHeroInt(s__Units_unit[s__Players_hero[s__Units_player[this]]], f)
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
            function s__Units_Model takes integer this,string path returns nothing
                call DzSetUnitModel(s__Units_unit[this], path)
            endfunction
                function s__Units_anon__3 takes nothing returns nothing
                    local integer d=(GetTimerData(GetExpiredTimer()))
                    call s__Units_Model((s___Data_c[s__Data_c[d]]),s___Data_s[s__Data_s[d]])
                    call ReleaseTimer(GetExpiredTimer())
                    call s__Data_Destroy(d)
                endfunction
            function s__Units_DelayModel takes integer this,string path,real delay returns nothing
                local timer t
                local integer data
                if ( delay == 0 ) then
                    call s__Units_Model(this,path)
                else
                    set t=NewTimer()
                    set data=s__Data_create('A001')
                    set s___Data_c[s__Data_c[data]]=this
                    set s___Data_s[s__Data_s[data]]=path
                    call SetTimerData(t , data)
                    call TimerStart(t, delay, false, function s__Units_anon__3)
                    set t=null
                endif
            endfunction
                function s__Units_anon__4 takes nothing returns nothing
                    local integer d=(GetTimerData(GetExpiredTimer()))
                    local integer u=(s___Data_c[s__Data_c[d]])
                    call s__Units_AnimeId(u,s___Data_i[s__Data_i[d]])
                    call s__Data_Destroy(d)
                    call ReleaseTimer(GetExpiredTimer())
                endfunction
            function s__Units_DelayAnime takes integer this,integer id,real delay returns nothing
                local timer t=NewTimer()
                local integer data=s__Data_create('A000')
                set s___Data_c[s__Data_c[data]]=this
                set s___Data_i[s__Data_i[data]]=id
                call SetTimerData(t , data)
                call TimerStart(t, delay, false, function s__Units_anon__4)
                set t=null
            endfunction
                function s__Units_anon__5 takes nothing returns nothing
                    local integer d=(GetTimerData(GetExpiredTimer()))
                    local integer u=(s___Data_c[s__Data_c[d]])
                    call s__Units_Size(u,s___Data_r[s__Data_r[d]])
                    call s__Data_Destroy(d)
                    call ReleaseTimer(GetExpiredTimer())
                endfunction
            function s__Units_DelaySize takes integer this,real s,real delay returns nothing
                local timer t=NewTimer()
                local integer data=s__Data_create('A003')
                set s___Data_c[s__Data_c[data]]=this
                set s___Data_r[s__Data_r[data]]=s
                call SetTimerData(t , data)
                call TimerStart(t, delay, false, function s__Units_anon__5)
                set t=null
            endfunction
                function s__Units_anon__6 takes nothing returns nothing
                    local integer d=(GetTimerData(GetExpiredTimer()))
                    local integer u=(s___Data_c[s__Data_c[d]])
                    call sc__Units_AnimeSpeed(u,s___Data_r[s__Data_r[d]])
                    call s__Data_Destroy(d)
                    call ReleaseTimer(GetExpiredTimer())
                endfunction
            function s__Units_DelayAnimeSpeed takes integer this,real speed,real delay returns nothing
                local timer t=NewTimer()
                local integer data=s__Data_create('A002')
                set s___Data_c[s__Data_c[data]]=this
                set s___Data_r[s__Data_r[data]]=speed
                call SetTimerData(t , data)
                call TimerStart(t, delay, false, function s__Units_anon__6)
                set t=null
            endfunction
                function s__Units_anon__7 takes nothing returns nothing
                    local integer d=(GetTimerData(GetExpiredTimer()))
                    local integer u=(s___Data_c[s__Data_c[d]])
                    call sc__Units_AnimeSpeed(u,1)
                    call s__Units_Pause(u,false)
                    call s__Data_Destroy(d)
                    call ReleaseTimer(GetExpiredTimer())
                endfunction
            function s__Units_DelayReleaseAnimePause takes integer this,real delay returns nothing
                local timer t=NewTimer()
                local integer data=s__Data_create('A004')
                set s___Data_c[s__Data_c[data]]=this
                call SetTimerData(t , data)
                call TimerStart(t, delay, false, function s__Units_anon__7)
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
                call SetUnitFacing(s__Units_unit[this], f)
                if ( ex == true ) then
                    call EXSetUnitFacing(s__Units_unit[this], f)
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
            function s__Units_Pz takes integer this,boolean f returns nothing
                call SetUnitPathing(s__Units_unit[this], f)
            endfunction
            function s__Units_PositionEnabled takes integer this,boolean f returns nothing
                if ( f == true ) then
                    set s__Units_moves[this]=s__Units_moves[this] - 1
                    if ( s__Units_moves[this] == 0 ) then
                        set s__Units_move[this]=f
                    endif
                else
                    if ( s__Units_moves[this] == 0 ) then
                        set s__Units_move[this]=f
                    endif
                    set s__Units_moves[this]=s__Units_moves[this] + 1
                endif
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
            function s__Units_GetAbilityCD takes integer this,integer id returns real
                return YDWEGetUnitAbilityState(s__Units_unit[this] , id , 1)
            endfunction
            function s__Units_SetAbilityCD takes integer this,integer id,real cd returns nothing
                call YDWESetUnitAbilityState(s__Units_unit[this] , id , 1 , cd)
            endfunction
        //public:  //自定义事件
            function s__Units_Trigger takes string eName,unit u,unit m returns nothing
                local integer i
                local integer callback
                set i=1
                loop
                exitwhen ( i >= s__Table__getindex(s__Table__staticgetindex(eName),0) )
                    set callback=(s__Table__getindex(s__Table__staticgetindex(eName),i))
                    call sc___prototype46_evaluate(callback,sc__Units_Get(u) , sc__Units_Get(m))
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
                    call SetUnitState(s__EventArgs_TriggerUnit[e], UNIT_STATE_LIFE, - 0.001)
                    call s__Units_Trigger(s__Units_onHeroDeath , s__EventArgs_TriggerUnit[e] , s__EventArgs_KillUnit[e])
                else
                    call s__Units_Trigger(s__Units_onAlocDeath , s__EventArgs_TriggerUnit[e] , s__EventArgs_KillUnit[e])
                endif
            elseif ( GetUnitAbilityLevel(s__EventArgs_TriggerUnit[e], 'Aloc') == 0 ) then
                call SetUnitState(s__EventArgs_TriggerUnit[e], UNIT_STATE_LIFE, - 0.001)
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
            call s__Events_On(s__Events_onUnitDeath , (12))
            call s__Events_On(s__Events_onUnitDeacy , (13))
        endfunction
        function s__Units_Create takes unit u returns integer
            local integer ud=s__Units__allocate()
            set s__Units_player[ud]=s__Players_Get(GetOwningPlayer(u))
            set s__Units_isHero[ud]=IsUnitType(u, UNIT_TYPE_HERO)
            set s__Units_name[ud]=GetUnitName(u)
            set s__Units_uid[ud]=GetUnitTypeId(u)
            set s__Units_unit[ud]=u
            set s__Units_spell[ud]=0
            set s__Units_ai[ud]=0
            set s__Units_move[ud]=true
            set s__Units_Obj[ud]=0
            set s__Units_pauses[ud]=0
            set s__Units_moves[ud]=0
            set s__Units_createtime[ud]=GameTime
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
    function GroupFirst takes group g returns unit
        local integer tmp
        local real c=99999
        local unit r=null
        call GroupAddGroup(g, Groups___tmp_create_group)
        loop
        exitwhen ( FirstOfGroup(Groups___tmp_create_group) == null )
            set tmp=s__Units_Get(FirstOfGroup(Groups___tmp_create_group))
            call GroupRemoveUnit(Groups___tmp_create_group, s__Units_unit[tmp])
            if ( s__Units_createtime[tmp] < c ) then
                set r=s__Units_unit[tmp]
                set c=s__Units_createtime[tmp]
            endif
        endloop
        call GroupClear(Groups___tmp_create_group)
        if ( r != null ) then
            set LAST_FIND_UNIT=r
            set r=null
            return LAST_FIND_UNIT
        endif
        return null
    endfunction
    function GroupDamage takes integer u,real x,real y,real dis,real dmg,integer dmgtype,integer aid,boolean hero returns nothing
        local integer tmp
        local boolean f=false
        call GroupEnumUnitsInRange(Groups___tmp_damage_group, x, y, dis, Condition(function GroupIsAliveNotAloc))
        loop
        exitwhen ( FirstOfGroup(Groups___tmp_damage_group) == null )
            set tmp=s__Units_Get(FirstOfGroup(Groups___tmp_damage_group))
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
            call GroupRemoveUnit(Groups___tmp_damage_group, s__Units_unit[tmp])
        endloop
        call GroupClear(Groups___tmp_damage_group)
    endfunction
    function GroupFind takes unit u,real x,real y,real dis,boolean hero,boolean team returns unit
        local unit tmp
        local real rdis=9999999999
        local unit lock=null
        call GroupEnumUnitsInRange(Groups___tmp_find_group, x, y, dis, Condition(function GroupIsAliveNotAloc))
        loop
        exitwhen ( FirstOfGroup(Groups___tmp_find_group) == null )
            set tmp=FirstOfGroup(Groups___tmp_find_group)
            if ( tmp != u ) then
                if ( IsUnitEnemy(tmp, GetOwningPlayer(u)) == not team ) then
                    if ( s__Util_XY2(tmp , u) < rdis ) then
                        if ( hero == true ) then
                            if ( IsUnitType(tmp, UNIT_TYPE_HERO) == true ) then
                                set lock=tmp
                                set rdis=s__Util_XY2(tmp , u)
                            elseif ( IsUnitType(lock, UNIT_TYPE_HERO) == false ) then
                                set lock=tmp
                                set rdis=s__Util_XY2(tmp , u)
                            endif
                        else
                            set lock=tmp
                            set rdis=s__Util_XY2(tmp , u)
                        endif
                    endif
                endif
            endif
            call GroupRemoveUnit(Groups___tmp_find_group, tmp)
        endloop
        call GroupClear(Groups___tmp_find_group)
        set tmp=null
        if ( lock != null ) then
            set LAST_FIND_UNIT=lock
            set lock=null
            return LAST_FIND_UNIT
        endif
        return null
    endfunction
    function GroupFindFilter takes unit u,real x,real y,real dis,boolean hero,boolean team,unit filter returns unit
        local unit tmp
        local real rdis=9999999999
        local unit lock=null
        call GroupEnumUnitsInRange(Groups___tmp_find_group, x, y, dis, Condition(function GroupIsAliveNotAloc))
        loop
        exitwhen ( FirstOfGroup(Groups___tmp_find_group) == null )
            set tmp=FirstOfGroup(Groups___tmp_find_group)
            if ( filter != tmp and u != tmp ) then
                if ( IsUnitEnemy(tmp, GetOwningPlayer(u)) == not team ) then
                    if ( s__Util_XY2(tmp , u) < rdis ) then
                        if ( hero == true ) then
                            if ( IsUnitType(tmp, UNIT_TYPE_HERO) == true ) then
                                set lock=tmp
                                set rdis=s__Util_XY2(tmp , u)
                            elseif ( IsUnitType(lock, UNIT_TYPE_HERO) == false ) then
                                set lock=tmp
                                set rdis=s__Util_XY2(tmp , u)
                            endif
                        else
                            set lock=tmp
                            set rdis=s__Util_XY2(tmp , u)
                        endif
                    endif
                endif
            endif
            call GroupRemoveUnit(Groups___tmp_find_group, tmp)
        endloop
        call GroupClear(Groups___tmp_find_group)
        set tmp=null
        if ( lock != null ) then
            set LAST_FIND_UNIT=lock
            set lock=null
            return LAST_FIND_UNIT
        endif
        return null
    endfunction
    function GroupRandom takes unit u,real x,real y,real dis,boolean team returns unit
        local unit tmp
        local group g=CreateGroup()
        call GroupEnumUnitsInRange(Groups___tmp_random_group, x, y, dis, Condition(function GroupIsAliveNotAloc))
        call GroupAddGroup(Groups___tmp_random_group, g)
        loop
        exitwhen ( FirstOfGroup(g) == null )
            set tmp=FirstOfGroup(g)
            call GroupRemoveUnit(g, tmp)
            if ( IsUnitEnemy(tmp, GetOwningPlayer(u)) == team ) then
                call GroupRemoveUnit(Groups___tmp_random_group, tmp)
            endif
        endloop
        call DestroyGroup(g)
        call GroupRemoveUnit(Groups___tmp_random_group, u)
        set g=null
        set tmp=null
        set tmp=GroupPickRandomUnit(Groups___tmp_random_group)
        call GroupClear(Groups___tmp_random_group)
        if ( tmp != null ) then
            set LAST_FIND_UNIT=tmp
            set tmp=null
            return LAST_FIND_UNIT
        endif
        return null
    endfunction
    function GroupRandomFilter takes unit u,real x,real y,real dis,boolean team,unit filter returns unit
        local unit tmp
        local group g=CreateGroup()
        call GroupEnumUnitsInRange(Groups___tmp_random_group, x, y, dis, Condition(function GroupIsAliveNotAloc))
        call GroupAddGroup(Groups___tmp_random_group, g)
        loop
        exitwhen ( FirstOfGroup(g) == null )
            set tmp=FirstOfGroup(g)
            call GroupRemoveUnit(g, tmp)
            if ( IsUnitEnemy(tmp, GetOwningPlayer(u)) == team or filter == tmp ) then
                call GroupRemoveUnit(Groups___tmp_random_group, tmp)
            endif
        endloop
        call DestroyGroup(g)
        call GroupRemoveUnit(Groups___tmp_random_group, u)
        set g=null
        set tmp=null
        set tmp=GroupPickRandomUnit(Groups___tmp_random_group)
        call GroupClear(Groups___tmp_random_group)
        if ( tmp != null ) then
            set LAST_FIND_UNIT=tmp
            set tmp=null
            return LAST_FIND_UNIT
        endif
        return null
    endfunction

//library Groups ends
//library HeroRare:

        function HeroRare___anon__14 takes nothing returns nothing
            local unit gu=GetEnumUnit()
            if ( IsUnitType(gu, UNIT_TYPE_HERO) == true ) then
                set HeroType[GetUnitPointValue(gu)]=GetUnitTypeId(gu)
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
        call ForGroup(g, function HeroRare___anon__14)
        call DestroyGroup(g)
        call sc__HeroRares_Repeat(true)
    endfunction
        function s__HeroRares_Repeat takes boolean b returns nothing
            set s__HeroRares_isRepeat=b
        endfunction
        function s__HeroRares_GetRepeat takes nothing returns boolean
            return s__HeroRares_isRepeat
        endfunction
        function s__HeroRares_GetUnitRare takes unit u returns integer
            local string rare=s__Util_GetUnitValue(GetUnitTypeId(u) , "EditorSuffix")
            if ( rare == "R" ) then
                return 0
            endif
            if ( rare == "SR" ) then
                return 1
            endif
            if ( rare == "SSR" ) then
                return 2
            endif
            return 0
        endfunction
        function s__HeroRares_AddRandomHero takes unit u returns nothing
            if ( s__HeroRares_GetRepeat() == false ) then
                call UnitPoolAddUnitType(s__HeroRare___HeroRare[s__HeroRares_GetUnitRare(u)], GetUnitTypeId(u), 1)
            endif
            call s__Units_Remove(u)
        endfunction
        function s__HeroRares_GetRandomHero takes player p,real r returns unit
            local real r1=GetRandomReal(0, 50)
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
            if ( s__Players_hero[s__Units_player[m]] != null ) then
                if ( s__Players_teamid[s__Units_player[u]] != s__Players_teamid[s__Units_player[m]] ) then
                    set s__Players_kills[s__Units_player[m]]=s__Players_kills[s__Units_player[m]] + 1
                    call s__Teams_AddTeamKills(s__Players_teamid[s__Units_player[m]] , 1)
                    call sc__KillUi_FlushKillData(s__Players_teamid[s__Units_player[m]])
                endif
                if ( s__Teams_GetTeamKills(s__Players_teamid[s__Units_player[m]]) >= s__Winner_MaxKills ) then
                    set s__Winner_GameEnd=true
                    call DisplayTimedTextToForce(s__Teams_GetAllPlayers(), 5.00, "游戏结束啦！！！！！！！！！！！ " + s__Teams_GetTeamNameByIndex(s__Players_teamid[s__Units_player[m]]) + " 获得了最终的胜利！！")
                    call sc__Winner_ShowWin(s__Players_teamid[s__Units_player[m]])
                endif
            endif
        endfunction
            function s__Winner_anon__18 takes nothing returns nothing
                if ( IsPlayerInForce(GetEnumPlayer(), s__Teams_GetTeamForceByIndex(s__Winner_WinTeam)) == true ) then
                    call CustomVictoryBJ(GetEnumPlayer(), true, false)
                else
                    call CustomDefeatBJ(GetEnumPlayer(), "失败！")
                endif
            endfunction
        function s__Winner_ShowWin takes integer teamid returns nothing
            set s__Winner_WinTeam=teamid
            call ForForce(s__Teams_GetAllPlayers(), function s__Winner_anon__18)
        endfunction
        function s__Winner_ShowTip takes nothing returns nothing
            call StopSoundBJ(gg_snd_ItemReceived, false)
            call PlaySoundBJ(gg_snd_ItemReceived)
            call PingMinimap(s__Winner_OX, s__Winner_OY, 3.00)
        endfunction  //夺旗判定 - 范围900码
            function s__Winner_anon__19 takes nothing returns boolean
                return IsUnitType(GetFilterUnit(), UNIT_TYPE_HERO) == true and IsUnitAliveBJ(GetFilterUnit())
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
                call GroupEnumUnitsInRange(g, s__Winner_OX, s__Winner_OY, 900, Condition(function s__Winner_anon__19))
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
                            set s__Winner_NowTime=s__Winner_NowTime - ( 0.01 * s__Teams_GetAllPlayersNumber() )
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
//library Ai:

//processed:     function interface Ai___AiEventInterface takes unit arg0 returns nothing  //非玩家英雄的自动施法、移动类 //对于没有实现AI接口的英雄 //点目标技能会在1000码内释放 //无目标技能会在400码内释放 //相同的顺序，无目标和点目标有2套命令串顺序 //在调整施法顺序的时候将对应的命令串填入即可 // 点目标：curse - dispel - charm  - channel -  doom     // 无目标: heal  -  hex   - impale - inferno - instant
    function Ai___AISpell takes unit ua returns nothing
        local integer u=s__Units_Get(ua)
        local unit target
        local unit no
        local real x=s__Units_X(u)
        local real y=s__Units_Y(u)
        local real x1
        local real y1
        local real mps=s__Units_MP(u) / s__Units_MaxMP(u)
        if ( mps > 0.2 ) then
            call IssuePointOrder(s__Units_unit[u], "attack", GetUnitX(Origin_Ball), GetUnitY(Origin_Ball))
        else
            call IssuePointOrder(s__Units_unit[u], "attack", GetRectCenterX(s__Teams_GetTeamRect(s__Players_player[s__Units_player[u]])), GetRectCenterY(s__Teams_GetTeamRect(s__Players_player[s__Units_player[u]])))
        endif
        if ( s__Units_ai[u] != 0 ) then
            call sc___prototype32_evaluate((s__Units_ai[u]),s__Units_unit[u])
        else
            set target=GroupFind(s__Units_unit[u] , x , y , 1000 , true , false)
            if ( target != null ) then
                set x1=GetUnitX(target)
                set y1=GetUnitY(target)
                set no=GroupFind(s__Units_unit[u] , x , y , 400 , true , false)
                if ( no != null ) then
                    call s__Units_SetF(u,s__Util_XY(s__Units_unit[u] , no) , true)
                    set x1=GetUnitX(no)
                    set y1=GetUnitY(no)
                    call IssueImmediateOrder(s__Units_unit[u], "instant")
                    set no=null
                endif
                call IssuePointOrder(s__Units_unit[u], "doom", x1, y1)
                set no=GroupFind(s__Units_unit[u] , x , y , 400 , true , false)
                if ( no != null ) then
                    call s__Units_SetF(u,s__Util_XY(s__Units_unit[u] , no) , true)
                    set x1=GetUnitX(no)
                    set y1=GetUnitY(no)
                    call IssueImmediateOrder(s__Units_unit[u], "inferno")
                    set no=null
                endif
                call IssuePointOrder(s__Units_unit[u], "channel", x1, y1)
                set no=GroupFind(s__Units_unit[u] , x , y , 400 , true , false)
                if ( no != null ) then
                    call s__Units_SetF(u,s__Util_XY(s__Units_unit[u] , no) , true)
                    set x1=GetUnitX(no)
                    set y1=GetUnitY(no)
                    call IssueImmediateOrder(s__Units_unit[u], "impale")
                    set no=null
                endif
                call IssuePointOrder(s__Units_unit[u], "charm", x1, y1)
                set no=GroupFind(s__Units_unit[u] , x , y , 400 , true , false)
                if ( no != null ) then
                    call s__Units_SetF(u,s__Util_XY(s__Units_unit[u] , no) , true)
                    set x1=GetUnitX(no)
                    set y1=GetUnitY(no)
                    call IssueImmediateOrder(s__Units_unit[u], "hex")
                    set no=null
                endif
                call IssuePointOrder(s__Units_unit[u], "dispel", x1, y1)
                set no=GroupFind(s__Units_unit[u] , x , y , 400 , true , false)
                if ( no != null ) then
                    call s__Units_SetF(u,s__Util_XY(s__Units_unit[u] , no) , true)
                    set x1=GetUnitX(no)
                    set y1=GetUnitY(no)
                    call IssueImmediateOrder(s__Units_unit[u], "heal")
                    set no=null
                endif
                call IssuePointOrder(s__Units_unit[u], "curse", x1, y1)
            endif
        endif
        set target=null
        set no=null
    endfunction
        function Ai___anon__28 takes nothing returns nothing
            local integer p=s__Players_Get(GetEnumPlayer())
            if ( s__Players_isai[p] == true and s__Units_Alive(s__Players_hero[p]) ) then
                call Ai___AISpell(s__Units_unit[s__Players_hero[p]])
            endif
        endfunction
    function Ai___onLoop takes nothing returns nothing
        call ForForce(s__Teams_GetAllPlayers(), function Ai___anon__28)
    endfunction
    function Ai___onDmg takes integer dmg returns nothing
        local integer u=s__DamageArgs_TriggerUnit[dmg]
        if ( s__Players_isai[s__Units_player[u]] == true ) then
            call Ai___AISpell(s__Units_unit[u])
        endif
    endfunction
    function Ai___onInit takes nothing returns nothing
        call s__Damage_On(s__Damage_onHeroDamage , (14))
        call TimerStart(NewTimer(), 1, true, function Ai___onLoop)
    endfunction

//library Ai ends
//library BlackSaber:
                function s__BlackSaber__BlackSaber_anon__79 takes integer h returns nothing
                    local integer u=s__Units_Get(s__HitFlys_Unit[h])
                    call s__Units_Anime(u,"death")
                    call s__HitFlys_Remove(s__Units_unit[u])
                endfunction
            function s__BlackSaber__BlackSaber_anon__78 takes nothing returns nothing
                local integer data=(GetTimerData(GetExpiredTimer()))
                local integer u=(s___Data_c[s__Data_c[data]])
                local integer mj
                local real x=s___Data_r[s__Data_r[data]+1]
                local real y=s___Data_r[s__Data_r[data]+2]
                local real dis
                local real a
                local integer i
                if ( s___Data_i[s__Data_i[data]] > 0 ) then
                    set s___Data_i[s__Data_i[data]]=s___Data_i[s__Data_i[data]] - 1
                    if ( s___Data_i[s__Data_i[data]] == 0 ) then
                        call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A015' , 0 , x , y , 0 , 2.5 , 1 , 1 , "stand" , "black_thunderclapcaster.mdl")
                        call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A015' , 0 , x , y , 0 , 2.5 , 1.5 , 1 , "stand" , "by_wood_effect_d2_shadowfiend_shadowraze_1_darkblue.mdl")
                        call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A015' , 0 , x , y , 0 , 2.5 , 2 , 1 , "stand" , "fire-boom-new-darkblue.mdl")
                        call s__Units_SetH(s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A015' , 0 , x , y , 0 , 2.5 , 2 , 1.5 , "stand" , "dead spirit by deckai3.mdl"),100)
                        call s__Units_SetH(s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A015' , 0 , x , y , 0 , 2.5 , 2 , 2.5 , "stand" , "dtbluenoringblend.mdl"),100)
                        call s__Util_Duang(x , y , 2 , 250 , 250 , - 256 , 0.02 , 50)
                    endif
                elseif ( s___Data_r[s__Data_r[data]] <= 0 or s__Units_Alive(u) == false ) then
                    if ( s___Data_i[s__Data_i[data]+1] == 0 ) then
                        call s__Units_Anime((s___Data_c[s__Data_c[data]+1]),"death")
                        call s__Units_Life((s___Data_c[s__Data_c[data]+1]),5)
                    endif
                    call s__Spell_Destroy((s___Data_c[s__Data_c[data]+2]))
                    call s__Units_PositionEnabled(u,true)
                    call s__Units_Pause(u,false)
                    call s__Data_Destroy(data)
                    call ReleaseTimer(GetExpiredTimer())
                else
                    if ( s___Data_r[s__Data_r[data]] == 0.4 ) then
                        call s__Units_Anime((s___Data_c[s__Data_c[data]+1]),"death")
                        call s__Units_Life((s___Data_c[s__Data_c[data]+1]),5)
                        set s___Data_i[s__Data_i[data]+1]=1
                    endif
                    if ( s___Data_r[s__Data_r[data]] > 0.02 ) then
                        set i=0
                        loop
                        exitwhen ( i >= 2 )
                            set dis=GetRandomReal(25, 225)
                            set a=GetRandomReal(0, 360)
                            set mj=s__Units_MJ(s__Players_player[s__Units_player[(s___Data_c[s__Data_c[data]])]] , 'e00B' , 'A015' , 0 , x + dis * CosBJ(a) , y + dis * SinBJ(a) , 0 , 2.5 , 0.75 , 2 , "stand" , "BlackDragonMissile.mdl")
                            set s__HitFlys_onDown[s__HitFlys_Add(s__Units_unit[mj] , 50)]=(15)
                        set i=i + 1
                        endloop
                    endif
                    if ( s___Data_r[s__Data_r[data]+3] == 0 ) then
                        set s___Data_r[s__Data_r[data]+3]=0.2 //Util.Range(x,y,250);
                        call GroupEnumUnitsInRange(tmp_group, x, y, 250, Condition(function GroupIsAliveNotAloc))
                        loop
                        exitwhen ( FirstOfGroup(tmp_group) == null )
                            set mj=s__Units_Get(FirstOfGroup(tmp_group))
                            call GroupRemoveUnit(tmp_group, s__Units_unit[mj])
                            if ( IsUnitEnemy(s__Units_unit[mj], s__Players_player[s__Units_player[u]]) == true ) then
                                call s__Units_Damage(u,s__Units_unit[mj] , 'A015' , s__Damage_Magic , s__Units_Int(u,true) * 2.2)
                                call s__HitFlys_Add(s__Units_unit[mj] , 20)
                                call s__Dash_Start(s__Units_unit[mj] , s__Util_XY(s__Units_unit[mj] , s__Units_unit[u]) , s__Util_XY2(s__Units_unit[u] , s__Units_unit[mj]) , s__Dash_SUB , 10 , true , true)
                                call s__Units_SetH(s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A012' , 0 , s__Units_X(mj) , s__Units_Y(mj) , 0 , 2 , 1 , 1 , "death" , "fire-boom-new-darkblue-3.mdl"),s__Units_H(mj))
                            endif
                        endloop
                        call GroupClear(tmp_group)
                    else
                        set s___Data_r[s__Data_r[data]+3]=s___Data_r[s__Data_r[data]+3] - 0.02
                    endif
                    set s___Data_r[s__Data_r[data]]=s___Data_r[s__Data_r[data]] - 0.02
                endif
            endfunction  //Util.Range(x,y,250); 
        function s__BlackSaber__BlackSaber_D takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            local timer t=NewTimer()
            local integer data=s__Data_create('A015')
            local real x=s__Units_X(u)
            local real y=s__Units_Y(u)
            call s__Units_Pause(u,true)
            call s__Units_PositionEnabled(u,false)
            call s__Units_AnimeId(u,10)
            set s___Data_c[s__Data_c[data]+1]=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A015' , 0 , x , y , 0 , 10 , 1.5 , 1 , "stand" , "dark4_fast.mdl")
            call s__Util_Duang(x , y , 2 , 250 , 250 , - 78 , 0.02 , 50)
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_c[s__Data_c[data]+2]=e
            if ( s__Spell_State[e] == s__Spell_SpellState ) then
                set s___Data_i[s__Data_i[data]]=20
            else
                set s___Data_i[s__Data_i[data]]=1
            endif
            set s___Data_i[s__Data_i[data]+1]=0
            set s___Data_r[s__Data_r[data]]=2
            set s___Data_r[s__Data_r[data]+1]=x
            set s___Data_r[s__Data_r[data]+2]=y
            set s___Data_r[s__Data_r[data]+3]=0
            call SetTimerData(t , data)
            call TimerStart(t, 0.02, true, function s__BlackSaber__BlackSaber_anon__78)
        endfunction
                    function s__BlackSaber__BlackSaber_anon__82 takes integer dash returns nothing
                        local integer m=s__Units_Get(s__Dash_Unit[dash])
                        if ( s__Dash_Speed[dash] > 20 ) then
                            call s__Units_SetH(s__Units_MJ(s__Players_player[s__Units_player[m]] , 'e008' , 'A012' , 0 , s__Units_X(m) , s__Units_Y(m) , 0 , 2 , s__Dash_Speed[dash] / 15 , 1 , "death" , "fire-boom-new-darkblue-3.mdl"),s__Units_H(m))
                        endif
                    endfunction
                function s__BlackSaber__BlackSaber_anon__81 takes nothing returns nothing
                    local integer data=(GetTimerData(GetExpiredTimer()))
                    local integer u=(s___Data_c[s__Data_c[data]])
                    local integer m=(s___Data_c[s__Data_c[data]+2])
                    local integer mj
                    local real x
                    local real y
                    if ( s__Units_Alive(u) == true and s__Units_Alive(m) ) then
                        call s__HitFlys_Remove(s__Units_unit[m])
                        if ( s___Data_r[s__Data_r[data]+1] == 0 ) then
                            if ( s___Data_r[s__Data_r[data]] < 540 ) then
                                set s___Data_r[s__Data_r[data]]=s___Data_r[s__Data_r[data]] + 15
                                call s__Units_Position(m,s__Units_X(u) + 80 * CosBJ(s__Units_F(u)) , s__Units_Y(u) + 80 * SinBJ(s__Units_F(u)) , false)
                                call s__Units_SetH(m,125 * s__Util_GetPwx(3.99 , s___Data_r[s__Data_r[data]] , 720))
                                call s__Units_SetH(s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A012' , 0 , s__Units_X(m) , s__Units_Y(m) , 0 , 2 , 0.6 , 2 , "death" , "BlackDragonMissile.mdl"),s__Units_H(m))
                                call s__Units_SetF(u,s__Units_F(u) + 15 , true)
                                call s__Buffs_Skill(s__Units_unit[m] , 'A00F' , 1)
                            else
                                set s___Data_r[s__Data_r[data]+1]=1
                                set s___Data_r[s__Data_r[data]]=0
                                call s__Units_AddAbility(u,'A014')
                                call s__Units_SetF(u,s__Util_XY(s__Units_unit[u] , s__Units_unit[m]) , true)
                            endif
                        elseif ( s___Data_r[s__Data_r[data]+1] < 2 ) then
                            call s__Units_Position(m,s__Units_X(u) + 80 * CosBJ(s__Units_F(u)) , s__Units_Y(u) + 80 * SinBJ(s__Units_F(u)) , false)
                        endif
                        if ( s___Data_r[s__Data_r[data]+1] == 1 ) then
                            if ( s___Data_r[s__Data_r[data]] < 80 ) then
                                set s___Data_r[s__Data_r[data]]=s___Data_r[s__Data_r[data]] + 1
                            else
                                set s___Data_r[s__Data_r[data]+1]=2
                                set s___Data_r[s__Data_r[data]]=0
                                call s__Units_RemoveAbility(u,'A014')
                                set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A012' , 0 , s__Units_X(m) , s__Units_Y(m) , 0 , 2 , 2 , 1 , "birth" , "blue-fire.mdl")
                                call s__Units_SetH(mj,s__Units_H(m))
                                call s__Units_DelayAnime(mj,2 , 0.2)
                                call s__Units_SetH(s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A012' , 0 , s__Units_X(m) , s__Units_Y(m) , 0 , 2 , 1 , 1 , "death" , "fire-boom-new-darkblue-3.mdl"),s__Units_H(m))
                                call s__Units_Damage(u,s__Units_unit[m] , 'A012' , s__Damage_Magic , s__Units_Str(u,true) * 5.0)
                                call s__Units_AnimeId(u,20)
                                call s__Units_AnimeSpeed(u,1)
                            endif
                        endif
                        if ( s___Data_r[s__Data_r[data]+1] == 2 ) then
                            if ( s___Data_r[s__Data_r[data]] < 15 ) then
                                set s___Data_r[s__Data_r[data]]=s___Data_r[s__Data_r[data]] + 1
                            else
                                call s__Units_SetH(s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A012' , 0 , s__Units_X(m) , s__Units_Y(m) , 0 , 2 , 2 , 1 , "death" , "fire-boom-new-darkblue-3.mdl"),s__Units_H(m))
                                call s__Players_Duang(s__Units_player[u],20 , 0.2)
                                call s__Dash_Start(s__Units_unit[u] , s__Util_XY(s__Units_unit[m] , s__Units_unit[u]) , 150 , s__Dash_SUB , 30 , true , false)
                                call s__Dash_Start(s__Units_unit[m] , s__Util_XY(s__Units_unit[u] , s__Units_unit[m]) , 100 , s__Dash_SUB , 20 , true , false)
                                call s__HitFlys_Add(s__Units_unit[m] , 15)
                                call s__Units_AnimeSpeed(u,0.5)
                                set s___Data_r[s__Data_r[data]+1]=3
                                set s___Data_r[s__Data_r[data]]=0
                            endif
                        endif
                        if ( s___Data_r[s__Data_r[data]+1] == 3 ) then
                            if ( s___Data_r[s__Data_r[data]] < 20 ) then
                                set s___Data_r[s__Data_r[data]]=s___Data_r[s__Data_r[data]] + 1
                            else
                                set s___Data_r[s__Data_r[data]+1]=4
                                call s__Units_AnimeSpeed(u,1)
                                call s__Players_Duang(s__Units_player[u],80 , 0.2)
                                set x=s__Units_X(u) + 50 * CosBJ(s__Units_F(u))
                                set y=s__Units_Y(u) + 50 * SinBJ(s__Units_F(u))
                                call s__Units_SetH(s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e00C' , 'A012' , 0 , x , y , s__Util_XY(s__Units_unit[u] , s__Units_unit[m]) , 5 , 2 , 2.5 , "stand" , "devilslam.mdl"),150)
                                set x=x + 200 * CosBJ(s__Units_F(u))
                                set y=y + 200 * SinBJ(s__Units_F(u))
                                call s__Units_Damage(u,s__Units_unit[m] , 'A012' , s__Damage_Chaos , s__Units_Str(u,true) * 12.0)
                                call GroupEnumUnitsInRange(tmp_group, x, y, 200, Condition(function GroupIsAliveNotAloc))
                                loop
                                exitwhen ( FirstOfGroup(tmp_group) == null )
                                    set mj=s__Units_Get(FirstOfGroup(tmp_group))
                                    call GroupRemoveUnit(tmp_group, s__Units_unit[mj])
                                    if ( IsUnitEnemy(s__Units_unit[mj], s__Players_player[s__Units_player[u]]) == true and s__Units_unit[mj] != s__Units_unit[m] ) then
                                        call s__Units_Damage(u,s__Units_unit[mj] , 'A012' , s__Damage_Chaos , s__Units_Str(u,true) * 12)
                                        call s__Units_SetH(s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A012' , 0 , s__Units_X(mj) , s__Units_Y(mj) , 0 , 2 , 1.5 , 1 , "death" , "fire-boom-new-darkblue-3.mdl"),70)
                                    endif
                                endloop
                                call GroupClear(tmp_group)
                                call s__Dash_Start(s__Units_unit[u] , s__Util_XY(s__Units_unit[m] , s__Units_unit[u]) , 300 , s__Dash_SUB , 50 , true , false)
                                set s__Dash_onMove[s__Dash_Start(s__Units_unit[m] , s__Util_XY(s__Units_unit[u] , s__Units_unit[m]) , 1000 , s__Dash_SUB , 70 , true , false)]=(16)
                                call s__HitFlys_Add(s__Units_unit[m] , 25)
                                call s__Units_RemoveAbility(u,'A013')
                                call s__Units_RemoveAbility(u,'A014')
                                call s__Units_Position(u,s__Units_X(u) , s__Units_Y(u) , true)
                                call s__Units_Pause(u,false)
                                call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                                call s__Data_Destroy(data)
                                call ReleaseTimer(GetExpiredTimer())
                            endif
                        endif
                    else
                        if ( s__Units_H(m) > 10 ) then
                            call s__HitFlys_Add(s__Units_unit[m] , 0.1)
                        endif
                        call s__Units_Anime(u,"stand")
                        call s__Units_RemoveAbility(u,'A013')
                        call s__Units_RemoveAbility(u,'A014')
                        call s__Units_Pause(u,false)
                        call s__Units_AnimeSpeed(u,1)
                        call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                        call s__Data_Destroy(data)
                        call ReleaseTimer(GetExpiredTimer())
                    endif
                endfunction
            function s__BlackSaber__BlackSaber_anon__80 takes integer dash returns nothing
                local integer data=(s__Dash_Obj[dash])
                local integer u=s__Units_Get(s__Dash_Unit[dash])
                local unit k
                local timer t
                if ( s__Dash_Speed[dash] < 5 ) then
                    if ( s___Data_i[s__Data_i[data]] == 0 ) then
                        call s__Units_RemoveAbility(u,'A013')
                        call s__Units_Pause(u,false)
                        call s__Units_AnimeSpeed(u,1)
                        call s__Units_AnimeId(u,18)
                        set s___Data_i[s__Data_i[data]]=1
                    endif
                endif
                if ( s__Dash_Speed[dash] > 50 ) then
                    call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl", s__Dash_X[dash], s__Dash_Y[dash]))
                endif
                if ( s___Data_i[s__Data_i[data]] == 0 ) then
                    set k=GroupFind(s__Units_unit[u] , s__Units_X(u) + 70 * CosBJ(s__Dash_Angle[dash]) , s__Units_Y(u) + 70 * SinBJ(s__Dash_Angle[dash]) , 70 , true , false)
                    if ( k != null ) then
                        set s___Data_i[s__Data_i[data]]=2
                        call s__Dash_Stop(dash)
                        set t=NewTimer()
                        call s__Units_AnimeId(u,19)
                        call s__Units_AnimeSpeed(u,1.5)
                        set s___Data_r[s__Data_r[data]]=0
                        set s___Data_r[s__Data_r[data]+1]=0
                        set s___Data_c[s__Data_c[data]+2]=s__Units_Get(k)
                        call SetTimerData(t , data)
                        call s__Dash_Start(s__Units_unit[u] , s__Dash_Angle[dash] , 300 , s__Dash_SUB , 20 , true , false)
                        call TimerStart(t, 0.01, true, function s__BlackSaber__BlackSaber_anon__81)
                        set t=null
                        set k=null
                    endif
                endif
            endfunction
            function s__BlackSaber__BlackSaber_anon__83 takes integer dash returns nothing
                local integer data=(s__Dash_Obj[dash])
                local integer u=s__Units_Get(s__Dash_Unit[dash])
                if ( s___Data_i[s__Data_i[data]] == 0 ) then
                    call s__Units_RemoveAbility(u,'A013')
                    call s__Units_AnimeSpeed(u,1)
                    call s__Units_Pause(u,false)
                endif
                if ( s___Data_i[s__Data_i[data]] <= 1 ) then
                    call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                    call s__Data_Destroy(data)
                endif
            endfunction
        function s__BlackSaber__BlackSaber_R takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer dash
            local integer data=s__Data_create('A012')
            call s__Units_Pause(u,true)
            call s__Units_AnimeId(u,17)
            call s__Units_AnimeSpeed(u,2.5)
            call s__Units_AddAbility(u,'A013')
            call s__Units_SetF(u,s__Spell_Angle[e] , true)
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_c[s__Data_c[data]+1]=e
            set s___Data_i[s__Data_i[data]]=0
            call s__Units_SetH(s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A012' , 0 , s__Units_X(u) , s__Units_Y(u) , s__Spell_Angle[e] , 2.5 , 0.5 , 1 , "stand" , "cf2.mdl"),70)
            set dash=s__Dash_Start(s__Units_unit[u] , s__Spell_Angle[e] , 1000 , s__Dash_SUB , 80 , true , false)
            set s__Dash_Obj[dash]=data
            set s__Dash_onMove[dash]=(17)
            set s__Dash_onEnd[dash]=(18)
        endfunction
            function s__BlackSaber__BlackSaber_anon__84 takes nothing returns nothing
                local integer data=(GetTimerData(GetExpiredTimer()))
                local integer u=(s___Data_c[s__Data_c[data]])
                local real x
                local real y
                local integer mj
                if ( s__Units_Alive(u) == true ) then
                    set s___Data_r[s__Data_r[data]]=s___Data_r[s__Data_r[data]] + 0.01
                    if ( s___Data_r[s__Data_r[data]] < 0.2 ) then
                        call s__Units_SetH(u,s__Units_H(u) + 20)
                    else
                        call s__Units_SetH(u,s__Units_H(u) - 20)
                    endif
                    if ( s___Data_r[s__Data_r[data]] > 0.5 ) then
                        call s__Buffs_Add(s__Units_unit[u] , 'A016' , 'B007' , 0.2 , false)
                        call s__Units_RemoveAbility(u,'A00Z')
                        call s__Units_AnimeSpeed(u,1)
                        call s__Units_Pause(u,false)
                        call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                        call s__Data_Destroy(data)
                        call ReleaseTimer(GetExpiredTimer())
                    else
                        if ( s___Data_r[s__Data_r[data]] < 0.3 ) then
                            call DestroyEffect(AddSpecialEffectTarget("dark5.mdx", s__Units_unit[u], "weapon"))
                            if ( s___Data_r[s__Data_r[data]] < 0.2 ) then
                                call DestroyEffect(AddSpecialEffectTarget("fire-boom-new-darkblue-2.mdl", s__Units_unit[u], "weapon"))
                            endif
                        endif
                        if ( s___Data_r[s__Data_r[data]+1] == 0 ) then
                            set s___Data_r[s__Data_r[data]+1]=0.1
                            set s___Data_r[s__Data_r[data]+2]=s___Data_r[s__Data_r[data]+2] + 1
                            set x=s__Units_X(u) + 125 * CosBJ(s__Units_F(u))
                            set y=s__Units_Y(u) + 125 * SinBJ(s__Units_F(u))
                            call GroupEnumUnitsInRange(tmp_group, x, y, 150, Condition(function GroupIsAliveNotAloc))
                            loop
                            exitwhen ( FirstOfGroup(tmp_group) == null )
                                set mj=s__Units_Get(FirstOfGroup(tmp_group))
                                call GroupRemoveUnit(tmp_group, s__Units_unit[mj])
                                if ( IsUnitEnemy(s__Units_unit[mj], s__Players_player[s__Units_player[u]]) == true ) then
                                    if ( s___Data_r[s__Data_r[data]+2] == 1 or s___Data_r[s__Data_r[data]+2] == 5 ) then
                                        if ( s___Data_r[s__Data_r[data]+2] == 1 ) then
                                            call s__HitFlys_Add(s__Units_unit[mj] , 20)
                                        endif
                                        call s__Units_Damage(u,s__Units_unit[mj] , 'A00X' , s__Damage_Magic , s__Units_Int(u,true) * 2.4)
                                        call DestroyEffect(AddSpecialEffectTarget("fire-boom-new-darkblue-3.mdl", s__Units_unit[mj], "chest"))
                                        call s__Units_Position(mj,s__Units_X(mj) + 25 * CosBJ(s__Units_F(u)) , s__Units_Y(mj) + 25 * SinBJ(s__Units_F(u)) , true)
                                    endif
                                    if ( s___Data_r[s__Data_r[data]+2] >= 2 and s___Data_r[s__Data_r[data]+2] <= 4 ) then
                                        if ( s__Units_H(mj) > 10 ) then
                                            call s__HitFlys_Add(s__Units_unit[mj] , 7)
                                            call s__Units_Damage(u,s__Units_unit[mj] , 'A00X' , s__Damage_Chaos , s__Units_Int(u,true) * 2.4)
                                            call DestroyEffect(AddSpecialEffectTarget("fire-boom-new-darkblue-3.mdl", s__Units_unit[mj], "chest"))
                                            call s__Units_Position(mj,s__Units_X(mj) + 25 * CosBJ(s__Units_F(u)) , s__Units_Y(mj) + 25 * SinBJ(s__Units_F(u)) , true)
                                        endif
                                    endif
                                endif
                            endloop
                            call GroupClear(tmp_group)
                        else
                            set s___Data_r[s__Data_r[data]+1]=s___Data_r[s__Data_r[data]+1] - 0.01
                        endif
                    endif
                else
                    call s__Units_RemoveAbility(u,'A00Z')
                    call s__Units_AnimeSpeed(u,1)
                    call s__Units_Pause(u,false)
                    call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                    call s__Data_Destroy(data)
                    call ReleaseTimer(GetExpiredTimer())
                endif
            endfunction
        function s__BlackSaber__BlackSaber_E takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer data=s__Data_create('A00X')
            local timer t=NewTimer()
            call s__Units_Pause(u,true)
            call s__Units_AnimeId(u,16)
            call s__Units_AnimeSpeed(u,3.5)
            call s__Units_AddAbility(u,'A00Z')
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_c[s__Data_c[data]+1]=e
            set s___Data_i[s__Data_i[data]]=0
            set s___Data_r[s__Data_r[data]]=0
            set s___Data_r[s__Data_r[data]+1]=0
            set s___Data_r[s__Data_r[data]+2]=0
            call SetTimerData(t , data)
            call s__Dash_Start(s__Units_unit[u] , s__Units_F(u) , 300 , s__Dash_SUB , 10 , true , false)
            call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00X' , 0 , s__Units_X(u) , s__Units_Y(u) , 0 , 2 , 0.4 , 1 , "stand" , "white-qiquan.mdl")
            call TimerStart(t, 0.01, true, function s__BlackSaber__BlackSaber_anon__84)
            set t=null
        endfunction
            function s__BlackSaber__BlackSaber_anon__85 takes integer dash returns nothing
                local integer u=s__Units_Get(s__Dash_Unit[dash])
                local integer mj
                local real dis
                local real a
                if ( s__Dash_Speed[dash] < 2 ) then
                    call GroupEnumUnitsInRange(tmp_group, s__Dash_X[dash], s__Dash_Y[dash], 200, Condition(function GroupIsAliveNotAloc))
                    loop
                    exitwhen ( FirstOfGroup(tmp_group) == null )
                        set mj=s__Units_Get(FirstOfGroup(tmp_group))
                        call GroupRemoveUnit(tmp_group, s__Units_unit[mj])
                        if ( IsUnitEnemy(s__Units_unit[mj], s__Players_player[s__Units_player[u]]) == true ) then
                            call s__Units_Damage(u,s__Units_unit[mj] , 'A00V' , s__Damage_Magic , s__Units_Int(u,true) * 7)
                        endif
                    endloop
                    call GroupClear(tmp_group)
                    call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00V' , 0 , s__Dash_X[dash] , s__Dash_Y[dash] , 0 , 1 , 0.2 , 2 , "stand" , "black_thunderclapcaster.mdl")
                    call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00V' , 0 , s__Dash_X[dash] , s__Dash_Y[dash] , 0 , 5 , 0.7 , 2 , "death" , "fire-boom-new-darkblue.mdl")
                    set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00V' , 0 , s__Dash_X[dash] , s__Dash_Y[dash] , 0 , 1.3 , 3 , 1 , "birth" , "blue-fire.mdl")
                    call s__Units_SetH(mj,125)
                    call s__Units_DelaySize(mj,5 , 0.4)
                    call s__Units_DelayAnime(mj,2 , 0.8)
                    call s__Dash_Stop(dash)
                else
                    set dis=GetRandomReal(0, 100)
                    set a=GetRandomReal(0, 360)
                    set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00V' , 0 , s__Dash_X[dash] + dis * CosBJ(a) , s__Dash_Y[dash] + dis * SinBJ(a) , 0 , 0.3 , 1 , 1 , "stand" , "blue-fire.mdl")
                    call s__Units_SetH(mj,100)
                    call s__Units_DelayAnime(mj,2 , 0.15)
                    call GroupEnumUnitsInRange(tmp_group, s__Dash_X[dash], s__Dash_Y[dash], 200, Condition(function GroupIsAliveNotAloc))
                    loop
                    exitwhen ( FirstOfGroup(tmp_group) == null )
                        set mj=s__Units_Get(FirstOfGroup(tmp_group))
                        call GroupRemoveUnit(tmp_group, s__Units_unit[mj])
                        if ( IsUnitEnemy(s__Units_unit[mj], s__Players_player[s__Units_player[u]]) == true ) then
                            call s__Units_Position(mj,s__Dash_X[dash] , s__Dash_Y[dash] , true)
                        endif
                    endloop
                    call GroupClear(tmp_group)
                endif
            endfunction
            function s__BlackSaber__BlackSaber_anon__86 takes integer dash returns nothing
                local integer u=s__Units_Get(s__Dash_Unit[dash])
                call s__Units_Life(u,5)
                call s__Units_Anime(u,"death")
            endfunction
        function s__BlackSaber__BlackSaber_W takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer mj
            local integer dash
            local real x=s__Units_X(u) + 50 * CosBJ(s__Spell_Angle[e])
            local real y=s__Units_Y(u) + 50 * SinBJ(s__Spell_Angle[e])
            call s__Units_Pause(u,true)
            call s__Units_AnimeId(u,14)
            call s__Units_Pause(u,false)
            set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00V' , 0 , x , y , s__Spell_Angle[e] , 10 , 1 , 1 , "stand" , "dark4_fast.mdl")
            set dash=s__Dash_Start(s__Units_unit[mj] , s__Spell_Angle[e] , 450 , s__Dash_SUB , 40 , true , false)
            set s__Dash_onMove[dash]=(19)
            set s__Dash_onEnd[dash]=(20)
            call s__Spell_Destroy(e)
        endfunction
            function s__BlackSaber__BlackSaber_anon__87 takes integer dash returns nothing
                local integer u=s__Units_Get(s__Dash_Unit[dash])
                local real x=s__Units_X(u) + 50 * CosBJ(s__Dash_Angle[dash])
                local real y=s__Units_Y(u) + 50 * SinBJ(s__Dash_Angle[dash])
                local unit k=null
                local integer mj
                if ( s__Dash_Speed[dash] < 1.5 ) then
                    call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl", s__Dash_X[dash], s__Dash_Y[dash]))
                endif
                set k=GroupFind(s__Units_unit[u] , x , y , 70 , true , false)
                if ( k != null ) then
                    call s__Dash_Stop(dash)
                    call s__Buffs_Add(s__Units_unit[u] , 'A010' , 'B005' , 0.5 , false)
                    call s__Units_Pause(u,true)
                    call s__Units_AnimeSpeed(u,4)
                    call s__Units_DelayReleaseAnimePause(u,0.15)
                    call s__Units_Damage(u,k , s__Damage_Physics , 'A00U' , s__Units_Str(u,true) * 5.0)
                    call s__Units_SetF(u,s__Util_XY(s__Units_unit[u] , k) , true)
                    call s__Buffs_Skill(k , 'A00W' , 1)
                    call s__Units_SetH(s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00U' , 0 , GetUnitX(k) , GetUnitY(k) , 0 , 2 , 0.7 , 2.5 , "stand" , "hit-red.mdl"),100)
                    call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl", k, "chest"))
                    if ( s__Dash_NowDis[dash] > 100 ) then
                        call s__Dash_Start(s__Units_unit[u] , s__Util_XY(k , s__Units_unit[u]) , 200 * ( s__Dash_NowDis[dash] / s__Dash_MaxDis[dash] ) , s__Dash_SUB , 20 , true , false)
                    endif
                    call RunSoundOnUnit(s__BlackSaber__BlackSaber_Q_HIT , k)
                endif
                set k=null
            endfunction
            function s__BlackSaber__BlackSaber_anon__88 takes integer dash returns nothing
                local integer u=s__Units_Get(s__Dash_Unit[dash])
                call s__Spell_Destroy((s__Dash_Obj[dash]))
                call s__Units_AnimeSpeed(u,1)
                call s__Units_Pause(u,false)
            endfunction
        function s__BlackSaber__BlackSaber_Q takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer dash
            call s__Units_Pause(u,true)
            call s__Units_AnimeId(u,3)
            call s__Units_AnimeSpeed(u,1)
            set dash=s__Dash_Start(s__Units_unit[u] , s__Spell_Angle[e] , 1000 , s__Dash_ADD , 70 , true , false)
            set s__Dash_Obj[dash]=e
            set s__Dash_onMove[dash]=(21)
            set s__Dash_onEnd[dash]=(22)
        endfunction
        function s__BlackSaber__BlackSaber_HERO_START takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            if ( s__Spell_Id[e] == 'A00V' ) then
                call s__Units_AnimeSpeed(u,1.75)
                call s__Units_FlushAnimeId(u,7)
                call s__Spell_Destroy(e)
            endif
            if ( s__Spell_Id[e] == 'A00X' ) then
                if ( s__Units_IsAbility(u,'B005') == false ) then
                    call s__Units_FlushAnimeId(u,15)
                    call s__Spell_Destroy(e)
                elseif ( s__Units_MP(u) >= 150 ) then
                    if ( s__Units_GetAbilityCD(u,'A00X') == 0 ) then
                        call SpellNameText(s__Units_unit[u] , "! 炎焱斩 !" , 3 , 15)
                        call s__Units_SetMP(u,s__Units_MP(u) - 150)
                        call s__Units_SetAbilityCD(u,'A00X' , 15)
                        call s__BlackSaber__BlackSaber_E(e)
                    else
                        call s__Spell_Destroy(e)
                    endif
                else
                    call s__Spell_Destroy(e)
                endif
            endif
            if ( s__Spell_Id[e] == 'A015' ) then
                if ( s__Units_IsAbility(u,'B007') == false ) then
                    call s__Units_FlushAnimeId(u,10)
                    call s__Spell_Destroy(e)
                elseif ( s__Units_MP(u) >= 250 ) then
                    if ( s__Units_GetAbilityCD(u,'A015') == 0 ) then
                        call SpellText(s__Units_unit[u] , 'A015' , 3 , 15)
                        call s__Units_SetMP(u,s__Units_MP(u) - 250)
                        call s__Units_SetAbilityCD(u,'A015' , 25)
                        call s__BlackSaber__BlackSaber_D(e)
                    else
                        call s__Spell_Destroy(e)
                    endif
                else
                    call s__Spell_Destroy(e)
                endif
            endif
        endfunction
        function s__BlackSaber__BlackSaber_HERO_STOP takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            if ( s__Spell_Id[e] == 'A00V' or s__Spell_Id[e] == 'A015' ) then
                call s__Units_AnimeSpeed(u,1)
            endif
            call s__Spell_Destroy(e)
        endfunction
        function s__BlackSaber__BlackSaber_AI takes unit ua returns nothing
            local integer u=s__Units_Get(ua)
            local unit target
            local unit no
            local real x=s__Units_X(u)
            local real y=s__Units_Y(u)
            local real x1
            local real y1
            set target=GroupFind(s__Units_unit[u] , x , y , 1000 , true , false)
            if ( target != null ) then
                set x1=GetUnitX(target)
                set y1=GetUnitY(target)
                set no=GroupFind(s__Units_unit[u] , x , y , 200 , true , false)
                if ( no != null ) then
                    call s__Units_SetF(u,s__Util_XY(s__Units_unit[u] , no) , true) //魔力震击
                    call IssueImmediateOrder(s__Units_unit[u], "impale")
                endif
                set no=GroupFind(s__Units_unit[u] , x , y , 450 , true , false)
                if ( no != null ) then
                    set x1=GetUnitX(no)
                    set y1=GetUnitY(no) //炸裂
                    call IssuePointOrder(s__Units_unit[u], "channel", x1, y1)
                endif
                set no=GroupFind(s__Units_unit[u] , x , y , 200 , true , false)
                if ( no != null ) then
                    call s__Units_SetF(u,s__Util_XY(s__Units_unit[u] , no) , true) //火炎斩
                    call IssueImmediateOrder(s__Units_unit[u], "hex")
                endif
                call IssuePointOrder(s__Units_unit[u], "doom", x1, y1) //黑暗炮
                call IssuePointOrder(s__Units_unit[u], "curse", x1, y1) //冲撞
            endif
            set target=null
            set no=null
        endfunction
        function s__BlackSaber__BlackSaber_Spawn takes integer u,integer m returns nothing
            if ( s__Units_IsAbility(u,'A015') == true ) then
                set s__Units_ai[u]=(1)
            endif
        endfunction
        function s__BlackSaber__BlackSaber_onInit takes nothing returns nothing
            call s__Spell_On(s__Spell_onSpell , 'A015' , (23))
            call s__Spell_On(s__Spell_onSpell , 'A012' , (24))
            call s__Spell_On(s__Spell_onSpell , 'A00U' , (25))
            call s__Spell_On(s__Spell_onSpell , 'A00V' , (26))
            call s__Spell_On(s__Spell_onSpell , 'A00X' , (27))
            call s__Spell_On(s__Spell_onReady , 'A00X' , (28))
            call s__Spell_On(s__Spell_onStop , 'A00X' , (29))
            call s__Spell_On(s__Spell_onReady , 'A00V' , (28))
            call s__Spell_On(s__Spell_onStop , 'A00V' , (29))
            call s__Spell_On(s__Spell_onReady , 'A015' , (28))
            call s__Spell_On(s__Spell_onStop , 'A015' , (29))
            call s__Units_On(s__Units_onHeroSpawn , (2))
            set s__BlackSaber__BlackSaber_Q_HIT=DefineSound("resource\\sound_effect_hit_0.wav" , 1000 , false , true)
        endfunction

//library BlackSaber ends
//library DazzleMaster:

        function s__DazzleMaster___DazzleMaster_Attack takes integer e returns nothing
            local integer data
            if ( s__Units_IsAbility(s__DamageArgs_DamageUnit[e],'A008') == true and s__DamageArgs_DamageType[e] == s__Damage_Attack ) then
                set data=(s__Units_Obj[s__DamageArgs_DamageUnit[e]])
                if ( s___Data_i[s__Data_i[data]] == 2 ) then
                    set s___Data_i[s__Data_i[data]]=0
                    call sc__DazzleMaster___DazzleMaster_AddDazzle(s__Units_unit[s__DamageArgs_DamageUnit[e]] , 0)
                else
                    set s___Data_i[s__Data_i[data]]=s___Data_i[s__Data_i[data]] + 1
                endif
            endif
        endfunction
        function s__DazzleMaster___DazzleMaster_Death takes integer u,integer m returns nothing
            local integer data
            if ( s__Units_aid[u] == 'A008' and s__Units_aidindex[u] >= 0 and s__Units_aidindex[u] <= 4 ) then
                set data=(s__Units_Obj[u])
                call GroupRemoveUnit(s___Data_g[s__Data_g[data]], s__Units_unit[u])
                call s__Units_RemoveObj(u)
            endif
        endfunction
        function s__DazzleMaster___DazzleMaster_AddDazzle takes unit u,integer id returns nothing
            local integer s=s__Units_Get(u)
            local integer data=(s__Units_Obj[s])
            local integer mj=s__Units_MJ(s__Players_player[s__Units_player[s]] , 'e008' , 'A008' , id , s__Units_X(s) , s__Units_Y(s) , 0 , 15 , 1.5 , 1 , "stand" , s__s__DazzleMaster___DazzleMaster_DazzlePath[id])
            call s__Units_AddObj(mj,data)
            call GroupAddUnit(s___Data_g[s__Data_g[data]], s__Units_unit[mj])
        endfunction
        function s__DazzleMaster___DazzleMaster_AI takes unit ua returns nothing
            local integer u=s__Units_Get(ua)
            local unit target
            local unit no
            local real x=s__Units_X(u)
            local real y=s__Units_Y(u)
            local real x1
            local real y1
            set target=GroupFind(s__Units_unit[u] , x , y , 1000 , true , false)
            if ( target != null ) then
                set x1=GetUnitX(target)
                set y1=GetUnitY(target)
                set no=GroupFind(s__Units_unit[u] , x , y , 200 , true , false)
                if ( no != null ) then
                    call s__Units_SetF(u,s__Util_XY(s__Units_unit[u] , no) , true) //落花
                    call IssueImmediateOrder(s__Units_unit[u], "inferno")
                endif
                set no=GroupFind(s__Units_unit[u] , x , y , 200 , true , false)
                if ( no != null ) then
                    call s__Units_SetF(u,s__Util_XY(s__Units_unit[u] , no) , true) //圆舞棍
                    call IssueImmediateOrder(s__Units_unit[u], "impale")
                endif
                set no=GroupFind(s__Units_unit[u] , x , y , 300 , true , false)
                if ( no != null ) then
                    set x1=GetUnitX(no)
                    set y1=GetUnitY(no) //龙牙
                    call IssuePointOrder(s__Units_unit[u], "channel", x1, y1)
                endif
                set no=GroupFind(s__Units_unit[u] , x , y , 600 , true , false)
                if ( no != null ) then
                    set x1=GetUnitX(no)
                    set y1=GetUnitY(no) //天击
                    call IssuePointOrder(s__Units_unit[u], "dispel", x1, y1)
                endif
                call IssuePointOrder(s__Units_unit[u], "curse", x1, y1) //炫纹发射
            endif
            set target=null
            set no=null
        endfunction
            function s__DazzleMaster___DazzleMaster_anon__36 takes nothing returns nothing
                local integer data=(GetTimerData(GetExpiredTimer()))
                local integer u=(s___Data_c[s__Data_c[data]])
                local integer tmp
                local real h=0
                local real x
                local real y
                local real dis
                local real fa
                local real ra
                local real b1
                local real b2
                local real x1
                local real y1
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
                else //x=u.X()+(75+GroupNumber(data.g[0])*7)*CosBJ(u.F()+180);
                    set x1=s__Units_X(u) //y=u.Y()+(75+GroupNumber(data.g[0])*7)*SinBJ(u.F()+180);
                    set y1=s__Units_Y(u)
                    set b1=0
                    set b2=0
                    call GroupAddGroup(s___Data_g[s__Data_g[data]], tmp_group)
                    loop
                    exitwhen ( FirstOfGroup(tmp_group) == null )
                        set tmp=s__Units_Get(FirstOfGroup(tmp_group))
                        set dis=75 + ( s__Util_XY2(s__Units_unit[tmp] , s__Units_unit[u]) / 600 ) + ( b2 * 30 )
                        set ra=s__Units_F(u) + 180 + ( 30 - ( b2 * 5 ) ) + ( b1 * - ( 30 - ( b2 * 5 ) ) )
                        set b1=b1 + 1
                        if ( b1 == 3 ) then
                            set b2=b2 + 1
                            set b1=0
                        endif
                        set x=x1 + ( dis ) * CosBJ(ra)
                        set y=y1 + ( dis ) * SinBJ(ra)
                        call s__Units_Position(tmp,x , y , false)
                        call s__Units_SetH(tmp,70 + ( 150 * s__Util_GetPwx(3.99 , s___Data_r[s__Data_r[data]+2] + GetRandomReal(0, 10) , 96) ))
                        call s__Units_SetF(tmp,s__Util_XY(s__Units_unit[tmp] , s__Units_unit[u]) , true)
                        call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
                        set h=h + 5
                    endloop
                    call GroupClear(tmp_group)
                endif
            endfunction
        function s__DazzleMaster___DazzleMaster_Spawn takes integer u,integer m returns nothing
            local timer t
            local integer data
            if ( s__Units_IsAbility(u,'A008') == true ) then
                set s__Units_ai[u]=(2)
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
                call TimerStart(t, 0.01, true, function s__DazzleMaster___DazzleMaster_anon__36)
                set t=null
            endif
        endfunction
        function s__DazzleMaster___DazzleMaster_HERO_START takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            if ( s__Spell_Id[e] == 'A009' ) then
                if ( s__Units_IsAbility(u,'B006') == false ) then
                    call s__Units_FlushAnimeId(u,5)
                    call s__Spell_Destroy(e)
                elseif ( s__Units_MP(u) >= 100 ) then
                    if ( s__Units_GetAbilityCD(u,'A009') == 0 ) then
                        call SpellNameText(s__Units_unit[u] , "! 龙牙击 !" , 3 , 15)
                        call s__Units_SetMP(u,s__Units_MP(u) - 100)
                        call s__Units_SetAbilityCD(u,'A009' , 10)
                        call sc__DazzleMaster___DazzleMaster_Q(e)
                    else
                        call s__Spell_Destroy(e)
                    endif
                else
                    call s__Spell_Destroy(e)
                endif
            endif
        endfunction
        function s__DazzleMaster___DazzleMaster_HERO_STOP takes integer e returns nothing
            call s__Spell_Destroy(e)
        endfunction
            function s__DazzleMaster___DazzleMaster_anon__37 takes integer b returns nothing
                local integer data=(s__Units_Obj[s__Units_Get(s__Buffs_Unit[b])])
                call SetUnitMoveSpeed(s__Buffs_Unit[b], GetUnitMoveSpeed(s__Buffs_Unit[b]) - s___Data_r[s__Data_r[data]])
                call SetUnitState(s__Buffs_Unit[b], ConvertUnitState(0x51), GetUnitState(s__Buffs_Unit[b], ConvertUnitState(0x51)) - s___Data_r[s__Data_r[data]+1])
                set s___Data_r[s__Data_r[data]]=0
                set s___Data_r[s__Data_r[data]+1]=0
            endfunction
            function s__DazzleMaster___DazzleMaster_anon__38 takes integer dash returns nothing
                local integer u=s__Units_Get(s__Dash_Unit[dash])
                call s__Units_SetH(u,50 + ( R2I(s__Dash_Obj[dash]) * ( 1 - s__Util_GetPwx(3.99 , s__Dash_NowDis[dash] / 2 , s__Dash_MaxDis[dash]) ) ))
            endfunction
            function s__DazzleMaster___DazzleMaster_anon__39 takes integer dash returns nothing
                local integer u=s__Units_Get(s__Dash_Unit[dash])
                local integer tmp
                local real x=s__Units_X(u)
                local real y=s__Units_Y(u)
                local real dmg=( s__Units_Str(s__Players_hero[s__Units_player[u]],true) * 0.4 ) + ( s__Units_Int(s__Players_hero[s__Units_player[u]],true) * 0.8 )
                local integer id=s__Units_aidindex[u] - 10
                call s__Units_Life(u,1)
                call s__Units_AnimeSpeed(u,2)
                call s__Units_Anime(u,"death") //无
                if ( id == 0 ) then
                    call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A008' , 66 , x , y , 0 , 2 , 1 , 2 , "stand" , "ball_nothing_kc.mdx")
                    call GroupEnumUnitsInRange(tmp_group, x, y, 150, Condition(function GroupIsAliveNotAloc))
                    loop
                    exitwhen ( FirstOfGroup(tmp_group) == null )
                        set tmp=s__Units_Get(FirstOfGroup(tmp_group))
                        call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
                        if ( IsUnitEnemy(s__Units_unit[tmp], s__Players_player[s__Units_player[u]]) == true ) then
                            call DestroyEffect(AddSpecialEffectTarget("Abilities\\Weapons\\GlaiveMissile\\GlaiveMissile.mdl", s__Units_unit[tmp], "chest"))
                            call s__Units_Damage(u,s__Units_unit[tmp] , s__Damage_Magic , 'A008' , dmg)
                        endif
                    endloop
                    call GroupClear(tmp_group)
                endif //光
                if ( id == 1 ) then
                    call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A008' , 66 , x , y , 0 , 2 , 1 , 2 , "stand" , "ball_light_kc.mdx")
                    if ( GroupFind(s__Units_unit[u] , x , y , 200 , false , false) != null ) then
                        set tmp=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A008' , 66 , x , y , 0 , 4 , 1.5 , 1.3 , "death" , "OrbOfLightning.mdx")
                        call s__Units_SetH(tmp,50)
                        call GroupEnumUnitsInRange(tmp_group, x, y, 200, Condition(function GroupIsAliveNotAloc))
                        loop
                        exitwhen ( FirstOfGroup(tmp_group) == null )
                            set tmp=s__Units_Get(FirstOfGroup(tmp_group))
                            call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
                            if ( IsUnitEnemy(s__Units_unit[tmp], s__Players_player[s__Units_player[u]]) == true ) then
                                call s__Units_Damage(u,s__Units_unit[tmp] , s__Damage_Chaos , 'A008' , dmg)
                                call s__HitFlys_Add(s__Units_unit[tmp] , 10)
                                call s__Buffs_Skill(s__Units_unit[tmp] , 'A00Y' , 1)
                                call s__Buffs_AllRemove(s__Units_unit[tmp] , s__Buffs_TYPE_ADD + s__Buffs_TYPE_DISPEL_TRUE)
                            endif
                        endloop
                        call GroupClear(tmp_group)
                    endif
                endif //冰
                if ( id == 2 ) then
                    call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A008' , 66 , x , y , 0 , 2 , 1 , 2 , "stand" , "ball_ice_kc.mdx")
                    if ( GroupFind(s__Units_unit[u] , x , y , 150 , false , false) != null ) then
                        set tmp=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A008' , 66 , x , y , 0 , 2 , 2 , 1 , "death" , "Abilities\\Weapons\\FrostWyrmMissile\\FrostWyrmMissile.mdl")
                        call s__Units_SetH(tmp,50)
                        set tmp=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A008' , 66 , x , y , 0 , 2 , 2 , 1 , "death" , "Abilities\\Weapons\\LichMissile\\LichMissile.mdl")
                        call s__Units_SetH(tmp,50)
                        call GroupEnumUnitsInRange(tmp_group, x, y, 150, Condition(function GroupIsAliveNotAloc))
                        loop
                        exitwhen ( FirstOfGroup(tmp_group) == null )
                            set tmp=s__Units_Get(FirstOfGroup(tmp_group))
                            call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
                            if ( IsUnitEnemy(s__Units_unit[tmp], s__Players_player[s__Units_player[u]]) == true ) then
                                call s__Units_Damage(u,s__Units_unit[tmp] , s__Damage_Magic , 'A008' , dmg)
                                set s__Buffs_Type[s__Buffs_Add(s__Units_unit[tmp] , 'A00I' , 'B003' , 2 , false)]=s__Buffs_TYPE_SUB + s__Buffs_TYPE_DISPEL_TRUE
                                call DestroyEffect(AddSpecialEffectTarget("Abilities\\Weapons\\ZigguratFrostMissile\\ZigguratFrostMissile.mdl", s__Units_unit[tmp], "chest"))
                            endif
                        endloop
                        call GroupClear(tmp_group)
                    endif
                endif //火
                if ( id == 3 ) then
                    call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A008' , 66 , x , y , 0 , 2 , 1 , 2 , "stand" , "ball_fire_kc.mdx")
                    if ( GroupFind(s__Units_unit[u] , x , y , 200 , false , false) != null ) then
                        set tmp=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A008' , 66 , x , y , 0 , 2 , 2.5 , 1 , "death" , "Abilities\\Weapons\\LordofFlameMissile\\LordofFlameMissile.mdl")
                        call s__Units_SetH(tmp,50)
                        set tmp=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A008' , 66 , x , y , 0 , 2 , 2 , 1 , "death" , "Abilities\\Weapons\\RedDragonBreath\\RedDragonMissile.mdl")
                        call s__Units_SetH(tmp,50)
                        set tmp=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A008' , 66 , x , y , 0 , 2 , 1.5 , 2 , "death" , "Abilities\\Weapons\\FragDriller\\FragDriller.mdl")
                        call s__Units_SetH(tmp,50)
                        call GroupEnumUnitsInRange(tmp_group, x, y, 200, Condition(function GroupIsAliveNotAloc))
                        loop
                        exitwhen ( FirstOfGroup(tmp_group) == null )
                            set tmp=s__Units_Get(FirstOfGroup(tmp_group))
                            call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
                            if ( IsUnitEnemy(s__Units_unit[tmp], s__Players_player[s__Units_player[u]]) == true ) then
                                call s__Units_Damage(u,s__Units_unit[tmp] , s__Damage_Magic , 'A008' , dmg)
                                call DestroyEffect(AddSpecialEffectTarget("Environment\\NightElfBuildingFire\\ElfLargeBuildingFire1.mdl", s__Units_unit[tmp], "chest"))
                                call s__Dash_Start(s__Units_unit[tmp] , s__Util_XYEX(x , y , s__Units_X(tmp) , s__Units_Y(tmp)) , 350 - s__Util_XY2EX(x , y , s__Units_X(tmp) , s__Units_Y(tmp)) , s__Dash_SUB , 30 , true , false)
                            endif
                        endloop
                        call GroupClear(tmp_group)
                    endif
                endif //暗
                if ( id == 4 ) then
                    call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A008' , 66 , x , y , 0 , 2 , 1 , 2 , "stand" , "ball_dark_kc.mdx")
                    if ( GroupFind(s__Units_unit[u] , x , y , 300 , false , false) != null ) then
                        set tmp=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A008' , 66 , x , y , 0 , 0.42 , 2.5 , 1.75 , "death" , "dark.mdx")
                        call s__Units_SetH(tmp,50)
                        call s__Units_SetH(u,150) //tmp=Units.MJ(u.player.player,'e008','A008',66,x,y,0,0.4,1.5,2, "stand","dark1.mdx");
                        call GroupEnumUnitsInRange(tmp_group, x, y, 300, Condition(function GroupIsAliveNotAloc))
                        loop
                        exitwhen ( FirstOfGroup(tmp_group) == null )
                            set tmp=s__Units_Get(FirstOfGroup(tmp_group))
                            call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
                            if ( IsUnitEnemy(s__Units_unit[tmp], s__Players_player[s__Units_player[u]]) == true ) then
                                call DestroyEffect(AddSpecialEffectTarget("Abilities\\Weapons\\AvengerMissile\\AvengerMissile.mdl", s__Units_unit[tmp], "chest"))
                                call s__Units_Damage(u,s__Units_unit[tmp] , s__Damage_Chaos , 'A008' , dmg)
                                call s__HitFlys_Add(s__Units_unit[tmp] , 20)
                                call s__Dash_Start(s__Units_unit[tmp] , s__Util_XY(s__Units_unit[tmp] , s__Units_unit[u]) , s__Util_XY2(s__Units_unit[tmp] , s__Units_unit[u]) , s__Dash_ADD , 40 , true , false)
                            endif
                        endloop
                        call GroupClear(tmp_group)
                    endif
                endif
            endfunction
        function s__DazzleMaster___DazzleMaster_D takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer data=(s__Units_Obj[u])
            local integer first=s__Units_Get(GroupFirst(s___Data_g[s__Data_g[data]]))
            local integer dash
            local real cd
            local real x=s__Units_X(first)
            local real y=s__Units_Y(first)
            local real h=s__Units_H(first)
            local integer id
            set id=s__Units_aidindex[first]
            call s__Units_Kill(s__Units_unit[first])
            if ( x == 0 ) then
                call BJDebugMsg(s__Units_name[first] + R2S(x) + "/" + R2S(y) + ":::" + R2S(s__Spell_X[e]) + "/" + R2S(s__Spell_Y[e]) + "/类型：" + I2S(id) + "/炫纹组：" + I2S(GroupNumber(s___Data_g[s__Data_g[data]])))
                call BJDebugMsg("---这是一条错误提示,如果提示了这个提示,请保存录像并联系作者")
            endif
            call TextForPlayer(s__Players_player[s__Units_player[u]] , s__Units_unit[u] , s__s__DazzleMaster___DazzleMaster_DazzleName[s__Units_aidindex[first]] + "!" , 0.8 , 14 , 300)
            set s__Buffs_onEnd[s__Buffs_Add(s__Units_unit[u] , 'A00G' , 'B002' , 5 , false)]=(30)
            if ( s___Data_r[s__Data_r[data]] < 80 ) then
                set s___Data_r[s__Data_r[data]]=s___Data_r[s__Data_r[data]] + 20
                call SetUnitMoveSpeed(s__Units_unit[u], GetUnitMoveSpeed(s__Units_unit[u]) + 20)
            endif
            if ( s___Data_r[s__Data_r[data]+1] < 1.2 ) then
                set s___Data_r[s__Data_r[data]+1]=s___Data_r[s__Data_r[data]+1] + 0.3
                call SetUnitState(s__Units_unit[u], ConvertUnitState(0x51), GetUnitState(s__Units_unit[u], ConvertUnitState(0x51)) + 0.3)
            endif
            set cd=s___Data_r[s__Data_r[data]] / 20
            call YDWESetUnitAbilityState(s__Units_unit[u] , 'A009' , 1 , YDWEGetUnitAbilityState(s__Units_unit[u] , 'A009' , 1) - cd)
            call YDWESetUnitAbilityState(s__Units_unit[u] , 'A00B' , 1 , YDWEGetUnitAbilityState(s__Units_unit[u] , 'A00B' , 1) - cd)
            call YDWESetUnitAbilityState(s__Units_unit[u] , 'A00D' , 1 , YDWEGetUnitAbilityState(s__Units_unit[u] , 'A00D' , 1) - cd)
            call YDWESetUnitAbilityState(s__Units_unit[u] , 'A00E' , 1 , YDWEGetUnitAbilityState(s__Units_unit[u] , 'A00E' , 1) - cd)
            set first=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A008' , id + 10 , x , y , 0 , 15 , 1.5 , 1 , "stand" , s__s__DazzleMaster___DazzleMaster_DazzlePath[id])
            call s__Units_SetH(first,h)
            call s__Units_Position(first,x , y , true)
            set id=s__Dash_ADD
            set dash=s__Dash_Start(s__Units_unit[first] , s__Util_XYEX(s__Units_X(first) , s__Units_Y(first) , s__Spell_X[e] , s__Spell_Y[e]) , s__Util_XY2EX(s__Units_X(first) , s__Units_Y(first) , s__Spell_X[e] , s__Spell_Y[e]) , id , 50 , true , false)
            set s__Dash_Obj[dash]=R2I(s__Units_H(first))
            set s__Dash_onMove[dash]=(31)
            set s__Dash_onEnd[dash]=(32)
            call s__Spell_Destroy(e)
        endfunction
                    function s__DazzleMaster___DazzleMaster_anon__42 takes integer dash returns nothing
                        local integer u=s__Units_Get(s__Dash_Unit[dash])
                        call s__Units_SetH(u,200 * ( s__Dash_NowDis[dash] / s__Dash_MaxDis[dash] ))
                    endfunction
                        function s__DazzleMaster___DazzleMaster_anon__44 takes integer dash returns nothing
                            local integer data=(s__Dash_Obj[dash])
                            local integer u=s__Units_Get(s__Dash_Unit[dash])
                            call s__Units_Position((s___Data_c[s__Data_c[data]]),s___Data_r[s__Data_r[data]+3] , s___Data_r[s__Data_r[data]+4] , false)
                            call s__Units_SetH(u,200 * ( 1 - ( s__Dash_NowDis[dash] / s__Dash_MaxDis[dash] ) ))
                        endfunction
                        function s__DazzleMaster___DazzleMaster_anon__45 takes integer dash returns nothing
                            local integer data=(s__Dash_Obj[dash])
                            local integer u=(s___Data_c[s__Data_c[data]])
                            local integer tmp=s__Units_Get(s__Dash_Unit[dash])
                            call s__Units_SetH(tmp,0)
                            set s___Data_i[s__Data_i[data]+1]=s___Data_i[s__Data_i[data]+1] - 1
                            call s__Buffs_Skill(s__Units_unit[tmp] , 'A00F' , 1)
                            call s__Units_Damage(u,s__Units_unit[tmp] , s__Damage_Physics , 'A00E' , s__Units_Str(u,true) * 18.0)
                            if ( s___Data_i[s__Data_i[data]] == 0 ) then
                                set s___Data_i[s__Data_i[data]]=1
                                call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00E' , 0 , s___Data_r[s__Data_r[data]+1] , s___Data_r[s__Data_r[data]+2] , 0 , 2 , 1 , 1 , "stand" , "tx.mdx")
                                call s__Util_Duang(s___Data_r[s__Data_r[data]+1] , s___Data_r[s__Data_r[data]+2] , 0.5 , 200 , 200 , - 75 , 0.02 , 50)
                            endif
                            if ( s___Data_i[s__Data_i[data]+1] == 0 ) then
                                call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                                call s__Data_Destroy(data)
                                call s__Units_PositionEnabled(u,true)
                                call s__Units_DelayReleaseAnimePause(u,0.2)
                            endif
                        endfunction
                    function s__DazzleMaster___DazzleMaster_anon__43 takes nothing returns nothing
                        local integer data=(GetTimerData(GetExpiredTimer()))
                        local integer u=(s___Data_c[s__Data_c[data]])
                        local integer tmp
                        local integer dash
                        local real x
                        local real y
                        if ( s___Data_r[s__Data_r[data]] > 0 ) then
                            set s___Data_r[s__Data_r[data]]=s___Data_r[s__Data_r[data]] - 0.02
                            call GroupAddGroup(s___Data_g[s__Data_g[data]], tmp_group)
                            loop
                            exitwhen ( FirstOfGroup(tmp_group) == null )
                                set tmp=s__Units_Get(FirstOfGroup(tmp_group))
                                call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
                                call s__Units_Position(tmp,s__Units_X(u) , s__Units_Y(u) , false)
                                if ( s__Units_Alive(u) == false ) then
                                    call s__HitFlys_Add(s__Units_unit[tmp] , 0.1)
                                endif
                            endloop
                            call GroupClear(tmp_group)
                            if ( s__Units_Alive(u) == false ) then
                                call DestroyGroup(s___Data_g[s__Data_g[data]])
                                call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                                set s___Data_g[s__Data_g[data]]=null
                                call s__Data_Destroy(data)
                                call s__Units_PositionEnabled(u,true)
                                call s__Units_Pause(u,false)
                                call ReleaseTimer(GetExpiredTimer())
                            endif
                        else
                            call s__Units_AnimeId(u,19)
                            set s___Data_i[s__Data_i[data]]=0
                            if ( s__PlayerPress_R[s__Players_press[s__Units_player[u]]] == true ) then
                                set x=s__Units_X(u) + 200 * CosBJ(s__Units_F(u))
                                set y=s__Units_Y(u) + 200 * SinBJ(s__Units_F(u))
                                call s__Units_SetH(s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e009' , 'A00E' , 0 , s__Units_X(u) , s__Units_Y(u) , s__Units_F(u) - 90 , 2 , 0.75 , 1 , "stand" , "daoguang-blue-hengsao.mdl"),100)
                            else
                                set x=s__Units_X(u) + 200 * CosBJ(s__Units_F(u) + 180)
                                set y=s__Units_Y(u) + 200 * SinBJ(s__Units_F(u) + 180)
                                call s__Units_SetH(s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e009' , 'A00E' , 0 , s__Units_X(u) , s__Units_Y(u) , s__Units_F(u) - 270 , 2 , 0.75 , 1 , "stand" , "daoguang-blue-hengsao.mdl"),100)
                            endif
                            set s___Data_r[s__Data_r[data]+1]=x
                            set s___Data_r[s__Data_r[data]+2]=y
                            set s___Data_r[s__Data_r[data]+3]=s__Units_X(u)
                            set s___Data_r[s__Data_r[data]+4]=s__Units_Y(u)
                            call s__Units_SetF(u,s__Util_XYEX(s__Units_X(u) , s__Units_Y(u) , x , y) , true)
                            call GroupAddGroup(s___Data_g[s__Data_g[data]], tmp_group)
                            loop
                            exitwhen ( FirstOfGroup(tmp_group) == null )
                                set tmp=s__Units_Get(FirstOfGroup(tmp_group))
                                call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
                                set s___Data_i[s__Data_i[data]+1]=s___Data_i[s__Data_i[data]+1] + 1
                                set dash=s__Dash_Start(s__Units_unit[tmp] , s__Util_XYEX(s__Units_X(tmp) , s__Units_Y(tmp) , x , y) , s__Util_XY2EX(s__Units_X(tmp) , s__Units_Y(tmp) , x , y) , s__Dash_NORMAL , 20 , true , false)
                                set s__Dash_Obj[dash]=data
                                set s__Dash_onMove[dash]=(33)
                                set s__Dash_onEnd[dash]=(34)
                            endloop
                            call GroupClear(tmp_group)
                            call DestroyGroup(s___Data_g[s__Data_g[data]])
                            set s___Data_g[s__Data_g[data]]=null
                            if ( s___Data_i[s__Data_i[data]+1] == 0 ) then
                                call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                                call s__Data_Destroy(data)
                                call s__Units_PositionEnabled(u,true)
                                call s__Units_Pause(u,false)
                            endif
                            call ReleaseTimer(GetExpiredTimer())
                        endif
                    endfunction
                function s__DazzleMaster___DazzleMaster_anon__41 takes nothing returns nothing
                    local integer data=(GetTimerData(GetExpiredTimer()))
                    local integer u=(s___Data_c[s__Data_c[data]])
                    local integer tmp
                    local real x=s__Units_X(u) + 200 * CosBJ(s__Units_F(u))
                    local real y=s__Units_Y(u) + 200 * SinBJ(s__Units_F(u))
                    if ( s__Units_Alive(u) == true ) then
                        call s__Units_SetH(s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e00B' , 'A00E' , 0 , s__Units_X(u) , s__Units_Y(u) , s__Units_F(u) - 90 , 2 , 0.5 , 2 , "stand" , "daoguang-blue-hengsao.mdl"),100)
                        set s___Data_g[s__Data_g[data]]=CreateGroup()
                        call GroupEnumUnitsInRange(tmp_group, x, y, 150, Condition(function GroupIsAliveNotAloc))
                        loop
                        exitwhen ( FirstOfGroup(tmp_group) == null )
                            set tmp=s__Units_Get(FirstOfGroup(tmp_group))
                            call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
                            if ( IsUnitEnemy(s__Units_unit[tmp], s__Players_player[s__Units_player[u]]) == true ) then
                                call GroupAddUnit(s___Data_g[s__Data_g[data]], s__Units_unit[tmp])
                                call s__Buffs_Skill(s__Units_unit[tmp] , 'A00C' , 1)
                                call s__HitFlys_Remove(s__Units_unit[tmp])
                                set s__Dash_onMove[s__Dash_Start(s__Units_unit[tmp] , s__Util_XY(s__Units_unit[tmp] , s__Units_unit[u]) , s__Util_XY2(s__Units_unit[tmp] , s__Units_unit[u]) , s__Dash_NORMAL , s__Util_XY2(s__Units_unit[tmp] , s__Units_unit[u]) / 4 , true , false)]=(35)
                                call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl", s__Units_unit[tmp], "chest"))
                            endif
                        endloop
                        call GroupClear(tmp_group)
                        if ( GroupNumber(s___Data_g[s__Data_g[data]]) != 0 ) then
                            set s___Data_r[s__Data_r[data]]=0.1
                            call TimerStart(GetExpiredTimer(), 0.02, true, function s__DazzleMaster___DazzleMaster_anon__43)
                        else
                            call DestroyGroup(s___Data_g[s__Data_g[data]])
                            call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                            set s___Data_g[s__Data_g[data]]=null
                            call s__Data_Destroy(data)
                            call s__Units_PositionEnabled(u,true)
                            call s__Units_Pause(u,false)
                            call ReleaseTimer(GetExpiredTimer())
                        endif
                    else
                        call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                        call s__Data_Destroy(data)
                        call s__Units_PositionEnabled(u,true)
                        call s__Units_Pause(u,false)
                        call ReleaseTimer(GetExpiredTimer())
                    endif
                endfunction
            function s__DazzleMaster___DazzleMaster_anon__40 takes nothing returns nothing
                local integer data=(GetTimerData(GetExpiredTimer()))
                local integer u=(s___Data_c[s__Data_c[data]])
                local real x=s__Units_X(u) + 200 * CosBJ(s__Units_F(u))
                local real y=s__Units_Y(u) + 200 * SinBJ(s__Units_F(u))
                local integer tmp
                local integer dash
                local integer s=0
                local timer t
                if ( s__Units_Alive(u) == true ) then
                    set tmp=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e009' , 'A00E' , 0 , x , y , s__Units_F(u) , 2 , 1.1 , 1.5 , "stand" , "by_wood_gongchengsipai_2.mdl")
                    call s__Units_SetH(tmp,110)
                    call s__Dash_Start(s__Units_unit[tmp] , s__Units_F(u) + 180 , 50 , s__Dash_SUB , 10 , true , false)
                    set tmp=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e009' , 'A00E' , 0 , x , y , s__Units_F(u) , 2 , 0.5 , 1.5 , "stand" , "white-qiquan.mdl")
                    call s__Units_SetH(tmp,100)
                    call s__Dash_Start(s__Units_unit[tmp] , s__Units_F(u) + 180 , 100 , s__Dash_SUB , 20 , true , false)
                    if ( GroupFind(s__Units_unit[u] , x , y , 150 , false , false) != null ) then
                        call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00E' , 0 , x , y , 0 , 2 , 1.25 , 1 , "stand" , "ThunderClapCaster.mdx")
                        call s__DazzleMaster___DazzleMaster_AddDazzle(s__Units_unit[u] , 4)
                        call GroupEnumUnitsInRange(tmp_group, x, y, 150, Condition(function GroupIsAliveNotAloc))
                        loop
                        exitwhen ( FirstOfGroup(tmp_group) == null )
                            set tmp=s__Units_Get(FirstOfGroup(tmp_group))
                            call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
                            if ( IsUnitEnemy(s__Units_unit[tmp], s__Players_player[s__Units_player[u]]) == true ) then
                                call s__HitFlys_Add(s__Units_unit[tmp] , 10)
                                call s__Dash_Start(s__Units_unit[tmp] , s__Units_F(u) , 50 , s__Dash_SUB , 10 , true , true)
                                call s__Units_Damage(u,s__Units_unit[tmp] , s__Damage_Physics , 'A00E' , s__Units_Agi(u,true) * 4.0)
                                call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl", s__Units_unit[tmp], "chest"))
                                call s__Buffs_Skill(s__Units_unit[tmp] , 'A00C' , 1)
                            endif
                        endloop
                        call GroupClear(tmp_group)
                        set t=NewTimer()
                        call SetTimerData(t , data)
                        call TimerStart(t, 0.15, false, function s__DazzleMaster___DazzleMaster_anon__41)
                        set t=null
                        call ReleaseTimer(GetExpiredTimer())
                    else
                        call s__Units_PositionEnabled(u,true)
                        call s__Units_Pause(u,false)
                        call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                        call s__Data_Destroy(data)
                        call ReleaseTimer(GetExpiredTimer())
                    endif
                else
                    call s__Units_PositionEnabled(u,true)
                    call s__Units_Pause(u,false)
                    call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                    call s__Data_Destroy(data)
                    call ReleaseTimer(GetExpiredTimer())
                endif
            endfunction
        function s__DazzleMaster___DazzleMaster_R takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            local timer t=NewTimer()
            local integer data=s__Data_create('A00E')
            call s__Units_Pause(u,true)
            call s__Units_PositionEnabled(u,false)
            call s__Units_AnimeId(u,18)
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_c[s__Data_c[data]+1]=e
            call SetTimerData(t , data)
            call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00E' , 0 , s__Units_X(u) , s__Units_Y(u) , 0 , 2 , 0.5 , 0.75 , "stand" , "white-qiquan.mdl")
            call TimerStart(t, 0.25, false, function s__DazzleMaster___DazzleMaster_anon__40)
            set t=null
        endfunction
                function s__DazzleMaster___DazzleMaster_anon__47 takes integer dash returns nothing
                    local integer data=(s__Dash_Obj[dash])
                    local integer u=(s___Data_c[s__Data_c[data]])
                    local integer mj=(s___Data_c[s__Data_c[data]+1])
                    local integer tmp
                    call s__Units_SetF(u,s__Dash_Angle[dash] , true)
                    call s__Units_Position(mj,s__Dash_X[dash] + 150 * CosBJ(s__Dash_Angle[dash] + 180) , s__Dash_LastY[dash] + 150 * SinBJ(s__Dash_Angle[dash] + 180) , false)
                    call s__Units_SetF(mj,s__Dash_Angle[dash] , true)
                    call GroupEnumUnitsInRange(tmp_group, s__Dash_X[dash] + 140 * CosBJ(s__Dash_Angle[dash]), s__Dash_Y[dash] + 140 * SinBJ(s__Dash_Angle[dash]), 100, Condition(function GroupIsAliveNotAloc))
                    loop
                    exitwhen ( FirstOfGroup(tmp_group) == null )
                        set tmp=s__Units_Get(FirstOfGroup(tmp_group))
                        call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
                        if ( IsUnitEnemy(s__Units_unit[tmp], s__Players_player[s__Units_player[u]]) == true and IsUnitInGroup(s__Units_unit[tmp], s___Data_g[s__Data_g[data]]) == false ) then
                            call GroupAddUnit(s___Data_g[s__Data_g[data]], s__Units_unit[tmp])
                            call s__Units_Damage(u,s__Units_unit[tmp] , s__Damage_Chaos , 'A00D' , s__Units_Agi(u,true) * ( 12 * ( s___Data_r[s__Data_r[data]] * 2.5 ) ))
                            call DestroyEffect(AddSpecialEffectTarget("hit_b.mdx", s__Units_unit[tmp], "chest"))
                            call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl", s__Units_X(tmp), s__Units_Y(tmp)))
                            call s__Dash_Start(s__Units_unit[tmp] , s__Dash_Angle[dash] , 350 + ( s___Data_r[s__Data_r[data]] * 2 ) * 50 , s__Dash_SUB , 15 + ( 15 * s___Data_r[s__Data_r[data]] ) , true , true)
                            if ( s___Data_i[s__Data_i[data]] == 0 ) then
                                set s___Data_i[s__Data_i[data]]=1
                                call s__DazzleMaster___DazzleMaster_AddDazzle(s__Units_unit[u] , 3)
                            endif
                        endif
                    endloop
                    call GroupClear(tmp_group)
                endfunction
                function s__DazzleMaster___DazzleMaster_anon__48 takes integer dash returns nothing
                    local integer data=(s__Dash_Obj[dash])
                    local integer u=(s___Data_c[s__Data_c[data]])
                    local integer mj=(s___Data_c[s__Data_c[data]+1])
                    call s__Spell_Destroy((s___Data_c[s__Data_c[data]+2]))
                    call s__Units_SetF(u,s__Dash_Angle[dash] , true)
                    call s__Units_Anime(mj,"death")
                    call s__Units_Life(mj,1)
                    call GroupClear(s___Data_g[s__Data_g[data]])
                    call DestroyGroup(s___Data_g[s__Data_g[data]])
                    set s___Data_g[s__Data_g[data]]=null
                    call s__Units_AnimeSpeed(u,1)
                    call s__Units_Pause(u,false)
                    call s__Data_Destroy(data)
                endfunction
            function s__DazzleMaster___DazzleMaster_anon__46 takes nothing returns nothing
                local integer data=(GetTimerData(GetExpiredTimer()))
                local integer mj
                local integer u=(s___Data_c[s__Data_c[data]])
                local integer dash
                if ( s__PlayerPress_E[s__Players_press[s__Units_player[u]]] == true and s___Data_r[s__Data_r[data]] <= 2 and s__Units_IsAbility(u,'BPSE') == false and s__Units_Alive(u) == true ) then
                    set s___Data_r[s__Data_r[data]]=s___Data_r[s__Data_r[data]] + 0.1
                    if ( s___Data_r[s__Data_r[data]] == 0.2 ) then
                        call s__Units_AnimeId(u,14)
                        call s__Units_AnimeSpeed(u,2)
                        call RunSoundOnUnit(s__s__DazzleMaster___DazzleMaster_E_sound[0] , s__Units_unit[u])
                    endif
                    if ( s___Data_r[s__Data_r[data]] == 0.8 ) then
                        call RunSoundOnUnit(s__s__DazzleMaster___DazzleMaster_E_sound[1] , s__Units_unit[u])
                    endif
                    if ( s___Data_r[s__Data_r[data]] == 1.3 ) then
                        call RunSoundOnUnit(s__s__DazzleMaster___DazzleMaster_E_sound[2] , s__Units_unit[u])
                    endif
                    if ( s___Data_r[s__Data_r[data]] == 1.8 ) then
                        call RunSoundOnUnit(s__s__DazzleMaster___DazzleMaster_E_sound[3] , s__Units_unit[u])
                    endif
                    if ( s___Data_r[s__Data_r[data]] == 0.5 or s___Data_r[s__Data_r[data]] == 1 or s___Data_r[s__Data_r[data]] == 1.5 or s___Data_r[s__Data_r[data]] == 2 ) then
                        call TextForPlayer(s__Players_player[s__Units_player[u]] , s__Units_unit[u] , R2S(( s___Data_r[s__Data_r[data]] / 2 ) * 100.0) + "%" , 0.4 , 12 , 45)
                    endif
                    if ( s___Data_i[s__Data_i[data]+3] == 0 ) then
                        set s___Data_i[s__Data_i[data]+3]=2
                        call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00D' , 0 , s__Units_X(u) , s__Units_Y(u) , GetRandomReal(0, 360) , 2 , 0.2 , 1.5 , "stand" , "kc12.mdx")
                    else
                        set s___Data_i[s__Data_i[data]+3]=s___Data_i[s__Data_i[data]+3] - 1
                    endif
                    if ( s___Data_r[s__Data_r[data]] >= 0.5 ) then
                        call s__Units_SetF(u,s__Util_XYEX(s__Units_X(u) , s__Units_Y(u) , s__PlayerPress_MouseX[s__Players_press[s__Units_player[u]]] , s__PlayerPress_MouseY[s__Players_press[s__Units_player[u]]]) , false)
                    endif
                else
                    call ReleaseTimer(GetExpiredTimer())
                    if ( s___Data_r[s__Data_r[data]] > 2 ) then
                        set s___Data_r[s__Data_r[data]]=2
                    endif
                    if ( s__Units_Alive(u) == false ) then
                        set s___Data_r[s__Data_r[data]]=0
                    else
                        set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00D' , 0 , s__Units_X(u) , s__Units_Y(u) , s__Units_F(u) , 0.6 , 0.8 , 1.5 , "birth" , "dg.mdx")
                        call s__Units_SetH(mj,100)
                        call s__Dash_Start(s__Units_unit[mj] , s__Units_F(u) , 350 + ( s___Data_r[s__Data_r[data]] * 250 ) , s__Dash_ADD , 80 , true , false)
                    endif
                    if ( s___Data_r[s__Data_r[data]] != 0 ) then
                        call TextForPlayer(s__Players_player[s__Units_player[u]] , s__Units_unit[u] , R2S(( s___Data_r[s__Data_r[data]] / 2 ) * 100) + "%落花!" , 0.8 , 14 , 300)
                    endif
                    if ( s___Data_r[s__Data_r[data]] > 1.5 ) then
                        set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e009' , 'A00D' , 0 , s__Units_X(u) , s__Units_Y(u) , s__Units_F(u) , 2 , 1.5 , 2 , "stand" , "wind.mdx")
                        call s__Units_SetH(mj,200)
                        call s__Dash_Start(s__Units_unit[mj] , s__Units_F(u) , 200 , s__Dash_ADD , 60 , true , false)
                    endif
                    call s__Units_AnimeSpeed(u,2)
                    call s__Units_AnimeId(u,17)
                    set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00D' , 0 , s__Units_X(u) , s__Units_Y(u) , s__Units_F(u) , 3600 , 0.9 , 1 , "birth" , "bimuyu_blue.mdx")
                    call s__Units_SetH(mj,100)
                    set s___Data_c[s__Data_c[data]+1]=mj
                    set s___Data_i[s__Data_i[data]]=0
                    set s___Data_g[s__Data_g[data]]=CreateGroup()
                    call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00D' , 0 , s__Units_X(u) , s__Units_Y(u) , 0 , 2 , 1 , 1 , "stand" , "ThunderClapCaster.mdx")
                    call s__Util_Duang(s__Units_X(u) , s__Units_Y(u) , 0.4 , 200 , 200 , - ( s___Data_r[s__Data_r[data]] * 51.2 ) , 0.04 , 100)
                    set dash=s__Dash_Start(s__Units_unit[u] , s__Units_F(u) , 350 + ( s___Data_r[s__Data_r[data]] * 250 ) , s__Dash_SUB , 80 , true , false)
                    set s__Dash_Obj[dash]=data
                    set s__Dash_onMove[dash]=(36)
                    set s__Dash_onEnd[dash]=(37)
                endif
            endfunction
        function s__DazzleMaster___DazzleMaster_E takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer data=s__Data_create('A00D')
            local timer t=NewTimer()
            call s__Units_Pause(u,true)
            call s__Units_AnimeId(u,16)
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_c[s__Data_c[data]+2]=e
            set s___Data_r[s__Data_r[data]]=0
            set s___Data_i[s__Data_i[data]+3]=2
            if ( s__Players_isai[s__Units_player[u]] == true ) then
                set s___Data_r[s__Data_r[data]]=2
            endif
            call SetTimerData(t , data)
            call TimerStart(t, 0.1, true, function s__DazzleMaster___DazzleMaster_anon__46)
            set t=null
        endfunction
            function s__DazzleMaster___DazzleMaster_anon__49 takes integer dash returns nothing
                local integer data=(s__Dash_Obj[dash])
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
                    if ( GroupFind(s__Units_unit[u] , x , y , 200 , false , false) != null ) then
                        if ( s___Data_i[s__Data_i[data]] == 0 ) then
                            set s___Data_i[s__Data_i[data]]=1
                            call s__Units_Pause(u,false)
                        endif
                        call s__Buffs_Add(s__Units_unit[u] , 'A011' , 'B006' , 0.5 , false)
                        call GroupEnumUnitsInRange(tmp_group, x, y, 200, Condition(function GroupIsAliveNotAloc))
                        call s__DazzleMaster___DazzleMaster_AddDazzle(s__Units_unit[u] , 2) //刀光特效版          
                        set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00B' , 0 , s__Units_X(u) , s__Units_Y(u) , s__Dash_Angle[dash] , 0.6 , 0.8 , 1.5 , "birth" , "dg.mdx")
                        call s__Units_SetH(mj,100)
                        call s__Dash_Start(s__Units_unit[mj] , s__Dash_Angle[dash] , 200 , s__Dash_ADD , 80 , true , false) //---
                        set tmp=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e009' , 'A002' , 0 , s__Dash_X[dash] , s__Dash_Y[dash] , s__Dash_Angle[dash] , 2 , 2.5 , 2 , "stand" , "wind.mdx")
                        call s__Units_SetH(tmp,200)
                        call s__Dash_Start(s__Units_unit[tmp] , s__Dash_Angle[dash] + 180 , 450 , s__Dash_SUB , 60 , true , false)
                        loop
                        exitwhen ( FirstOfGroup(tmp_group) == null )
                            set tmp=s__Units_Get(FirstOfGroup(tmp_group))
                            call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
                            if ( IsUnitEnemy(s__Units_unit[tmp], s__Players_player[s__Units_player[u]]) == true ) then
                                call s__Buffs_Skill(s__Units_unit[tmp] , 'A00C' , 1)
                                call s__Units_Damage(u,s__Units_unit[tmp] , s__Damage_Physics , 'A00B' , s__Units_Agi(u,true) * 6 + s__Units_Str(u,true) * 6)
                                call s__Dash_Start(s__Units_unit[tmp] , s__Dash_Angle[dash] , 300 , s__Dash_SUB , 90 , true , true)
                                call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl", s__Units_unit[tmp], "chest"))
                            endif
                        endloop
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
            function s__DazzleMaster___DazzleMaster_anon__50 takes integer dash returns nothing
                local integer data=(s__Dash_Obj[dash])
                local integer u=s__Units_Get(s__Dash_Unit[dash])
                if ( s___Data_i[s__Data_i[data]] == 0 ) then
                    call s__Units_Pause(u,false)
                endif
                call s__Units_Alpha(u,255)
                call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                call s__Data_Destroy(data)
            endfunction
        function s__DazzleMaster___DazzleMaster_W takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer dash
            local integer data=s__Data_create('A00B')
            call s__Units_Pause(u,true)
            call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00B' , 0 , s__Units_X(u) , s__Units_Y(u) , s__Spell_Angle[e] , 2 , 1.5 , 2 , "stand" , "dust2.mdx")
            call s__Util_Duang(s__Units_X(u) , s__Units_Y(u) , 0.3 , 200 , 200 , - 48 , 0.04 , 100)
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_c[s__Data_c[data]+1]=e
            set s___Data_i[s__Data_i[data]]=0
            set dash=s__Dash_Start(s__Units_unit[u] , s__Spell_Angle[e] , 250 , s__Dash_SUB , 40 , true , false)
            set s__Dash_Obj[dash]=data
            set s__Dash_onMove[dash]=(38)
            set s__Dash_onEnd[dash]=(39)
        endfunction
            function s__DazzleMaster___DazzleMaster_anon__51 takes integer dash returns nothing
                local integer data=(s__Dash_Obj[dash])
                local integer du=s__Units_Get(s__Dash_Unit[dash])
                local integer u=(s___Data_c[s__Data_c[data]])
                local integer tmp
                call s__Units_Position(u,s__Units_X(du) , s__Units_Y(du) , false)
                call GroupEnumUnitsInRange(tmp_group, s__Units_X(u) + 100 * CosBJ(s__Dash_Angle[dash]), s__Units_Y(u) + 100 * SinBJ(s__Dash_Angle[dash]), 90, Condition(function GroupIsAliveNotAloc))
                loop
                exitwhen ( FirstOfGroup(tmp_group) == null )
                    set tmp=s__Units_Get(FirstOfGroup(tmp_group))
                    call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
                    if ( IsUnitEnemy(s__Units_unit[tmp], s__Players_player[s__Units_player[u]]) == true and IsUnitInGroup(s__Units_unit[tmp], s___Data_g[s__Data_g[data]]) == false ) then
                        call GroupAddUnit(s___Data_g[s__Data_g[data]], s__Units_unit[tmp])
                        call s__Buffs_Skill(s__Units_unit[tmp] , 'A00A' , 1)
                        call s__HitFlys_Add(s__Units_unit[tmp] , 25)
                        call s__Units_Damage(u,s__Units_unit[tmp] , s__Damage_Magic , 'A009' , s__Units_Agi(u,true) * 3 + s__Units_Str(u,true) * 4)
                        call DestroyEffect(AddSpecialEffectTarget("bd2d2.mdx", s__Units_unit[tmp], "chest"))
                        if ( s__Dash_NowDis[dash] < 400 ) then
                            call s__Dash_Start(s__Units_unit[tmp] , s__Dash_Angle[dash] , 500 - s__Dash_NowDis[dash] , s__Dash_SUB , 90 , true , true)
                        endif
                        if ( s___Data_i[s__Data_i[data]] == 0 ) then
                            set s___Data_i[s__Data_i[data]]=1
                            call s__DazzleMaster___DazzleMaster_AddDazzle(s__Units_unit[u] , 1)
                        endif
                    endif
                endloop
                call GroupClear(tmp_group)
                if ( s__Dash_Speed[dash] > 15 and s__Dash_Speed[dash] < 40 ) then
                    if ( s___Data_i[s__Data_i[data]+1] == 0 ) then
                        set s___Data_i[s__Data_i[data]+1]=1
                        call s__Units_Pause(u,false)
                    endif
                    call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl", s__Dash_X[dash], s__Dash_Y[dash]))
                endif
                if ( s__Dash_Speed[dash] < 1.5 ) then
                    call s__Dash_Stop(dash)
                endif
            endfunction
            function s__DazzleMaster___DazzleMaster_anon__52 takes integer dash returns nothing
                local integer data=(s__Dash_Obj[dash])
                local integer u=(s___Data_c[s__Data_c[data]])
                call DestroyGroup(s___Data_g[s__Data_g[data]])
                set s___Data_g[s__Data_g[data]]=null
                call s__Units_Remove(s__Units_unit[(s___Data_c[s__Data_c[data]+2])])
                call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                call s__Units_Alpha(u,255)
                if ( s___Data_i[s__Data_i[data]+1] == 0 ) then
                    call s__Units_Pause(u,false)
                endif
                call s__Data_Destroy(data)
            endfunction
        function s__DazzleMaster___DazzleMaster_Q takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer dash
            local integer data=s__Data_create('A009')
            local integer ts
            call s__Units_Pause(u,true)
            call s__Units_Alpha(u,0)
            call s__Units_AnimeId(u,6)
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_c[s__Data_c[data]+1]=e
            set s___Data_i[s__Data_i[data]]=0
            set s___Data_g[s__Data_g[data]]=CreateGroup()
            set ts=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00B' , 0 , s__Units_X(u) , s__Units_Y(u) , s__Spell_Angle[e] , 10 , 1 , 0.7 , "stand" , "kiyohime_lancer.mdl")
            call s__Units_AnimeId(ts,6)
            call s__Units_AnimeSpeed(ts,0.7)
            set s___Data_c[s__Data_c[data]+2]=ts
            set s___Data_i[s__Data_i[data]+1]=0
            call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00B' , 0 , s__Units_X(u) , s__Units_Y(u) , s__Spell_Angle[e] , 4 , 1 , 2.5 , "stand" , "dust2.mdx")
            set dash=s__Dash_Start(s__Units_unit[ts] , s__Spell_Angle[e] , 600 , s__Dash_SUB , 60 , true , false)
            set s__Dash_Obj[dash]=data
            set s__Dash_onMove[dash]=(40)
            set s__Dash_onEnd[dash]=(41)
        endfunction
    function DazzleMaster___onInit takes nothing returns nothing
        call s__Spell_On(s__Spell_onSpell , 'A008' , (42))
        call s__Spell_On(s__Spell_onSpell , 'A009' , (43))
        call s__Spell_On(s__Spell_onSpell , 'A00B' , (44))
        call s__Spell_On(s__Spell_onSpell , 'A00D' , (45))
        call s__Spell_On(s__Spell_onSpell , 'A00E' , (46))
        call s__Spell_On(s__Spell_onReady , 'A009' , (47))
        call s__Spell_On(s__Spell_onStop , 'A009' , (48))
        call s__Damage_On(s__Damage_onHeroDamageed , (49))
        call s__Units_On(s__Units_onHeroSpawn , (3))
        call s__Units_On(s__Units_onAlocDeath , (4))
        set s__s__DazzleMaster___DazzleMaster_DazzlePath[0]= "ball_nothing.mdx"
        set s__s__DazzleMaster___DazzleMaster_DazzleName[0]= "无属性"
        set s__s__DazzleMaster___DazzleMaster_DazzlePath[1]= "ball_light.mdx"
        set s__s__DazzleMaster___DazzleMaster_DazzleName[1]= "光属性"
        set s__s__DazzleMaster___DazzleMaster_DazzlePath[2]= "ball_ice.mdx"
        set s__s__DazzleMaster___DazzleMaster_DazzleName[2]= "冰属性"
        set s__s__DazzleMaster___DazzleMaster_DazzlePath[3]= "ball_fire.mdx"
        set s__s__DazzleMaster___DazzleMaster_DazzleName[3]= "火属性"
        set s__s__DazzleMaster___DazzleMaster_DazzlePath[4]= "ball_dark.mdx"
        set s__s__DazzleMaster___DazzleMaster_DazzleName[4]= "暗属性"
        set s__s__DazzleMaster___DazzleMaster_E_sound[0]= DefineSound("resource\\sound_effect_xuanwendashi_e_0.wav" , 1000 , false , true)
        set s__s__DazzleMaster___DazzleMaster_E_sound[1]= DefineSound("resource\\sound_effect_xuanwendashi_e_1.wav" , 1000 , false , true)
        set s__s__DazzleMaster___DazzleMaster_E_sound[2]= DefineSound("resource\\sound_effect_xuanwendashi_e_2.wav" , 1000 , false , true)
        set s__s__DazzleMaster___DazzleMaster_E_sound[3]= DefineSound("resource\\sound_effect_xuanwendashi_e_3.wav" , 1000 , false , true)
    endfunction

//library DazzleMaster ends
//library Init:

    //public:  //中央球、阵初始化、杂物初始化类 //中央球,中央阵
        function Init___anon__8 takes nothing returns nothing
            local unit u
            local integer p=s__Players_Set(GetEnumPlayer())
            call UnitShareVision(Origin_Ball, s__Players_player[p], true)
            set u=s__Units_Spawn(s__Players_player[p] , 'H007' , 0 , 0 , 0)
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
        call SetUnitOwner(Origin_Magic, Player(bj_PLAYER_NEUTRAL_EXTRA), false)
        set Origin_X=GetUnitX(Origin_Ball)
        set Origin_Y=GetUnitY(Origin_Ball)
        call SetUnitTimeScale(Origin_Magic, 0)
        call s__Winner_start()
        call s__Players_Set(Player(PLAYER_NEUTRAL_PASSIVE))
        call s__Players_Set(Player(PLAYER_NEUTRAL_AGGRESSIVE))
        call s__Players_Set(Player(bj_PLAYER_NEUTRAL_EXTRA))
        call s__Teams_ActionsForAllPlayer(function Init___anon__8)
        set i=0 //测试
        loop
        exitwhen ( i > 5 )
            call RemoveGuardPosition(s__Units_Spawn(Player(PLAYER_NEUTRAL_AGGRESSIVE) , 'h001' , - 4464 , - 3641 , 0))
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
            function s__KillUi_anon__20 takes nothing returns nothing
                set s___KillUi_TeamPlayer[s__KillUi_TeamPlayer[s__KillUi_tmp]+s__KillUi_TeamNumbers[s__KillUi_tmp]]=s__Players_Get(GetEnumPlayer())
                set s__KillUi_TeamNumbers[s__KillUi_tmp]=s__KillUi_TeamNumbers[s__KillUi_tmp] + 1
            endfunction
        function s__KillUi_create takes integer tid,integer index returns integer
            local integer i
            set s__KillUi_tmp=s__KillUi__allocate()
            set s__KillUi_TeamIndex[s__KillUi_tmp]=tid
            call ForForce(s__Teams_GetTeamForceByIndex(tid), function s__KillUi_anon__20)
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
        function s__KillUi_Show takes player p,string e returns nothing
            if ( e == "F2" ) then
                call DzFrameShow(s__KillUi_KillBackgroundMaxLine, true)
            endif
        endfunction
        function s__KillUi_Hide takes player p,string e returns nothing
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
            call s__Press_OnSnyc(s__Press_onSnycPressKeyDown , (3))
            call s__Press_OnSnyc(s__Press_onSnycPressKeyUp , (4))
        endfunction
        function KillUi___anon__21 takes nothing returns nothing
            call s__KillUi_FlushKillData(- 1)
            call ReleaseTimer(GetExpiredTimer())
        endfunction  //-----最小化状态
        function KillUi___anon__22 takes nothing returns nothing
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
        call TimerStart(NewTimer(), 0.05, false, function KillUi___anon__21)
        call TimerStart(NewTimer(), 0.06, false, function KillUi___anon__22)
    endfunction

//library KillUi ends
//library OrdinaryWizard:
            function s__OrdinaryWizard___OrdinaryWizard_anon__29 takes integer dash returns nothing
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
            function s__OrdinaryWizard___OrdinaryWizard_anon__30 takes integer dash returns nothing
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
                    call GroupDamage(u , x , y , 300 , s__Units_Int(s__Players_hero[s__Units_player[u]],true) * 20.0 , s__Damage_Magic , 'A006' , false)
                    if ( s__Players_lv10[s__Units_player[u]] != null ) then //是否触发E
                        call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A006' , 0 , x , y , 0 , 5 , 1 , 1.5 , "death" , "fire3.mdx")
                        set i=0
                        loop
                        exitwhen ( i >= 12 )
                            set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A005' , 0 , x , y , I2R(i) * 30 , 1.5 , 2.5 , 1 , "stand" , "Environment\\UndeadBuildingFire\\UndeadLargeBuildingFire1.mdl")
                            call s__Dash_Start(s__Units_unit[mj] , s__Units_F(mj) , 600 , s__Dash_SUB , 40 , true , false)
                        set i=i + 1
                        endloop
                    endif
                else
                    call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A006' , 0 , s__Units_X(u) , s__Units_Y(u) , s__Spell_Angle[e] , 2 , 2.5 , 1 , "death" , "Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile.mdl")
                    call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Human\\MarkOfChaos\\MarkOfChaosTarget.mdl", s__Units_X(u), s__Units_Y(u)))
                    call DzSetUnitModel(s__Units_unit[u], "units\\human\\HeroBloodElf\\HeroBloodElf.mdx")
                    if ( s__Units_Alive(u) == false ) then
                        call s__Units_Anime(u,"death")
                    endif
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
            set s__Dash_onMove[dash]=(50)
            set s__Dash_onEnd[dash]=(51)
        endfunction
        function s__OrdinaryWizard___OrdinaryWizard_E takes integer u,integer m returns nothing
            if ( s__Units_aid[u] == 'A005' and s__Units_aidindex[u] == 0 ) then
                call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Other\\Doom\\DoomDeath.mdl", s__Units_X(u), s__Units_Y(u)))
                call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Other\\Incinerate\\FireLordDeathExplode.mdl", s__Units_X(u), s__Units_Y(u)))
                call GroupDamage(u , s__Units_X(u) , s__Units_Y(u) , 150 , s__Units_Int(s__Players_hero[s__Units_player[u]],true) * 2.0 , s__Damage_Magic , 0 , false)
            endif
        endfunction
            function s__OrdinaryWizard___OrdinaryWizard_anon__31 takes nothing returns nothing
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
                            call s__Units_Damage(u,s__Units_unit[mj] , s__Damage_Magic , 'A004' , s__Units_Int(u,true) * 10)
                        endif
                        call GroupRemoveUnit(tmp_group, s__Units_unit[mj])
                    endloop
                    call GroupClear(tmp_group)
                    if ( s__Players_lv10[s__Units_player[u]] != null ) then //是否触发E
                        set i=0
                        loop
                        exitwhen ( i >= 6 )
                            set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A005' , 0 , s__Units_X(u) , s__Units_Y(u) , I2R(i) * 60 , 1.5 , 2.5 , 1 , "stand" , "Environment\\UndeadBuildingFire\\UndeadLargeBuildingFire1.mdl")
                            call s__Dash_Start(s__Units_unit[mj] , s__Units_F(mj) , 300 , s__Dash_PWX , 20 , true , false)
                        set i=i + 1
                        endloop
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
            call TimerStart(t, 0.4, false, function s__OrdinaryWizard___OrdinaryWizard_anon__31)
            set t=null
        endfunction
            function s__OrdinaryWizard___OrdinaryWizard_anon__32 takes integer da returns nothing
                call s__Units_Anime(s__Units_Get(s__Dash_Unit[da]),"death")
            endfunction
            function s__OrdinaryWizard___OrdinaryWizard_anon__33 takes integer da returns nothing
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
            function s__OrdinaryWizard___OrdinaryWizard_anon__34 takes integer d returns nothing
                local integer u=(s__Dash_Obj[d])
                local integer tmp=s__Units_Get(s__Dash_Unit[d])
                local real dis
                local real f
                if ( s__Dash_NowDis[d] > 200 ) then
                    if ( s__Players_lv10[s__Units_player[u]] != null ) then //是否触发E
                        if ( s__Units_IsAbility(u,'B000') == false ) then
                            set dis=GetRandomReal(0, 150)
                            set f=GetRandomReal(0, 360)
                            call s__Buffs_Add(s__Units_unit[u] , 'A000' , 'B000' , 0.03 , false)
                            call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A005' , 0 , s__Units_X(tmp) + dis * CosBJ(f) , s__Units_Y(tmp) + dis * SinBJ(f) , f , 1.5 , 2.5 , 1 , "stand" , "Environment\\UndeadBuildingFire\\UndeadLargeBuildingFire1.mdl")
                        endif
                    endif
                    if ( GroupFind(s__Units_unit[u] , s__Units_X(tmp) , s__Units_Y(tmp) , 75 , false , false) != null ) then
                        call s__Dash_Stop(d)
                    endif
                endif
            endfunction
            function s__OrdinaryWizard___OrdinaryWizard_anon__35 takes integer d returns nothing
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
                    call GroupDamage(u , x , y , 250 , s__Units_Int(s__Players_hero[s__Units_player[u]],true) * 5.0 , s__Damage_Magic , 'A002' , false)
                    set u=(s__Dash_Obj[d])
                    if ( s__Players_lv10[s__Units_player[u]] != null ) then //是否触发E
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
            set s__Dash_onEnd[dash]=(52)
            set s__Dash_onMove[dash]=(53)
            call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl", x + 100 * CosBJ(f), y + 100 * SinBJ(f)))
            call DestroyEffect(AddSpecialEffectTarget("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl", s__Units_unit[u], "hand right"))
            set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A002' , 2 , x + 100 * CosBJ(f) , y + 100 * SinBJ(f) , f , 1.5 , 2 , 1 , "stand" , "Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl")
            call s__Units_SetH(mj,120)
            call SetUnitPosition(s__Units_unit[mj], s__Units_X(mj), s__Units_Y(mj))
            set dash=s__Dash_Start(s__Units_unit[mj] , f , 1300 , s__Dash_ADD , 50 , true , false)
            set s__Dash_Obj[dash]=u
            set s__Dash_NowDis[dash]=10
            set s__Dash_onMove[dash]=(54)
            set s__Dash_onEnd[dash]=(55)
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
            call s__Spell_On(s__Spell_onSpell , 'A002' , (56))
            call s__Spell_On(s__Spell_onSpell , 'A004' , (57))
            call s__Spell_On(s__Spell_onSpell , 'A006' , (58))
            call s__Spell_On(s__Spell_onStart , 'A002' , (59))
            call s__Spell_On(s__Spell_onStop , 'A002' , (60))
            call s__Spell_On(s__Spell_onStart , 'A006' , (59))
            call s__Spell_On(s__Spell_onStop , 'A006' , (60))
            call s__Units_On(s__Units_onAlocDeath , (5))
        endfunction

//library OrdinaryWizard ends
//library SL:
                function s__SL__SL_anon__90 takes integer dash returns nothing
                    local integer u=s__Units_Get(s__Dash_Unit[dash])
                    local real x=s__Units_X(u)
                    local real y=s__Units_Y(u)
                    local unit k
                    set k=GroupFind(s__Units_unit[u] , x , y , 100 , true , false)
                    if ( k != null ) then
                        set s__Dash_X[dash]=GetUnitX(k)
                        set s__Dash_Y[dash]=GetUnitY(k)
                        call s__Dash_Stop(dash)
                        set k=null
                    endif
                endfunction
                    function s__SL__SL_anon__92 takes nothing returns nothing
                        local integer data=(GetTimerData(GetExpiredTimer()))
                        local integer mj=(s___Data_c[s__Data_c[data]])
                        local integer tmp
                        local real x=s__Units_X(mj)
                        local real y=s__Units_Y(mj)
                        local real dis
                        local real a
                        if ( s___Data_r[s__Data_r[data]] < 0 ) then
                            call s__Units_Anime(mj,"death")
                            call s__Units_Life(mj,5)
                            call s__Data_Destroy(data)
                            call ReleaseTimer(GetExpiredTimer())
                        else
                            set dis=GetRandomReal(0, 50)
                            set a=GetRandomReal(0, 360)
                            call s__Units_SetH(s__Units_MJ(s__Players_player[s__Units_player[mj]] , 'e008' , 'A01B' , 0 , x + dis * CosBJ(a) , y + dis * SinBJ(a) , GetRandomReal(250, 290) , 0.5 , 0.5 , 2 , "stand" , "blue-slash-more.mdl"),50)
                            call GroupEnumUnitsInRange(tmp_group, x, y, 150, Condition(function GroupIsAliveNotAloc))
                            loop
                            exitwhen ( FirstOfGroup(tmp_group) == null )
                                set tmp=s__Units_Get(FirstOfGroup(tmp_group))
                                call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
                                if ( IsUnitEnemy(s__Units_unit[tmp], s__Players_player[s__Units_player[mj]]) == true ) then
                                    call DestroyEffect(AddSpecialEffectTarget("hiteffect10white.mdl", s__Units_unit[tmp], "chest"))
                                    call s__Units_Damage(mj,s__Units_unit[tmp] , s__Damage_Physics , 'A01B' , s__Units_Agi(mj,true) * 1.428) //敏捷X20伤害 14次      
                                endif
                            endloop
                            call GroupClear(tmp_group)
                            set s___Data_r[s__Data_r[data]]=s___Data_r[s__Data_r[data]] - 0.03
                        endif
                    endfunction
                function s__SL__SL_anon__91 takes integer dash returns nothing
                    local integer u=s__Units_Get(s__Dash_Unit[dash])
                    local timer t=NewTimer()
                    local integer data=s__Data_create('A00B')
                    local integer mj
                    call s__Units_Life(u,0.2)
                    if ( s__Dash_Obj[dash] == s__Spell_ReadyState ) then
                        call s__Units_SetH(s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A01B' , 0 , s__Dash_X[dash] , s__Dash_Y[dash] , 0 , 1 , 1.5 , 1 , "stand" , "blue-daoguang-new.mdl"),50)
                    endif
                    call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A01B' , 0 , s__Dash_X[dash] , s__Dash_Y[dash] , 0 , 1 , 0.60 , 1 , "stand" , "white-qiquan.mdl")
                    set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A01B' , 0 , s__Dash_X[dash] , s__Dash_Y[dash] , 0 , 10 , 3 , 5 , "stand" , "cyz.mdl")
                    call s__Units_SetH(mj,150)
                    set s___Data_c[s__Data_c[data]]=mj
                    set s___Data_r[s__Data_r[data]]=0.4
                    call SetTimerData(t , data)
                    call TimerStart(t, 0.03, true, function s__SL__SL_anon__92)
                    set t=null
                endfunction
            function s__SL__SL_anon__89 takes integer dash returns nothing
                local integer data=(s__Dash_Obj[dash])
                local integer u=(s___Data_c[s__Data_c[data]])
                local integer e=(s___Data_c[s__Data_c[data]+1])
                local real x=s__Dash_X[dash]
                local real y=s__Dash_Y[dash]
                local integer mj
                if ( s__Dash_Speed[dash] < 30 ) then
                    if ( s___Data_i[s__Data_i[data]] == 0 ) then
                        call s__Units_SetH(s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A01B' , 0 , x , y , s__Dash_Angle[dash] + 45 , 1 , 1.5 , 1.5 , "stand" , "dg4.mdl"),75)
                        set s___Data_i[s__Data_i[data]]=1
                        set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A01B' , 0 , x , y , s__Spell_Angle[e] , 10 , 0.75 , 1 , "stand" , ".mdl")
                        set dash=s__Dash_Start(s__Units_unit[mj] , s__Spell_Angle[e] , 1200 , s__Dash_NORMAL , 80 , true , false)
                        set s__Dash_Obj[dash]=s__Spell_State[e]
                        set s__Dash_onMove[dash]=(61)
                        set s__Dash_onEnd[dash]=(62)
                    endif
                endif
            endfunction
            function s__SL__SL_anon__93 takes integer dash returns nothing
                local integer data=(s__Dash_Obj[dash])
                local integer u=(s___Data_c[s__Data_c[data]])
                if ( s__Spell_State[(s___Data_c[s__Data_c[data]+1])] == s__Spell_ReadyState ) then
                    call s__Units_AnimeSpeed(u,4)
                    call s__Units_DelayAlpha(u,0 , 255 , 0.1)
                    call s__Units_DelayReleaseAnimePause(u,0.2)
                else
                    call s__Units_DelayAlpha(u,0 , 255 , 0.7)
                    call s__Units_DelayReleaseAnimePause(u,0.8)
                endif
                call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                call s__Data_Destroy(data)
            endfunction
        function s__SL__SL_R takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer i
            local integer dash
            local integer mj
            local integer data=s__Data_create('A01B')
            local real x=s__Units_X(u)
            local real y=s__Units_Y(u)
            call s__Units_Pause(u,true)
            call s__Units_AnimeId(u,4)
            call s__Units_DelayAlpha(u,255 , 0 , 0.2)
            call DestroyEffect(AddSpecialEffectTarget("blink_blue.mdl", s__Units_unit[u], "origin"))
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_c[s__Data_c[data]+1]=e
            set s___Data_i[s__Data_i[data]]=0
            set dash=s__Dash_Start(s__Units_unit[u] , s__Spell_Angle[e] + 180 , 300 , s__Dash_SUB , 40 , true , false)
            set s__Dash_Obj[dash]=data
            set s__Dash_onMove[dash]=(63)
            set s__Dash_onEnd[dash]=(64)
        endfunction
                function s__SL__SL_anon__95 takes integer dash returns nothing
                    local integer u=s__Units_Get(s__Dash_Unit[dash])
                    local integer mj
                    if ( s__Dash_Speed[dash] < 4 ) then
                        if ( s__Units_aidindex[u] == 0 ) then
                            set s__Units_aidindex[u]=1
                            call s__Units_Life(u,0.5)
                            call s__Units_Anime(u,"death")
                        endif
                    elseif ( s__Dash_Obj[dash] == 0 ) then //12 
                        set s__Dash_Obj[dash]=2
                        call GroupEnumUnitsInRange(tmp_group, s__Dash_X[dash], s__Dash_Y[dash], 125, Condition(function GroupIsAliveNotAloc))
                        loop
                        exitwhen ( FirstOfGroup(tmp_group) == null )
                            set mj=s__Units_Get(FirstOfGroup(tmp_group))
                            call GroupRemoveUnit(tmp_group, s__Units_unit[mj])
                            if ( IsUnitEnemy(s__Units_unit[mj], s__Players_player[s__Units_player[u]]) == true ) then
                                call DestroyEffect(AddSpecialEffectTarget("hiteffect10white.mdl", s__Units_unit[mj], "chest"))
                                call s__Units_Damage(u,s__Units_unit[mj] , s__Damage_Magic , 'A01A' , s__Units_Agi(u,true) * 2)
                            endif
                        endloop
                        call GroupClear(tmp_group)
                    else
                        set s__Dash_Obj[dash]=s__Dash_Obj[dash] - 1
                    endif
                endfunction
                function s__SL__SL_anon__96 takes integer dash returns nothing
                    local integer u=s__Units_Get(s__Dash_Unit[dash])
                    if ( s__Units_aidindex[u] == 0 ) then
                        call s__Units_Life(u,0.5)
                        call s__Units_Anime(u,"death")
                    endif
                endfunction
            function s__SL__SL_anon__94 takes nothing returns nothing
                local integer data=(GetTimerData(GetExpiredTimer()))
                local integer u=(s___Data_c[s__Data_c[data]])
                local integer mj
                local real x=s__Units_X(u)
                local real y=s__Units_Y(u)
                local real f=s__Util_XYEX(x , y , x + 100 * CosBJ(s__Units_F(u)) , y + 100 * SinBJ(s__Units_F(u)))
                local integer dash
                call s__Units_SetF(u,s__Units_F(u) , true)
                call s__Units_AnimeSpeed(u,1)
                call s__Units_AnimeId(u,10)
                if ( s__Units_Alive(u) == true ) then
                    call s__Units_SetH(s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e00B' , 'A01A' , 0 , x , y , f + 90 , 2 , 0.5 , 2.5 , "stand" , "[spell]xinzhao_r2_3.mdl"),100)
                    set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A01A' , 0 , x + 75 * CosBJ(f) , y + 75 * SinBJ(f) , f + 180 , 2 , 1.5 , 1 , "stand" , "dust2.mdl")
                    call s__Dash_Start(s__Units_unit[mj] , f , 250 , s__Dash_SUB , 20 , true , false)
                    call GroupEnumUnitsInRange(tmp_group, x, y, 300, Condition(function GroupIsAliveNotAloc))
                    loop
                    exitwhen ( FirstOfGroup(tmp_group) == null )
                        set mj=s__Units_Get(FirstOfGroup(tmp_group))
                        call GroupRemoveUnit(tmp_group, s__Units_unit[mj])
                        if ( IsUnitEnemy(s__Units_unit[mj], s__Players_player[s__Units_player[u]]) == true ) then
                            if ( s__Util_FAN(s__Units_unit[u] , s__Units_unit[mj] , f , 80) == true ) then
                                call DestroyEffect(AddSpecialEffectTarget("hiteffect10white.mdl", s__Units_unit[mj], "chest"))
                                call s__Dash_Start(s__Units_unit[mj] , f , 400.0 , s__Dash_SUB , 40 , true , true)
                            endif
                        endif
                    endloop
                    call GroupClear(tmp_group)
                    set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A01A' , 0 , x + 75 * CosBJ(f) , y + 75 * SinBJ(f) , f , 5 , 0.75 , 1 , "stand" , "bladewave_yellow.mdl")
                    set dash=s__Dash_Start(s__Units_unit[mj] , f , 1600 , s__Dash_SUB , 40 , true , false)
                    set s__Dash_Obj[dash]=2
                    set s__Dash_onMove[dash]=(65)
                    set s__Dash_onEnd[dash]=(66)
                endif
                if ( s__Players_lv15[s__Units_player[u]] == null ) then
                    call s__Units_DelayReleaseAnimePause(u,0.6)
                else
                    call s__Buffs_Add(s__Units_unit[u] , 'A01C' , 'B008' , 0.25 , false)
                    call s__Units_AnimeSpeed(u,3)
                    call s__Units_DelayReleaseAnimePause(u,0.2)
                endif
                call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                call s__Data_Destroy(data)
                call ReleaseTimer(GetExpiredTimer())
            endfunction
        function s__SL__SL_E takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer data=s__Data_create('A01A')
            local timer t=NewTimer()
            local real s=0.4
            call s__Units_Pause(u,true)
            if ( s__Players_lv15[s__Units_player[u]] != null ) then
                set s=0.01
                call s__Units_AnimeSpeed(u,6)
            endif
            call s__Units_AnimeId(u,6)
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_c[s__Data_c[data]+1]=e
            call SetTimerData(t , data)
            call TimerStart(t, s, false, function s__SL__SL_anon__94)
            set t=null
        endfunction
                function s__SL__SL_anon__98 takes integer dash returns nothing
                    local integer u=s__Units_Get(s__Dash_Unit[dash])
                    call s__Units_SetF(u,s__Dash_Angle[dash] , true)
                    if ( s__Dash_Speed[dash] < 4 ) then
                        call s__Dash_Stop(dash)
                    endif
                endfunction
                    function s__SL__SL_anon__100 takes nothing returns nothing
                        local integer data=(GetTimerData(GetExpiredTimer()))
                        local integer u=(s___Data_c[s__Data_c[data]+2])
                        local integer m=(s___Data_c[s__Data_c[data]])
                        local integer dash
                        if ( s___Data_i[s__Data_i[data]+2] == 0 ) then //u.RemoveAbility('A019');
                            call s__Units_AnimeSpeed(u,1)
                            call s__Units_AnimeId(u,8)
                            call s__Units_Life(u,0.8)
                            call s__Units_DelayAlpha(u,200 , 0 , 0.7)
                            call ReleaseTimer(GetExpiredTimer())
                            set s___Data_i[s__Data_i[data]+1]=s___Data_i[s__Data_i[data]+1] - 1
                        else
                            call s__Units_Position(u,GetUnitX(s___Data_u[s__Data_u[data]]) + 225 * CosBJ(s__Util_XY(s__Units_unit[u] , s___Data_u[s__Data_u[data]]) + 45) , GetUnitY(s___Data_u[s__Data_u[data]]) + 225 * SinBJ(s__Util_XY(s__Units_unit[u] , s___Data_u[s__Data_u[data]]) + 45) , false)
                            call s__Units_SetF(u,s__Util_XY(s__Units_unit[u] , s___Data_u[s__Data_u[data]]) , true)
                            call s__Units_AnimeId(u,3)
                            call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl", s___Data_u[s__Data_u[data]], "chest"))
                            set s___Data_i[s__Data_i[data]+2]=s___Data_i[s__Data_i[data]+2] - 1
                            call s__Units_Damage(u,s___Data_u[s__Data_u[data]] , s__Damage_Physics , 'A018' , s__Units_Agi(u,true) * 0.5)
                        endif
                    endfunction
                function s__SL__SL_anon__99 takes integer dash returns nothing
                    local integer data=(s__Dash_Obj[dash])
                    local integer u=s__Units_Get(s__Dash_Unit[dash])
                    local timer t=NewTimer()
                    call s__Units_Model(u,"niuzai_squished.mdl")
                    call s__Units_AddAbility(u,'A019')
                    call s__Units_SetH(u,0)
                    call s__Units_Size(u,0.75)
                    call s__Units_Alpha(u,200)
                    call s__Units_AnimeId(u,3)
                    set s___Data_i[s__Data_i[data]+2]=5
                    call SetTimerData(t , data)
                    call TimerStart(t, 0.05, true, function s__SL__SL_anon__100)
                    set t=null
                endfunction  //------------
                function s__SL__SL_anon__101 takes integer dash returns nothing
                    if ( s__Dash_Speed[dash] < 4 ) then
                        call s__Dash_Stop(dash)
                    endif
                endfunction
                        function s__SL__SL_anon__104 takes integer dash returns nothing
                            local integer data=(s__Dash_Obj[dash])
                            local integer u=(s___Data_c[s__Data_c[data]])
                            call SetUnitX(s___Data_u[s__Data_u[data]], s___Data_r[s__Data_r[data]])
                            call SetUnitY(s___Data_u[s__Data_u[data]], s___Data_r[s__Data_r[data]+1])
                            if ( s__Util_XY2(s__Units_unit[u] , s___Data_u[s__Data_u[data]]) < 150 ) then
                                set s___Data_r[s__Data_r[data]]=s___Data_r[s__Data_r[data]] + 10 * CosBJ(s__Dash_Angle[dash] + 180)
                                set s___Data_r[s__Data_r[data]+1]=s___Data_r[s__Data_r[data]+1] + 10 * SinBJ(s__Dash_Angle[dash] + 180)
                                call s__Units_SetH(s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A018' , 0 , GetUnitX(s___Data_u[s__Data_u[data]]) , GetUnitY(s___Data_u[s__Data_u[data]]) , 0 , 2 , 1.5 , 2 , "stand" , "az-blood-hit.mdl"),100)
                                call s__Units_SetH(s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A018' , 0 , GetUnitX(s___Data_u[s__Data_u[data]]) , GetUnitY(s___Data_u[s__Data_u[data]]) , 0 , 2 , 1.5 , 2 , "stand" , "yooobug_hit_blue.mdl"),100)
                                if ( s___Data_r[s__Data_r[data]+4] == 0 ) then
                                    set s___Data_r[s__Data_r[data]+4]=1
                                    call s__Units_Damage(u,s___Data_u[s__Data_u[data]] , s__Damage_Physics , 'A018' , s__Units_Agi(u,true) * 5.0)
                                endif
                            endif
                            if ( s__Dash_Speed[dash] < 4 ) then
                                call s__Dash_Stop(dash)
                            endif
                        endfunction
                        function s__SL__SL_anon__105 takes integer dash returns nothing
                            local integer data=(s__Dash_Obj[dash])
                            local integer u=(s___Data_c[s__Data_c[data]])
                            call s__Dash_Start(s__Units_unit[u] , s__Dash_Angle[dash] , 100 , s__Dash_SUB , 7 , true , false)
                            call s__Units_SetF(u,s__Util_XY(s__Units_unit[u] , s___Data_u[s__Data_u[data]]) , true)
                            call s__Units_AnimeSpeed(u,2.5)
                            call s__Units_DelayAlpha(u,0 , 255 , 0.2)
                            call s__Units_AnimeId(u,8)
                            if ( s__Players_lv15[s__Units_player[u]] == null ) then
                                call s__Units_DelayReleaseAnimePause(u,0.4)
                            else
                                call s__Buffs_Add(s__Units_unit[u] , 'A01C' , 'B008' , 0.25 , false)
                                call s__Units_AnimeSpeed(u,5)
                                call s__Units_DelayReleaseAnimePause(u,0.2)
                            endif
                            set s___Data_u[s__Data_u[data]]=null
                            call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                            call s__Data_Destroy(data)
                        endfunction
                    function s__SL__SL_anon__103 takes nothing returns nothing
                        local integer data=(GetTimerData(GetExpiredTimer()))
                        local integer u=(s___Data_c[s__Data_c[data]+3])
                        local integer m=(s___Data_c[s__Data_c[data]])
                        local integer dash
                        if ( s___Data_i[s__Data_i[data]+3] == 0 ) then
                            if ( s___Data_i[s__Data_i[data]+4] == 0 ) then
                                set s___Data_i[s__Data_i[data]+4]=1
                                call s__Units_AnimeSpeed(u,1)
                                call s__Units_AnimeId(u,8)
                                call s__Units_Life(u,0.8)
                                call s__Units_DelayAlpha(u,200 , 0 , 0.7)
                                set s___Data_i[s__Data_i[data]+1]=s___Data_i[s__Data_i[data]+1] - 1
                            endif
                            if ( s___Data_i[s__Data_i[data]+1] == 0 ) then
                                call ReleaseTimer(GetExpiredTimer())
                                if ( s__Units_Alive(m) == true ) then
                                    call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A018' , 0 , s__Units_X(m) , s__Units_Y(m) , s__Util_XY(s__Units_unit[m] , s___Data_u[s__Data_u[data]]) , 2 , 1 , 2 , "stand" , "chongfeng2.mdl")
                                    call s__Util_Duang(s__Units_X(m) , s__Units_Y(m) , 0.5 , 150 , 150 , - 36 , 0.02 , 50)
                                    set s___Data_r[s__Data_r[data]]=GetUnitX(s___Data_u[s__Data_u[data]])
                                    set s___Data_r[s__Data_r[data]+1]=GetUnitY(s___Data_u[s__Data_u[data]])
                                    set s___Data_r[s__Data_r[data]+4]=0
                                    set dash=s__Dash_Start(s__Units_unit[m] , s__Util_XY(s__Units_unit[m] , s___Data_u[s__Data_u[data]]) , s__Util_XY2(s__Units_unit[m] , s___Data_u[s__Data_u[data]]) + 200 , s__Dash_SUB , 125 , true , false)
                                    set s__Dash_Obj[dash]=data
                                    set s__Dash_onMove[dash]=(67)
                                    set s__Dash_onEnd[dash]=(68)
                                else
                                    call s__Units_Alpha(m,255)
                                    call s__Units_Pause(m,false)
                                    set s___Data_u[s__Data_u[data]]=null
                                    call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                                    call s__Data_Destroy(data)
                                endif
                            endif
                        else
                            call s__Units_Position(u,GetUnitX(s___Data_u[s__Data_u[data]]) + 225 * CosBJ(s__Util_XY(s__Units_unit[u] , s___Data_u[s__Data_u[data]]) - 45) , GetUnitY(s___Data_u[s__Data_u[data]]) + 225 * SinBJ(s__Util_XY(s__Units_unit[u] , s___Data_u[s__Data_u[data]]) - 45) , false)
                            call s__Units_SetF(u,s__Util_XY(s__Units_unit[u] , s___Data_u[s__Data_u[data]]) , true)
                            call s__Units_AnimeId(u,3)
                            call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl", s___Data_u[s__Data_u[data]], "chest"))
                            set s___Data_i[s__Data_i[data]+3]=s___Data_i[s__Data_i[data]+3] - 1
                            call s__Units_Damage(u,s___Data_u[s__Data_u[data]] , s__Damage_Physics , 'A018' , s__Units_Agi(u,true) * 0.5)
                        endif
                    endfunction
                function s__SL__SL_anon__102 takes integer dash returns nothing
                    local integer data=(s__Dash_Obj[dash])
                    local integer u=s__Units_Get(s__Dash_Unit[dash])
                    local timer t=NewTimer()
                    call s__Units_Model(u,"niuzai_squished.mdl")
                    call s__Units_AddAbility(u,'A019')
                    call s__Units_SetH(u,0)
                    call s__Units_Size(u,0.75)
                    call s__Units_Alpha(u,200)
                    call s__Units_AnimeId(u,3)
                    set s___Data_i[s__Data_i[data]+3]=5
                    set s___Data_i[s__Data_i[data]+4]=0
                    call SetTimerData(t , data)
                    call TimerStart(t, 0.05, true, function s__SL__SL_anon__103)
                    set t=null
                endfunction
            function s__SL__SL_anon__97 takes integer dash returns nothing
                local integer data=(s__Dash_Obj[dash])
                local integer u=(s___Data_c[s__Data_c[data]])
                local real x=s__Dash_X[dash] + 100 * CosBJ(s__Dash_Angle[dash])
                local real y=s__Dash_Y[dash] + 100 * SinBJ(s__Dash_Angle[dash])
                local unit k
                local integer mj
                local integer dash1
                if ( s__Dash_Speed[dash] < 4 ) then
                    if ( s___Data_i[s__Data_i[data]] == 0 ) then
                        set s___Data_i[s__Data_i[data]]=1
                        call s__Units_AnimeId(u,0)
                        call s__Units_AnimeSpeed(u,1)
                        call s__Units_Pause(u,false)
                    endif
                else
                    if ( s__Dash_Speed[dash] > 18 ) then
                        call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl", s__Dash_X[dash], s__Dash_Y[dash]))
                    endif
                    set k=GroupFind(s__Units_unit[u] , x , y , 80 , true , false)
                    if ( k != null ) then
                        set s___Data_i[s__Data_i[data]]=2
                        call s__Dash_Stop(dash)
                        call s__Units_AnimeSpeed(u,1)
                        call s__Units_AnimeId(u,1)
                        call s__Units_DelayAlpha(u,255 , 0 , 0.5)
                        call s__Units_SetH(s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A018' , 0 , s__Units_X(u) + s__Util_XY2(s__Units_unit[u] , k) / 2 * CosBJ(s__Util_XY(s__Units_unit[u] , k)) , s__Units_Y(u) + s__Util_XY2(s__Units_unit[u] , k) / 2 * SinBJ(s__Util_XY(s__Units_unit[u] , k)) , s__Units_F(u) , 2 , 1 , 1 , "stand" , "qqqqq.mdl"),100)
                        call s__Dash_Start(s__Units_unit[u] , s__Util_XY(k , s__Units_unit[u]) , 200 , s__Dash_SUB , 10 , true , false)
                        call s__Dash_Start(k , s__Util_XY(s__Units_unit[u] , k) , 300 , s__Dash_SUB , 5 , true , true)
                        set s___Data_u[s__Data_u[data]]=k
                        set s___Data_i[s__Data_i[data]+1]=2
                        set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A018' , 5 , s__Units_X(u) , s__Units_Y(u) , 0 , 5 , 0.75 , 1 , "stand" , "blink_blue.mdl")
                        set s___Data_c[s__Data_c[data]+2]=mj
                        set dash1=s__Dash_Start(s__Units_unit[mj] , s__Util_XY(s__Units_unit[u] , k) + 45 , s__Util_XY2(s__Units_unit[u] , k) * 4 , s__Dash_SUB , 60 , true , false)
                        set s__Dash_Obj[dash1]=data
                        set s__Dash_onMove[dash1]=(69)
                        set s__Dash_onEnd[dash1]=(70)
                        set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A018' , 6 , s__Units_X(u) , s__Units_Y(u) , 0 , 5 , 0.75 , 1 , "stand" , "blink_blue.mdl")
                        set s___Data_c[s__Data_c[data]+3]=mj
                        set dash1=s__Dash_Start(s__Units_unit[mj] , s__Util_XY(s__Units_unit[u] , k) - 45 , s__Util_XY2(s__Units_unit[u] , k) * 4 , s__Dash_SUB , 60 , true , false)
                        set s__Dash_Obj[dash1]=data
                        set s__Dash_onMove[dash1]=(71)
                        set s__Dash_onEnd[dash1]=(72)
                        set k=null
                    endif
                endif
            endfunction
            function s__SL__SL_anon__106 takes integer dash returns nothing
                local integer data=(s__Dash_Obj[dash])
                local integer u=(s___Data_c[s__Data_c[data]])
                if ( s___Data_i[s__Data_i[data]] == 0 ) then
                    call s__Units_AnimeId(u,0)
                    call s__Units_AnimeSpeed(u,1)
                    call s__Units_Pause(u,false)
                endif
                if ( s___Data_i[s__Data_i[data]] <= 1 ) then
                    call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                    call s__Data_Destroy(data)
                endif
            endfunction
        function s__SL__SL_W takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer data=s__Data_create('A018')
            local integer dash
            call s__Units_Pause(u,true)
            call s__Units_AnimeSpeed(u,2)
            call s__Units_AnimeId(u,9)
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_c[s__Data_c[data]+1]=e
            set s___Data_i[s__Data_i[data]]=0
            set s___Data_i[s__Data_i[data]+1]=0
            set dash=s__Dash_Start(s__Units_unit[u] , s__Spell_Angle[e] , 1500 , s__Dash_SUB , 20 , true , false)
            set s__Dash_Obj[dash]=data
            set s__Dash_onMove[dash]=(73)
            set s__Dash_onEnd[dash]=(74)
        endfunction
            function s__SL__SL_anon__107 takes nothing returns nothing
                local integer data=(GetTimerData(GetExpiredTimer()))
                local integer u=(s___Data_c[s__Data_c[data]])
                local integer mj
                local real x=s__Units_X(u)
                local real y=s__Units_Y(u)
                local real f=s__Util_XYEX(x , y , x + 100 * CosBJ(s__Units_F(u)) , y + 100 * SinBJ(s__Units_F(u)))
                if ( s__Units_Alive(u) == true ) then
                    call s__Units_SetH(s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A017' , 0 , x , y , s__Units_F(u) , 2 , 0.5 , 2.2 , "stand" , "[spell]xinzhao_r2_3.mdl"),100)
                    call GroupEnumUnitsInRange(tmp_group, x, y, 300, Condition(function GroupIsAliveNotAloc))
                    loop
                    exitwhen ( FirstOfGroup(tmp_group) == null )
                        set mj=s__Units_Get(FirstOfGroup(tmp_group))
                        call GroupRemoveUnit(tmp_group, s__Units_unit[mj])
                        if ( IsUnitEnemy(s__Units_unit[mj], s__Players_player[s__Units_player[u]]) == true ) then
                            if ( s__Util_FAN(s__Units_unit[u] , s__Units_unit[mj] , f , 80) == true ) then
                                call s__Units_Damage(u,s__Units_unit[mj] , s__Damage_Physics , 'A017' , s__Units_Str(u,true) * 5.0)
                                call DestroyEffect(AddSpecialEffectTarget("az-blood-hit.mdl", s__Units_unit[mj], "chest"))
                                call s__Dash_Start(s__Units_unit[mj] , s__Util_XY(s__Units_unit[u] , s__Units_unit[mj]) , 200.0 , s__Dash_SUB , 20 , true , true)
                            endif
                        endif
                    endloop
                    call GroupClear(tmp_group)
                endif
                call s__Units_AnimeSpeed(u,2)
                if ( s__Players_lv15[s__Units_player[u]] == null ) then
                    call s__Units_DelayReleaseAnimePause(u,0.4)
                else
                    call s__Buffs_Add(s__Units_unit[u] , 'A01C' , 'B008' , 0.25 , false)
                    call s__Units_AnimeSpeed(u,4)
                    call s__Units_DelayReleaseAnimePause(u,0.2)
                endif
                call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                call s__Data_Destroy(data)
                call ReleaseTimer(GetExpiredTimer())
            endfunction
        function s__SL__SL_Q takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer data=s__Data_create('A017')
            local timer t=NewTimer()
            call s__Units_Pause(u,true)
            call s__Units_AnimeSpeed(u,4)
            call s__Units_AnimeId(u,3)
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_c[s__Data_c[data]+1]=e
            call SetTimerData(t , data)
            call TimerStart(t, 0.1, false, function s__SL__SL_anon__107)
            set t=null
        endfunction
        function s__SL__SL_HERO_START takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            if ( s__Spell_Id[e] == 'A018' ) then
                call s__Units_FlushAnimeId(u,1)
                call s__Spell_Destroy(e)
            endif
            if ( s__Spell_Id[e] == 'A01B' ) then
                if ( s__Units_IsAbility(u,'B008') == false ) then
                    call s__Units_FlushAnimeId(u,7)
                    call s__Spell_Destroy(e)
                elseif ( s__Units_MP(u) >= 200.0 ) then
                    if ( s__Units_GetAbilityCD(u,'A01B') == 0 ) then
                        call SpellText(s__Units_unit[u] , 'A01B' , 3 , 15)
                        call s__Units_SetMP(u,s__Units_MP(u) - 200)
                        call s__Units_SetAbilityCD(u,'A01B' , 10)
                        call s__SL__SL_R(e)
                    else
                        call s__Spell_Destroy(e)
                    endif
                else
                    call s__Spell_Destroy(e)
                endif
            endif
        endfunction
        function s__SL__SL_onInit takes nothing returns nothing
            call s__Spell_On(s__Spell_onSpell , 'A01B' , (75))
            call s__Spell_On(s__Spell_onSpell , 'A01A' , (76))
            call s__Spell_On(s__Spell_onSpell , 'A017' , (77))
            call s__Spell_On(s__Spell_onSpell , 'A018' , (78))
            call s__Spell_On(s__Spell_onReady , 'A018' , (79))
            call s__Spell_On(s__Spell_onReady , 'A01B' , (79))
        endfunction

//library SL ends
//library SwordMaster:
                    function s__SwordMaster__SwordMaster_anon__110 takes integer dash returns nothing
                        set s__Dash_Angle[dash]=s__Units_F(s__Units_Get(s__Dash_Unit[dash]))
                    endfunction
                function s__SwordMaster__SwordMaster_anon__109 takes nothing returns nothing
                    local integer data=(GetTimerData(GetExpiredTimer()))
                    local integer u=(s___Data_c[s__Data_c[data]])
                    local integer mj
                    if ( s___Data_r[s__Data_r[data]+1] == 1 ) then
                        call s__Units_RemoveAbility(u,'A01J')
                        call s__Units_RemoveAbility(u,'A01H')
                        call s__Units_SetH(u,0)
                        call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                        call s__Data_Destroy(data)
                        call ReleaseTimer(GetExpiredTimer())
                    elseif ( s___Data_r[s__Data_r[data]+2] == 0 ) then
                        if ( s__Units_Alive(u) == false or s__Units_IsAbility(u,'B009') == false ) then
                            set s___Data_r[s__Data_r[data]+1]=1
                        else
                            set s___Data_r[s__Data_r[data]]=25
                            set s___Data_r[s__Data_r[data]+2]=1
                            call s__Util_Duang(s__Units_X(u) , s__Units_Y(u) , 0.3 , 150 , 150 , - 256 , 0.02 , 50)
                            set s__Dash_onMove[s__Dash_Start(s__Units_unit[u] , s__Units_F(u) , 300 , s__Dash_SUB , 10 , true , false)]=(80)
                            call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl", s__Units_X(u), s__Units_Y(u)))
                            call GroupEnumUnitsInRange(tmp_group, s__Units_X(u), s__Units_Y(u), 200, Condition(function GroupIsAliveNotAloc))
                            loop
                            exitwhen ( FirstOfGroup(tmp_group) == null )
                                set mj=s__Units_Get(FirstOfGroup(tmp_group))
                                call GroupRemoveUnit(tmp_group, s__Units_unit[mj])
                                if ( IsUnitEnemy(s__Units_unit[mj], s__Players_player[s__Units_player[u]]) == true ) then //DestroyEffect( AddSpecialEffectTarget("qqqqq.mdl", mj.unit, "chest") );
                                    call s__Units_Damage(u,s__Units_unit[mj] , s__Damage_Physics , 'A01F' , s__Units_Agi(u,true) * 5.0)
                                    call s__HitFlys_Add(s__Units_unit[mj] , 25)
                                    call s__Buffs_Add(s__Units_unit[mj] , 'A01I' , 'B00A' , 2 , false)
                                endif
                            endloop
                            call GroupClear(tmp_group)
                        endif
                    else
                        call s__Units_SetH(u,s__Units_H(u) + s___Data_r[s__Data_r[data]])
                        if ( s__Units_H(u) <= 20 ) then
                            set s___Data_r[s__Data_r[data]+2]=0
                        endif
                        set s___Data_r[s__Data_r[data]]=s___Data_r[s__Data_r[data]] - 0.98
                    endif
                endfunction
            function s__SwordMaster__SwordMaster_anon__108 takes nothing returns nothing
                local integer data=(GetTimerData(GetExpiredTimer()))
                local integer u=(s___Data_c[s__Data_c[data]])
                call s__Units_Pause(u,false)
                if ( s__Units_Alive(u) == true ) then
                    call s__Buffs_Add(s__Units_unit[u] , 'A01G' , 'B009' , 10 , false)
                    call s__Units_AddAbility(u,'A01H')
                    call s__Units_AddAbility(u,'A01J')
                    call TimerStart(GetExpiredTimer(), 0.01, true, function s__SwordMaster__SwordMaster_anon__109)
                else
                    call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                    call s__Data_Destroy(data)
                    call ReleaseTimer(GetExpiredTimer())
                endif
            endfunction
        function s__SwordMaster__SwordMaster_R takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer data=s__Data_create('A01F')
            local timer t=NewTimer()
            call s__Units_Pause(u,true)
            call s__Units_AnimeId(u,10)
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_c[s__Data_c[data]+1]=e
            set s___Data_r[s__Data_r[data]]=45
            set s___Data_r[s__Data_r[data]+1]=0
            set s___Data_r[s__Data_r[data]+2]=0
            call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIvi\\AIviTarget.mdl", s__Units_unit[u], "hand right"))
            call SetTimerData(t , data)
            call TimerStart(t, 1, false, function s__SwordMaster__SwordMaster_anon__108)
            set t=null
        endfunction
            function s__SwordMaster__SwordMaster_anon__111 takes integer dash returns nothing
                local integer data=(s__Dash_Obj[dash])
                local integer u=(s___Data_c[s__Data_c[data]])
                local integer mj
                set s__Dash_Angle[dash]=s__Units_F(u)
                if ( s__Dash_Speed[dash] < 2 ) then
                    call s__Dash_Stop(dash)
                else
                    call GroupEnumUnitsInRange(tmp_group, s__Dash_X[dash], s__Dash_Y[dash], 150, Condition(function GroupIsAliveNotAloc))
                    loop
                    exitwhen ( FirstOfGroup(tmp_group) == null )
                        set mj=s__Units_Get(FirstOfGroup(tmp_group))
                        call GroupRemoveUnit(tmp_group, s__Units_unit[mj])
                        if ( IsUnitEnemy(s__Units_unit[mj], s__Players_player[s__Units_player[u]]) == true ) then
                            if ( IsUnitInGroup(s__Units_unit[mj], s___Data_g[s__Data_g[data]]) != true ) then
                                call GroupAddUnit(s___Data_g[s__Data_g[data]], s__Units_unit[mj])
                                call DestroyEffect(AddSpecialEffectTarget("qqqqq.mdl", s__Units_unit[mj], "chest"))
                                call s__Units_Damage(u,s__Units_unit[mj] , s__Damage_Physics , 'A01D' , s__Units_Agi(u,true) * 15.0)
                                call s__HitFlys_Add(s__Units_unit[mj] , 25)
                            endif
                        endif
                    endloop
                    call GroupClear(tmp_group)
                endif
            endfunction
            function s__SwordMaster__SwordMaster_anon__112 takes integer dash returns nothing
                local integer data=(s__Dash_Obj[dash])
                local integer u=(s___Data_c[s__Data_c[data]])
                call DestroyGroup(s___Data_g[s__Data_g[data]])
                set s___Data_g[s__Data_g[data]]=null
                call s__Units_AnimeSpeed(u,1)
                call s__Units_Pause(u,false)
                call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                call s__Data_Destroy(data)
            endfunction
        function s__SwordMaster__SwordMaster_E takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer data=s__Data_create('A01D')
            local integer dash
            call s__Units_Pause(u,true)
            call s__Units_AnimeId(u,10)
            call s__Units_AnimeSpeed(u,1.5)
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_c[s__Data_c[data]+1]=e
            set s___Data_g[s__Data_g[data]]=CreateGroup()
            call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIvi\\AIviTarget.mdl", s__Units_unit[u], "hand right"))
            call s__HitFlys_Add(s__Units_unit[u] , 25)
            set dash=s__Dash_Start(s__Units_unit[u] , s__Units_F(u) , 1200 , s__Dash_SUB , 45 , true , false)
            set s__Dash_Obj[dash]=data
            set s__Dash_onMove[dash]=(81)
            set s__Dash_onEnd[dash]=(82)
        endfunction
                function s__SwordMaster__SwordMaster_anon__114 takes integer dash returns nothing
                    set s__Dash_Angle[dash]=s__Dash_Angle[dash] + 4
                    if ( s__Dash_Obj[dash] == 0 ) then
                        set s__Dash_Obj[dash]=3
                        call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl", s__Dash_X[dash], s__Dash_Y[dash]))
                    else
                        set s__Dash_Obj[dash]=s__Dash_Obj[dash] - 1
                    endif
                endfunction
            function s__SwordMaster__SwordMaster_anon__113 takes nothing returns nothing
                local integer data=(GetTimerData(GetExpiredTimer()))
                local integer u=(s___Data_c[s__Data_c[data]])
                local integer mj=(s___Data_c[s__Data_c[data]+2])
                local integer dash
                local real x=s__Units_X(u)
                local real y=s__Units_Y(u)
                if ( s__Units_IsAbility(u,'B009') == true ) then
                    if ( s__Units_GetAbilityCD(u,'A01E') > 1 ) then
                        call s__Units_SetAbilityCD(u,'A01E' , 1)
                        call s__Units_SetMP(u,s__Units_MP(u) + 75)
                        call BJDebugMsg("!")
                    endif
                endif
                if ( s__Units_Alive(u) == false or s___Data_r[s__Data_r[data]] <= 0 ) then
                    call DestroyGroup(s___Data_g[s__Data_g[data]])
                    set s___Data_g[s__Data_g[data]]=null
                    call s__Units_Alpha(mj,0)
                    call s__Units_Anime(mj,"stand")
                    call s__Units_Life(mj,2)
                    call SetUnitMoveSpeed(s__Units_unit[u], GetUnitMoveSpeed(s__Units_unit[u]) - 100)
                    call s__Units_Alpha(u,255)
                    call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                    call s__Data_Destroy(data)
                    call ReleaseTimer(GetExpiredTimer())
                else
                    call s__Units_SetH(mj,s__Units_H(u))
                    call s__Units_Position(mj,x , y , false)
                    call GroupEnumUnitsInRange(tmp_group, x, y, 300, Condition(function GroupIsAliveNotAloc))
                    loop
                    exitwhen ( FirstOfGroup(tmp_group) == null )
                        set mj=s__Units_Get(FirstOfGroup(tmp_group))
                        call GroupRemoveUnit(tmp_group, s__Units_unit[mj])
                        if ( IsUnitEnemy(s__Units_unit[mj], s__Players_player[s__Units_player[u]]) == true ) then
                            if ( IsUnitInGroup(s__Units_unit[mj], s___Data_g[s__Data_g[data]]) != true ) then
                                call GroupAddUnit(s___Data_g[s__Data_g[data]], s__Units_unit[mj])
                                call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl", s__Units_unit[mj], "origin"))
                                if ( s__Units_IsAbility(u,'B009') == true ) then
                                    call s__HitFlys_Add(s__Units_unit[mj] , 20)
                                    call s__Units_Damage(u,s__Units_unit[mj] , s__Damage_Physics , 'A01E' , s__Units_Agi(u,true) * 2.0)
                                else
                                    call s__Units_Damage(u,s__Units_unit[mj] , s__Damage_Physics , 'A01E' , s__Units_Agi(u,true) * 10.0)
                                endif
                                set dash=s__Dash_Start(s__Units_unit[mj] , s__Util_XY(s__Units_unit[u] , s__Units_unit[mj]) - 45 , 600 , s__Dash_PWX , 25 , true , true)
                                set s__Dash_Obj[dash]=3
                                set s__Dash_onMove[dash]=(83)
                            endif
                            call s__Units_Position(mj,s__Units_X(mj) + 10 * CosBJ(s__Util_XY(s__Units_unit[u] , s__Units_unit[mj])) , s__Units_Y(mj) + 10 * SinBJ(s__Util_XY(s__Units_unit[u] , s__Units_unit[mj])) , true)
                        endif
                    endloop
                    call GroupClear(tmp_group)
                    set s___Data_r[s__Data_r[data]]=s___Data_r[s__Data_r[data]] - 0.02
                endif
            endfunction
        function s__SwordMaster__SwordMaster_W takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            local timer t=NewTimer()
            local integer data=s__Data_create('A01E')
            call s__Units_Pause(u,true)
            call s__Units_Pause(u,false)
            call SetUnitMoveSpeed(s__Units_unit[u], GetUnitMoveSpeed(s__Units_unit[u]) + 100)
            call s__Units_Alpha(u,0)
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_c[s__Data_c[data]+1]=e
            set s___Data_g[s__Data_g[data]]=CreateGroup()
            set u=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A01E' , 0 , s__Units_X(u) , s__Units_Y(u) , 0 , 10 , 1.15 , 2 , "stand" , "units\\orc\\HeroBladeMaster\\HeroBladeMaster.mdl")
            call s__Units_AnimeId(u,13)
            set s___Data_c[s__Data_c[data]+2]=u
            set s___Data_r[s__Data_r[data]]=1
            call SetTimerData(t , data)
            call TimerStart(t, 0.02, true, function s__SwordMaster__SwordMaster_anon__113)
            set t=null
        endfunction
        function s__SwordMaster__SwordMaster_AI takes unit ua returns nothing
            local integer u=s__Units_Get(ua)
            local unit target
            local unit no
            local real x=s__Units_X(u)
            local real y=s__Units_Y(u)
            local real x1
            local real y1
            set target=GroupFind(s__Units_unit[u] , x , y , 1000 , true , false)
            if ( target != null ) then
                set x1=GetUnitX(target)
                set y1=GetUnitY(target)
                set no=GroupFind(s__Units_unit[u] , x , y , 300 , true , false)
                if ( no != null ) then
                    call s__Units_SetF(u,s__Util_XY(s__Units_unit[u] , no) , true) //快乐风暴
                    call IssueImmediateOrder(s__Units_unit[u], "fanofknives")
                endif
                call IssueImmediateOrder(s__Units_unit[u], "hex") //快乐蹦迪
                call IssueImmediateOrder(s__Units_unit[u], "heal") //快乐冲刺
            endif
            set target=null
            set no=null
        endfunction
        function s__SwordMaster__SwordMaster_Spawn takes integer u,integer m returns nothing
            if ( s__Units_IsAbility(u,'A01F') == true ) then
                set s__Units_ai[u]=(3)
            endif
        endfunction
        function s__SwordMaster__SwordMaster_onInit takes nothing returns nothing
            call s__Spell_On(s__Spell_onSpell , 'A01E' , (84))
            call s__Spell_On(s__Spell_onSpell , 'A01D' , (85))
            call s__Spell_On(s__Spell_onSpell , 'A01F' , (86))
            call s__Units_On(s__Units_onHeroSpawn , (6))
        endfunction

//library SwordMaster ends
//library WindWalk:
                function s__WindWalk__WindWalk_anon__54 takes integer dash returns nothing
                    local integer data=(s__Dash_Obj[dash])
                    local integer u=(s___Data_c[s__Data_c[data]])
                    local integer k=s__Units_Get(s___Data_u[s__Data_u[data]])
                    local integer c=(s___Data_c[s__Data_c[data]+2])
                    local integer tmp
                    call s__Units_Position(c,s__Dash_X[dash] , s__Dash_Y[dash] , false)
                    if ( s__Util_XY2(s__Units_unit[u] , s__Units_unit[k]) < 100 or s__Units_Alive(k) == false ) then
                        call GroupEnumUnitsInRange(tmp_group, s__Units_X(u), s__Units_Y(u), 200, Condition(function GroupIsAliveNotAloc))
                        loop
                        exitwhen ( FirstOfGroup(tmp_group) == null )
                            set tmp=s__Units_Get(FirstOfGroup(tmp_group))
                            call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
                            if ( IsUnitEnemy(s__Units_unit[tmp], s__Players_player[s__Units_player[u]]) == true ) then
                                call s__Buffs_Add(s__Units_unit[tmp] , 'A00N' , 'B004' , 3 , false)
                                call YDWESetUnitAbilityState(s__Units_unit[u] , 'A00M' , 1 , YDWEGetUnitAbilityState(s__Units_unit[u] , 'A00M' , 1) - 4)
                            endif
                        endloop
                        call GroupClear(tmp_group)
                        call s__Dash_Stop(dash)
                    else
                        set s__Dash_MaxDis[dash]=s__Dash_MaxDis[dash] + 100
                        set s__Dash_Angle[dash]=s__Util_XY(s__Units_unit[u] , s__Units_unit[k])
                    endif
                endfunction
                function s__WindWalk__WindWalk_anon__55 takes integer dash returns nothing
                    local integer data=(s__Dash_Obj[dash])
                    local integer u=(s___Data_c[s__Data_c[data]])
                    local integer c=(s___Data_c[s__Data_c[data]+2])
                    call s__Units_Life(c,0.5)
                    call s__Units_AnimeSpeed(c,2)
                    call s__Units_Anime(c,"death")
                    set s___Data_u[s__Data_u[data]]=null
                    call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                    call s__Data_Destroy(data)
                endfunction
            function s__WindWalk__WindWalk_anon__53 takes integer dash returns nothing
                local integer data=(s__Dash_Obj[dash])
                local integer u=s__Units_Get(s__Dash_Unit[dash])
                local integer dash1
                local unit k=GroupFind(s__Units_unit[u] , s__Dash_X[dash] , s__Dash_Y[dash] , 100 , false , false)
                if ( k != null ) then
                    set s___Data_i[s__Data_i[data]]=1
                    call s__Dash_Stop(dash)
                    set u=(s___Data_c[s__Data_c[data]])
                    call YDWESetUnitAbilityState(s__Units_unit[u] , 'A00K' , 1 , YDWEGetUnitAbilityState(s__Units_unit[u] , 'A00K' , 1) - 5)
                    call YDWESetUnitAbilityState(s__Units_unit[u] , 'A00L' , 1 , YDWEGetUnitAbilityState(s__Units_unit[u] , 'A00L' , 1) - 10)
                    set s___Data_u[s__Data_u[data]]=k
                    set s___Data_c[s__Data_c[data]+2]=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00M' , 0 , s__Dash_X[dash] , s__Dash_Y[dash] , s__Dash_Angle[dash] , 3600 , 1.5 , 1 , "stand" , "wind2.mdx")
                    set dash1=s__Dash_Start(s__Units_unit[u] , s__Util_XY(s__Units_unit[u] , k) , 1600 , s__Dash_SUB , 60 , true , false)
                    set s__Dash_Obj[dash1]=data
                    set s__Dash_onMove[dash1]=(87)
                    set s__Dash_onEnd[dash1]=(88)
                endif
                set k=null
                if ( s__Dash_Speed[dash] < 4 ) then
                    call s__Dash_Stop(dash)
                endif
            endfunction
            function s__WindWalk__WindWalk_anon__56 takes integer dash returns nothing
                local integer u=s__Units_Get(s__Dash_Unit[dash])
                local integer data=(s__Dash_Obj[dash])
                call s__Units_AnimeSpeed(u,3)
                call s__Units_Life(u,0.5)
                call s__Units_Anime(u,"death")
                if ( s___Data_i[s__Data_i[data]] == 0 ) then
                    call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                    call s__Data_Destroy(data)
                endif
            endfunction
        function s__WindWalk__WindWalk_R takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer mj
            local integer dash
            local integer data=s__Data_create('A00M')
            set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00M' , 0 , s__Units_X(u) + 50 * CosBJ(s__Spell_Angle[e]) , s__Units_Y(u) + 50 * SinBJ(s__Spell_Angle[e]) , s__Spell_Angle[e] , 4 , 1.5 , 1 , "stand" , "wind2.mdx")
            call s__Units_SetH(mj,50)
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_c[s__Data_c[data]+1]=e
            set s___Data_i[s__Data_i[data]]=0
            set dash=s__Dash_Start(s__Units_unit[mj] , s__Spell_Angle[e] , 1600 , s__Dash_SUB , 60 , true , false)
            set s__Dash_Obj[dash]=data
            set s__Dash_onMove[dash]=(89)
            set s__Dash_onEnd[dash]=(90)
        endfunction
                function s__WindWalk__WindWalk_anon__58 takes integer dash returns nothing
                    local integer u=s__Units_Get(s__Dash_Unit[dash])
                    local unit k=GroupFind(s__Units_unit[u] , s__Units_X(u) , s__Units_Y(u) , 60 , false , false)
                    if ( k != null ) then
                        call DestroyEffect(AddSpecialEffectTarget("Abilities\\Weapons\\MakuraMissile\\MakuraMissile.mdl", k, "chest"))
                        call s__Dash_Start(k , s__Dash_Angle[dash] , 100 , s__Dash_SUB , 20 , true , true)
                        call s__Dash_Stop(dash)
                        call s__Units_Damage(u,k , s__Damage_Physics , 'A00L' , s__Units_Agi(s__Players_hero[s__Units_player[u]],true) * 7.0)
                    endif
                    set k=null
                endfunction
                function s__WindWalk__WindWalk_anon__59 takes integer dash returns nothing
                    local integer u=s__Units_Get(s__Dash_Unit[dash])
                    call s__Units_Anime(u,"death")
                    call s__Units_Life(u,0.5)
                endfunction
            function s__WindWalk__WindWalk_anon__57 takes integer dash returns nothing
                local integer u=s__Units_Get(s__Dash_Unit[dash])
                local integer mj
                local integer dash1
                set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00L' , 0 , s__Dash_X[dash] , s__Dash_Y[dash] , s__Dash_Angle[dash] , 0.7 , 1.3 , 1.5 , "attack" , "units\\creeps\\SylvanusWindrunner\\SylvanusWindrunner.mdl")
                call s__Units_Alpha(mj,50)
                call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Orc\\MirrorImage\\MirrorImageCaster.mdl", s__Units_unit[mj], "origin"))
                set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00L' , 0 , s__Units_X(u) + 50 * CosBJ(s__Dash_Angle[dash]) , s__Units_Y(u) + 50 * SinBJ(s__Dash_Angle[dash]) , s__Dash_Angle[dash] , 6 , 1.5 , 1 , "stand" , "Abilities\\Weapons\\MoonPriestessMissile\\MoonPriestessMissile.mdl")
                call s__Units_SetH(mj,70)
                call s__Units_Position(mj,s__Units_X(mj) , s__Units_Y(mj) , true)
                set dash1=s__Dash_Start(s__Units_unit[mj] , s__Units_F(mj) , 900 , s__Dash_ADD , 60 , true , false)
                set s__Dash_onMove[dash1]=(91)
                set s__Dash_onEnd[dash1]=(92)
            endfunction
        function s__WindWalk__WindWalk_E1 takes nothing returns nothing
            local integer data=(GetTimerData(GetExpiredTimer()))
            local integer u=(s___Data_c[s__Data_c[data]])
            local integer e=(s___Data_c[s__Data_c[data]+1])
            local integer dash
            if ( s__Units_Alive(u) == true and s___Data_i[s__Data_i[data]] > 0 ) then
                if ( s__PlayerPress_E[s__Players_press[s__Units_player[u]]] == true ) then
                    if ( s___Data_r[s__Data_r[data]+1] != 0 ) then
                        set s___Data_r[s__Data_r[data]+1]=s___Data_r[s__Data_r[data]+1] - 1
                    else
                        set s___Data_r[s__Data_r[data]+1]=2
                        set s___Data_r[s__Data_r[data]]=s___Data_r[s__Data_r[data]] - 0.01
                        if ( s___Data_r[s__Data_r[data]] < 0.02 ) then
                            set s___Data_r[s__Data_r[data]]=0.02
                        endif
                        call TimerStart(GetExpiredTimer(), s___Data_r[s__Data_r[data]], true, function s__WindWalk__WindWalk_E1)
                    endif
                endif
                call s__Units_Position(u,s___Data_r[s__Data_r[data]+2] , s___Data_r[s__Data_r[data]+3] , false)
                call s__Units_Alpha(u,0)
                set dash=s__Dash_Start(s__Units_unit[u] , GetRandomReal(0, 360) , 200 , s__Dash_SUB , 60 , true , false)
                set s__Dash_onEnd[dash]=(93)
                set s___Data_i[s__Data_i[data]]=s___Data_i[s__Data_i[data]] - 1
            else
                call ReleaseTimer(GetExpiredTimer())
                call s__Units_AnimeId(u,5)
                call s__Units_Alpha(u,255)
                call s__Spell_Destroy(e)
                call s__Data_Destroy(data)
            endif
        endfunction
        function s__WindWalk__WindWalk_E takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            local timer t=NewTimer()
            local integer data=s__Data_create('A00L')
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_c[s__Data_c[data]+1]=e
            set s___Data_r[s__Data_r[data]]=0.08
            set s___Data_r[s__Data_r[data]+1]=2
            set s___Data_r[s__Data_r[data]+2]=s__Units_X(u)
            set s___Data_r[s__Data_r[data]+3]=s__Units_Y(u)
            set s___Data_i[s__Data_i[data]]=30
            if ( s__Players_isai[s__Units_player[u]] == true ) then
                set s___Data_r[s__Data_r[data]]=0.02
            endif
            call SetTimerData(t , data)
            call TimerStart(t, s___Data_r[s__Data_r[data]], true, function s__WindWalk__WindWalk_E1)
            set t=null
        endfunction
            function s__WindWalk__WindWalk_anon__60 takes integer dash returns nothing
                local integer u=s__Units_Get(s__Dash_Unit[dash])
                local unit k=GroupFind(s__Units_unit[u] , s__Units_X(u) , s__Units_Y(u) , 60 , false , false)
                if ( k != null ) then
                    call DestroyEffect(AddSpecialEffectTarget("Abilities\\Weapons\\MakuraMissile\\MakuraMissile.mdl", k, "chest"))
                    call s__Dash_Start(k , s__Dash_Angle[dash] , 100 , s__Dash_SUB , 20 , true , true)
                    call s__Dash_Stop(dash)
                    call s__Units_Damage(u,k , s__Damage_Physics , 'A00K' , s__Units_Agi(s__Players_hero[s__Units_player[u]],true) * 10.0)
                endif
                set k=null
                if ( s__Dash_Speed[dash] < 2 ) then
                    call s__Dash_Stop(dash)
                endif
            endfunction
            function s__WindWalk__WindWalk_anon__61 takes integer dash returns nothing
                local integer u=s__Units_Get(s__Dash_Unit[dash])
                call s__Units_Anime(u,"death")
                call s__Units_Life(u,0.5)
            endfunction
                function s__WindWalk__WindWalk_anon__63 takes integer dash returns nothing
                    local integer u=s__Units_Get(s__Dash_Unit[dash])
                    local unit k=GroupFind(s__Units_unit[u] , s__Units_X(u) , s__Units_Y(u) , 60 , false , false)
                    if ( k != null ) then
                        call DestroyEffect(AddSpecialEffectTarget("Abilities\\Weapons\\MakuraMissile\\MakuraMissile.mdl", k, "chest"))
                        call s__Dash_Start(k , s__Dash_Angle[dash] , 100 , s__Dash_SUB , 20 , true , true)
                        call s__Dash_Stop(dash)
                        call s__Units_Damage(u,k , s__Damage_Physics , 'A00K' , s__Units_Agi(s__Players_hero[s__Units_player[u]],true) * 10.0)
                    endif
                    set k=null
                endfunction
                function s__WindWalk__WindWalk_anon__64 takes integer dash returns nothing
                    local integer u=s__Units_Get(s__Dash_Unit[dash])
                    call s__Units_Anime(u,"death")
                    call s__Units_Life(u,0.5)
                endfunction
            function s__WindWalk__WindWalk_anon__62 takes integer dash returns nothing
                local integer u=s__Units_Get(s__Dash_Unit[dash])
                local integer mj
                local integer dash1
                local integer i
                if ( s__Units_Alive(u) == true ) then
                    set i=0
                    loop
                    exitwhen ( i >= 6 )
                        set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00K' , 0 , s__Units_X(u) + 125 * CosBJ(s__Units_F(u)) , s__Units_Y(u) + 125 * SinBJ(s__Units_F(u)) , s__Dash_Angle[dash] + 180 + ( - 30 + ( i * 15 ) ) , 3 , 1.5 , 1 , "stand" , "Abilities\\Weapons\\MoonPriestessMissile\\MoonPriestessMissile.mdl")
                        call s__Units_SetH(mj,70)
                        call s__Units_Position(mj,s__Units_X(mj) , s__Units_Y(mj) , true)
                        set dash1=s__Dash_Start(s__Units_unit[mj] , s__Units_F(mj) , 900 , s__Dash_ADD , 80 , true , false)
                        set s__Dash_onMove[dash1]=(94)
                        set s__Dash_onEnd[dash1]=(95)
                    set i=i + 1
                    endloop
                endif
                call s__Spell_Destroy((s__Dash_Obj[dash]))
                call s__Units_AnimeSpeed(u,1)
                call s__Units_Pause(u,false)
            endfunction
        function s__WindWalk__WindWalk_W takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer i
            local integer dash
            local integer mj
            call s__Units_Pause(u,true)
            set i=0
            loop
            exitwhen ( i >= 3 )
                set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00K' , 0 , s__Units_X(u) + 50 * CosBJ(s__Units_F(u)) , s__Units_Y(u) + 50 * SinBJ(s__Units_F(u)) , s__Units_F(u) + ( - 15 + ( i * 15 ) ) , 3 , 1.5 , 1 , "stand" , "Abilities\\Weapons\\MoonPriestessMissile\\MoonPriestessMissile.mdl")
                call s__Units_SetH(mj,70)
                call s__Units_Position(mj,s__Units_X(mj) , s__Units_Y(mj) , true)
                set dash=s__Dash_Start(s__Units_unit[mj] , s__Units_F(mj) , 900 , s__Dash_SUB , 40 , true , false)
                set s__Dash_onMove[dash]=(96)
                set s__Dash_onEnd[dash]=(97)
            set i=i + 1
            endloop
            call s__Units_SetH(s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e009' , 'A00K' , 0 , s__Units_X(u) , s__Units_Y(u) , s__Units_F(u) , 2 , 0.5 , 2.5 , "stand" , "tx.mdx"),80)
            call s__Units_AnimeSpeed(u,2.5)
            call s__Units_AnimeId(u,6)
            set dash=s__Dash_Start(s__Units_unit[u] , s__Units_F(u) + 180 , 300 , s__Dash_SUB , 50 , true , false)
            set s__Dash_Obj[dash]=e
            set s__Dash_onEnd[dash]=(98)
        endfunction
            function s__WindWalk__WindWalk_anon__65 takes integer dash returns nothing
                local integer u=s__Units_Get(s__Dash_Unit[dash])
                call s__Units_Alpha(u,0)
            endfunction
                    function s__WindWalk__WindWalk_anon__68 takes integer dash returns nothing
                        local integer u=s__Units_Get(s__Dash_Unit[dash])
                        local unit k=GroupFind(s__Units_unit[u] , s__Units_X(u) , s__Units_Y(u) , 60 , false , false)
                        if ( k != null ) then
                            call DestroyEffect(AddSpecialEffectTarget("Abilities\\Weapons\\MakuraMissile\\MakuraMissile.mdl", k, "chest"))
                            call s__Dash_Start(k , s__Dash_Angle[dash] , 100 , s__Dash_SUB , 20 , true , true)
                            call s__Dash_Stop(dash)
                            call s__Units_Damage(u,k , s__Damage_Physics , 'A00J' , s__Units_Agi(s__Players_hero[s__Units_player[u]],true) * 2.0)
                        endif
                        set k=null
                    endfunction
                    function s__WindWalk__WindWalk_anon__69 takes integer dash returns nothing
                        local integer u=s__Units_Get(s__Dash_Unit[dash])
                        call s__Units_Anime(u,"death")
                        call s__Units_Life(u,0.5)
                    endfunction
                function s__WindWalk__WindWalk_anon__67 takes integer dash returns nothing
                    local integer u=s__Units_Get(s__Dash_Unit[dash])
                    local integer mj
                    local integer dash1
                    call s__Units_Alpha(u,0)
                    if ( GetRandomInt(0, 1) == 0 ) then
                        set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00J' , 0 , s__Units_X(u) , s__Units_Y(u) , s__Units_F(u) , 10 , 1.5 , 1 , "stand" , "Abilities\\Weapons\\MoonPriestessMissile\\MoonPriestessMissile.mdl")
                        call s__Units_Position(mj,s__Units_X(u) , s__Units_Y(u) , true)
                        call s__Units_SetH(mj,50)
                        set dash1=s__Dash_Start(s__Units_unit[mj] , s__Units_F(u) , 900 , s__Dash_ADD , 50 , true , false)
                        set s__Dash_onMove[dash1]=(99)
                        set s__Dash_onEnd[dash1]=(100)
                    endif
                endfunction
                function s__WindWalk__WindWalk_anon__70 takes integer dash returns nothing
                    local integer u=s__Units_Get(s__Dash_Unit[dash])
                    call s__Spell_Destroy((s__Dash_Obj[dash]))
                    call s__Units_AnimeSpeed(u,1)
                    call s__Units_Alpha(u,255)
                endfunction
            function s__WindWalk__WindWalk_anon__66 takes integer dash returns nothing
                local integer u=s__Units_Get(s__Dash_Unit[dash])
                local integer dash1
                call s__Units_Alpha(u,255)
                if ( s__Units_Alive(u) == true ) then
                    call s__Units_Alpha(u,0)
                    call s__Units_AnimeSpeed(u,2.5)
                    call s__Units_AnimeId(u,6)
                    set dash1=s__Dash_Start(s__Units_unit[u] , s__Units_F(u) - 90 , 400 , s__Dash_ADD , 100 , true , false)
                    set s__Dash_Obj[dash1]=s__Dash_Obj[dash]
                    set s__Dash_onMove[dash1]=(101)
                    set s__Dash_onEnd[dash1]=(102)
                else
                    call s__Spell_Destroy((s__Dash_Obj[dash]))
                endif
            endfunction
        function s__WindWalk__WindWalk_Q takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer dash
            call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Orc\\MirrorImage\\MirrorImageCaster.mdl", s__Spell_Spell[e], "origin"))
            set dash=s__Dash_Start(s__Spell_Spell[e] , s__Units_F(u) + 90 , 200 , s__Dash_SUB , 40 , true , false)
            set s__Dash_Obj[dash]=e
            set s__Dash_onMove[dash]=(103)
            set s__Dash_onEnd[dash]=(104)
        endfunction
        function s__WindWalk__WindWalk_HERO_START takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            if ( s__Spell_Id[e] == 'A00K' ) then
                call s__Units_AnimeSpeed(u,4)
                call s__Units_FlushAnimeId(u,5)
            endif
            if ( s__Spell_Id[e] == 'A00M' ) then
                call s__Units_AnimeSpeed(u,4)
                call s__Units_FlushAnimeId(u,6)
            endif
            call s__Spell_Destroy(e)
        endfunction
        function s__WindWalk__WindWalk_HERO_STOP takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            call s__Units_AnimeSpeed(u,1)
            call s__Spell_Destroy(e)
        endfunction
        function s__WindWalk__WindWalk_onInit takes nothing returns nothing
            call s__Spell_On(s__Spell_onSpell , 'A00M' , (105))
            call s__Spell_On(s__Spell_onSpell , 'A00L' , (106))
            call s__Spell_On(s__Spell_onSpell , 'A00J' , (107))
            call s__Spell_On(s__Spell_onSpell , 'A00K' , (108))
            call s__Spell_On(s__Spell_onReady , 'A00K' , (109))
            call s__Spell_On(s__Spell_onStop , 'A00K' , (110))
            call s__Spell_On(s__Spell_onReady , 'A00M' , (109))
            call s__Spell_On(s__Spell_onStop , 'A00M' , (110))
        endfunction

//library WindWalk ends
//library YeG:

            function YeG___anon__27 takes nothing returns boolean
                return GetUnitTypeId(GetFilterUnit()) == 'n001'
            endfunction
        function YeG___anon__26 takes nothing returns nothing
            local integer s
            local location d
            call GroupEnumUnitsInRange(tmp_group, 0, 0, 9999999999, Condition(function YeG___anon__27))
            set s=200 - GroupNumber(tmp_group)
            loop
            exitwhen ( s <= 0 )
                set d=GetRandomLocInRect(s__YeG___rec[GetRandomInt(0, 1)])
                call s__Units_Spawn(Player(PLAYER_NEUTRAL_AGGRESSIVE) , 'n001' , GetLocationX(d) , GetLocationY(d) , 0)
                call RemoveLocation(d)
                set d=null
                set s=s - 1
            endloop
            call GroupClear(tmp_group)
        endfunction
    function YeG___onInit takes nothing returns nothing
        set s__YeG___rec[0]= gg_rct_YeGuai_01
        set s__YeG___rec[1]= gg_rct_YeGuai_02
        call TimerStart(NewTimer(), 20, true, function YeG___anon__26)
    endfunction

//library YeG ends
//library ZZ:
                function s__ZZ__ZZ_anon__72 takes integer dash returns nothing
                    local integer u=s__Units_Get(s__Dash_Unit[dash])
                    local integer k=(s__Dash_Obj[dash])
                    if ( s__Units_Alive(k) == false ) then
                        call s__Dash_Stop(dash)
                    elseif ( s__Util_XY2(s__Units_unit[u] , s__Units_unit[k]) < 25 ) then
                        call s__Units_Damage(u,s__Units_unit[k] , s__Damage_Magic , 'A00S' , s__Units_Agi(s__Players_hero[s__Units_player[u]],true) * 5.0)
                        call s__Buffs_Skill(s__Units_unit[k] , 'A00H' , 1)
                        call s__Units_Model(u,"Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl")
                        call s__Units_AnimeSpeed(u,GetRandomReal(0.7, 1.2))
                        call s__Units_Anime(u,"death")
                        call s__Units_Size(u,0.7)
                        call s__Dash_Stop(dash)
                    else
                        call s__Units_SetF(u,s__Util_XY(s__Units_unit[u] , s__Units_unit[k]) , true)
                        set s__Dash_Angle[dash]=s__Units_F(u)
                        set s__Dash_MaxDis[dash]=s__Dash_MaxDis[dash] + 100
                    endif
                endfunction
                function s__ZZ__ZZ_anon__73 takes integer dash returns nothing
                    local integer u=s__Units_Get(s__Dash_Unit[dash])
                    call s__Units_Model(u,"Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl")
                    call s__Units_AnimeSpeed(u,GetRandomReal(0.7, 1.2))
                    call s__Units_Size(u,0.7)
                    call s__Units_Anime(u,"death")
                    call s__Units_Life(u,0.5)
                endfunction
            function s__ZZ__ZZ_anon__71 takes integer dash returns nothing
                local integer u=s__Units_Get(s__Dash_Unit[dash])
                local integer dash1
                local integer mj
                local unit k=null
                if ( s__Dash_Speed[dash] < 5 and s__Dash_Speed[dash] > 4.8 and s__Units_aidindex[u] == 0 ) then
                    set s__Units_aidindex[u]=1
                    call s__Units_Model(u,"Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl")
                    call s__Units_Size(u,0.7)
                    call s__Units_AnimeSpeed(u,GetRandomReal(0.7, 1.2))
                    call s__Units_Anime(u,"death")
                endif
                if ( s__Units_aidindex[u] == 0 ) then
                    set k=GroupFind(s__Units_unit[u] , s__Dash_X[dash] , s__Dash_Y[dash] , 50 , false , false)
                    if ( k != null ) then
                        call s__Units_Damage(u,k , s__Damage_Magic , 'A00S' , s__Units_Agi(s__Players_hero[s__Units_player[u]],true) * 15.0)
                        call s__Buffs_Skill(k , 'A00H' , 1)
                        set s__Dash_Speed[dash]=1
                        set k=GroupRandomFilter(s__Units_unit[u] , GetUnitX(k) , GetUnitY(k) , 500 , false , k)
                        if ( k != null ) then
                            set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00S' , 0 , s__Dash_X[dash] , s__Dash_Y[dash] , s__Util_XY(s__Units_unit[u] , k) , 50 , 0.6 , 1 , "birth" , "az_lxj_blue.mdx")
                            call s__Units_SetH(mj,100)
                            call s__Units_Position(mj,s__Dash_X[dash] , s__Dash_Y[dash] , true)
                            set dash1=s__Dash_Start(s__Units_unit[mj] , s__Units_F(mj) , 1800 , s__Dash_SUB , 13 , true , false)
                            set s__Dash_Obj[dash1]=s__Units_Get(k)
                            set s__Dash_onMove[dash1]=(111)
                            set s__Dash_onEnd[dash1]=(112)
                        endif
                    endif
                    set k=null
                endif
                if ( s__Dash_Speed[dash] < 2 ) then
                    call s__Dash_Stop(dash)
                endif
            endfunction
            function s__ZZ__ZZ_anon__74 takes integer dash returns nothing
                local integer u=s__Units_Get(s__Dash_Unit[dash])
                if ( s__Units_aidindex[u] == 0 ) then
                    call s__Units_Model(u,"Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl")
                    call s__Units_AnimeSpeed(u,GetRandomReal(0.7, 1.2))
                    call s__Units_Size(u,0.7)
                    call s__Units_Anime(u,"death")
                endif
                call s__Units_Life(u,0.5)
            endfunction
        function s__ZZ__ZZ_R takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer i
            local real x=s__Units_X(u) + 50 * CosBJ(s__Spell_Angle[e])
            local real y=s__Units_Y(u) + 50 * SinBJ(s__Spell_Angle[e])
            local integer mj
            local integer dash
            set i=0
            loop
            exitwhen ( i >= 9 )
                set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00S' , 0 , x , y , s__Spell_Angle[e] - 30 + ( i * 6.667 ) , 5 , 0.3 , 1 , "birth" , "az_lxj_blue.mdx")
                call s__Units_SetH(mj,100)
                call s__Units_Position(mj,x , y , true)
                set dash=s__Dash_Start(s__Units_unit[mj] , s__Units_F(mj) , 1800 , s__Dash_SUB , 60 , true , false)
                set s__Dash_onMove[dash]=(113)
                set s__Dash_onEnd[dash]=(114)
            set i=i + 1
            endloop
            call s__Spell_Destroy(e)
        endfunction
            function s__ZZ__ZZ_anon__75 takes nothing returns nothing
                local integer data=(GetTimerData(GetExpiredTimer()))
                local integer u=(s___Data_c[s__Data_c[data]])
                local integer mj
                local real dis
                local real a
                if ( s___Data_r[s__Data_r[data]] == 0 ) then
                    call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                    call s__Data_Destroy(data)
                    call ReleaseTimer(GetExpiredTimer())
                    call s__Units_PositionEnabled(u,true)
                    call s__Units_Pause(u,false)
                else
                    if ( s__Units_Alive(u) == false ) then
                        set s___Data_r[s__Data_r[data]]=0.05
                    endif
                    set s___Data_r[s__Data_r[data]]=s___Data_r[s__Data_r[data]] - 0.05
                    if ( s___Data_r[s__Data_r[data]] > 0.3 ) then
                        call DestroyEffect(AddSpecialEffectTarget("lei2.mdx", s__Units_unit[u], "weapon"))
                    endif
                    if ( s___Data_r[s__Data_r[data]] > 0.1 and s___Data_r[s__Data_r[data]] < 0.35 ) then
                        set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00R' , 0 , s__Units_X(u) , s__Units_Y(u) , GetRandomReal(0, 360) , 2 , 2.5 , 2 , "death" , "lei2.mdx")
                        call s__Units_SetH(mj,100)
                        set dis=GetRandomReal(0, 100)
                        set a=GetRandomReal(0, 360)
                        set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00R' , 0 , s__Units_X(u) + dis * CosBJ(a) , s__Units_Y(u) + dis * SinBJ(a) , GetRandomReal(0, 360) , 2 , 1 , 1 , "stand" , "az_storm_v2_z_5.mdl")
                    endif
                    call GroupEnumUnitsInRange(tmp_group, s__Units_X(u), s__Units_Y(u), 300, Condition(function GroupIsAliveNotAloc))
                    loop
                    exitwhen ( FirstOfGroup(tmp_group) == null )
                        set mj=s__Units_Get(FirstOfGroup(tmp_group))
                        call GroupRemoveUnit(tmp_group, s__Units_unit[mj])
                        if ( IsUnitEnemy(s__Units_unit[mj], s__Players_player[s__Units_player[u]]) == true ) then
                            call s__Units_Damage(u,s__Units_unit[mj] , s__Damage_Magic , 'A00R' , s__Units_Agi(u,true) * 1.5)
                            call s__Buffs_Skill(s__Units_unit[mj] , 'A00T' , 1)
                        endif
                    endloop
                    call GroupClear(tmp_group)
                endif
            endfunction
        function s__ZZ__ZZ_E takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer data=s__Data_create('A00R')
            local timer t=NewTimer()
            local integer i
            call s__Units_Pause(u,true)
            call s__Units_AnimeId(u,15)
            call s__Units_PositionEnabled(u,false)
            call s__Units_SetH(s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00R' , 0 , s__Units_X(u) , s__Units_Y(u) , GetRandomReal(0, 360) , 1.5 , 3 , 1 , "stand" , "az_goods_blink(3).mdx"),200)
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_c[s__Data_c[data]+1]=e
            set s___Data_r[s__Data_r[data]]=0.5
            call SetTimerData(t , data)
            call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl", s__Units_X(u), s__Units_Y(u)))
            call TimerStart(t, 0.05, true, function s__ZZ__ZZ_anon__75)
            set t=null
        endfunction
            function s__ZZ__ZZ_anon__76 takes integer dash returns nothing
                local integer u=s__Units_Get(s__Dash_Unit[dash])
                local integer mj
                local unit k
                local real x=s__Dash_X[dash] + 80 * CosBJ(s__Dash_Angle[dash])
                local real y=s__Dash_Y[dash] + 80 * SinBJ(s__Dash_Angle[dash])
                if ( s__Dash_Speed[dash] < 2 ) then
                    call DestroyEffect(AddSpecialEffectTarget("Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl", s__Units_unit[u], "hand,left"))
                else
                    set k=GroupFind(s__Units_unit[u] , x , y , 80 , false , false)
                    if ( k != null ) then
                        set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00P' , 0 , x , y , 0 , 2 , 1.5 , 2 , "death" , "lei2.mdx")
                        call s__Units_SetH(mj,100)
                        set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00P' , 0 , x , y , 0 , 2 , 1.75 , 1.75 , "death" , "lei2.mdx")
                        call s__Units_SetH(mj,100)
                        set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00P' , 0 , x , y , 0 , 2 , 2 , 1.5 , "death" , "lei2.mdx")
                        call s__Units_SetH(mj,100)
                        set x=x + 50 * CosBJ(s__Dash_Angle[dash])
                        set y=y + 50 * SinBJ(s__Dash_Angle[dash])
                        call GroupEnumUnitsInRange(tmp_group, x, y, 200, Condition(function GroupIsAliveNotAloc))
                        loop
                        exitwhen ( FirstOfGroup(tmp_group) == null )
                            set mj=s__Units_Get(FirstOfGroup(tmp_group))
                            call GroupRemoveUnit(tmp_group, s__Units_unit[mj])
                            if ( IsUnitEnemy(s__Units_unit[mj], s__Players_player[s__Units_player[u]]) == true ) then
                                call s__Units_Damage(u,s__Units_unit[mj] , s__Damage_Magic , 'A00P' , s__Units_Agi(u,true) * 10.0)
                                call s__Buffs_Skill(s__Units_unit[mj] , 'A00H' , 1)
                            endif
                        endloop
                        call GroupClear(tmp_group)
                        call s__Dash_Stop(dash)
                        call s__Units_Pause(u,true)
                        call s__Units_AnimeSpeed(u,3.5)
                        call s__Units_DelayReleaseAnimePause(u,0.2)
                    endif
                    set k=null
                endif
            endfunction
            function s__ZZ__ZZ_anon__77 takes integer dash returns nothing
                local integer u=s__Units_Get(s__Dash_Unit[dash])
                call s__Spell_Destroy((s__Dash_Obj[dash]))
                call s__Units_RemoveAbility(u,'A00Q')
                call s__Units_Pause(u,false)
            endfunction
        function s__ZZ__ZZ_W takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer dash
            call s__Units_Pause(u,true)
            call s__Units_AddAbility(u,'A00Q')
            call s__Units_AnimeId(u,9)
            set dash=s__Dash_Start(s__Units_unit[u] , s__Spell_Angle[e] , 1000 , s__Dash_ADD , 70 , true , false)
            set s__Dash_Obj[dash]=e
            set s__Dash_onMove[dash]=(115)
            set s__Dash_onEnd[dash]=(116)
        endfunction
        function s__ZZ__ZZ_Q takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer mj
            local real x=s__Units_X(u) + 25 * CosBJ(s__Spell_Angle[e])
            local real y=s__Units_Y(u) + 25 * SinBJ(s__Spell_Angle[e])
            local integer i
            local real ta
            call s__Units_AnimeSpeed(u,1)
            set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00O' , 0 , x , y , s__Spell_Angle[e] , 4 , 0.75 , 2 , "stand" , "AZ_HYHX.mdx") //-30 右边 +30 左边  650
            call GroupEnumUnitsInRange(tmp_group, s__Units_X(u), s__Units_Y(u), 650, Condition(function GroupIsAliveNotAloc))
            loop
            exitwhen ( FirstOfGroup(tmp_group) == null )
                set mj=s__Units_Get(FirstOfGroup(tmp_group))
                call GroupRemoveUnit(tmp_group, s__Units_unit[mj])
                if ( IsUnitEnemy(s__Units_unit[mj], s__Players_player[s__Units_player[u]]) == true ) then
                    if ( s__Util_FAN(s__Units_unit[u] , s__Units_unit[mj] , s__Spell_Angle[e] , 30) == true ) then
                        call s__Units_Damage(u,s__Units_unit[mj] , s__Damage_Magic , 'A00O' , s__Units_Int(u,true) * 5.0)
                        call DestroyEffect(AddSpecialEffectTarget("Environment\\LargeBuildingFire\\LargeBuildingFire1.mdl", s__Units_unit[mj], "chest"))
                        call s__Dash_Start(s__Units_unit[mj] , s__Spell_Angle[e] , 700.0 - s__Util_XY2(s__Units_unit[u] , s__Units_unit[mj]) , s__Dash_SUB , 40 , true , true)
                    endif
                endif
            endloop
            call GroupClear(tmp_group)
            call s__Spell_Destroy(e)
        endfunction
        function s__ZZ__ZZ_HERO_START takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            if ( s__Spell_Id[e] == 'A00S' ) then
                call s__Units_AnimeSpeed(u,2)
                call s__Units_FlushAnimeId(u,11)
            endif
            if ( s__Spell_Id[e] == 'A00O' ) then
                call s__Units_AnimeSpeed(u,1.7)
                call s__Units_FlushAnimeId(u,6)
            endif
            if ( s__Spell_Id[e] == 'A00R' ) then
                call s__Units_AnimeSpeed(u,2)
                call s__Units_FlushAnimeId(u,14)
            endif
            call s__Spell_Destroy(e)
        endfunction
        function s__ZZ__ZZ_HERO_STOP takes integer e returns nothing
            local integer u=s__Units_Get(s__Spell_Spell[e])
            if ( s__Spell_Id[e] == 'A00O' or s__Spell_Id[e] == 'A00R' or s__Spell_Id[e] == 'A00S' ) then
                call s__Units_AnimeSpeed(u,1)
            endif
            call s__Spell_Destroy(e)
        endfunction
        function s__ZZ__ZZ_onInit takes nothing returns nothing
            call s__Spell_On(s__Spell_onSpell , 'A00S' , (117))
            call s__Spell_On(s__Spell_onSpell , 'A00R' , (118))
            call s__Spell_On(s__Spell_onSpell , 'A00P' , (119))
            call s__Spell_On(s__Spell_onSpell , 'A00O' , (120))
            call s__Spell_On(s__Spell_onStart , 'A00O' , (121))
            call s__Spell_On(s__Spell_onStop , 'A00O' , (122))
            call s__Spell_On(s__Spell_onStart , 'A00R' , (121))
            call s__Spell_On(s__Spell_onStop , 'A00R' , (122))
            call s__Spell_On(s__Spell_onStart , 'A00S' , (121))
            call s__Spell_On(s__Spell_onStop , 'A00S' , (122))
        endfunction

//library ZZ ends
//library Camera:

        function Camera___anon__13 takes nothing returns nothing
            call SetCameraField(CAMERA_FIELD_TARGET_DISTANCE, 2250.00, 0) //游戏时间轴，方便计算时间;
            set GameTime=GameTime + 0.01
        endfunction
    function Camera___onInit takes nothing returns nothing
        call CameraSetSmoothingFactor(998.00)
        call TimerStart(NewTimer(), 0.01, true, function Camera___anon__13)
    endfunction

//library Camera ends
//library Respawn:

        //public:
        function s__Respawn___Respawn_Spawn takes player p returns nothing
            local integer hid=0
            local integer money=0
            local integer ps=s__Players_Get(p)
            local integer r=s__Players_respawn[ps]
            local integer r_i
            local integer r_lv
            local integer r_str
            local integer r_agi
            local integer r_int
            local integer array r_it
            set s__Players_isdeath[ps]=false
            call sc__Respawn___Respawn_Show(p , false)
            if ( s__Respawn___Respawn_RespawnSelect[r] == 1 ) then
                set hid=s__Units_uid[s__Players_hero[ps]]
                set money=s__Respawn___Respawn_RespawnSaveMoney[r]
            elseif ( s__Respawn___Respawn_RespawnSelect[r] == 2 ) then
                set hid=s__Players_nextherotype[ps]
                set money=s__Respawn___Respawn_RespawnSaveMoney[r] * 2
                set s__Players_nextherotype[ps]=- 1
            endif
            set r_lv=GetUnitLevel(s__Units_unit[s__Players_hero[ps]])
            set r_str=s__Units_Str(s__Players_hero[ps],false)
            set r_agi=s__Units_Agi(s__Players_hero[ps],false)
            set r_int=s__Units_Int(s__Players_hero[ps],false)
            set r_i=0
            loop
            exitwhen ( r_i >= 6 )
                set r_it[r_i]=GetItemTypeId(UnitItemInSlot(s__Units_unit[s__Players_hero[ps]], r_i))
            set r_i=r_i + 1
            endloop
            call s__HeroRares_AddRandomHero(s__Units_unit[s__Players_hero[ps]])
            if ( s__Respawn___Respawn_RespawnSelect[r] == 0 ) then
                set s__Players_hero[ps]=s__Units_Get(s__HeroRares_GetRandomHero(s__Players_player[ps] , s__Players_randomhero[ps]))
            else
                set s__Players_hero[ps]=s__Units_Get(s__Units_Spawn(s__Players_player[ps] , hid , 0 , 0 , 0))
            endif
            if ( r_lv != 1 ) then
                call SetHeroLevel(s__Units_unit[s__Players_hero[ps]], r_lv, false)
            endif
            call SetHeroAgi(s__Units_unit[s__Players_hero[ps]], r_agi, true)
            call SetHeroStr(s__Units_unit[s__Players_hero[ps]], r_str, true)
            call SetHeroInt(s__Units_unit[s__Players_hero[ps]], r_int, true)
            set r_i=0
            loop
            exitwhen ( r_i >= 6 )
                call UnitAddItemToSlotById(s__Units_unit[s__Players_hero[ps]], r_it[r_i], r_i)
            set r_i=r_i + 1
            endloop
            call s__Units_Position(s__Players_hero[ps],GetRectCenterX(s__Teams_GetTeamRect(s__Players_player[ps])) , GetRectCenterY(s__Teams_GetTeamRect(s__Players_player[ps])) , true)
            call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\Awaken\\Awaken.mdl", s__Units_unit[s__Players_hero[ps]], "origin"))
            call s__Players_AddMoney(ps,- money)
            call s__Units_Lock(s__Players_hero[ps],p)
            set s__Players_respawn[ps]=0
            call s__KillUi_FlushPlayerData(s__Players_player[ps])
            call s__Respawn___Respawn_deallocate(r)
        endfunction
            function s__Respawn___Respawn_anon__23 takes nothing returns nothing
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
            call ForForce(s__Teams_GetAllPlayers(), function s__Respawn___Respawn_anon__23)
        endfunction
            function s__Respawn___Respawn_anon__24 takes nothing returns nothing
                call AdjustPlayerStateBJ(300, GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD)
            endfunction
        function s__Respawn___Respawn_Death takes integer u,integer m returns nothing
            local integer r=s__Respawn___Respawn__allocate()
            if ( s__Players_hero[s__Units_player[m]] != null ) then
                if ( s__Players_teamid[s__Units_player[u]] != s__Players_teamid[s__Units_player[m]] and s__Units_unit[m] != null ) then
                    set s__Players_lifekill[s__Units_player[m]]=s__Players_lifekill[s__Units_player[m]] + 1
                    call ForForce(s__Teams_GetTeamForce(s__Players_player[s__Units_player[m]]), function s__Respawn___Respawn_anon__24)
                    call DisplayTimedTextToForce(s__Teams_GetAllPlayers(), 5.00, s__Players_name[s__Units_player[m]] + "与队友 因击杀 " + s__Players_name[s__Units_player[u]] + " 而获得了|cffffcc00$300|r")
                    if ( s__Players_randomhero[s__Units_player[m]] > 0 ) then
                        set s__Players_randomhero[s__Units_player[m]]=s__Players_randomhero[s__Units_player[m]] - 5.0
                    endif
                endif
                if ( s__Players_randomhero[s__Units_player[u]] < 100 ) then
                    set s__Players_randomhero[s__Units_player[u]]=s__Players_randomhero[s__Units_player[u]] + 5.0
                endif
            else
                call DisplayTimedTextToForce(s__Teams_GetAllPlayers(), 5.00, s__Players_name[s__Units_player[u]] + "死在了野怪的手里...")
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
            if ( s__Players_nextherotype[p] == - 1 ) then
                if ( ps == s__Players_localplayer ) then
                    call DzFrameSetText(s__Respawn___Respawn_DeathUIMainBuy, "(|cff00ff00E|r)使用指定的英雄复活(未指定/|cffffcc00$0|r)")
                    call DzFrameShow(s__Respawn___Respawn_DeathUIMainBuyLine, true)
                endif
                if ( s__Respawn___Respawn_RespawnSelect[r] == 2 ) then
                    set s__Respawn___Respawn_RespawnSelect[r]=s__Respawn___Respawn_RespawnSelectLast[r]
                endif
            else
                if ( ps == s__Players_localplayer ) then
                    call DzFrameSetText(s__Respawn___Respawn_DeathUIMainBuy, "(|cff00ff00E|r)使用指定的英雄复活(" + s__Util_GetUnitValue(s__Players_nextherotype[p] , "Name") + "/|cffffcc00$" + I2S(s__Respawn___Respawn_RespawnSaveMoney[r] * 2) + "|r)")
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
        function s__Respawn___Respawn_Press takes player ps,string e returns nothing
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
            call s__Units_On(s__Units_onHeroDeath , (7))
            call s__Press_OnSnyc(s__Press_onSnycPressKeyDown , (5))
            call s__Press_OnSnyc(s__Press_onSnycPressKeyDown , (6))
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
//   Date: Sat Dec 29 00:48:56 2018
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
    set u=CreateUnit(p, 'n002', - 5120.0, - 4736.0, 270.000)
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
    set u=CreateUnit(p, 'n002', 384.0, 4672.0, 270.000)
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
    set u=CreateUnit(p, 'n002', 4416.0, - 5376.0, 270.000)
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
function CreateNeutralHostile takes nothing returns nothing
    local player p= Player(PLAYER_NEUTRAL_AGGRESSIVE)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set gg_unit_e001_0011=CreateUnit(p, 'e001', - 189.7, - 805.3, 188.610)
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
    set u=CreateUnit(p, 'H002', - 6.8, - 178.3, 251.900)
    set u=CreateUnit(p, 'H003', 97.3, - 182.4, 358.540)
    set u=CreateUnit(p, 'H004', - 260.0, - 183.6, 345.630)
    set u=CreateUnit(p, 'H005', - 383.1, - 187.9, 244.660)
    set u=CreateUnit(p, 'H006', - 35.1, - 364.2, 273.830)
    set u=CreateUnit(p, 'H007', - 173.7, - 357.1, 351.410)
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
    call CreateNeutralHostile()
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
    set gg_rct_YeGuai_01=Rect(- 4800.0, - 2144.0, - 2464.0, 4736.0)
    set gg_rct_ShuLin_01=Rect(- 2304.0, - 5376.0, 2720.0, - 4000.0)
    set gg_rct_YeGuai_02=Rect(2432.0, - 2048.0, 4864.0, 4832.0)
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
// BEGIN IMPORT OF C:\Users\ushiop\Desktop\war3\project\map/script/Stack.j
// END IMPORT OF C:\Users\ushiop\Desktop\war3\project\map/script/Stack.j
// BEGIN IMPORT OF C:\Users\ushiop\Desktop\war3\project\map/script/SoundUtils.j
// END IMPORT OF C:\Users\ushiop\Desktop\war3\project\map/script/SoundUtils.j

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
// Units\Creeps\HeroTinkerFactory\HeroTinkerFactoryMissle.mdl
//===========================================================================
function Trig_initConditions takes nothing returns boolean
    return ( ( YDWEIsEventAttackDamage() == true ) )
endfunction
function Trig_initActions takes nothing returns nothing
    call DzLoadToc("resource\\UI.toc")
    call SetUnitUserData(gg_unit_e000_0010, 0)
    call SetUnitUserData(gg_unit_e001_0011, 0)
    call BJDebugMsg(( EXExecuteScript("(require'jass.slk').unit[" + I2S('e000') + "].Art") ))
    call EXEffectMatReset(bj_lastCreatedEffect)
    call YDWEUnitAddStun(GetTriggerUnit())
    call YDWESetUnitAbilityState(GetTriggerUnit() , 'A00E' , 1 , 0.00)
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
    call AdjustPlayerStateBJ(156465, Player(0), PLAYER_STATE_RESOURCE_GOLD)
    call SetPlayerAlliance(Player(PLAYER_NEUTRAL_AGGRESSIVE), Player(0), ALLIANCE_SHARED_CONTROL, true)
    call SetPlayerAlliance(Player(PLAYER_NEUTRAL_PASSIVE), Player(0), ALLIANCE_SHARED_CONTROL, true)
    call SetPlayerAlliance(Player(4), Player(0), ALLIANCE_SHARED_CONTROL, true)
endfunction
//===========================================================================
function InitTrig____________________001 takes nothing returns nothing
    set gg_trg____________________001=CreateTrigger()
    call DoNothing()
    call TriggerRegisterPlayerEventEndCinematic(gg_trg____________________001, Player(0))
    call TriggerAddAction(gg_trg____________________001, function Trig____________________001Actions)
endfunction
//===========================================================================
// Trigger: 未命名触发器 002
//===========================================================================
function Trig____________________002Actions takes nothing returns nothing
    call UnitDamageTarget(gg_unit_e000_0010, FirstOfGroup(YDWEGetUnitsOfPlayerAllNull(Player(0))), 500.00, true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS)
endfunction
//===========================================================================
function InitTrig____________________002 takes nothing returns nothing
    set gg_trg____________________002=CreateTrigger()
    call DoNothing()
    call TriggerRegisterPlayerChatEvent(gg_trg____________________002, Player(0), "1", true)
    call TriggerAddAction(gg_trg____________________002, function Trig____________________002Actions)
endfunction
//===========================================================================
function InitCustomTriggers takes nothing returns nothing
    call InitTrig_init()
    call InitTrig____________________001()
    call InitTrig____________________002()
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

call ExecuteFunc("jasshelper__initstructs652906468")
call ExecuteFunc("BuyStrAgiInt___onInit")
call ExecuteFunc("Teams___onInit")
call ExecuteFunc("TerrainPathability___Init")
call ExecuteFunc("TimerUtils___init")
call ExecuteFunc("Tree___onInit")
call ExecuteFunc("Buff___onInit")
call ExecuteFunc("Dashs___onInit")
call ExecuteFunc("Events___onInit")
call ExecuteFunc("HitFly___onInit")
call ExecuteFunc("Press___onInit")
call ExecuteFunc("BuyNextHero___onInit")
call ExecuteFunc("Disconnect___onInit")
call ExecuteFunc("LevelUp___onInit")
call ExecuteFunc("PlayerChat___onInit")
call ExecuteFunc("PlayerPress___onInit")
call ExecuteFunc("HeroRare___onInit")
call ExecuteFunc("Winner___onInit")
call ExecuteFunc("Ai___onInit")
call ExecuteFunc("DazzleMaster___onInit")
call ExecuteFunc("Init___onInit")
call ExecuteFunc("KillUi___onInit")
call ExecuteFunc("YeG___onInit")
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
            if ( s__Players_nextherotype[p] == - 1 ) then
                if ( ps == s__Players_localplayer ) then
                    call DzFrameSetText(s__Respawn___Respawn_DeathUIMainBuy, "(|cff00ff00E|r)使用指定的英雄复活(未指定/|cffffcc00$0|r)")
                    call DzFrameShow(s__Respawn___Respawn_DeathUIMainBuyLine, true)
                endif
                if ( s__Respawn___Respawn_RespawnSelect[r] == 2 ) then
                    set s__Respawn___Respawn_RespawnSelect[r]=s__Respawn___Respawn_RespawnSelectLast[r]
                endif
            else
                if ( ps == s__Players_localplayer ) then
                    call DzFrameSetText(s__Respawn___Respawn_DeathUIMainBuy, "(|cff00ff00E|r)使用指定的英雄复活(" + s__Util_GetUnitValue(s__Players_nextherotype[p] , "Name") + "/|cffffcc00$" + I2S(s__Respawn___Respawn_RespawnSaveMoney[r] * 2) + "|r)")
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
function sa__DazzleMaster___DazzleMaster_AddDazzle takes nothing returns boolean
    call s__DazzleMaster___DazzleMaster_AddDazzle(f__arg_unit1,f__arg_integer1)
   return true
endfunction
function sa__DazzleMaster___DazzleMaster_Q takes nothing returns boolean
local integer e=f__arg_integer1
            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer dash
            local integer data=s__Data_create('A009')
            local integer ts
            call s__Units_Pause(u,true)
            call s__Units_Alpha(u,0)
            call s__Units_AnimeId(u,6)
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_c[s__Data_c[data]+1]=e
            set s___Data_i[s__Data_i[data]]=0
            set s___Data_g[s__Data_g[data]]=CreateGroup()
            set ts=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00B' , 0 , s__Units_X(u) , s__Units_Y(u) , s__Spell_Angle[e] , 10 , 1 , 0.7 , "stand" , "kiyohime_lancer.mdl")
            call s__Units_AnimeId(ts,6)
            call s__Units_AnimeSpeed(ts,0.7)
            set s___Data_c[s__Data_c[data]+2]=ts
            set s___Data_i[s__Data_i[data]+1]=0
            call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00B' , 0 , s__Units_X(u) , s__Units_Y(u) , s__Spell_Angle[e] , 4 , 1 , 2.5 , "stand" , "dust2.mdx")
            set dash=s__Dash_Start(s__Units_unit[ts] , s__Spell_Angle[e] , 600 , s__Dash_SUB , 60 , true , false)
            set s__Dash_Obj[dash]=data
            set s__Dash_onMove[dash]=(40)
            set s__Dash_onEnd[dash]=(41)
   return true
endfunction
function sa__Winner_ShowWin takes nothing returns boolean
local integer teamid=f__arg_integer1
            set s__Winner_WinTeam=teamid
            call ForForce(s__Teams_GetAllPlayers(), function s__Winner_anon__18)
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
function sa__Units_Alpha takes nothing returns boolean
local integer this=f__arg_this
local integer a=f__arg_integer1
                call SetUnitVertexColor(s__Units_unit[this], 255, 255, 255, a)
   return true
endfunction
function sa__Units_Str takes nothing returns boolean
local integer this=f__arg_this
local boolean f=f__arg_boolean1
set f__result_integer= GetHeroStr(s__Units_unit[s__Players_hero[s__Units_player[this]]], f)
   return true
endfunction
function sa__Units_Agi takes nothing returns boolean
local integer this=f__arg_this
local boolean f=f__arg_boolean1
set f__result_integer= GetHeroAgi(s__Units_unit[s__Players_hero[s__Units_player[this]]], f)
   return true
endfunction
function sa__Units_Int takes nothing returns boolean
local integer this=f__arg_this
local boolean f=f__arg_boolean1
set f__result_integer= GetHeroInt(s__Units_unit[s__Players_hero[s__Units_player[this]]], f)
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
                call TimerStart(t, delay, false, function s__Units_anon__4)
                set t=null
   return true
endfunction
function sa__Units_AnimeSpeed takes nothing returns boolean
local integer this=f__arg_this
local real sp=f__arg_real1
                call SetUnitTimeScale(s__Units_unit[this], sp)
   return true
endfunction
function sa__Units_Y takes nothing returns boolean
local integer this=f__arg_this
set f__result_real= GetUnitY(s__Units_unit[this])
   return true
endfunction
function sa__Units_X takes nothing returns boolean
local integer this=f__arg_this
set f__result_real= GetUnitX(s__Units_unit[this])
   return true
endfunction
function sa__Units_SetH takes nothing returns boolean
local integer this=f__arg_this
local real h=f__arg_real1
                call SetUnitFlyHeight(s__Units_unit[this], h, 0)
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
function sa__Units_MJ takes nothing returns boolean
local player p=f__arg_player1
local integer uid=f__arg_integer1
local integer aid=f__arg_integer2
local integer aindex=f__arg_integer3
local real x=f__arg_real1
local real y=f__arg_real2
local real f=f__arg_real3
local real lifetime=f__arg_real4
local real modsize=f__arg_real5
local real animspeed=f__arg_real6
local string animname=f__arg_string1
local string modpath=f__arg_string2
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
set f__result_integer= t
   return true
endfunction
function sa__Units_Kill takes nothing returns boolean
    call s__Units_Kill(f__arg_unit1)
   return true
endfunction
function sa__PlayerPress_create takes nothing returns boolean

            local integer p=s__PlayerPress__allocate()
            set s__PlayerPress_Q[p]=false
            set s__PlayerPress_W[p]=false
            set s__PlayerPress_E[p]=false
            set s__PlayerPress_R[p]=false
            set s__PlayerPress_D[p]=false
            set s__PlayerPress_F[p]=false
            set s__PlayerPress_MouseX[p]=0
            set s__PlayerPress_MouseY[p]=0
set f__result_integer= p
   return true
endfunction
function sa__SoundUtils___soundrecycler_onDestroy takes nothing returns boolean
local integer this=f__arg_this
        call RemoveSavedInteger(SoundUtils___rt, s__SoundUtils___soundrecycler_sh[this], GetHandleId(s__SoundUtils___soundrecycler_s[this]))
        call ReleaseTimer(s__SoundUtils___soundrecycler_t[this])
   return true
endfunction
function sa__Players_AddMoney takes nothing returns boolean
local integer this=f__arg_this
local integer addm=f__arg_integer1
                call AdjustPlayerStateBJ(addm, s__Players_player[this], PLAYER_STATE_RESOURCE_GOLD)
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
                    call sc___prototype1_evaluate(callback,m)
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
                    call sc___prototype1_evaluate((s__Dash_onRemove[this]),this)
                endif
                if ( s__Dash_onEnd[this] != 0 ) then
                    call sc___prototype1_evaluate((s__Dash_onEnd[this]),this)
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
function sa__Table___GTable_onDestroy takes nothing returns boolean
local integer this=f__arg_this
            call s__Table___GTable_reset(this)
   return true
endfunction
function sa__Stack_onDestroy takes nothing returns boolean
local integer this=f__arg_this
            local integer n
            loop
                set n=s__Stack_top[this]
                exitwhen n == 0
                set s__Stack_top[this]=s__Stack_next[n]
                set s__Stack_next[n]=s__Stack_free
                set s__Stack_free=n
            endloop
   return true
endfunction
function sa___prototype1_BuyStrAgiInt___Buy takes nothing returns boolean
 local integer e=f__arg_integer1

        local integer id
        local integer add
        local integer p
        if ( GetItemType(s__EventArgs_BuyItem[e]) == ITEM_TYPE_PERMANENT ) then
            set id=GetItemTypeId(s__EventArgs_BuyItem[e])
            set p=s__Units_player[sc__Units_Get(s__EventArgs_BuyingUnit[e])]
            call RemoveItem(s__EventArgs_BuyItem[e])
            if ( id == 'I003' or id == 'I004' ) then
                if ( sc__Units_Str(s__Players_hero[p],false) > 10 ) then
                    set add=10
                else
                    set add=0
                    call sc__Players_AddMoney(p,20)
                endif
                call ModifyHeroStat(bj_HEROSTAT_STR, s__Units_unit[s__Players_hero[p]], bj_MODIFYMETHOD_SUB, add)
                if ( id == 'I003' ) then
                    call ModifyHeroStat(bj_HEROSTAT_AGI, s__Units_unit[s__Players_hero[p]], bj_MODIFYMETHOD_ADD, add)
                    call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Items\\AIam\\AIamTarget.mdl", sc__Units_X(s__Players_hero[p]), sc__Units_Y(s__Players_hero[p])))
                else
                    call ModifyHeroStat(bj_HEROSTAT_INT, s__Units_unit[s__Players_hero[p]], bj_MODIFYMETHOD_ADD, add)
                    call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Items\\AIim\\AIimTarget.mdl", sc__Units_X(s__Players_hero[p]), sc__Units_Y(s__Players_hero[p])))
                endif
            endif
            if ( id == 'I005' or id == 'I006' ) then
                if ( sc__Units_Agi(s__Players_hero[p],false) > 10 ) then
                    set add=10
                else
                    set add=0
                    call sc__Players_AddMoney(p,20)
                endif
                call ModifyHeroStat(bj_HEROSTAT_AGI, s__Units_unit[s__Players_hero[p]], bj_MODIFYMETHOD_SUB, add)
                if ( id == 'I005' ) then
                    call ModifyHeroStat(bj_HEROSTAT_STR, s__Units_unit[s__Players_hero[p]], bj_MODIFYMETHOD_ADD, add)
                    call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", sc__Units_X(s__Players_hero[p]), sc__Units_Y(s__Players_hero[p])))
                else
                    call ModifyHeroStat(bj_HEROSTAT_INT, s__Units_unit[s__Players_hero[p]], bj_MODIFYMETHOD_ADD, add)
                    call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Items\\AIim\\AIimTarget.mdl", sc__Units_X(s__Players_hero[p]), sc__Units_Y(s__Players_hero[p])))
                endif
            endif
            if ( id == 'I007' or id == 'I008' ) then
                if ( sc__Units_Int(s__Players_hero[p],false) > 10 ) then
                    set add=10
                else
                    set add=0
                    call sc__Players_AddMoney(p,20)
                endif
                call ModifyHeroStat(bj_HEROSTAT_INT, s__Units_unit[s__Players_hero[p]], bj_MODIFYMETHOD_SUB, add)
                if ( id == 'I007' ) then
                    call ModifyHeroStat(bj_HEROSTAT_STR, s__Units_unit[s__Players_hero[p]], bj_MODIFYMETHOD_ADD, add)
                    call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", sc__Units_X(s__Players_hero[p]), sc__Units_Y(s__Players_hero[p])))
                else
                    call ModifyHeroStat(bj_HEROSTAT_AGI, s__Units_unit[s__Players_hero[p]], bj_MODIFYMETHOD_ADD, add)
                    call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Items\\AIam\\AIamTarget.mdl", sc__Units_X(s__Players_hero[p]), sc__Units_Y(s__Players_hero[p])))
                endif
            endif
            call DisplayTimedTextFromPlayer(s__Players_player[p], 0, 0, 5, "属性转换完成~！现在的属性是: 力量(" + I2S(sc__Units_Str(s__Players_hero[p],true)) + ")  敏捷(" + I2S(sc__Units_Agi(s__Players_hero[p],true)) + ")   智力(" + I2S(sc__Units_Int(s__Players_hero[p],true)) + ")")
        endif
    return true
endfunction
function sa___prototype36_SoundUtils___HookStopSound takes nothing returns boolean
    call SoundUtils___HookStopSound(f__arg_sound1,f__arg_boolean1,f__arg_boolean2)
    return true
endfunction
function sa___prototype37_SoundUtils___HookKillSoundWhenDone takes nothing returns boolean
    call SoundUtils___HookKillSoundWhenDone(f__arg_sound1)
    return true
endfunction
function sa___prototype1_BuyNextHero___Buy takes nothing returns boolean
 local integer e=f__arg_integer1

        local integer id
        local integer p
        if ( GetItemType(s__EventArgs_BuyItem[e]) == ITEM_TYPE_POWERUP ) then
            set id=S2I(GetItemName(s__EventArgs_BuyItem[e]))
            set p=s__Units_player[sc__Units_Get(s__EventArgs_BuyingUnit[e])]
            call RemoveItem(s__EventArgs_BuyItem[e])
            set s__Players_nextherotype[p]=HeroType[id]
            call DisplayTextToPlayer(s__Players_player[p], 0, 0, "你已指定复活英雄为 '" + s__Util_GetUnitValue(s__Players_nextherotype[p] , "Name") + " ',请确保死亡时金钱充足~~")
        endif
    return true
endfunction
function sa___prototype1_Disconnect___onDisconnect takes nothing returns boolean
 local integer e=f__arg_integer1

        local integer x
        local unit u
        local timer t
        set Disconnect___tmp=s__Players_Get(s__EventArgs_TriggerPlayer[e])
        set u=s__Units_unit[s__Players_hero[Disconnect___tmp]]
        set s__Players_hero[Disconnect___tmp]=0
        call ReviveHero(u, GetUnitX(u), GetUnitY(u), false)
        call SetUnitPosition(u, GetRectCenterX(s__Teams_GetTeamRect(s__Players_player[Disconnect___tmp])), GetRectCenterY(s__Teams_GetTeamRect(s__Players_player[Disconnect___tmp])))
        set x=1
        loop
        exitwhen ( x > 6 )
            call UnitRemoveItemFromSlotSwapped(x, u)
        set x=x + 1
        endloop
        call sc__Units_Kill(u)
        set t=NewTimer()
        call SetTimerData(t , sc__Units_Get(u))
        call TimerStart(t, 3, false, function Disconnect___anon__16)
        set t=null
        set x=s__Teams_GetTeamNumber(s__Players_player[Disconnect___tmp]) - 1
        if ( x != 0 ) then
            call ForForce(s__Teams_GetTeamForce(s__Players_player[Disconnect___tmp]), function Disconnect___anon__17)
        endif
        call s__Teams_PlayerRemoveForce(s__Players_player[Disconnect___tmp])
        call DisplayTimedTextToForce(s__Teams_GetAllPlayers(), 5.00, s__Players_name[Disconnect___tmp] + " 离开了游戏，金钱将平分给他的队友。")
        set s__Players_isonline[Disconnect___tmp]=false
        call sc__KillUi_FlushPlayerData(s__Players_player[Disconnect___tmp])
        set u=null
    return true
endfunction
function sa___prototype1_LevelUp___LvUp takes nothing returns boolean
 local integer e=f__arg_integer1

        local integer lv=GetUnitLevel(s__EventArgs_TriggerUnit[e])
        local integer p=s__Units_player[sc__Units_Get(s__EventArgs_TriggerUnit[e])]
        if ( lv > LevelUp___MaxLv ) then
            set LevelUp___MaxLv=lv
            call ForForce(s__Teams_GetAllPlayers(), function LevelUp___anon__25)
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
function sa___prototype1_PlayerChat___Chat takes nothing returns boolean
 local integer e=f__arg_integer1

        local integer p=s__Players_Get(s__EventArgs_TriggerPlayer[e])
        if ( s__EventArgs_ChatString[e] == "-PC" ) then
            if ( s__Players_isai[p] == true ) then
                set s__Players_isai[p]=false
                call DisplayTextToPlayer(s__Players_player[p], 0, 0, "你已关闭电脑托管~!")
            else
                set s__Players_isai[p]=true
                call DisplayTextToPlayer(s__Players_player[p], 0, 0, "你已开启电脑托管~!")
            endif
        endif
    return true
endfunction
function sa___prototype1_Ai___onDmg takes nothing returns boolean
 local integer dmg=f__arg_integer1

        local integer u=s__DamageArgs_TriggerUnit[dmg]
        if ( s__Players_isai[s__Units_player[u]] == true ) then
            call Ai___AISpell(s__Units_unit[u])
        endif
    return true
endfunction
function sa___prototype1_s__Spell_onUnitSpell takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=sc__Units_Get(s__EventArgs_TriggerUnit[e])
            local integer tmp
            if ( GetUnitAbilityLevel(s__EventArgs_TriggerUnit[e], 'Aloc') == 0 ) then
                set tmp=s__Spell__allocate()
                call SpellText(s__Units_unit[u] , s__EventArgs_SpellId[e] , 3 , 10)
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
                call BJDebugMsg(GetAbilityName(s__Spell_Id[tmp]) + "生成-阶段:" + I2S(s__Spell_State[tmp]))
                if ( s__Units_spell[u] != 0 ) then
                    set s__Spell_Use[tmp]=2
                    call sc___prototype1_evaluate((s__Units_spell[u]),tmp)
                endif
                call s__Spell_Trigger(s__Spell_onSpell , s__Spell_Id[tmp] , tmp)
            endif
    return true
endfunction
function sa___prototype1_s__Spell_onUnitStartSpell takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=sc__Units_Get(s__EventArgs_TriggerUnit[e])
            local integer tmp
            if ( GetUnitAbilityLevel(s__EventArgs_TriggerUnit[e], 'Aloc') == 0 ) then
                set tmp=s__Spell__allocate()
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
                set s__Spell_State[tmp]=2
                call BJDebugMsg(GetAbilityName(s__Spell_Id[tmp]) + "生成-阶段:" + I2S(s__Spell_State[tmp]))
                call s__Spell_Trigger(s__Spell_onStart , s__Spell_Id[tmp] , tmp)
            endif
    return true
endfunction
function sa___prototype1_s__Spell_onUnitStopSpell takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=sc__Units_Get(s__EventArgs_TriggerUnit[e])
            local integer tmp
            if ( GetUnitAbilityLevel(s__EventArgs_TriggerUnit[e], 'Aloc') == 0 ) then
                set tmp=s__Spell__allocate()
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
                set s__Spell_State[tmp]=3
                call BJDebugMsg(GetAbilityName(s__Spell_Id[tmp]) + "生成-阶段:" + I2S(s__Spell_State[tmp]))
                call s__Spell_Trigger(s__Spell_onStop , s__Spell_Id[tmp] , tmp)
            endif
    return true
endfunction
function sa___prototype1_s__Spell_onUnitReadySpell takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=sc__Units_Get(s__EventArgs_TriggerUnit[e])
            local integer tmp
            if ( GetUnitAbilityLevel(s__EventArgs_TriggerUnit[e], 'Aloc') == 0 ) then
                set tmp=s__Spell__allocate()
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
                set s__Spell_State[tmp]=1
                call BJDebugMsg(GetAbilityName(s__Spell_Id[tmp]) + "生成-阶段:" + I2S(s__Spell_State[tmp]))
                call s__Spell_Trigger(s__Spell_onReady , s__Spell_Id[tmp] , tmp)
            endif
    return true
endfunction
function sa___prototype1_s__Damage_onDisconnect takes nothing returns boolean
 local integer p=f__arg_integer1

            if ( s__HandleTable_exists(s__Damage_ht,s__EventArgs_TriggerPlayer[p]) == true ) then
                call s__HandleTable_flush(s__Damage_ht,s__EventArgs_TriggerPlayer[p])
            endif
    return true
endfunction
function sa___prototype1_s__Damage_onDamage takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer dmg
            if ( s__EventArgs_Damage[e] > 0 ) then
                set dmg=s__DamageArgs_create()
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
            endif
    return true
endfunction
function sa___prototype35_s__PlayerPress_Down takes nothing returns boolean
 local player ps=f__arg_player1
 local string e=f__arg_string1

            local integer p=s__Players_Get(ps)
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
function sa___prototype35_s__PlayerPress_Up takes nothing returns boolean
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
function sa___prototype54_s__Units_Damage takes nothing returns boolean
    call s__Units_Damage(f__arg_integer1,f__arg_unit1,f__arg_integer2,f__arg_integer3,f__arg_real1)
    return true
endfunction
function sa___prototype1_s__Units_onDeath takes nothing returns boolean
 local integer e=f__arg_integer1

            if ( IsUnitType(s__EventArgs_TriggerUnit[e], UNIT_TYPE_HERO) == true ) then
                if ( GetUnitAbilityLevel(s__EventArgs_TriggerUnit[e], 'Aloc') == 0 ) then
                    call SetUnitState(s__EventArgs_TriggerUnit[e], UNIT_STATE_LIFE, - 0.001)
                    call s__Units_Trigger(s__Units_onHeroDeath , s__EventArgs_TriggerUnit[e] , s__EventArgs_KillUnit[e])
                else
                    call s__Units_Trigger(s__Units_onAlocDeath , s__EventArgs_TriggerUnit[e] , s__EventArgs_KillUnit[e])
                endif
            elseif ( GetUnitAbilityLevel(s__EventArgs_TriggerUnit[e], 'Aloc') == 0 ) then
                call SetUnitState(s__EventArgs_TriggerUnit[e], UNIT_STATE_LIFE, - 0.001)
                call s__Units_Trigger(s__Units_onUnitDeath , s__EventArgs_TriggerUnit[e] , s__EventArgs_KillUnit[e])
            else
                call s__Units_Trigger(s__Units_onAlocDeath , s__EventArgs_TriggerUnit[e] , s__EventArgs_KillUnit[e])
                call sc__Units_Destroys(s__EventArgs_TriggerUnit[e])
            endif
    return true
endfunction
function sa___prototype1_s__Units_onDeacy takes nothing returns boolean
 local integer e=f__arg_integer1

            if ( IsUnitType(s__EventArgs_TriggerUnit[e], UNIT_TYPE_HERO) == false ) then
                call sc__Units_Destroys(s__EventArgs_TriggerUnit[e])
            endif
    return true
endfunction
function sa___prototype46_s__Winner_Death takes nothing returns boolean
 local integer u=f__arg_integer1
 local integer m=f__arg_integer2

            set s__Players_deaths[s__Units_player[u]]=s__Players_deaths[s__Units_player[u]] + 1
            call sc__KillUi_FlushPlayerData(s__Players_player[s__Units_player[u]])
            if ( s__Players_hero[s__Units_player[m]] != null ) then
                if ( s__Players_teamid[s__Units_player[u]] != s__Players_teamid[s__Units_player[m]] ) then
                    set s__Players_kills[s__Units_player[m]]=s__Players_kills[s__Units_player[m]] + 1
                    call s__Teams_AddTeamKills(s__Players_teamid[s__Units_player[m]] , 1)
                    call sc__KillUi_FlushKillData(s__Players_teamid[s__Units_player[m]])
                endif
                if ( s__Teams_GetTeamKills(s__Players_teamid[s__Units_player[m]]) >= s__Winner_MaxKills ) then
                    set s__Winner_GameEnd=true
                    call DisplayTimedTextToForce(s__Teams_GetAllPlayers(), 5.00, "游戏结束啦！！！！！！！！！！！ " + s__Teams_GetTeamNameByIndex(s__Players_teamid[s__Units_player[m]]) + " 获得了最终的胜利！！")
                    call sc__Winner_ShowWin(s__Players_teamid[s__Units_player[m]])
                endif
            endif
    return true
endfunction
function sa___prototype1_s__BlackSaber__BlackSaber_anon__79 takes nothing returns boolean
 local integer h=f__arg_integer1

                    local integer u=s__Units_Get(s__HitFlys_Unit[h])
                    call s__Units_Anime(u,"death")
                    call s__HitFlys_Remove(s__Units_unit[u])
    return true
endfunction
function sa___prototype1_s__BlackSaber__BlackSaber_anon__82 takes nothing returns boolean
 local integer dash=f__arg_integer1

                        local integer m=s__Units_Get(s__Dash_Unit[dash])
                        if ( s__Dash_Speed[dash] > 20 ) then
                            call s__Units_SetH(s__Units_MJ(s__Players_player[s__Units_player[m]] , 'e008' , 'A012' , 0 , s__Units_X(m) , s__Units_Y(m) , 0 , 2 , s__Dash_Speed[dash] / 15 , 1 , "death" , "fire-boom-new-darkblue-3.mdl"),s__Units_H(m))
                        endif
    return true
endfunction
function sa___prototype1_s__BlackSaber__BlackSaber_anon__80 takes nothing returns boolean
 local integer dash=f__arg_integer1

                local integer data=(s__Dash_Obj[dash])
                local integer u=s__Units_Get(s__Dash_Unit[dash])
                local unit k
                local timer t
                if ( s__Dash_Speed[dash] < 5 ) then
                    if ( s___Data_i[s__Data_i[data]] == 0 ) then
                        call s__Units_RemoveAbility(u,'A013')
                        call s__Units_Pause(u,false)
                        call s__Units_AnimeSpeed(u,1)
                        call s__Units_AnimeId(u,18)
                        set s___Data_i[s__Data_i[data]]=1
                    endif
                endif
                if ( s__Dash_Speed[dash] > 50 ) then
                    call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl", s__Dash_X[dash], s__Dash_Y[dash]))
                endif
                if ( s___Data_i[s__Data_i[data]] == 0 ) then
                    set k=GroupFind(s__Units_unit[u] , s__Units_X(u) + 70 * CosBJ(s__Dash_Angle[dash]) , s__Units_Y(u) + 70 * SinBJ(s__Dash_Angle[dash]) , 70 , true , false)
                    if ( k != null ) then
                        set s___Data_i[s__Data_i[data]]=2
                        call s__Dash_Stop(dash)
                        set t=NewTimer()
                        call s__Units_AnimeId(u,19)
                        call s__Units_AnimeSpeed(u,1.5)
                        set s___Data_r[s__Data_r[data]]=0
                        set s___Data_r[s__Data_r[data]+1]=0
                        set s___Data_c[s__Data_c[data]+2]=s__Units_Get(k)
                        call SetTimerData(t , data)
                        call s__Dash_Start(s__Units_unit[u] , s__Dash_Angle[dash] , 300 , s__Dash_SUB , 20 , true , false)
                        call TimerStart(t, 0.01, true, function s__BlackSaber__BlackSaber_anon__81)
                        set t=null
                        set k=null
                    endif
                endif
    return true
endfunction
function sa___prototype1_s__BlackSaber__BlackSaber_anon__83 takes nothing returns boolean
 local integer dash=f__arg_integer1

                local integer data=(s__Dash_Obj[dash])
                local integer u=s__Units_Get(s__Dash_Unit[dash])
                if ( s___Data_i[s__Data_i[data]] == 0 ) then
                    call s__Units_RemoveAbility(u,'A013')
                    call s__Units_AnimeSpeed(u,1)
                    call s__Units_Pause(u,false)
                endif
                if ( s___Data_i[s__Data_i[data]] <= 1 ) then
                    call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                    call s__Data_Destroy(data)
                endif
    return true
endfunction
function sa___prototype1_s__BlackSaber__BlackSaber_anon__85 takes nothing returns boolean
 local integer dash=f__arg_integer1

                local integer u=s__Units_Get(s__Dash_Unit[dash])
                local integer mj
                local real dis
                local real a
                if ( s__Dash_Speed[dash] < 2 ) then
                    call GroupEnumUnitsInRange(tmp_group, s__Dash_X[dash], s__Dash_Y[dash], 200, Condition(function GroupIsAliveNotAloc))
                    loop
                    exitwhen ( FirstOfGroup(tmp_group) == null )
                        set mj=s__Units_Get(FirstOfGroup(tmp_group))
                        call GroupRemoveUnit(tmp_group, s__Units_unit[mj])
                        if ( IsUnitEnemy(s__Units_unit[mj], s__Players_player[s__Units_player[u]]) == true ) then
                            call s__Units_Damage(u,s__Units_unit[mj] , 'A00V' , s__Damage_Magic , s__Units_Int(u,true) * 7)
                        endif
                    endloop
                    call GroupClear(tmp_group)
                    call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00V' , 0 , s__Dash_X[dash] , s__Dash_Y[dash] , 0 , 1 , 0.2 , 2 , "stand" , "black_thunderclapcaster.mdl")
                    call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00V' , 0 , s__Dash_X[dash] , s__Dash_Y[dash] , 0 , 5 , 0.7 , 2 , "death" , "fire-boom-new-darkblue.mdl")
                    set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00V' , 0 , s__Dash_X[dash] , s__Dash_Y[dash] , 0 , 1.3 , 3 , 1 , "birth" , "blue-fire.mdl")
                    call s__Units_SetH(mj,125)
                    call s__Units_DelaySize(mj,5 , 0.4)
                    call s__Units_DelayAnime(mj,2 , 0.8)
                    call s__Dash_Stop(dash)
                else
                    set dis=GetRandomReal(0, 100)
                    set a=GetRandomReal(0, 360)
                    set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00V' , 0 , s__Dash_X[dash] + dis * CosBJ(a) , s__Dash_Y[dash] + dis * SinBJ(a) , 0 , 0.3 , 1 , 1 , "stand" , "blue-fire.mdl")
                    call s__Units_SetH(mj,100)
                    call s__Units_DelayAnime(mj,2 , 0.15)
                    call GroupEnumUnitsInRange(tmp_group, s__Dash_X[dash], s__Dash_Y[dash], 200, Condition(function GroupIsAliveNotAloc))
                    loop
                    exitwhen ( FirstOfGroup(tmp_group) == null )
                        set mj=s__Units_Get(FirstOfGroup(tmp_group))
                        call GroupRemoveUnit(tmp_group, s__Units_unit[mj])
                        if ( IsUnitEnemy(s__Units_unit[mj], s__Players_player[s__Units_player[u]]) == true ) then
                            call s__Units_Position(mj,s__Dash_X[dash] , s__Dash_Y[dash] , true)
                        endif
                    endloop
                    call GroupClear(tmp_group)
                endif
    return true
endfunction
function sa___prototype1_s__BlackSaber__BlackSaber_anon__86 takes nothing returns boolean
 local integer dash=f__arg_integer1

                local integer u=s__Units_Get(s__Dash_Unit[dash])
                call s__Units_Life(u,5)
                call s__Units_Anime(u,"death")
    return true
endfunction
function sa___prototype1_s__BlackSaber__BlackSaber_anon__87 takes nothing returns boolean
 local integer dash=f__arg_integer1

                local integer u=s__Units_Get(s__Dash_Unit[dash])
                local real x=s__Units_X(u) + 50 * CosBJ(s__Dash_Angle[dash])
                local real y=s__Units_Y(u) + 50 * SinBJ(s__Dash_Angle[dash])
                local unit k=null
                local integer mj
                if ( s__Dash_Speed[dash] < 1.5 ) then
                    call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl", s__Dash_X[dash], s__Dash_Y[dash]))
                endif
                set k=GroupFind(s__Units_unit[u] , x , y , 70 , true , false)
                if ( k != null ) then
                    call s__Dash_Stop(dash)
                    call s__Buffs_Add(s__Units_unit[u] , 'A010' , 'B005' , 0.5 , false)
                    call s__Units_Pause(u,true)
                    call s__Units_AnimeSpeed(u,4)
                    call s__Units_DelayReleaseAnimePause(u,0.15)
                    call s__Units_Damage(u,k , s__Damage_Physics , 'A00U' , s__Units_Str(u,true) * 5.0)
                    call s__Units_SetF(u,s__Util_XY(s__Units_unit[u] , k) , true)
                    call s__Buffs_Skill(k , 'A00W' , 1)
                    call s__Units_SetH(s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00U' , 0 , GetUnitX(k) , GetUnitY(k) , 0 , 2 , 0.7 , 2.5 , "stand" , "hit-red.mdl"),100)
                    call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl", k, "chest"))
                    if ( s__Dash_NowDis[dash] > 100 ) then
                        call s__Dash_Start(s__Units_unit[u] , s__Util_XY(k , s__Units_unit[u]) , 200 * ( s__Dash_NowDis[dash] / s__Dash_MaxDis[dash] ) , s__Dash_SUB , 20 , true , false)
                    endif
                    call RunSoundOnUnit(s__BlackSaber__BlackSaber_Q_HIT , k)
                endif
                set k=null
    return true
endfunction
function sa___prototype1_s__BlackSaber__BlackSaber_anon__88 takes nothing returns boolean
 local integer dash=f__arg_integer1

                local integer u=s__Units_Get(s__Dash_Unit[dash])
                call s__Spell_Destroy((s__Dash_Obj[dash]))
                call s__Units_AnimeSpeed(u,1)
                call s__Units_Pause(u,false)
    return true
endfunction
function sa___prototype32_s__BlackSaber__BlackSaber_AI takes nothing returns boolean
    call s__BlackSaber__BlackSaber_AI(f__arg_unit1)
    return true
endfunction
function sa___prototype1_s__BlackSaber__BlackSaber_D takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            local timer t=NewTimer()
            local integer data=s__Data_create('A015')
            local real x=s__Units_X(u)
            local real y=s__Units_Y(u)
            call s__Units_Pause(u,true)
            call s__Units_PositionEnabled(u,false)
            call s__Units_AnimeId(u,10)
            set s___Data_c[s__Data_c[data]+1]=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A015' , 0 , x , y , 0 , 10 , 1.5 , 1 , "stand" , "dark4_fast.mdl")
            call s__Util_Duang(x , y , 2 , 250 , 250 , - 78 , 0.02 , 50)
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_c[s__Data_c[data]+2]=e
            if ( s__Spell_State[e] == s__Spell_SpellState ) then
                set s___Data_i[s__Data_i[data]]=20
            else
                set s___Data_i[s__Data_i[data]]=1
            endif
            set s___Data_i[s__Data_i[data]+1]=0
            set s___Data_r[s__Data_r[data]]=2
            set s___Data_r[s__Data_r[data]+1]=x
            set s___Data_r[s__Data_r[data]+2]=y
            set s___Data_r[s__Data_r[data]+3]=0
            call SetTimerData(t , data)
            call TimerStart(t, 0.02, true, function s__BlackSaber__BlackSaber_anon__78)
    return true
endfunction
function sa___prototype1_s__BlackSaber__BlackSaber_R takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer dash
            local integer data=s__Data_create('A012')
            call s__Units_Pause(u,true)
            call s__Units_AnimeId(u,17)
            call s__Units_AnimeSpeed(u,2.5)
            call s__Units_AddAbility(u,'A013')
            call s__Units_SetF(u,s__Spell_Angle[e] , true)
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_c[s__Data_c[data]+1]=e
            set s___Data_i[s__Data_i[data]]=0
            call s__Units_SetH(s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A012' , 0 , s__Units_X(u) , s__Units_Y(u) , s__Spell_Angle[e] , 2.5 , 0.5 , 1 , "stand" , "cf2.mdl"),70)
            set dash=s__Dash_Start(s__Units_unit[u] , s__Spell_Angle[e] , 1000 , s__Dash_SUB , 80 , true , false)
            set s__Dash_Obj[dash]=data
            set s__Dash_onMove[dash]=(17)
            set s__Dash_onEnd[dash]=(18)
    return true
endfunction
function sa___prototype1_s__BlackSaber__BlackSaber_Q takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer dash
            call s__Units_Pause(u,true)
            call s__Units_AnimeId(u,3)
            call s__Units_AnimeSpeed(u,1)
            set dash=s__Dash_Start(s__Units_unit[u] , s__Spell_Angle[e] , 1000 , s__Dash_ADD , 70 , true , false)
            set s__Dash_Obj[dash]=e
            set s__Dash_onMove[dash]=(21)
            set s__Dash_onEnd[dash]=(22)
    return true
endfunction
function sa___prototype1_s__BlackSaber__BlackSaber_W takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer mj
            local integer dash
            local real x=s__Units_X(u) + 50 * CosBJ(s__Spell_Angle[e])
            local real y=s__Units_Y(u) + 50 * SinBJ(s__Spell_Angle[e])
            call s__Units_Pause(u,true)
            call s__Units_AnimeId(u,14)
            call s__Units_Pause(u,false)
            set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00V' , 0 , x , y , s__Spell_Angle[e] , 10 , 1 , 1 , "stand" , "dark4_fast.mdl")
            set dash=s__Dash_Start(s__Units_unit[mj] , s__Spell_Angle[e] , 450 , s__Dash_SUB , 40 , true , false)
            set s__Dash_onMove[dash]=(19)
            set s__Dash_onEnd[dash]=(20)
            call s__Spell_Destroy(e)
    return true
endfunction
function sa___prototype1_s__BlackSaber__BlackSaber_E takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer data=s__Data_create('A00X')
            local timer t=NewTimer()
            call s__Units_Pause(u,true)
            call s__Units_AnimeId(u,16)
            call s__Units_AnimeSpeed(u,3.5)
            call s__Units_AddAbility(u,'A00Z')
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_c[s__Data_c[data]+1]=e
            set s___Data_i[s__Data_i[data]]=0
            set s___Data_r[s__Data_r[data]]=0
            set s___Data_r[s__Data_r[data]+1]=0
            set s___Data_r[s__Data_r[data]+2]=0
            call SetTimerData(t , data)
            call s__Dash_Start(s__Units_unit[u] , s__Units_F(u) , 300 , s__Dash_SUB , 10 , true , false)
            call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00X' , 0 , s__Units_X(u) , s__Units_Y(u) , 0 , 2 , 0.4 , 1 , "stand" , "white-qiquan.mdl")
            call TimerStart(t, 0.01, true, function s__BlackSaber__BlackSaber_anon__84)
            set t=null
    return true
endfunction
function sa___prototype1_s__BlackSaber__BlackSaber_HERO_START takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            if ( s__Spell_Id[e] == 'A00V' ) then
                call s__Units_AnimeSpeed(u,1.75)
                call s__Units_FlushAnimeId(u,7)
                call s__Spell_Destroy(e)
            endif
            if ( s__Spell_Id[e] == 'A00X' ) then
                if ( s__Units_IsAbility(u,'B005') == false ) then
                    call s__Units_FlushAnimeId(u,15)
                    call s__Spell_Destroy(e)
                elseif ( s__Units_MP(u) >= 150 ) then
                    if ( s__Units_GetAbilityCD(u,'A00X') == 0 ) then
                        call SpellNameText(s__Units_unit[u] , "! 炎焱斩 !" , 3 , 15)
                        call s__Units_SetMP(u,s__Units_MP(u) - 150)
                        call s__Units_SetAbilityCD(u,'A00X' , 15)
                        call s__BlackSaber__BlackSaber_E(e)
                    else
                        call s__Spell_Destroy(e)
                    endif
                else
                    call s__Spell_Destroy(e)
                endif
            endif
            if ( s__Spell_Id[e] == 'A015' ) then
                if ( s__Units_IsAbility(u,'B007') == false ) then
                    call s__Units_FlushAnimeId(u,10)
                    call s__Spell_Destroy(e)
                elseif ( s__Units_MP(u) >= 250 ) then
                    if ( s__Units_GetAbilityCD(u,'A015') == 0 ) then
                        call SpellText(s__Units_unit[u] , 'A015' , 3 , 15)
                        call s__Units_SetMP(u,s__Units_MP(u) - 250)
                        call s__Units_SetAbilityCD(u,'A015' , 25)
                        call s__BlackSaber__BlackSaber_D(e)
                    else
                        call s__Spell_Destroy(e)
                    endif
                else
                    call s__Spell_Destroy(e)
                endif
            endif
    return true
endfunction
function sa___prototype1_s__BlackSaber__BlackSaber_HERO_STOP takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            if ( s__Spell_Id[e] == 'A00V' or s__Spell_Id[e] == 'A015' ) then
                call s__Units_AnimeSpeed(u,1)
            endif
            call s__Spell_Destroy(e)
    return true
endfunction
function sa___prototype46_s__BlackSaber__BlackSaber_Spawn takes nothing returns boolean
 local integer u=f__arg_integer1
 local integer m=f__arg_integer2

            if ( s__Units_IsAbility(u,'A015') == true ) then
                set s__Units_ai[u]=(1)
            endif
    return true
endfunction
function sa___prototype32_s__DazzleMaster___DazzleMaster_AI takes nothing returns boolean
    call s__DazzleMaster___DazzleMaster_AI(f__arg_unit1)
    return true
endfunction
function sa___prototype1_s__DazzleMaster___DazzleMaster_anon__37 takes nothing returns boolean
 local integer b=f__arg_integer1

                local integer data=(s__Units_Obj[s__Units_Get(s__Buffs_Unit[b])])
                call SetUnitMoveSpeed(s__Buffs_Unit[b], GetUnitMoveSpeed(s__Buffs_Unit[b]) - s___Data_r[s__Data_r[data]])
                call SetUnitState(s__Buffs_Unit[b], ConvertUnitState(0x51), GetUnitState(s__Buffs_Unit[b], ConvertUnitState(0x51)) - s___Data_r[s__Data_r[data]+1])
                set s___Data_r[s__Data_r[data]]=0
                set s___Data_r[s__Data_r[data]+1]=0
    return true
endfunction
function sa___prototype1_s__DazzleMaster___DazzleMaster_anon__38 takes nothing returns boolean
 local integer dash=f__arg_integer1

                local integer u=s__Units_Get(s__Dash_Unit[dash])
                call s__Units_SetH(u,50 + ( R2I(s__Dash_Obj[dash]) * ( 1 - s__Util_GetPwx(3.99 , s__Dash_NowDis[dash] / 2 , s__Dash_MaxDis[dash]) ) ))
    return true
endfunction
function sa___prototype1_s__DazzleMaster___DazzleMaster_anon__39 takes nothing returns boolean
 local integer dash=f__arg_integer1

                local integer u=s__Units_Get(s__Dash_Unit[dash])
                local integer tmp
                local real x=s__Units_X(u)
                local real y=s__Units_Y(u)
                local real dmg=( s__Units_Str(s__Players_hero[s__Units_player[u]],true) * 0.4 ) + ( s__Units_Int(s__Players_hero[s__Units_player[u]],true) * 0.8 )
                local integer id=s__Units_aidindex[u] - 10
                call s__Units_Life(u,1)
                call s__Units_AnimeSpeed(u,2)
                call s__Units_Anime(u,"death") //无
                if ( id == 0 ) then
                    call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A008' , 66 , x , y , 0 , 2 , 1 , 2 , "stand" , "ball_nothing_kc.mdx")
                    call GroupEnumUnitsInRange(tmp_group, x, y, 150, Condition(function GroupIsAliveNotAloc))
                    loop
                    exitwhen ( FirstOfGroup(tmp_group) == null )
                        set tmp=s__Units_Get(FirstOfGroup(tmp_group))
                        call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
                        if ( IsUnitEnemy(s__Units_unit[tmp], s__Players_player[s__Units_player[u]]) == true ) then
                            call DestroyEffect(AddSpecialEffectTarget("Abilities\\Weapons\\GlaiveMissile\\GlaiveMissile.mdl", s__Units_unit[tmp], "chest"))
                            call s__Units_Damage(u,s__Units_unit[tmp] , s__Damage_Magic , 'A008' , dmg)
                        endif
                    endloop
                    call GroupClear(tmp_group)
                endif //光
                if ( id == 1 ) then
                    call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A008' , 66 , x , y , 0 , 2 , 1 , 2 , "stand" , "ball_light_kc.mdx")
                    if ( GroupFind(s__Units_unit[u] , x , y , 200 , false , false) != null ) then
                        set tmp=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A008' , 66 , x , y , 0 , 4 , 1.5 , 1.3 , "death" , "OrbOfLightning.mdx")
                        call s__Units_SetH(tmp,50)
                        call GroupEnumUnitsInRange(tmp_group, x, y, 200, Condition(function GroupIsAliveNotAloc))
                        loop
                        exitwhen ( FirstOfGroup(tmp_group) == null )
                            set tmp=s__Units_Get(FirstOfGroup(tmp_group))
                            call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
                            if ( IsUnitEnemy(s__Units_unit[tmp], s__Players_player[s__Units_player[u]]) == true ) then
                                call s__Units_Damage(u,s__Units_unit[tmp] , s__Damage_Chaos , 'A008' , dmg)
                                call s__HitFlys_Add(s__Units_unit[tmp] , 10)
                                call s__Buffs_Skill(s__Units_unit[tmp] , 'A00Y' , 1)
                                call s__Buffs_AllRemove(s__Units_unit[tmp] , s__Buffs_TYPE_ADD + s__Buffs_TYPE_DISPEL_TRUE)
                            endif
                        endloop
                        call GroupClear(tmp_group)
                    endif
                endif //冰
                if ( id == 2 ) then
                    call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A008' , 66 , x , y , 0 , 2 , 1 , 2 , "stand" , "ball_ice_kc.mdx")
                    if ( GroupFind(s__Units_unit[u] , x , y , 150 , false , false) != null ) then
                        set tmp=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A008' , 66 , x , y , 0 , 2 , 2 , 1 , "death" , "Abilities\\Weapons\\FrostWyrmMissile\\FrostWyrmMissile.mdl")
                        call s__Units_SetH(tmp,50)
                        set tmp=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A008' , 66 , x , y , 0 , 2 , 2 , 1 , "death" , "Abilities\\Weapons\\LichMissile\\LichMissile.mdl")
                        call s__Units_SetH(tmp,50)
                        call GroupEnumUnitsInRange(tmp_group, x, y, 150, Condition(function GroupIsAliveNotAloc))
                        loop
                        exitwhen ( FirstOfGroup(tmp_group) == null )
                            set tmp=s__Units_Get(FirstOfGroup(tmp_group))
                            call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
                            if ( IsUnitEnemy(s__Units_unit[tmp], s__Players_player[s__Units_player[u]]) == true ) then
                                call s__Units_Damage(u,s__Units_unit[tmp] , s__Damage_Magic , 'A008' , dmg)
                                set s__Buffs_Type[s__Buffs_Add(s__Units_unit[tmp] , 'A00I' , 'B003' , 2 , false)]=s__Buffs_TYPE_SUB + s__Buffs_TYPE_DISPEL_TRUE
                                call DestroyEffect(AddSpecialEffectTarget("Abilities\\Weapons\\ZigguratFrostMissile\\ZigguratFrostMissile.mdl", s__Units_unit[tmp], "chest"))
                            endif
                        endloop
                        call GroupClear(tmp_group)
                    endif
                endif //火
                if ( id == 3 ) then
                    call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A008' , 66 , x , y , 0 , 2 , 1 , 2 , "stand" , "ball_fire_kc.mdx")
                    if ( GroupFind(s__Units_unit[u] , x , y , 200 , false , false) != null ) then
                        set tmp=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A008' , 66 , x , y , 0 , 2 , 2.5 , 1 , "death" , "Abilities\\Weapons\\LordofFlameMissile\\LordofFlameMissile.mdl")
                        call s__Units_SetH(tmp,50)
                        set tmp=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A008' , 66 , x , y , 0 , 2 , 2 , 1 , "death" , "Abilities\\Weapons\\RedDragonBreath\\RedDragonMissile.mdl")
                        call s__Units_SetH(tmp,50)
                        set tmp=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A008' , 66 , x , y , 0 , 2 , 1.5 , 2 , "death" , "Abilities\\Weapons\\FragDriller\\FragDriller.mdl")
                        call s__Units_SetH(tmp,50)
                        call GroupEnumUnitsInRange(tmp_group, x, y, 200, Condition(function GroupIsAliveNotAloc))
                        loop
                        exitwhen ( FirstOfGroup(tmp_group) == null )
                            set tmp=s__Units_Get(FirstOfGroup(tmp_group))
                            call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
                            if ( IsUnitEnemy(s__Units_unit[tmp], s__Players_player[s__Units_player[u]]) == true ) then
                                call s__Units_Damage(u,s__Units_unit[tmp] , s__Damage_Magic , 'A008' , dmg)
                                call DestroyEffect(AddSpecialEffectTarget("Environment\\NightElfBuildingFire\\ElfLargeBuildingFire1.mdl", s__Units_unit[tmp], "chest"))
                                call s__Dash_Start(s__Units_unit[tmp] , s__Util_XYEX(x , y , s__Units_X(tmp) , s__Units_Y(tmp)) , 350 - s__Util_XY2EX(x , y , s__Units_X(tmp) , s__Units_Y(tmp)) , s__Dash_SUB , 30 , true , false)
                            endif
                        endloop
                        call GroupClear(tmp_group)
                    endif
                endif //暗
                if ( id == 4 ) then
                    call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A008' , 66 , x , y , 0 , 2 , 1 , 2 , "stand" , "ball_dark_kc.mdx")
                    if ( GroupFind(s__Units_unit[u] , x , y , 300 , false , false) != null ) then
                        set tmp=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A008' , 66 , x , y , 0 , 0.42 , 2.5 , 1.75 , "death" , "dark.mdx")
                        call s__Units_SetH(tmp,50)
                        call s__Units_SetH(u,150) //tmp=Units.MJ(u.player.player,'e008','A008',66,x,y,0,0.4,1.5,2, "stand","dark1.mdx");
                        call GroupEnumUnitsInRange(tmp_group, x, y, 300, Condition(function GroupIsAliveNotAloc))
                        loop
                        exitwhen ( FirstOfGroup(tmp_group) == null )
                            set tmp=s__Units_Get(FirstOfGroup(tmp_group))
                            call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
                            if ( IsUnitEnemy(s__Units_unit[tmp], s__Players_player[s__Units_player[u]]) == true ) then
                                call DestroyEffect(AddSpecialEffectTarget("Abilities\\Weapons\\AvengerMissile\\AvengerMissile.mdl", s__Units_unit[tmp], "chest"))
                                call s__Units_Damage(u,s__Units_unit[tmp] , s__Damage_Chaos , 'A008' , dmg)
                                call s__HitFlys_Add(s__Units_unit[tmp] , 20)
                                call s__Dash_Start(s__Units_unit[tmp] , s__Util_XY(s__Units_unit[tmp] , s__Units_unit[u]) , s__Util_XY2(s__Units_unit[tmp] , s__Units_unit[u]) , s__Dash_ADD , 40 , true , false)
                            endif
                        endloop
                        call GroupClear(tmp_group)
                    endif
                endif
    return true
endfunction
function sa___prototype1_s__DazzleMaster___DazzleMaster_anon__44 takes nothing returns boolean
 local integer dash=f__arg_integer1

                            local integer data=(s__Dash_Obj[dash])
                            local integer u=s__Units_Get(s__Dash_Unit[dash])
                            call s__Units_Position((s___Data_c[s__Data_c[data]]),s___Data_r[s__Data_r[data]+3] , s___Data_r[s__Data_r[data]+4] , false)
                            call s__Units_SetH(u,200 * ( 1 - ( s__Dash_NowDis[dash] / s__Dash_MaxDis[dash] ) ))
    return true
endfunction
function sa___prototype1_s__DazzleMaster___DazzleMaster_anon__45 takes nothing returns boolean
 local integer dash=f__arg_integer1

                            local integer data=(s__Dash_Obj[dash])
                            local integer u=(s___Data_c[s__Data_c[data]])
                            local integer tmp=s__Units_Get(s__Dash_Unit[dash])
                            call s__Units_SetH(tmp,0)
                            set s___Data_i[s__Data_i[data]+1]=s___Data_i[s__Data_i[data]+1] - 1
                            call s__Buffs_Skill(s__Units_unit[tmp] , 'A00F' , 1)
                            call s__Units_Damage(u,s__Units_unit[tmp] , s__Damage_Physics , 'A00E' , s__Units_Str(u,true) * 18.0)
                            if ( s___Data_i[s__Data_i[data]] == 0 ) then
                                set s___Data_i[s__Data_i[data]]=1
                                call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00E' , 0 , s___Data_r[s__Data_r[data]+1] , s___Data_r[s__Data_r[data]+2] , 0 , 2 , 1 , 1 , "stand" , "tx.mdx")
                                call s__Util_Duang(s___Data_r[s__Data_r[data]+1] , s___Data_r[s__Data_r[data]+2] , 0.5 , 200 , 200 , - 75 , 0.02 , 50)
                            endif
                            if ( s___Data_i[s__Data_i[data]+1] == 0 ) then
                                call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                                call s__Data_Destroy(data)
                                call s__Units_PositionEnabled(u,true)
                                call s__Units_DelayReleaseAnimePause(u,0.2)
                            endif
    return true
endfunction
function sa___prototype1_s__DazzleMaster___DazzleMaster_anon__42 takes nothing returns boolean
 local integer dash=f__arg_integer1

                        local integer u=s__Units_Get(s__Dash_Unit[dash])
                        call s__Units_SetH(u,200 * ( s__Dash_NowDis[dash] / s__Dash_MaxDis[dash] ))
    return true
endfunction
function sa___prototype1_s__DazzleMaster___DazzleMaster_anon__47 takes nothing returns boolean
 local integer dash=f__arg_integer1

                    local integer data=(s__Dash_Obj[dash])
                    local integer u=(s___Data_c[s__Data_c[data]])
                    local integer mj=(s___Data_c[s__Data_c[data]+1])
                    local integer tmp
                    call s__Units_SetF(u,s__Dash_Angle[dash] , true)
                    call s__Units_Position(mj,s__Dash_X[dash] + 150 * CosBJ(s__Dash_Angle[dash] + 180) , s__Dash_LastY[dash] + 150 * SinBJ(s__Dash_Angle[dash] + 180) , false)
                    call s__Units_SetF(mj,s__Dash_Angle[dash] , true)
                    call GroupEnumUnitsInRange(tmp_group, s__Dash_X[dash] + 140 * CosBJ(s__Dash_Angle[dash]), s__Dash_Y[dash] + 140 * SinBJ(s__Dash_Angle[dash]), 100, Condition(function GroupIsAliveNotAloc))
                    loop
                    exitwhen ( FirstOfGroup(tmp_group) == null )
                        set tmp=s__Units_Get(FirstOfGroup(tmp_group))
                        call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
                        if ( IsUnitEnemy(s__Units_unit[tmp], s__Players_player[s__Units_player[u]]) == true and IsUnitInGroup(s__Units_unit[tmp], s___Data_g[s__Data_g[data]]) == false ) then
                            call GroupAddUnit(s___Data_g[s__Data_g[data]], s__Units_unit[tmp])
                            call s__Units_Damage(u,s__Units_unit[tmp] , s__Damage_Chaos , 'A00D' , s__Units_Agi(u,true) * ( 12 * ( s___Data_r[s__Data_r[data]] * 2.5 ) ))
                            call DestroyEffect(AddSpecialEffectTarget("hit_b.mdx", s__Units_unit[tmp], "chest"))
                            call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl", s__Units_X(tmp), s__Units_Y(tmp)))
                            call s__Dash_Start(s__Units_unit[tmp] , s__Dash_Angle[dash] , 350 + ( s___Data_r[s__Data_r[data]] * 2 ) * 50 , s__Dash_SUB , 15 + ( 15 * s___Data_r[s__Data_r[data]] ) , true , true)
                            if ( s___Data_i[s__Data_i[data]] == 0 ) then
                                set s___Data_i[s__Data_i[data]]=1
                                call s__DazzleMaster___DazzleMaster_AddDazzle(s__Units_unit[u] , 3)
                            endif
                        endif
                    endloop
                    call GroupClear(tmp_group)
    return true
endfunction
function sa___prototype1_s__DazzleMaster___DazzleMaster_anon__48 takes nothing returns boolean
 local integer dash=f__arg_integer1

                    local integer data=(s__Dash_Obj[dash])
                    local integer u=(s___Data_c[s__Data_c[data]])
                    local integer mj=(s___Data_c[s__Data_c[data]+1])
                    call s__Spell_Destroy((s___Data_c[s__Data_c[data]+2]))
                    call s__Units_SetF(u,s__Dash_Angle[dash] , true)
                    call s__Units_Anime(mj,"death")
                    call s__Units_Life(mj,1)
                    call GroupClear(s___Data_g[s__Data_g[data]])
                    call DestroyGroup(s___Data_g[s__Data_g[data]])
                    set s___Data_g[s__Data_g[data]]=null
                    call s__Units_AnimeSpeed(u,1)
                    call s__Units_Pause(u,false)
                    call s__Data_Destroy(data)
    return true
endfunction
function sa___prototype1_s__DazzleMaster___DazzleMaster_anon__49 takes nothing returns boolean
 local integer dash=f__arg_integer1

                local integer data=(s__Dash_Obj[dash])
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
                    if ( GroupFind(s__Units_unit[u] , x , y , 200 , false , false) != null ) then
                        if ( s___Data_i[s__Data_i[data]] == 0 ) then
                            set s___Data_i[s__Data_i[data]]=1
                            call s__Units_Pause(u,false)
                        endif
                        call s__Buffs_Add(s__Units_unit[u] , 'A011' , 'B006' , 0.5 , false)
                        call GroupEnumUnitsInRange(tmp_group, x, y, 200, Condition(function GroupIsAliveNotAloc))
                        call s__DazzleMaster___DazzleMaster_AddDazzle(s__Units_unit[u] , 2) //刀光特效版          
                        set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00B' , 0 , s__Units_X(u) , s__Units_Y(u) , s__Dash_Angle[dash] , 0.6 , 0.8 , 1.5 , "birth" , "dg.mdx")
                        call s__Units_SetH(mj,100)
                        call s__Dash_Start(s__Units_unit[mj] , s__Dash_Angle[dash] , 200 , s__Dash_ADD , 80 , true , false) //---
                        set tmp=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e009' , 'A002' , 0 , s__Dash_X[dash] , s__Dash_Y[dash] , s__Dash_Angle[dash] , 2 , 2.5 , 2 , "stand" , "wind.mdx")
                        call s__Units_SetH(tmp,200)
                        call s__Dash_Start(s__Units_unit[tmp] , s__Dash_Angle[dash] + 180 , 450 , s__Dash_SUB , 60 , true , false)
                        loop
                        exitwhen ( FirstOfGroup(tmp_group) == null )
                            set tmp=s__Units_Get(FirstOfGroup(tmp_group))
                            call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
                            if ( IsUnitEnemy(s__Units_unit[tmp], s__Players_player[s__Units_player[u]]) == true ) then
                                call s__Buffs_Skill(s__Units_unit[tmp] , 'A00C' , 1)
                                call s__Units_Damage(u,s__Units_unit[tmp] , s__Damage_Physics , 'A00B' , s__Units_Agi(u,true) * 6 + s__Units_Str(u,true) * 6)
                                call s__Dash_Start(s__Units_unit[tmp] , s__Dash_Angle[dash] , 300 , s__Dash_SUB , 90 , true , true)
                                call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl", s__Units_unit[tmp], "chest"))
                            endif
                        endloop
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
function sa___prototype1_s__DazzleMaster___DazzleMaster_anon__50 takes nothing returns boolean
 local integer dash=f__arg_integer1

                local integer data=(s__Dash_Obj[dash])
                local integer u=s__Units_Get(s__Dash_Unit[dash])
                if ( s___Data_i[s__Data_i[data]] == 0 ) then
                    call s__Units_Pause(u,false)
                endif
                call s__Units_Alpha(u,255)
                call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                call s__Data_Destroy(data)
    return true
endfunction
function sa___prototype1_s__DazzleMaster___DazzleMaster_anon__51 takes nothing returns boolean
 local integer dash=f__arg_integer1

                local integer data=(s__Dash_Obj[dash])
                local integer du=s__Units_Get(s__Dash_Unit[dash])
                local integer u=(s___Data_c[s__Data_c[data]])
                local integer tmp
                call s__Units_Position(u,s__Units_X(du) , s__Units_Y(du) , false)
                call GroupEnumUnitsInRange(tmp_group, s__Units_X(u) + 100 * CosBJ(s__Dash_Angle[dash]), s__Units_Y(u) + 100 * SinBJ(s__Dash_Angle[dash]), 90, Condition(function GroupIsAliveNotAloc))
                loop
                exitwhen ( FirstOfGroup(tmp_group) == null )
                    set tmp=s__Units_Get(FirstOfGroup(tmp_group))
                    call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
                    if ( IsUnitEnemy(s__Units_unit[tmp], s__Players_player[s__Units_player[u]]) == true and IsUnitInGroup(s__Units_unit[tmp], s___Data_g[s__Data_g[data]]) == false ) then
                        call GroupAddUnit(s___Data_g[s__Data_g[data]], s__Units_unit[tmp])
                        call s__Buffs_Skill(s__Units_unit[tmp] , 'A00A' , 1)
                        call s__HitFlys_Add(s__Units_unit[tmp] , 25)
                        call s__Units_Damage(u,s__Units_unit[tmp] , s__Damage_Magic , 'A009' , s__Units_Agi(u,true) * 3 + s__Units_Str(u,true) * 4)
                        call DestroyEffect(AddSpecialEffectTarget("bd2d2.mdx", s__Units_unit[tmp], "chest"))
                        if ( s__Dash_NowDis[dash] < 400 ) then
                            call s__Dash_Start(s__Units_unit[tmp] , s__Dash_Angle[dash] , 500 - s__Dash_NowDis[dash] , s__Dash_SUB , 90 , true , true)
                        endif
                        if ( s___Data_i[s__Data_i[data]] == 0 ) then
                            set s___Data_i[s__Data_i[data]]=1
                            call s__DazzleMaster___DazzleMaster_AddDazzle(s__Units_unit[u] , 1)
                        endif
                    endif
                endloop
                call GroupClear(tmp_group)
                if ( s__Dash_Speed[dash] > 15 and s__Dash_Speed[dash] < 40 ) then
                    if ( s___Data_i[s__Data_i[data]+1] == 0 ) then
                        set s___Data_i[s__Data_i[data]+1]=1
                        call s__Units_Pause(u,false)
                    endif
                    call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl", s__Dash_X[dash], s__Dash_Y[dash]))
                endif
                if ( s__Dash_Speed[dash] < 1.5 ) then
                    call s__Dash_Stop(dash)
                endif
    return true
endfunction
function sa___prototype1_s__DazzleMaster___DazzleMaster_anon__52 takes nothing returns boolean
 local integer dash=f__arg_integer1

                local integer data=(s__Dash_Obj[dash])
                local integer u=(s___Data_c[s__Data_c[data]])
                call DestroyGroup(s___Data_g[s__Data_g[data]])
                set s___Data_g[s__Data_g[data]]=null
                call s__Units_Remove(s__Units_unit[(s___Data_c[s__Data_c[data]+2])])
                call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                call s__Units_Alpha(u,255)
                if ( s___Data_i[s__Data_i[data]+1] == 0 ) then
                    call s__Units_Pause(u,false)
                endif
                call s__Data_Destroy(data)
    return true
endfunction
function sa___prototype1_s__DazzleMaster___DazzleMaster_D takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer data=(s__Units_Obj[u])
            local integer first=s__Units_Get(GroupFirst(s___Data_g[s__Data_g[data]]))
            local integer dash
            local real cd
            local real x=s__Units_X(first)
            local real y=s__Units_Y(first)
            local real h=s__Units_H(first)
            local integer id
            set id=s__Units_aidindex[first]
            call s__Units_Kill(s__Units_unit[first])
            if ( x == 0 ) then
                call BJDebugMsg(s__Units_name[first] + R2S(x) + "/" + R2S(y) + ":::" + R2S(s__Spell_X[e]) + "/" + R2S(s__Spell_Y[e]) + "/类型：" + I2S(id) + "/炫纹组：" + I2S(GroupNumber(s___Data_g[s__Data_g[data]])))
                call BJDebugMsg("---这是一条错误提示,如果提示了这个提示,请保存录像并联系作者")
            endif
            call TextForPlayer(s__Players_player[s__Units_player[u]] , s__Units_unit[u] , s__s__DazzleMaster___DazzleMaster_DazzleName[s__Units_aidindex[first]] + "!" , 0.8 , 14 , 300)
            set s__Buffs_onEnd[s__Buffs_Add(s__Units_unit[u] , 'A00G' , 'B002' , 5 , false)]=(30)
            if ( s___Data_r[s__Data_r[data]] < 80 ) then
                set s___Data_r[s__Data_r[data]]=s___Data_r[s__Data_r[data]] + 20
                call SetUnitMoveSpeed(s__Units_unit[u], GetUnitMoveSpeed(s__Units_unit[u]) + 20)
            endif
            if ( s___Data_r[s__Data_r[data]+1] < 1.2 ) then
                set s___Data_r[s__Data_r[data]+1]=s___Data_r[s__Data_r[data]+1] + 0.3
                call SetUnitState(s__Units_unit[u], ConvertUnitState(0x51), GetUnitState(s__Units_unit[u], ConvertUnitState(0x51)) + 0.3)
            endif
            set cd=s___Data_r[s__Data_r[data]] / 20
            call YDWESetUnitAbilityState(s__Units_unit[u] , 'A009' , 1 , YDWEGetUnitAbilityState(s__Units_unit[u] , 'A009' , 1) - cd)
            call YDWESetUnitAbilityState(s__Units_unit[u] , 'A00B' , 1 , YDWEGetUnitAbilityState(s__Units_unit[u] , 'A00B' , 1) - cd)
            call YDWESetUnitAbilityState(s__Units_unit[u] , 'A00D' , 1 , YDWEGetUnitAbilityState(s__Units_unit[u] , 'A00D' , 1) - cd)
            call YDWESetUnitAbilityState(s__Units_unit[u] , 'A00E' , 1 , YDWEGetUnitAbilityState(s__Units_unit[u] , 'A00E' , 1) - cd)
            set first=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A008' , id + 10 , x , y , 0 , 15 , 1.5 , 1 , "stand" , s__s__DazzleMaster___DazzleMaster_DazzlePath[id])
            call s__Units_SetH(first,h)
            call s__Units_Position(first,x , y , true)
            set id=s__Dash_ADD
            set dash=s__Dash_Start(s__Units_unit[first] , s__Util_XYEX(s__Units_X(first) , s__Units_Y(first) , s__Spell_X[e] , s__Spell_Y[e]) , s__Util_XY2EX(s__Units_X(first) , s__Units_Y(first) , s__Spell_X[e] , s__Spell_Y[e]) , id , 50 , true , false)
            set s__Dash_Obj[dash]=R2I(s__Units_H(first))
            set s__Dash_onMove[dash]=(31)
            set s__Dash_onEnd[dash]=(32)
            call s__Spell_Destroy(e)
    return true
endfunction
function sa___prototype1_s__DazzleMaster___DazzleMaster_Q takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer dash
            local integer data=s__Data_create('A009')
            local integer ts
            call s__Units_Pause(u,true)
            call s__Units_Alpha(u,0)
            call s__Units_AnimeId(u,6)
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_c[s__Data_c[data]+1]=e
            set s___Data_i[s__Data_i[data]]=0
            set s___Data_g[s__Data_g[data]]=CreateGroup()
            set ts=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00B' , 0 , s__Units_X(u) , s__Units_Y(u) , s__Spell_Angle[e] , 10 , 1 , 0.7 , "stand" , "kiyohime_lancer.mdl")
            call s__Units_AnimeId(ts,6)
            call s__Units_AnimeSpeed(ts,0.7)
            set s___Data_c[s__Data_c[data]+2]=ts
            set s___Data_i[s__Data_i[data]+1]=0
            call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00B' , 0 , s__Units_X(u) , s__Units_Y(u) , s__Spell_Angle[e] , 4 , 1 , 2.5 , "stand" , "dust2.mdx")
            set dash=s__Dash_Start(s__Units_unit[ts] , s__Spell_Angle[e] , 600 , s__Dash_SUB , 60 , true , false)
            set s__Dash_Obj[dash]=data
            set s__Dash_onMove[dash]=(40)
            set s__Dash_onEnd[dash]=(41)
    return true
endfunction
function sa___prototype1_s__DazzleMaster___DazzleMaster_W takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer dash
            local integer data=s__Data_create('A00B')
            call s__Units_Pause(u,true)
            call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00B' , 0 , s__Units_X(u) , s__Units_Y(u) , s__Spell_Angle[e] , 2 , 1.5 , 2 , "stand" , "dust2.mdx")
            call s__Util_Duang(s__Units_X(u) , s__Units_Y(u) , 0.3 , 200 , 200 , - 48 , 0.04 , 100)
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_c[s__Data_c[data]+1]=e
            set s___Data_i[s__Data_i[data]]=0
            set dash=s__Dash_Start(s__Units_unit[u] , s__Spell_Angle[e] , 250 , s__Dash_SUB , 40 , true , false)
            set s__Dash_Obj[dash]=data
            set s__Dash_onMove[dash]=(38)
            set s__Dash_onEnd[dash]=(39)
    return true
endfunction
function sa___prototype1_s__DazzleMaster___DazzleMaster_E takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer data=s__Data_create('A00D')
            local timer t=NewTimer()
            call s__Units_Pause(u,true)
            call s__Units_AnimeId(u,16)
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_c[s__Data_c[data]+2]=e
            set s___Data_r[s__Data_r[data]]=0
            set s___Data_i[s__Data_i[data]+3]=2
            if ( s__Players_isai[s__Units_player[u]] == true ) then
                set s___Data_r[s__Data_r[data]]=2
            endif
            call SetTimerData(t , data)
            call TimerStart(t, 0.1, true, function s__DazzleMaster___DazzleMaster_anon__46)
            set t=null
    return true
endfunction
function sa___prototype1_s__DazzleMaster___DazzleMaster_R takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            local timer t=NewTimer()
            local integer data=s__Data_create('A00E')
            call s__Units_Pause(u,true)
            call s__Units_PositionEnabled(u,false)
            call s__Units_AnimeId(u,18)
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_c[s__Data_c[data]+1]=e
            call SetTimerData(t , data)
            call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00E' , 0 , s__Units_X(u) , s__Units_Y(u) , 0 , 2 , 0.5 , 0.75 , "stand" , "white-qiquan.mdl")
            call TimerStart(t, 0.25, false, function s__DazzleMaster___DazzleMaster_anon__40)
            set t=null
    return true
endfunction
function sa___prototype1_s__DazzleMaster___DazzleMaster_HERO_START takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            if ( s__Spell_Id[e] == 'A009' ) then
                if ( s__Units_IsAbility(u,'B006') == false ) then
                    call s__Units_FlushAnimeId(u,5)
                    call s__Spell_Destroy(e)
                elseif ( s__Units_MP(u) >= 100 ) then
                    if ( s__Units_GetAbilityCD(u,'A009') == 0 ) then
                        call SpellNameText(s__Units_unit[u] , "! 龙牙击 !" , 3 , 15)
                        call s__Units_SetMP(u,s__Units_MP(u) - 100)
                        call s__Units_SetAbilityCD(u,'A009' , 10)
                        call sc__DazzleMaster___DazzleMaster_Q(e)
                    else
                        call s__Spell_Destroy(e)
                    endif
                else
                    call s__Spell_Destroy(e)
                endif
            endif
    return true
endfunction
function sa___prototype1_s__DazzleMaster___DazzleMaster_HERO_STOP takes nothing returns boolean
 local integer e=f__arg_integer1

            call s__Spell_Destroy(e)
    return true
endfunction
function sa___prototype1_s__DazzleMaster___DazzleMaster_Attack takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer data
            if ( s__Units_IsAbility(s__DamageArgs_DamageUnit[e],'A008') == true and s__DamageArgs_DamageType[e] == s__Damage_Attack ) then
                set data=(s__Units_Obj[s__DamageArgs_DamageUnit[e]])
                if ( s___Data_i[s__Data_i[data]] == 2 ) then
                    set s___Data_i[s__Data_i[data]]=0
                    call sc__DazzleMaster___DazzleMaster_AddDazzle(s__Units_unit[s__DamageArgs_DamageUnit[e]] , 0)
                else
                    set s___Data_i[s__Data_i[data]]=s___Data_i[s__Data_i[data]] + 1
                endif
            endif
    return true
endfunction
function sa___prototype46_s__DazzleMaster___DazzleMaster_Spawn takes nothing returns boolean
 local integer u=f__arg_integer1
 local integer m=f__arg_integer2

            local timer t
            local integer data
            if ( s__Units_IsAbility(u,'A008') == true ) then
                set s__Units_ai[u]=(2)
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
                call TimerStart(t, 0.01, true, function s__DazzleMaster___DazzleMaster_anon__36)
                set t=null
            endif
    return true
endfunction
function sa___prototype46_s__DazzleMaster___DazzleMaster_Death takes nothing returns boolean
 local integer u=f__arg_integer1
 local integer m=f__arg_integer2

            local integer data
            if ( s__Units_aid[u] == 'A008' and s__Units_aidindex[u] >= 0 and s__Units_aidindex[u] <= 4 ) then
                set data=(s__Units_Obj[u])
                call GroupRemoveUnit(s___Data_g[s__Data_g[data]], s__Units_unit[u])
                call s__Units_RemoveObj(u)
            endif
    return true
endfunction
function sa___prototype35_s__KillUi_Show takes nothing returns boolean
 local player p=f__arg_player1
 local string e=f__arg_string1

            if ( e == "F2" ) then
                call DzFrameShow(s__KillUi_KillBackgroundMaxLine, true)
            endif
    return true
endfunction
function sa___prototype35_s__KillUi_Hide takes nothing returns boolean
 local player p=f__arg_player1
 local string e=f__arg_string1

            if ( e == "F2" ) then
                call DzFrameShow(s__KillUi_KillBackgroundMaxLine, false)
            endif
    return true
endfunction
function sa___prototype1_s__OrdinaryWizard___OrdinaryWizard_anon__29 takes nothing returns boolean
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
function sa___prototype1_s__OrdinaryWizard___OrdinaryWizard_anon__30 takes nothing returns boolean
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
                    call GroupDamage(u , x , y , 300 , s__Units_Int(s__Players_hero[s__Units_player[u]],true) * 20.0 , s__Damage_Magic , 'A006' , false)
                    if ( s__Players_lv10[s__Units_player[u]] != null ) then //是否触发E
                        call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A006' , 0 , x , y , 0 , 5 , 1 , 1.5 , "death" , "fire3.mdx")
                        set i=0
                        loop
                        exitwhen ( i >= 12 )
                            set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A005' , 0 , x , y , I2R(i) * 30 , 1.5 , 2.5 , 1 , "stand" , "Environment\\UndeadBuildingFire\\UndeadLargeBuildingFire1.mdl")
                            call s__Dash_Start(s__Units_unit[mj] , s__Units_F(mj) , 600 , s__Dash_SUB , 40 , true , false)
                        set i=i + 1
                        endloop
                    endif
                else
                    call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A006' , 0 , s__Units_X(u) , s__Units_Y(u) , s__Spell_Angle[e] , 2 , 2.5 , 1 , "death" , "Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile.mdl")
                    call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Human\\MarkOfChaos\\MarkOfChaosTarget.mdl", s__Units_X(u), s__Units_Y(u)))
                    call DzSetUnitModel(s__Units_unit[u], "units\\human\\HeroBloodElf\\HeroBloodElf.mdx")
                    if ( s__Units_Alive(u) == false ) then
                        call s__Units_Anime(u,"death")
                    endif
                endif
                call s__Units_SetH(u,0)
                call s__Units_AnimeSpeed(u,1)
                call s__Units_Pause(u,false)
                call s__Spell_Destroy(e)
                call s__Data_Destroy(data)
    return true
endfunction
function sa___prototype1_s__OrdinaryWizard___OrdinaryWizard_anon__32 takes nothing returns boolean
 local integer da=f__arg_integer1

                call s__Units_Anime(s__Units_Get(s__Dash_Unit[da]),"death")
    return true
endfunction
function sa___prototype1_s__OrdinaryWizard___OrdinaryWizard_anon__33 takes nothing returns boolean
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
function sa___prototype1_s__OrdinaryWizard___OrdinaryWizard_anon__34 takes nothing returns boolean
 local integer d=f__arg_integer1

                local integer u=(s__Dash_Obj[d])
                local integer tmp=s__Units_Get(s__Dash_Unit[d])
                local real dis
                local real f
                if ( s__Dash_NowDis[d] > 200 ) then
                    if ( s__Players_lv10[s__Units_player[u]] != null ) then //是否触发E
                        if ( s__Units_IsAbility(u,'B000') == false ) then
                            set dis=GetRandomReal(0, 150)
                            set f=GetRandomReal(0, 360)
                            call s__Buffs_Add(s__Units_unit[u] , 'A000' , 'B000' , 0.03 , false)
                            call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A005' , 0 , s__Units_X(tmp) + dis * CosBJ(f) , s__Units_Y(tmp) + dis * SinBJ(f) , f , 1.5 , 2.5 , 1 , "stand" , "Environment\\UndeadBuildingFire\\UndeadLargeBuildingFire1.mdl")
                        endif
                    endif
                    if ( GroupFind(s__Units_unit[u] , s__Units_X(tmp) , s__Units_Y(tmp) , 75 , false , false) != null ) then
                        call s__Dash_Stop(d)
                    endif
                endif
    return true
endfunction
function sa___prototype1_s__OrdinaryWizard___OrdinaryWizard_anon__35 takes nothing returns boolean
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
                    call GroupDamage(u , x , y , 250 , s__Units_Int(s__Players_hero[s__Units_player[u]],true) * 5.0 , s__Damage_Magic , 'A002' , false)
                    set u=(s__Dash_Obj[d])
                    if ( s__Players_lv10[s__Units_player[u]] != null ) then //是否触发E
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
function sa___prototype1_s__OrdinaryWizard___OrdinaryWizard_Q takes nothing returns boolean
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
            set s__Dash_onEnd[dash]=(52)
            set s__Dash_onMove[dash]=(53)
            call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl", x + 100 * CosBJ(f), y + 100 * SinBJ(f)))
            call DestroyEffect(AddSpecialEffectTarget("Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl", s__Units_unit[u], "hand right"))
            set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A002' , 2 , x + 100 * CosBJ(f) , y + 100 * SinBJ(f) , f , 1.5 , 2 , 1 , "stand" , "Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl")
            call s__Units_SetH(mj,120)
            call SetUnitPosition(s__Units_unit[mj], s__Units_X(mj), s__Units_Y(mj))
            set dash=s__Dash_Start(s__Units_unit[mj] , f , 1300 , s__Dash_ADD , 50 , true , false)
            set s__Dash_Obj[dash]=u
            set s__Dash_NowDis[dash]=10
            set s__Dash_onMove[dash]=(54)
            set s__Dash_onEnd[dash]=(55)
            call s__Units_AnimeSpeed(u,1)
            call s__Spell_Destroy(e)
    return true
endfunction
function sa___prototype1_s__OrdinaryWizard___OrdinaryWizard_W takes nothing returns boolean
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
            call TimerStart(t, 0.4, false, function s__OrdinaryWizard___OrdinaryWizard_anon__31)
            set t=null
    return true
endfunction
function sa___prototype1_s__OrdinaryWizard___OrdinaryWizard_R takes nothing returns boolean
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
            set s__Dash_onMove[dash]=(50)
            set s__Dash_onEnd[dash]=(51)
    return true
endfunction
function sa___prototype1_s__OrdinaryWizard___OrdinaryWizard_HERO_START takes nothing returns boolean
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
function sa___prototype1_s__OrdinaryWizard___OrdinaryWizard_HERO_STOP takes nothing returns boolean
 local integer e=f__arg_integer1

            call s__Units_AnimeSpeed(s__Units_Get(s__Spell_Spell[e]),1)
            call s__Spell_Destroy(e)
    return true
endfunction
function sa___prototype46_s__OrdinaryWizard___OrdinaryWizard_E takes nothing returns boolean
 local integer u=f__arg_integer1
 local integer m=f__arg_integer2

            if ( s__Units_aid[u] == 'A005' and s__Units_aidindex[u] == 0 ) then
                call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Other\\Doom\\DoomDeath.mdl", s__Units_X(u), s__Units_Y(u)))
                call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Other\\Incinerate\\FireLordDeathExplode.mdl", s__Units_X(u), s__Units_Y(u)))
                call GroupDamage(u , s__Units_X(u) , s__Units_Y(u) , 150 , s__Units_Int(s__Players_hero[s__Units_player[u]],true) * 2.0 , s__Damage_Magic , 0 , false)
            endif
    return true
endfunction
function sa___prototype1_s__SL__SL_anon__90 takes nothing returns boolean
 local integer dash=f__arg_integer1

                    local integer u=s__Units_Get(s__Dash_Unit[dash])
                    local real x=s__Units_X(u)
                    local real y=s__Units_Y(u)
                    local unit k
                    set k=GroupFind(s__Units_unit[u] , x , y , 100 , true , false)
                    if ( k != null ) then
                        set s__Dash_X[dash]=GetUnitX(k)
                        set s__Dash_Y[dash]=GetUnitY(k)
                        call s__Dash_Stop(dash)
                        set k=null
                    endif
    return true
endfunction
function sa___prototype1_s__SL__SL_anon__91 takes nothing returns boolean
 local integer dash=f__arg_integer1

                    local integer u=s__Units_Get(s__Dash_Unit[dash])
                    local timer t=NewTimer()
                    local integer data=s__Data_create('A00B')
                    local integer mj
                    call s__Units_Life(u,0.2)
                    if ( s__Dash_Obj[dash] == s__Spell_ReadyState ) then
                        call s__Units_SetH(s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A01B' , 0 , s__Dash_X[dash] , s__Dash_Y[dash] , 0 , 1 , 1.5 , 1 , "stand" , "blue-daoguang-new.mdl"),50)
                    endif
                    call s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A01B' , 0 , s__Dash_X[dash] , s__Dash_Y[dash] , 0 , 1 , 0.60 , 1 , "stand" , "white-qiquan.mdl")
                    set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A01B' , 0 , s__Dash_X[dash] , s__Dash_Y[dash] , 0 , 10 , 3 , 5 , "stand" , "cyz.mdl")
                    call s__Units_SetH(mj,150)
                    set s___Data_c[s__Data_c[data]]=mj
                    set s___Data_r[s__Data_r[data]]=0.4
                    call SetTimerData(t , data)
                    call TimerStart(t, 0.03, true, function s__SL__SL_anon__92)
                    set t=null
    return true
endfunction
function sa___prototype1_s__SL__SL_anon__89 takes nothing returns boolean
 local integer dash=f__arg_integer1

                local integer data=(s__Dash_Obj[dash])
                local integer u=(s___Data_c[s__Data_c[data]])
                local integer e=(s___Data_c[s__Data_c[data]+1])
                local real x=s__Dash_X[dash]
                local real y=s__Dash_Y[dash]
                local integer mj
                if ( s__Dash_Speed[dash] < 30 ) then
                    if ( s___Data_i[s__Data_i[data]] == 0 ) then
                        call s__Units_SetH(s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A01B' , 0 , x , y , s__Dash_Angle[dash] + 45 , 1 , 1.5 , 1.5 , "stand" , "dg4.mdl"),75)
                        set s___Data_i[s__Data_i[data]]=1
                        set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A01B' , 0 , x , y , s__Spell_Angle[e] , 10 , 0.75 , 1 , "stand" , ".mdl")
                        set dash=s__Dash_Start(s__Units_unit[mj] , s__Spell_Angle[e] , 1200 , s__Dash_NORMAL , 80 , true , false)
                        set s__Dash_Obj[dash]=s__Spell_State[e]
                        set s__Dash_onMove[dash]=(61)
                        set s__Dash_onEnd[dash]=(62)
                    endif
                endif
    return true
endfunction
function sa___prototype1_s__SL__SL_anon__93 takes nothing returns boolean
 local integer dash=f__arg_integer1

                local integer data=(s__Dash_Obj[dash])
                local integer u=(s___Data_c[s__Data_c[data]])
                if ( s__Spell_State[(s___Data_c[s__Data_c[data]+1])] == s__Spell_ReadyState ) then
                    call s__Units_AnimeSpeed(u,4)
                    call s__Units_DelayAlpha(u,0 , 255 , 0.1)
                    call s__Units_DelayReleaseAnimePause(u,0.2)
                else
                    call s__Units_DelayAlpha(u,0 , 255 , 0.7)
                    call s__Units_DelayReleaseAnimePause(u,0.8)
                endif
                call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                call s__Data_Destroy(data)
    return true
endfunction
function sa___prototype1_s__SL__SL_anon__95 takes nothing returns boolean
 local integer dash=f__arg_integer1

                    local integer u=s__Units_Get(s__Dash_Unit[dash])
                    local integer mj
                    if ( s__Dash_Speed[dash] < 4 ) then
                        if ( s__Units_aidindex[u] == 0 ) then
                            set s__Units_aidindex[u]=1
                            call s__Units_Life(u,0.5)
                            call s__Units_Anime(u,"death")
                        endif
                    elseif ( s__Dash_Obj[dash] == 0 ) then //12 
                        set s__Dash_Obj[dash]=2
                        call GroupEnumUnitsInRange(tmp_group, s__Dash_X[dash], s__Dash_Y[dash], 125, Condition(function GroupIsAliveNotAloc))
                        loop
                        exitwhen ( FirstOfGroup(tmp_group) == null )
                            set mj=s__Units_Get(FirstOfGroup(tmp_group))
                            call GroupRemoveUnit(tmp_group, s__Units_unit[mj])
                            if ( IsUnitEnemy(s__Units_unit[mj], s__Players_player[s__Units_player[u]]) == true ) then
                                call DestroyEffect(AddSpecialEffectTarget("hiteffect10white.mdl", s__Units_unit[mj], "chest"))
                                call s__Units_Damage(u,s__Units_unit[mj] , s__Damage_Magic , 'A01A' , s__Units_Agi(u,true) * 2)
                            endif
                        endloop
                        call GroupClear(tmp_group)
                    else
                        set s__Dash_Obj[dash]=s__Dash_Obj[dash] - 1
                    endif
    return true
endfunction
function sa___prototype1_s__SL__SL_anon__96 takes nothing returns boolean
 local integer dash=f__arg_integer1

                    local integer u=s__Units_Get(s__Dash_Unit[dash])
                    if ( s__Units_aidindex[u] == 0 ) then
                        call s__Units_Life(u,0.5)
                        call s__Units_Anime(u,"death")
                    endif
    return true
endfunction
function sa___prototype1_s__SL__SL_anon__104 takes nothing returns boolean
 local integer dash=f__arg_integer1

                            local integer data=(s__Dash_Obj[dash])
                            local integer u=(s___Data_c[s__Data_c[data]])
                            call SetUnitX(s___Data_u[s__Data_u[data]], s___Data_r[s__Data_r[data]])
                            call SetUnitY(s___Data_u[s__Data_u[data]], s___Data_r[s__Data_r[data]+1])
                            if ( s__Util_XY2(s__Units_unit[u] , s___Data_u[s__Data_u[data]]) < 150 ) then
                                set s___Data_r[s__Data_r[data]]=s___Data_r[s__Data_r[data]] + 10 * CosBJ(s__Dash_Angle[dash] + 180)
                                set s___Data_r[s__Data_r[data]+1]=s___Data_r[s__Data_r[data]+1] + 10 * SinBJ(s__Dash_Angle[dash] + 180)
                                call s__Units_SetH(s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A018' , 0 , GetUnitX(s___Data_u[s__Data_u[data]]) , GetUnitY(s___Data_u[s__Data_u[data]]) , 0 , 2 , 1.5 , 2 , "stand" , "az-blood-hit.mdl"),100)
                                call s__Units_SetH(s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A018' , 0 , GetUnitX(s___Data_u[s__Data_u[data]]) , GetUnitY(s___Data_u[s__Data_u[data]]) , 0 , 2 , 1.5 , 2 , "stand" , "yooobug_hit_blue.mdl"),100)
                                if ( s___Data_r[s__Data_r[data]+4] == 0 ) then
                                    set s___Data_r[s__Data_r[data]+4]=1
                                    call s__Units_Damage(u,s___Data_u[s__Data_u[data]] , s__Damage_Physics , 'A018' , s__Units_Agi(u,true) * 5.0)
                                endif
                            endif
                            if ( s__Dash_Speed[dash] < 4 ) then
                                call s__Dash_Stop(dash)
                            endif
    return true
endfunction
function sa___prototype1_s__SL__SL_anon__105 takes nothing returns boolean
 local integer dash=f__arg_integer1

                            local integer data=(s__Dash_Obj[dash])
                            local integer u=(s___Data_c[s__Data_c[data]])
                            call s__Dash_Start(s__Units_unit[u] , s__Dash_Angle[dash] , 100 , s__Dash_SUB , 7 , true , false)
                            call s__Units_SetF(u,s__Util_XY(s__Units_unit[u] , s___Data_u[s__Data_u[data]]) , true)
                            call s__Units_AnimeSpeed(u,2.5)
                            call s__Units_DelayAlpha(u,0 , 255 , 0.2)
                            call s__Units_AnimeId(u,8)
                            if ( s__Players_lv15[s__Units_player[u]] == null ) then
                                call s__Units_DelayReleaseAnimePause(u,0.4)
                            else
                                call s__Buffs_Add(s__Units_unit[u] , 'A01C' , 'B008' , 0.25 , false)
                                call s__Units_AnimeSpeed(u,5)
                                call s__Units_DelayReleaseAnimePause(u,0.2)
                            endif
                            set s___Data_u[s__Data_u[data]]=null
                            call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                            call s__Data_Destroy(data)
    return true
endfunction
function sa___prototype1_s__SL__SL_anon__98 takes nothing returns boolean
 local integer dash=f__arg_integer1

                    local integer u=s__Units_Get(s__Dash_Unit[dash])
                    call s__Units_SetF(u,s__Dash_Angle[dash] , true)
                    if ( s__Dash_Speed[dash] < 4 ) then
                        call s__Dash_Stop(dash)
                    endif
    return true
endfunction
function sa___prototype1_s__SL__SL_anon__99 takes nothing returns boolean
 local integer dash=f__arg_integer1

                    local integer data=(s__Dash_Obj[dash])
                    local integer u=s__Units_Get(s__Dash_Unit[dash])
                    local timer t=NewTimer()
                    call s__Units_Model(u,"niuzai_squished.mdl")
                    call s__Units_AddAbility(u,'A019')
                    call s__Units_SetH(u,0)
                    call s__Units_Size(u,0.75)
                    call s__Units_Alpha(u,200)
                    call s__Units_AnimeId(u,3)
                    set s___Data_i[s__Data_i[data]+2]=5
                    call SetTimerData(t , data)
                    call TimerStart(t, 0.05, true, function s__SL__SL_anon__100)
                    set t=null
    return true
endfunction
function sa___prototype1_s__SL__SL_anon__101 takes nothing returns boolean
 local integer dash=f__arg_integer1

                    if ( s__Dash_Speed[dash] < 4 ) then
                        call s__Dash_Stop(dash)
                    endif
    return true
endfunction
function sa___prototype1_s__SL__SL_anon__102 takes nothing returns boolean
 local integer dash=f__arg_integer1

                    local integer data=(s__Dash_Obj[dash])
                    local integer u=s__Units_Get(s__Dash_Unit[dash])
                    local timer t=NewTimer()
                    call s__Units_Model(u,"niuzai_squished.mdl")
                    call s__Units_AddAbility(u,'A019')
                    call s__Units_SetH(u,0)
                    call s__Units_Size(u,0.75)
                    call s__Units_Alpha(u,200)
                    call s__Units_AnimeId(u,3)
                    set s___Data_i[s__Data_i[data]+3]=5
                    set s___Data_i[s__Data_i[data]+4]=0
                    call SetTimerData(t , data)
                    call TimerStart(t, 0.05, true, function s__SL__SL_anon__103)
                    set t=null
    return true
endfunction
function sa___prototype1_s__SL__SL_anon__97 takes nothing returns boolean
 local integer dash=f__arg_integer1

                local integer data=(s__Dash_Obj[dash])
                local integer u=(s___Data_c[s__Data_c[data]])
                local real x=s__Dash_X[dash] + 100 * CosBJ(s__Dash_Angle[dash])
                local real y=s__Dash_Y[dash] + 100 * SinBJ(s__Dash_Angle[dash])
                local unit k
                local integer mj
                local integer dash1
                if ( s__Dash_Speed[dash] < 4 ) then
                    if ( s___Data_i[s__Data_i[data]] == 0 ) then
                        set s___Data_i[s__Data_i[data]]=1
                        call s__Units_AnimeId(u,0)
                        call s__Units_AnimeSpeed(u,1)
                        call s__Units_Pause(u,false)
                    endif
                else
                    if ( s__Dash_Speed[dash] > 18 ) then
                        call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl", s__Dash_X[dash], s__Dash_Y[dash]))
                    endif
                    set k=GroupFind(s__Units_unit[u] , x , y , 80 , true , false)
                    if ( k != null ) then
                        set s___Data_i[s__Data_i[data]]=2
                        call s__Dash_Stop(dash)
                        call s__Units_AnimeSpeed(u,1)
                        call s__Units_AnimeId(u,1)
                        call s__Units_DelayAlpha(u,255 , 0 , 0.5)
                        call s__Units_SetH(s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A018' , 0 , s__Units_X(u) + s__Util_XY2(s__Units_unit[u] , k) / 2 * CosBJ(s__Util_XY(s__Units_unit[u] , k)) , s__Units_Y(u) + s__Util_XY2(s__Units_unit[u] , k) / 2 * SinBJ(s__Util_XY(s__Units_unit[u] , k)) , s__Units_F(u) , 2 , 1 , 1 , "stand" , "qqqqq.mdl"),100)
                        call s__Dash_Start(s__Units_unit[u] , s__Util_XY(k , s__Units_unit[u]) , 200 , s__Dash_SUB , 10 , true , false)
                        call s__Dash_Start(k , s__Util_XY(s__Units_unit[u] , k) , 300 , s__Dash_SUB , 5 , true , true)
                        set s___Data_u[s__Data_u[data]]=k
                        set s___Data_i[s__Data_i[data]+1]=2
                        set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A018' , 5 , s__Units_X(u) , s__Units_Y(u) , 0 , 5 , 0.75 , 1 , "stand" , "blink_blue.mdl")
                        set s___Data_c[s__Data_c[data]+2]=mj
                        set dash1=s__Dash_Start(s__Units_unit[mj] , s__Util_XY(s__Units_unit[u] , k) + 45 , s__Util_XY2(s__Units_unit[u] , k) * 4 , s__Dash_SUB , 60 , true , false)
                        set s__Dash_Obj[dash1]=data
                        set s__Dash_onMove[dash1]=(69)
                        set s__Dash_onEnd[dash1]=(70)
                        set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A018' , 6 , s__Units_X(u) , s__Units_Y(u) , 0 , 5 , 0.75 , 1 , "stand" , "blink_blue.mdl")
                        set s___Data_c[s__Data_c[data]+3]=mj
                        set dash1=s__Dash_Start(s__Units_unit[mj] , s__Util_XY(s__Units_unit[u] , k) - 45 , s__Util_XY2(s__Units_unit[u] , k) * 4 , s__Dash_SUB , 60 , true , false)
                        set s__Dash_Obj[dash1]=data
                        set s__Dash_onMove[dash1]=(71)
                        set s__Dash_onEnd[dash1]=(72)
                        set k=null
                    endif
                endif
    return true
endfunction
function sa___prototype1_s__SL__SL_anon__106 takes nothing returns boolean
 local integer dash=f__arg_integer1

                local integer data=(s__Dash_Obj[dash])
                local integer u=(s___Data_c[s__Data_c[data]])
                if ( s___Data_i[s__Data_i[data]] == 0 ) then
                    call s__Units_AnimeId(u,0)
                    call s__Units_AnimeSpeed(u,1)
                    call s__Units_Pause(u,false)
                endif
                if ( s___Data_i[s__Data_i[data]] <= 1 ) then
                    call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                    call s__Data_Destroy(data)
                endif
    return true
endfunction
function sa___prototype1_s__SL__SL_R takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer i
            local integer dash
            local integer mj
            local integer data=s__Data_create('A01B')
            local real x=s__Units_X(u)
            local real y=s__Units_Y(u)
            call s__Units_Pause(u,true)
            call s__Units_AnimeId(u,4)
            call s__Units_DelayAlpha(u,255 , 0 , 0.2)
            call DestroyEffect(AddSpecialEffectTarget("blink_blue.mdl", s__Units_unit[u], "origin"))
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_c[s__Data_c[data]+1]=e
            set s___Data_i[s__Data_i[data]]=0
            set dash=s__Dash_Start(s__Units_unit[u] , s__Spell_Angle[e] + 180 , 300 , s__Dash_SUB , 40 , true , false)
            set s__Dash_Obj[dash]=data
            set s__Dash_onMove[dash]=(63)
            set s__Dash_onEnd[dash]=(64)
    return true
endfunction
function sa___prototype1_s__SL__SL_E takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer data=s__Data_create('A01A')
            local timer t=NewTimer()
            local real s=0.4
            call s__Units_Pause(u,true)
            if ( s__Players_lv15[s__Units_player[u]] != null ) then
                set s=0.01
                call s__Units_AnimeSpeed(u,6)
            endif
            call s__Units_AnimeId(u,6)
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_c[s__Data_c[data]+1]=e
            call SetTimerData(t , data)
            call TimerStart(t, s, false, function s__SL__SL_anon__94)
            set t=null
    return true
endfunction
function sa___prototype1_s__SL__SL_Q takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer data=s__Data_create('A017')
            local timer t=NewTimer()
            call s__Units_Pause(u,true)
            call s__Units_AnimeSpeed(u,4)
            call s__Units_AnimeId(u,3)
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_c[s__Data_c[data]+1]=e
            call SetTimerData(t , data)
            call TimerStart(t, 0.1, false, function s__SL__SL_anon__107)
            set t=null
    return true
endfunction
function sa___prototype1_s__SL__SL_W takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer data=s__Data_create('A018')
            local integer dash
            call s__Units_Pause(u,true)
            call s__Units_AnimeSpeed(u,2)
            call s__Units_AnimeId(u,9)
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_c[s__Data_c[data]+1]=e
            set s___Data_i[s__Data_i[data]]=0
            set s___Data_i[s__Data_i[data]+1]=0
            set dash=s__Dash_Start(s__Units_unit[u] , s__Spell_Angle[e] , 1500 , s__Dash_SUB , 20 , true , false)
            set s__Dash_Obj[dash]=data
            set s__Dash_onMove[dash]=(73)
            set s__Dash_onEnd[dash]=(74)
    return true
endfunction
function sa___prototype1_s__SL__SL_HERO_START takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            if ( s__Spell_Id[e] == 'A018' ) then
                call s__Units_FlushAnimeId(u,1)
                call s__Spell_Destroy(e)
            endif
            if ( s__Spell_Id[e] == 'A01B' ) then
                if ( s__Units_IsAbility(u,'B008') == false ) then
                    call s__Units_FlushAnimeId(u,7)
                    call s__Spell_Destroy(e)
                elseif ( s__Units_MP(u) >= 200.0 ) then
                    if ( s__Units_GetAbilityCD(u,'A01B') == 0 ) then
                        call SpellText(s__Units_unit[u] , 'A01B' , 3 , 15)
                        call s__Units_SetMP(u,s__Units_MP(u) - 200)
                        call s__Units_SetAbilityCD(u,'A01B' , 10)
                        call s__SL__SL_R(e)
                    else
                        call s__Spell_Destroy(e)
                    endif
                else
                    call s__Spell_Destroy(e)
                endif
            endif
    return true
endfunction
function sa___prototype1_s__SwordMaster__SwordMaster_anon__110 takes nothing returns boolean
 local integer dash=f__arg_integer1

                        set s__Dash_Angle[dash]=s__Units_F(s__Units_Get(s__Dash_Unit[dash]))
    return true
endfunction
function sa___prototype1_s__SwordMaster__SwordMaster_anon__111 takes nothing returns boolean
 local integer dash=f__arg_integer1

                local integer data=(s__Dash_Obj[dash])
                local integer u=(s___Data_c[s__Data_c[data]])
                local integer mj
                set s__Dash_Angle[dash]=s__Units_F(u)
                if ( s__Dash_Speed[dash] < 2 ) then
                    call s__Dash_Stop(dash)
                else
                    call GroupEnumUnitsInRange(tmp_group, s__Dash_X[dash], s__Dash_Y[dash], 150, Condition(function GroupIsAliveNotAloc))
                    loop
                    exitwhen ( FirstOfGroup(tmp_group) == null )
                        set mj=s__Units_Get(FirstOfGroup(tmp_group))
                        call GroupRemoveUnit(tmp_group, s__Units_unit[mj])
                        if ( IsUnitEnemy(s__Units_unit[mj], s__Players_player[s__Units_player[u]]) == true ) then
                            if ( IsUnitInGroup(s__Units_unit[mj], s___Data_g[s__Data_g[data]]) != true ) then
                                call GroupAddUnit(s___Data_g[s__Data_g[data]], s__Units_unit[mj])
                                call DestroyEffect(AddSpecialEffectTarget("qqqqq.mdl", s__Units_unit[mj], "chest"))
                                call s__Units_Damage(u,s__Units_unit[mj] , s__Damage_Physics , 'A01D' , s__Units_Agi(u,true) * 15.0)
                                call s__HitFlys_Add(s__Units_unit[mj] , 25)
                            endif
                        endif
                    endloop
                    call GroupClear(tmp_group)
                endif
    return true
endfunction
function sa___prototype1_s__SwordMaster__SwordMaster_anon__112 takes nothing returns boolean
 local integer dash=f__arg_integer1

                local integer data=(s__Dash_Obj[dash])
                local integer u=(s___Data_c[s__Data_c[data]])
                call DestroyGroup(s___Data_g[s__Data_g[data]])
                set s___Data_g[s__Data_g[data]]=null
                call s__Units_AnimeSpeed(u,1)
                call s__Units_Pause(u,false)
                call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                call s__Data_Destroy(data)
    return true
endfunction
function sa___prototype1_s__SwordMaster__SwordMaster_anon__114 takes nothing returns boolean
 local integer dash=f__arg_integer1

                    set s__Dash_Angle[dash]=s__Dash_Angle[dash] + 4
                    if ( s__Dash_Obj[dash] == 0 ) then
                        set s__Dash_Obj[dash]=3
                        call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl", s__Dash_X[dash], s__Dash_Y[dash]))
                    else
                        set s__Dash_Obj[dash]=s__Dash_Obj[dash] - 1
                    endif
    return true
endfunction
function sa___prototype32_s__SwordMaster__SwordMaster_AI takes nothing returns boolean
    call s__SwordMaster__SwordMaster_AI(f__arg_unit1)
    return true
endfunction
function sa___prototype1_s__SwordMaster__SwordMaster_W takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            local timer t=NewTimer()
            local integer data=s__Data_create('A01E')
            call s__Units_Pause(u,true)
            call s__Units_Pause(u,false)
            call SetUnitMoveSpeed(s__Units_unit[u], GetUnitMoveSpeed(s__Units_unit[u]) + 100)
            call s__Units_Alpha(u,0)
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_c[s__Data_c[data]+1]=e
            set s___Data_g[s__Data_g[data]]=CreateGroup()
            set u=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A01E' , 0 , s__Units_X(u) , s__Units_Y(u) , 0 , 10 , 1.15 , 2 , "stand" , "units\\orc\\HeroBladeMaster\\HeroBladeMaster.mdl")
            call s__Units_AnimeId(u,13)
            set s___Data_c[s__Data_c[data]+2]=u
            set s___Data_r[s__Data_r[data]]=1
            call SetTimerData(t , data)
            call TimerStart(t, 0.02, true, function s__SwordMaster__SwordMaster_anon__113)
            set t=null
    return true
endfunction
function sa___prototype1_s__SwordMaster__SwordMaster_E takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer data=s__Data_create('A01D')
            local integer dash
            call s__Units_Pause(u,true)
            call s__Units_AnimeId(u,10)
            call s__Units_AnimeSpeed(u,1.5)
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_c[s__Data_c[data]+1]=e
            set s___Data_g[s__Data_g[data]]=CreateGroup()
            call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIvi\\AIviTarget.mdl", s__Units_unit[u], "hand right"))
            call s__HitFlys_Add(s__Units_unit[u] , 25)
            set dash=s__Dash_Start(s__Units_unit[u] , s__Units_F(u) , 1200 , s__Dash_SUB , 45 , true , false)
            set s__Dash_Obj[dash]=data
            set s__Dash_onMove[dash]=(81)
            set s__Dash_onEnd[dash]=(82)
    return true
endfunction
function sa___prototype1_s__SwordMaster__SwordMaster_R takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer data=s__Data_create('A01F')
            local timer t=NewTimer()
            call s__Units_Pause(u,true)
            call s__Units_AnimeId(u,10)
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_c[s__Data_c[data]+1]=e
            set s___Data_r[s__Data_r[data]]=45
            set s___Data_r[s__Data_r[data]+1]=0
            set s___Data_r[s__Data_r[data]+2]=0
            call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIvi\\AIviTarget.mdl", s__Units_unit[u], "hand right"))
            call SetTimerData(t , data)
            call TimerStart(t, 1, false, function s__SwordMaster__SwordMaster_anon__108)
            set t=null
    return true
endfunction
function sa___prototype46_s__SwordMaster__SwordMaster_Spawn takes nothing returns boolean
 local integer u=f__arg_integer1
 local integer m=f__arg_integer2

            if ( s__Units_IsAbility(u,'A01F') == true ) then
                set s__Units_ai[u]=(3)
            endif
    return true
endfunction
function sa___prototype1_s__WindWalk__WindWalk_anon__54 takes nothing returns boolean
 local integer dash=f__arg_integer1

                    local integer data=(s__Dash_Obj[dash])
                    local integer u=(s___Data_c[s__Data_c[data]])
                    local integer k=s__Units_Get(s___Data_u[s__Data_u[data]])
                    local integer c=(s___Data_c[s__Data_c[data]+2])
                    local integer tmp
                    call s__Units_Position(c,s__Dash_X[dash] , s__Dash_Y[dash] , false)
                    if ( s__Util_XY2(s__Units_unit[u] , s__Units_unit[k]) < 100 or s__Units_Alive(k) == false ) then
                        call GroupEnumUnitsInRange(tmp_group, s__Units_X(u), s__Units_Y(u), 200, Condition(function GroupIsAliveNotAloc))
                        loop
                        exitwhen ( FirstOfGroup(tmp_group) == null )
                            set tmp=s__Units_Get(FirstOfGroup(tmp_group))
                            call GroupRemoveUnit(tmp_group, s__Units_unit[tmp])
                            if ( IsUnitEnemy(s__Units_unit[tmp], s__Players_player[s__Units_player[u]]) == true ) then
                                call s__Buffs_Add(s__Units_unit[tmp] , 'A00N' , 'B004' , 3 , false)
                                call YDWESetUnitAbilityState(s__Units_unit[u] , 'A00M' , 1 , YDWEGetUnitAbilityState(s__Units_unit[u] , 'A00M' , 1) - 4)
                            endif
                        endloop
                        call GroupClear(tmp_group)
                        call s__Dash_Stop(dash)
                    else
                        set s__Dash_MaxDis[dash]=s__Dash_MaxDis[dash] + 100
                        set s__Dash_Angle[dash]=s__Util_XY(s__Units_unit[u] , s__Units_unit[k])
                    endif
    return true
endfunction
function sa___prototype1_s__WindWalk__WindWalk_anon__55 takes nothing returns boolean
 local integer dash=f__arg_integer1

                    local integer data=(s__Dash_Obj[dash])
                    local integer u=(s___Data_c[s__Data_c[data]])
                    local integer c=(s___Data_c[s__Data_c[data]+2])
                    call s__Units_Life(c,0.5)
                    call s__Units_AnimeSpeed(c,2)
                    call s__Units_Anime(c,"death")
                    set s___Data_u[s__Data_u[data]]=null
                    call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                    call s__Data_Destroy(data)
    return true
endfunction
function sa___prototype1_s__WindWalk__WindWalk_anon__53 takes nothing returns boolean
 local integer dash=f__arg_integer1

                local integer data=(s__Dash_Obj[dash])
                local integer u=s__Units_Get(s__Dash_Unit[dash])
                local integer dash1
                local unit k=GroupFind(s__Units_unit[u] , s__Dash_X[dash] , s__Dash_Y[dash] , 100 , false , false)
                if ( k != null ) then
                    set s___Data_i[s__Data_i[data]]=1
                    call s__Dash_Stop(dash)
                    set u=(s___Data_c[s__Data_c[data]])
                    call YDWESetUnitAbilityState(s__Units_unit[u] , 'A00K' , 1 , YDWEGetUnitAbilityState(s__Units_unit[u] , 'A00K' , 1) - 5)
                    call YDWESetUnitAbilityState(s__Units_unit[u] , 'A00L' , 1 , YDWEGetUnitAbilityState(s__Units_unit[u] , 'A00L' , 1) - 10)
                    set s___Data_u[s__Data_u[data]]=k
                    set s___Data_c[s__Data_c[data]+2]=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00M' , 0 , s__Dash_X[dash] , s__Dash_Y[dash] , s__Dash_Angle[dash] , 3600 , 1.5 , 1 , "stand" , "wind2.mdx")
                    set dash1=s__Dash_Start(s__Units_unit[u] , s__Util_XY(s__Units_unit[u] , k) , 1600 , s__Dash_SUB , 60 , true , false)
                    set s__Dash_Obj[dash1]=data
                    set s__Dash_onMove[dash1]=(87)
                    set s__Dash_onEnd[dash1]=(88)
                endif
                set k=null
                if ( s__Dash_Speed[dash] < 4 ) then
                    call s__Dash_Stop(dash)
                endif
    return true
endfunction
function sa___prototype1_s__WindWalk__WindWalk_anon__56 takes nothing returns boolean
 local integer dash=f__arg_integer1

                local integer u=s__Units_Get(s__Dash_Unit[dash])
                local integer data=(s__Dash_Obj[dash])
                call s__Units_AnimeSpeed(u,3)
                call s__Units_Life(u,0.5)
                call s__Units_Anime(u,"death")
                if ( s___Data_i[s__Data_i[data]] == 0 ) then
                    call s__Spell_Destroy((s___Data_c[s__Data_c[data]+1]))
                    call s__Data_Destroy(data)
                endif
    return true
endfunction
function sa___prototype1_s__WindWalk__WindWalk_anon__58 takes nothing returns boolean
 local integer dash=f__arg_integer1

                    local integer u=s__Units_Get(s__Dash_Unit[dash])
                    local unit k=GroupFind(s__Units_unit[u] , s__Units_X(u) , s__Units_Y(u) , 60 , false , false)
                    if ( k != null ) then
                        call DestroyEffect(AddSpecialEffectTarget("Abilities\\Weapons\\MakuraMissile\\MakuraMissile.mdl", k, "chest"))
                        call s__Dash_Start(k , s__Dash_Angle[dash] , 100 , s__Dash_SUB , 20 , true , true)
                        call s__Dash_Stop(dash)
                        call s__Units_Damage(u,k , s__Damage_Physics , 'A00L' , s__Units_Agi(s__Players_hero[s__Units_player[u]],true) * 7.0)
                    endif
                    set k=null
    return true
endfunction
function sa___prototype1_s__WindWalk__WindWalk_anon__59 takes nothing returns boolean
 local integer dash=f__arg_integer1

                    local integer u=s__Units_Get(s__Dash_Unit[dash])
                    call s__Units_Anime(u,"death")
                    call s__Units_Life(u,0.5)
    return true
endfunction
function sa___prototype1_s__WindWalk__WindWalk_anon__57 takes nothing returns boolean
 local integer dash=f__arg_integer1

                local integer u=s__Units_Get(s__Dash_Unit[dash])
                local integer mj
                local integer dash1
                set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00L' , 0 , s__Dash_X[dash] , s__Dash_Y[dash] , s__Dash_Angle[dash] , 0.7 , 1.3 , 1.5 , "attack" , "units\\creeps\\SylvanusWindrunner\\SylvanusWindrunner.mdl")
                call s__Units_Alpha(mj,50)
                call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Orc\\MirrorImage\\MirrorImageCaster.mdl", s__Units_unit[mj], "origin"))
                set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00L' , 0 , s__Units_X(u) + 50 * CosBJ(s__Dash_Angle[dash]) , s__Units_Y(u) + 50 * SinBJ(s__Dash_Angle[dash]) , s__Dash_Angle[dash] , 6 , 1.5 , 1 , "stand" , "Abilities\\Weapons\\MoonPriestessMissile\\MoonPriestessMissile.mdl")
                call s__Units_SetH(mj,70)
                call s__Units_Position(mj,s__Units_X(mj) , s__Units_Y(mj) , true)
                set dash1=s__Dash_Start(s__Units_unit[mj] , s__Units_F(mj) , 900 , s__Dash_ADD , 60 , true , false)
                set s__Dash_onMove[dash1]=(91)
                set s__Dash_onEnd[dash1]=(92)
    return true
endfunction
function sa___prototype1_s__WindWalk__WindWalk_anon__63 takes nothing returns boolean
 local integer dash=f__arg_integer1

                    local integer u=s__Units_Get(s__Dash_Unit[dash])
                    local unit k=GroupFind(s__Units_unit[u] , s__Units_X(u) , s__Units_Y(u) , 60 , false , false)
                    if ( k != null ) then
                        call DestroyEffect(AddSpecialEffectTarget("Abilities\\Weapons\\MakuraMissile\\MakuraMissile.mdl", k, "chest"))
                        call s__Dash_Start(k , s__Dash_Angle[dash] , 100 , s__Dash_SUB , 20 , true , true)
                        call s__Dash_Stop(dash)
                        call s__Units_Damage(u,k , s__Damage_Physics , 'A00K' , s__Units_Agi(s__Players_hero[s__Units_player[u]],true) * 10.0)
                    endif
                    set k=null
    return true
endfunction
function sa___prototype1_s__WindWalk__WindWalk_anon__64 takes nothing returns boolean
 local integer dash=f__arg_integer1

                    local integer u=s__Units_Get(s__Dash_Unit[dash])
                    call s__Units_Anime(u,"death")
                    call s__Units_Life(u,0.5)
    return true
endfunction
function sa___prototype1_s__WindWalk__WindWalk_anon__60 takes nothing returns boolean
 local integer dash=f__arg_integer1

                local integer u=s__Units_Get(s__Dash_Unit[dash])
                local unit k=GroupFind(s__Units_unit[u] , s__Units_X(u) , s__Units_Y(u) , 60 , false , false)
                if ( k != null ) then
                    call DestroyEffect(AddSpecialEffectTarget("Abilities\\Weapons\\MakuraMissile\\MakuraMissile.mdl", k, "chest"))
                    call s__Dash_Start(k , s__Dash_Angle[dash] , 100 , s__Dash_SUB , 20 , true , true)
                    call s__Dash_Stop(dash)
                    call s__Units_Damage(u,k , s__Damage_Physics , 'A00K' , s__Units_Agi(s__Players_hero[s__Units_player[u]],true) * 10.0)
                endif
                set k=null
                if ( s__Dash_Speed[dash] < 2 ) then
                    call s__Dash_Stop(dash)
                endif
    return true
endfunction
function sa___prototype1_s__WindWalk__WindWalk_anon__61 takes nothing returns boolean
 local integer dash=f__arg_integer1

                local integer u=s__Units_Get(s__Dash_Unit[dash])
                call s__Units_Anime(u,"death")
                call s__Units_Life(u,0.5)
    return true
endfunction
function sa___prototype1_s__WindWalk__WindWalk_anon__62 takes nothing returns boolean
 local integer dash=f__arg_integer1

                local integer u=s__Units_Get(s__Dash_Unit[dash])
                local integer mj
                local integer dash1
                local integer i
                if ( s__Units_Alive(u) == true ) then
                    set i=0
                    loop
                    exitwhen ( i >= 6 )
                        set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00K' , 0 , s__Units_X(u) + 125 * CosBJ(s__Units_F(u)) , s__Units_Y(u) + 125 * SinBJ(s__Units_F(u)) , s__Dash_Angle[dash] + 180 + ( - 30 + ( i * 15 ) ) , 3 , 1.5 , 1 , "stand" , "Abilities\\Weapons\\MoonPriestessMissile\\MoonPriestessMissile.mdl")
                        call s__Units_SetH(mj,70)
                        call s__Units_Position(mj,s__Units_X(mj) , s__Units_Y(mj) , true)
                        set dash1=s__Dash_Start(s__Units_unit[mj] , s__Units_F(mj) , 900 , s__Dash_ADD , 80 , true , false)
                        set s__Dash_onMove[dash1]=(94)
                        set s__Dash_onEnd[dash1]=(95)
                    set i=i + 1
                    endloop
                endif
                call s__Spell_Destroy((s__Dash_Obj[dash]))
                call s__Units_AnimeSpeed(u,1)
                call s__Units_Pause(u,false)
    return true
endfunction
function sa___prototype1_s__WindWalk__WindWalk_anon__68 takes nothing returns boolean
 local integer dash=f__arg_integer1

                        local integer u=s__Units_Get(s__Dash_Unit[dash])
                        local unit k=GroupFind(s__Units_unit[u] , s__Units_X(u) , s__Units_Y(u) , 60 , false , false)
                        if ( k != null ) then
                            call DestroyEffect(AddSpecialEffectTarget("Abilities\\Weapons\\MakuraMissile\\MakuraMissile.mdl", k, "chest"))
                            call s__Dash_Start(k , s__Dash_Angle[dash] , 100 , s__Dash_SUB , 20 , true , true)
                            call s__Dash_Stop(dash)
                            call s__Units_Damage(u,k , s__Damage_Physics , 'A00J' , s__Units_Agi(s__Players_hero[s__Units_player[u]],true) * 2.0)
                        endif
                        set k=null
    return true
endfunction
function sa___prototype1_s__WindWalk__WindWalk_anon__69 takes nothing returns boolean
 local integer dash=f__arg_integer1

                        local integer u=s__Units_Get(s__Dash_Unit[dash])
                        call s__Units_Anime(u,"death")
                        call s__Units_Life(u,0.5)
    return true
endfunction
function sa___prototype1_s__WindWalk__WindWalk_anon__67 takes nothing returns boolean
 local integer dash=f__arg_integer1

                    local integer u=s__Units_Get(s__Dash_Unit[dash])
                    local integer mj
                    local integer dash1
                    call s__Units_Alpha(u,0)
                    if ( GetRandomInt(0, 1) == 0 ) then
                        set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00J' , 0 , s__Units_X(u) , s__Units_Y(u) , s__Units_F(u) , 10 , 1.5 , 1 , "stand" , "Abilities\\Weapons\\MoonPriestessMissile\\MoonPriestessMissile.mdl")
                        call s__Units_Position(mj,s__Units_X(u) , s__Units_Y(u) , true)
                        call s__Units_SetH(mj,50)
                        set dash1=s__Dash_Start(s__Units_unit[mj] , s__Units_F(u) , 900 , s__Dash_ADD , 50 , true , false)
                        set s__Dash_onMove[dash1]=(99)
                        set s__Dash_onEnd[dash1]=(100)
                    endif
    return true
endfunction
function sa___prototype1_s__WindWalk__WindWalk_anon__70 takes nothing returns boolean
 local integer dash=f__arg_integer1

                    local integer u=s__Units_Get(s__Dash_Unit[dash])
                    call s__Spell_Destroy((s__Dash_Obj[dash]))
                    call s__Units_AnimeSpeed(u,1)
                    call s__Units_Alpha(u,255)
    return true
endfunction
function sa___prototype1_s__WindWalk__WindWalk_anon__65 takes nothing returns boolean
 local integer dash=f__arg_integer1

                local integer u=s__Units_Get(s__Dash_Unit[dash])
                call s__Units_Alpha(u,0)
    return true
endfunction
function sa___prototype1_s__WindWalk__WindWalk_anon__66 takes nothing returns boolean
 local integer dash=f__arg_integer1

                local integer u=s__Units_Get(s__Dash_Unit[dash])
                local integer dash1
                call s__Units_Alpha(u,255)
                if ( s__Units_Alive(u) == true ) then
                    call s__Units_Alpha(u,0)
                    call s__Units_AnimeSpeed(u,2.5)
                    call s__Units_AnimeId(u,6)
                    set dash1=s__Dash_Start(s__Units_unit[u] , s__Units_F(u) - 90 , 400 , s__Dash_ADD , 100 , true , false)
                    set s__Dash_Obj[dash1]=s__Dash_Obj[dash]
                    set s__Dash_onMove[dash1]=(101)
                    set s__Dash_onEnd[dash1]=(102)
                else
                    call s__Spell_Destroy((s__Dash_Obj[dash]))
                endif
    return true
endfunction
function sa___prototype1_s__WindWalk__WindWalk_R takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer mj
            local integer dash
            local integer data=s__Data_create('A00M')
            set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00M' , 0 , s__Units_X(u) + 50 * CosBJ(s__Spell_Angle[e]) , s__Units_Y(u) + 50 * SinBJ(s__Spell_Angle[e]) , s__Spell_Angle[e] , 4 , 1.5 , 1 , "stand" , "wind2.mdx")
            call s__Units_SetH(mj,50)
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_c[s__Data_c[data]+1]=e
            set s___Data_i[s__Data_i[data]]=0
            set dash=s__Dash_Start(s__Units_unit[mj] , s__Spell_Angle[e] , 1600 , s__Dash_SUB , 60 , true , false)
            set s__Dash_Obj[dash]=data
            set s__Dash_onMove[dash]=(89)
            set s__Dash_onEnd[dash]=(90)
    return true
endfunction
function sa___prototype1_s__WindWalk__WindWalk_E takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            local timer t=NewTimer()
            local integer data=s__Data_create('A00L')
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_c[s__Data_c[data]+1]=e
            set s___Data_r[s__Data_r[data]]=0.08
            set s___Data_r[s__Data_r[data]+1]=2
            set s___Data_r[s__Data_r[data]+2]=s__Units_X(u)
            set s___Data_r[s__Data_r[data]+3]=s__Units_Y(u)
            set s___Data_i[s__Data_i[data]]=30
            if ( s__Players_isai[s__Units_player[u]] == true ) then
                set s___Data_r[s__Data_r[data]]=0.02
            endif
            call SetTimerData(t , data)
            call TimerStart(t, s___Data_r[s__Data_r[data]], true, function s__WindWalk__WindWalk_E1)
            set t=null
    return true
endfunction
function sa___prototype1_s__WindWalk__WindWalk_Q takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer dash
            call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Orc\\MirrorImage\\MirrorImageCaster.mdl", s__Spell_Spell[e], "origin"))
            set dash=s__Dash_Start(s__Spell_Spell[e] , s__Units_F(u) + 90 , 200 , s__Dash_SUB , 40 , true , false)
            set s__Dash_Obj[dash]=e
            set s__Dash_onMove[dash]=(103)
            set s__Dash_onEnd[dash]=(104)
    return true
endfunction
function sa___prototype1_s__WindWalk__WindWalk_W takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer i
            local integer dash
            local integer mj
            call s__Units_Pause(u,true)
            set i=0
            loop
            exitwhen ( i >= 3 )
                set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00K' , 0 , s__Units_X(u) + 50 * CosBJ(s__Units_F(u)) , s__Units_Y(u) + 50 * SinBJ(s__Units_F(u)) , s__Units_F(u) + ( - 15 + ( i * 15 ) ) , 3 , 1.5 , 1 , "stand" , "Abilities\\Weapons\\MoonPriestessMissile\\MoonPriestessMissile.mdl")
                call s__Units_SetH(mj,70)
                call s__Units_Position(mj,s__Units_X(mj) , s__Units_Y(mj) , true)
                set dash=s__Dash_Start(s__Units_unit[mj] , s__Units_F(mj) , 900 , s__Dash_SUB , 40 , true , false)
                set s__Dash_onMove[dash]=(96)
                set s__Dash_onEnd[dash]=(97)
            set i=i + 1
            endloop
            call s__Units_SetH(s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e009' , 'A00K' , 0 , s__Units_X(u) , s__Units_Y(u) , s__Units_F(u) , 2 , 0.5 , 2.5 , "stand" , "tx.mdx"),80)
            call s__Units_AnimeSpeed(u,2.5)
            call s__Units_AnimeId(u,6)
            set dash=s__Dash_Start(s__Units_unit[u] , s__Units_F(u) + 180 , 300 , s__Dash_SUB , 50 , true , false)
            set s__Dash_Obj[dash]=e
            set s__Dash_onEnd[dash]=(98)
    return true
endfunction
function sa___prototype1_s__WindWalk__WindWalk_HERO_START takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            if ( s__Spell_Id[e] == 'A00K' ) then
                call s__Units_AnimeSpeed(u,4)
                call s__Units_FlushAnimeId(u,5)
            endif
            if ( s__Spell_Id[e] == 'A00M' ) then
                call s__Units_AnimeSpeed(u,4)
                call s__Units_FlushAnimeId(u,6)
            endif
            call s__Spell_Destroy(e)
    return true
endfunction
function sa___prototype1_s__WindWalk__WindWalk_HERO_STOP takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            call s__Units_AnimeSpeed(u,1)
            call s__Spell_Destroy(e)
    return true
endfunction
function sa___prototype1_s__ZZ__ZZ_anon__72 takes nothing returns boolean
 local integer dash=f__arg_integer1

                    local integer u=s__Units_Get(s__Dash_Unit[dash])
                    local integer k=(s__Dash_Obj[dash])
                    if ( s__Units_Alive(k) == false ) then
                        call s__Dash_Stop(dash)
                    elseif ( s__Util_XY2(s__Units_unit[u] , s__Units_unit[k]) < 25 ) then
                        call s__Units_Damage(u,s__Units_unit[k] , s__Damage_Magic , 'A00S' , s__Units_Agi(s__Players_hero[s__Units_player[u]],true) * 5.0)
                        call s__Buffs_Skill(s__Units_unit[k] , 'A00H' , 1)
                        call s__Units_Model(u,"Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl")
                        call s__Units_AnimeSpeed(u,GetRandomReal(0.7, 1.2))
                        call s__Units_Anime(u,"death")
                        call s__Units_Size(u,0.7)
                        call s__Dash_Stop(dash)
                    else
                        call s__Units_SetF(u,s__Util_XY(s__Units_unit[u] , s__Units_unit[k]) , true)
                        set s__Dash_Angle[dash]=s__Units_F(u)
                        set s__Dash_MaxDis[dash]=s__Dash_MaxDis[dash] + 100
                    endif
    return true
endfunction
function sa___prototype1_s__ZZ__ZZ_anon__73 takes nothing returns boolean
 local integer dash=f__arg_integer1

                    local integer u=s__Units_Get(s__Dash_Unit[dash])
                    call s__Units_Model(u,"Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl")
                    call s__Units_AnimeSpeed(u,GetRandomReal(0.7, 1.2))
                    call s__Units_Size(u,0.7)
                    call s__Units_Anime(u,"death")
                    call s__Units_Life(u,0.5)
    return true
endfunction
function sa___prototype1_s__ZZ__ZZ_anon__71 takes nothing returns boolean
 local integer dash=f__arg_integer1

                local integer u=s__Units_Get(s__Dash_Unit[dash])
                local integer dash1
                local integer mj
                local unit k=null
                if ( s__Dash_Speed[dash] < 5 and s__Dash_Speed[dash] > 4.8 and s__Units_aidindex[u] == 0 ) then
                    set s__Units_aidindex[u]=1
                    call s__Units_Model(u,"Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl")
                    call s__Units_Size(u,0.7)
                    call s__Units_AnimeSpeed(u,GetRandomReal(0.7, 1.2))
                    call s__Units_Anime(u,"death")
                endif
                if ( s__Units_aidindex[u] == 0 ) then
                    set k=GroupFind(s__Units_unit[u] , s__Dash_X[dash] , s__Dash_Y[dash] , 50 , false , false)
                    if ( k != null ) then
                        call s__Units_Damage(u,k , s__Damage_Magic , 'A00S' , s__Units_Agi(s__Players_hero[s__Units_player[u]],true) * 15.0)
                        call s__Buffs_Skill(k , 'A00H' , 1)
                        set s__Dash_Speed[dash]=1
                        set k=GroupRandomFilter(s__Units_unit[u] , GetUnitX(k) , GetUnitY(k) , 500 , false , k)
                        if ( k != null ) then
                            set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00S' , 0 , s__Dash_X[dash] , s__Dash_Y[dash] , s__Util_XY(s__Units_unit[u] , k) , 50 , 0.6 , 1 , "birth" , "az_lxj_blue.mdx")
                            call s__Units_SetH(mj,100)
                            call s__Units_Position(mj,s__Dash_X[dash] , s__Dash_Y[dash] , true)
                            set dash1=s__Dash_Start(s__Units_unit[mj] , s__Units_F(mj) , 1800 , s__Dash_SUB , 13 , true , false)
                            set s__Dash_Obj[dash1]=s__Units_Get(k)
                            set s__Dash_onMove[dash1]=(111)
                            set s__Dash_onEnd[dash1]=(112)
                        endif
                    endif
                    set k=null
                endif
                if ( s__Dash_Speed[dash] < 2 ) then
                    call s__Dash_Stop(dash)
                endif
    return true
endfunction
function sa___prototype1_s__ZZ__ZZ_anon__74 takes nothing returns boolean
 local integer dash=f__arg_integer1

                local integer u=s__Units_Get(s__Dash_Unit[dash])
                if ( s__Units_aidindex[u] == 0 ) then
                    call s__Units_Model(u,"Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl")
                    call s__Units_AnimeSpeed(u,GetRandomReal(0.7, 1.2))
                    call s__Units_Size(u,0.7)
                    call s__Units_Anime(u,"death")
                endif
                call s__Units_Life(u,0.5)
    return true
endfunction
function sa___prototype1_s__ZZ__ZZ_anon__76 takes nothing returns boolean
 local integer dash=f__arg_integer1

                local integer u=s__Units_Get(s__Dash_Unit[dash])
                local integer mj
                local unit k
                local real x=s__Dash_X[dash] + 80 * CosBJ(s__Dash_Angle[dash])
                local real y=s__Dash_Y[dash] + 80 * SinBJ(s__Dash_Angle[dash])
                if ( s__Dash_Speed[dash] < 2 ) then
                    call DestroyEffect(AddSpecialEffectTarget("Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl", s__Units_unit[u], "hand,left"))
                else
                    set k=GroupFind(s__Units_unit[u] , x , y , 80 , false , false)
                    if ( k != null ) then
                        set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00P' , 0 , x , y , 0 , 2 , 1.5 , 2 , "death" , "lei2.mdx")
                        call s__Units_SetH(mj,100)
                        set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00P' , 0 , x , y , 0 , 2 , 1.75 , 1.75 , "death" , "lei2.mdx")
                        call s__Units_SetH(mj,100)
                        set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00P' , 0 , x , y , 0 , 2 , 2 , 1.5 , "death" , "lei2.mdx")
                        call s__Units_SetH(mj,100)
                        set x=x + 50 * CosBJ(s__Dash_Angle[dash])
                        set y=y + 50 * SinBJ(s__Dash_Angle[dash])
                        call GroupEnumUnitsInRange(tmp_group, x, y, 200, Condition(function GroupIsAliveNotAloc))
                        loop
                        exitwhen ( FirstOfGroup(tmp_group) == null )
                            set mj=s__Units_Get(FirstOfGroup(tmp_group))
                            call GroupRemoveUnit(tmp_group, s__Units_unit[mj])
                            if ( IsUnitEnemy(s__Units_unit[mj], s__Players_player[s__Units_player[u]]) == true ) then
                                call s__Units_Damage(u,s__Units_unit[mj] , s__Damage_Magic , 'A00P' , s__Units_Agi(u,true) * 10.0)
                                call s__Buffs_Skill(s__Units_unit[mj] , 'A00H' , 1)
                            endif
                        endloop
                        call GroupClear(tmp_group)
                        call s__Dash_Stop(dash)
                        call s__Units_Pause(u,true)
                        call s__Units_AnimeSpeed(u,3.5)
                        call s__Units_DelayReleaseAnimePause(u,0.2)
                    endif
                    set k=null
                endif
    return true
endfunction
function sa___prototype1_s__ZZ__ZZ_anon__77 takes nothing returns boolean
 local integer dash=f__arg_integer1

                local integer u=s__Units_Get(s__Dash_Unit[dash])
                call s__Spell_Destroy((s__Dash_Obj[dash]))
                call s__Units_RemoveAbility(u,'A00Q')
                call s__Units_Pause(u,false)
    return true
endfunction
function sa___prototype1_s__ZZ__ZZ_R takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer i
            local real x=s__Units_X(u) + 50 * CosBJ(s__Spell_Angle[e])
            local real y=s__Units_Y(u) + 50 * SinBJ(s__Spell_Angle[e])
            local integer mj
            local integer dash
            set i=0
            loop
            exitwhen ( i >= 9 )
                set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00S' , 0 , x , y , s__Spell_Angle[e] - 30 + ( i * 6.667 ) , 5 , 0.3 , 1 , "birth" , "az_lxj_blue.mdx")
                call s__Units_SetH(mj,100)
                call s__Units_Position(mj,x , y , true)
                set dash=s__Dash_Start(s__Units_unit[mj] , s__Units_F(mj) , 1800 , s__Dash_SUB , 60 , true , false)
                set s__Dash_onMove[dash]=(113)
                set s__Dash_onEnd[dash]=(114)
            set i=i + 1
            endloop
            call s__Spell_Destroy(e)
    return true
endfunction
function sa___prototype1_s__ZZ__ZZ_E takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer data=s__Data_create('A00R')
            local timer t=NewTimer()
            local integer i
            call s__Units_Pause(u,true)
            call s__Units_AnimeId(u,15)
            call s__Units_PositionEnabled(u,false)
            call s__Units_SetH(s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00R' , 0 , s__Units_X(u) , s__Units_Y(u) , GetRandomReal(0, 360) , 1.5 , 3 , 1 , "stand" , "az_goods_blink(3).mdx"),200)
            set s___Data_c[s__Data_c[data]]=u
            set s___Data_c[s__Data_c[data]+1]=e
            set s___Data_r[s__Data_r[data]]=0.5
            call SetTimerData(t , data)
            call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl", s__Units_X(u), s__Units_Y(u)))
            call TimerStart(t, 0.05, true, function s__ZZ__ZZ_anon__75)
            set t=null
    return true
endfunction
function sa___prototype1_s__ZZ__ZZ_W takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer dash
            call s__Units_Pause(u,true)
            call s__Units_AddAbility(u,'A00Q')
            call s__Units_AnimeId(u,9)
            set dash=s__Dash_Start(s__Units_unit[u] , s__Spell_Angle[e] , 1000 , s__Dash_ADD , 70 , true , false)
            set s__Dash_Obj[dash]=e
            set s__Dash_onMove[dash]=(115)
            set s__Dash_onEnd[dash]=(116)
    return true
endfunction
function sa___prototype1_s__ZZ__ZZ_Q takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            local integer mj
            local real x=s__Units_X(u) + 25 * CosBJ(s__Spell_Angle[e])
            local real y=s__Units_Y(u) + 25 * SinBJ(s__Spell_Angle[e])
            local integer i
            local real ta
            call s__Units_AnimeSpeed(u,1)
            set mj=s__Units_MJ(s__Players_player[s__Units_player[u]] , 'e008' , 'A00O' , 0 , x , y , s__Spell_Angle[e] , 4 , 0.75 , 2 , "stand" , "AZ_HYHX.mdx") //-30 右边 +30 左边  650
            call GroupEnumUnitsInRange(tmp_group, s__Units_X(u), s__Units_Y(u), 650, Condition(function GroupIsAliveNotAloc))
            loop
            exitwhen ( FirstOfGroup(tmp_group) == null )
                set mj=s__Units_Get(FirstOfGroup(tmp_group))
                call GroupRemoveUnit(tmp_group, s__Units_unit[mj])
                if ( IsUnitEnemy(s__Units_unit[mj], s__Players_player[s__Units_player[u]]) == true ) then
                    if ( s__Util_FAN(s__Units_unit[u] , s__Units_unit[mj] , s__Spell_Angle[e] , 30) == true ) then
                        call s__Units_Damage(u,s__Units_unit[mj] , s__Damage_Magic , 'A00O' , s__Units_Int(u,true) * 5.0)
                        call DestroyEffect(AddSpecialEffectTarget("Environment\\LargeBuildingFire\\LargeBuildingFire1.mdl", s__Units_unit[mj], "chest"))
                        call s__Dash_Start(s__Units_unit[mj] , s__Spell_Angle[e] , 700.0 - s__Util_XY2(s__Units_unit[u] , s__Units_unit[mj]) , s__Dash_SUB , 40 , true , true)
                    endif
                endif
            endloop
            call GroupClear(tmp_group)
            call s__Spell_Destroy(e)
    return true
endfunction
function sa___prototype1_s__ZZ__ZZ_HERO_START takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            if ( s__Spell_Id[e] == 'A00S' ) then
                call s__Units_AnimeSpeed(u,2)
                call s__Units_FlushAnimeId(u,11)
            endif
            if ( s__Spell_Id[e] == 'A00O' ) then
                call s__Units_AnimeSpeed(u,1.7)
                call s__Units_FlushAnimeId(u,6)
            endif
            if ( s__Spell_Id[e] == 'A00R' ) then
                call s__Units_AnimeSpeed(u,2)
                call s__Units_FlushAnimeId(u,14)
            endif
            call s__Spell_Destroy(e)
    return true
endfunction
function sa___prototype1_s__ZZ__ZZ_HERO_STOP takes nothing returns boolean
 local integer e=f__arg_integer1

            local integer u=s__Units_Get(s__Spell_Spell[e])
            if ( s__Spell_Id[e] == 'A00O' or s__Spell_Id[e] == 'A00R' or s__Spell_Id[e] == 'A00S' ) then
                call s__Units_AnimeSpeed(u,1)
            endif
            call s__Spell_Destroy(e)
    return true
endfunction
function sa___prototype46_s__Respawn___Respawn_Death takes nothing returns boolean
 local integer u=f__arg_integer1
 local integer m=f__arg_integer2

            local integer r=s__Respawn___Respawn__allocate()
            if ( s__Players_hero[s__Units_player[m]] != null ) then
                if ( s__Players_teamid[s__Units_player[u]] != s__Players_teamid[s__Units_player[m]] and s__Units_unit[m] != null ) then
                    set s__Players_lifekill[s__Units_player[m]]=s__Players_lifekill[s__Units_player[m]] + 1
                    call ForForce(s__Teams_GetTeamForce(s__Players_player[s__Units_player[m]]), function s__Respawn___Respawn_anon__24)
                    call DisplayTimedTextToForce(s__Teams_GetAllPlayers(), 5.00, s__Players_name[s__Units_player[m]] + "与队友 因击杀 " + s__Players_name[s__Units_player[u]] + " 而获得了|cffffcc00$300|r")
                    if ( s__Players_randomhero[s__Units_player[m]] > 0 ) then
                        set s__Players_randomhero[s__Units_player[m]]=s__Players_randomhero[s__Units_player[m]] - 5.0
                    endif
                endif
                if ( s__Players_randomhero[s__Units_player[u]] < 100 ) then
                    set s__Players_randomhero[s__Units_player[u]]=s__Players_randomhero[s__Units_player[u]] + 5.0
                endif
            else
                call DisplayTimedTextToForce(s__Teams_GetAllPlayers(), 5.00, s__Players_name[s__Units_player[u]] + "死在了野怪的手里...")
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
function sa___prototype35_s__Respawn___Respawn_Press takes nothing returns boolean
 local player ps=f__arg_player1
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
function sa___prototype35_s__Respawn___Respawn_PressSnyc takes nothing returns boolean
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

function jasshelper__initstructs652906468 takes nothing returns nothing
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
    set st__DazzleMaster___DazzleMaster_AddDazzle=CreateTrigger()
    call TriggerAddCondition(st__DazzleMaster___DazzleMaster_AddDazzle,Condition( function sa__DazzleMaster___DazzleMaster_AddDazzle))
    set st__DazzleMaster___DazzleMaster_Q=CreateTrigger()
    call TriggerAddCondition(st__DazzleMaster___DazzleMaster_Q,Condition( function sa__DazzleMaster___DazzleMaster_Q))
    set st__Winner_ShowWin=CreateTrigger()
    call TriggerAddCondition(st__Winner_ShowWin,Condition( function sa__Winner_ShowWin))
    set st__HeroRares_Repeat=CreateTrigger()
    call TriggerAddCondition(st__HeroRares_Repeat,Condition( function sa__HeroRares_Repeat))
    set st__HeroRares_AddRandomHero=CreateTrigger()
    call TriggerAddCondition(st__HeroRares_AddRandomHero,Condition( function sa__HeroRares_AddRandomHero))
    set st__Units_Alpha=CreateTrigger()
    call TriggerAddCondition(st__Units_Alpha,Condition( function sa__Units_Alpha))
    set st__Units_Str=CreateTrigger()
    call TriggerAddCondition(st__Units_Str,Condition( function sa__Units_Str))
    set st__Units_Agi=CreateTrigger()
    call TriggerAddCondition(st__Units_Agi,Condition( function sa__Units_Agi))
    set st__Units_Int=CreateTrigger()
    call TriggerAddCondition(st__Units_Int,Condition( function sa__Units_Int))
    set st__Units_DelayAnime=CreateTrigger()
    call TriggerAddCondition(st__Units_DelayAnime,Condition( function sa__Units_DelayAnime))
    set st__Units_AnimeSpeed=CreateTrigger()
    call TriggerAddCondition(st__Units_AnimeSpeed,Condition( function sa__Units_AnimeSpeed))
    set st__Units_Y=CreateTrigger()
    call TriggerAddCondition(st__Units_Y,Condition( function sa__Units_Y))
    set st__Units_X=CreateTrigger()
    call TriggerAddCondition(st__Units_X,Condition( function sa__Units_X))
    set st__Units_SetH=CreateTrigger()
    call TriggerAddCondition(st__Units_SetH,Condition( function sa__Units_SetH))
    set st__Units_Position=CreateTrigger()
    call TriggerAddCondition(st__Units_Position,Condition( function sa__Units_Position))
    set st__Units_Destroys=CreateTrigger()
    call TriggerAddCondition(st__Units_Destroys,Condition( function sa__Units_Destroys))
    set st__Units_Get=CreateTrigger()
    call TriggerAddCondition(st__Units_Get,Condition( function sa__Units_Get))
    set st__Units_Spawn=CreateTrigger()
    call TriggerAddCondition(st__Units_Spawn,Condition( function sa__Units_Spawn))
    set st__Units_MJ=CreateTrigger()
    call TriggerAddCondition(st__Units_MJ,Condition( function sa__Units_MJ))
    set st__Units_Kill=CreateTrigger()
    call TriggerAddCondition(st__Units_Kill,Condition( function sa__Units_Kill))
    set st__PlayerPress_create=CreateTrigger()
    call TriggerAddCondition(st__PlayerPress_create,Condition( function sa__PlayerPress_create))
    set st__SoundUtils___soundrecycler_onDestroy=CreateTrigger()
    call TriggerAddCondition(st__SoundUtils___soundrecycler_onDestroy,Condition( function sa__SoundUtils___soundrecycler_onDestroy))
    set st__Players_AddMoney=CreateTrigger()
    call TriggerAddCondition(st__Players_AddMoney,Condition( function sa__Players_AddMoney))
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
    set st__Table___GTable_onDestroy[9]=CreateTrigger()
    set st__Table___GTable_onDestroy[10]=st__Table___GTable_onDestroy[9]
    set st__Table___GTable_onDestroy[11]=st__Table___GTable_onDestroy[9]
    set st__Table___GTable_onDestroy[12]=st__Table___GTable_onDestroy[9]
    call TriggerAddCondition(st__Table___GTable_onDestroy[9],Condition( function sa__Table___GTable_onDestroy))
    set st__Stack_onDestroy=CreateTrigger()
    call TriggerAddCondition(st__Stack_onDestroy,Condition( function sa__Stack_onDestroy))
    set st___prototype1[1]=CreateTrigger()
    call TriggerAddAction(st___prototype1[1],function sa___prototype1_BuyStrAgiInt___Buy)
    call TriggerAddCondition(st___prototype1[1],Condition(function sa___prototype1_BuyStrAgiInt___Buy))
    set st___prototype36[1]=CreateTrigger()
    call TriggerAddAction(st___prototype36[1],function sa___prototype36_SoundUtils___HookStopSound)
    call TriggerAddCondition(st___prototype36[1],Condition(function sa___prototype36_SoundUtils___HookStopSound))
    set st___prototype37[1]=CreateTrigger()
    call TriggerAddAction(st___prototype37[1],function sa___prototype37_SoundUtils___HookKillSoundWhenDone)
    call TriggerAddCondition(st___prototype37[1],Condition(function sa___prototype37_SoundUtils___HookKillSoundWhenDone))
    set st___prototype1[6]=CreateTrigger()
    call TriggerAddAction(st___prototype1[6],function sa___prototype1_BuyNextHero___Buy)
    call TriggerAddCondition(st___prototype1[6],Condition(function sa___prototype1_BuyNextHero___Buy))
    set st___prototype1[9]=CreateTrigger()
    call TriggerAddAction(st___prototype1[9],function sa___prototype1_Disconnect___onDisconnect)
    call TriggerAddCondition(st___prototype1[9],Condition(function sa___prototype1_Disconnect___onDisconnect))
    set st___prototype1[10]=CreateTrigger()
    call TriggerAddAction(st___prototype1[10],function sa___prototype1_LevelUp___LvUp)
    call TriggerAddCondition(st___prototype1[10],Condition(function sa___prototype1_LevelUp___LvUp))
    set st___prototype1[11]=CreateTrigger()
    call TriggerAddAction(st___prototype1[11],function sa___prototype1_PlayerChat___Chat)
    call TriggerAddCondition(st___prototype1[11],Condition(function sa___prototype1_PlayerChat___Chat))
    set st___prototype1[14]=CreateTrigger()
    call TriggerAddAction(st___prototype1[14],function sa___prototype1_Ai___onDmg)
    call TriggerAddCondition(st___prototype1[14],Condition(function sa___prototype1_Ai___onDmg))
    set st___prototype1[2]=CreateTrigger()
    call TriggerAddAction(st___prototype1[2],function sa___prototype1_s__Spell_onUnitSpell)
    call TriggerAddCondition(st___prototype1[2],Condition(function sa___prototype1_s__Spell_onUnitSpell))
    set st___prototype1[3]=CreateTrigger()
    call TriggerAddAction(st___prototype1[3],function sa___prototype1_s__Spell_onUnitStartSpell)
    call TriggerAddCondition(st___prototype1[3],Condition(function sa___prototype1_s__Spell_onUnitStartSpell))
    set st___prototype1[4]=CreateTrigger()
    call TriggerAddAction(st___prototype1[4],function sa___prototype1_s__Spell_onUnitStopSpell)
    call TriggerAddCondition(st___prototype1[4],Condition(function sa___prototype1_s__Spell_onUnitStopSpell))
    set st___prototype1[5]=CreateTrigger()
    call TriggerAddAction(st___prototype1[5],function sa___prototype1_s__Spell_onUnitReadySpell)
    call TriggerAddCondition(st___prototype1[5],Condition(function sa___prototype1_s__Spell_onUnitReadySpell))
    set st___prototype1[7]=CreateTrigger()
    call TriggerAddAction(st___prototype1[7],function sa___prototype1_s__Damage_onDisconnect)
    call TriggerAddCondition(st___prototype1[7],Condition(function sa___prototype1_s__Damage_onDisconnect))
    set st___prototype1[8]=CreateTrigger()
    call TriggerAddAction(st___prototype1[8],function sa___prototype1_s__Damage_onDamage)
    call TriggerAddCondition(st___prototype1[8],Condition(function sa___prototype1_s__Damage_onDamage))
    set st___prototype35[1]=CreateTrigger()
    call TriggerAddAction(st___prototype35[1],function sa___prototype35_s__PlayerPress_Down)
    call TriggerAddCondition(st___prototype35[1],Condition(function sa___prototype35_s__PlayerPress_Down))
    set st___prototype35[2]=CreateTrigger()
    call TriggerAddAction(st___prototype35[2],function sa___prototype35_s__PlayerPress_Up)
    call TriggerAddCondition(st___prototype35[2],Condition(function sa___prototype35_s__PlayerPress_Up))
    set st___prototype54[1]=CreateTrigger()
    call TriggerAddAction(st___prototype54[1],function sa___prototype54_s__Units_Damage)
    call TriggerAddCondition(st___prototype54[1],Condition(function sa___prototype54_s__Units_Damage))
    set st___prototype1[12]=CreateTrigger()
    call TriggerAddAction(st___prototype1[12],function sa___prototype1_s__Units_onDeath)
    call TriggerAddCondition(st___prototype1[12],Condition(function sa___prototype1_s__Units_onDeath))
    set st___prototype1[13]=CreateTrigger()
    call TriggerAddAction(st___prototype1[13],function sa___prototype1_s__Units_onDeacy)
    call TriggerAddCondition(st___prototype1[13],Condition(function sa___prototype1_s__Units_onDeacy))
    set st___prototype46[1]=CreateTrigger()
    call TriggerAddAction(st___prototype46[1],function sa___prototype46_s__Winner_Death)
    call TriggerAddCondition(st___prototype46[1],Condition(function sa___prototype46_s__Winner_Death))
    set st___prototype1[15]=CreateTrigger()
    call TriggerAddAction(st___prototype1[15],function sa___prototype1_s__BlackSaber__BlackSaber_anon__79)
    call TriggerAddCondition(st___prototype1[15],Condition(function sa___prototype1_s__BlackSaber__BlackSaber_anon__79))
    set st___prototype1[16]=CreateTrigger()
    call TriggerAddAction(st___prototype1[16],function sa___prototype1_s__BlackSaber__BlackSaber_anon__82)
    call TriggerAddCondition(st___prototype1[16],Condition(function sa___prototype1_s__BlackSaber__BlackSaber_anon__82))
    set st___prototype1[17]=CreateTrigger()
    call TriggerAddAction(st___prototype1[17],function sa___prototype1_s__BlackSaber__BlackSaber_anon__80)
    call TriggerAddCondition(st___prototype1[17],Condition(function sa___prototype1_s__BlackSaber__BlackSaber_anon__80))
    set st___prototype1[18]=CreateTrigger()
    call TriggerAddAction(st___prototype1[18],function sa___prototype1_s__BlackSaber__BlackSaber_anon__83)
    call TriggerAddCondition(st___prototype1[18],Condition(function sa___prototype1_s__BlackSaber__BlackSaber_anon__83))
    set st___prototype1[19]=CreateTrigger()
    call TriggerAddAction(st___prototype1[19],function sa___prototype1_s__BlackSaber__BlackSaber_anon__85)
    call TriggerAddCondition(st___prototype1[19],Condition(function sa___prototype1_s__BlackSaber__BlackSaber_anon__85))
    set st___prototype1[20]=CreateTrigger()
    call TriggerAddAction(st___prototype1[20],function sa___prototype1_s__BlackSaber__BlackSaber_anon__86)
    call TriggerAddCondition(st___prototype1[20],Condition(function sa___prototype1_s__BlackSaber__BlackSaber_anon__86))
    set st___prototype1[21]=CreateTrigger()
    call TriggerAddAction(st___prototype1[21],function sa___prototype1_s__BlackSaber__BlackSaber_anon__87)
    call TriggerAddCondition(st___prototype1[21],Condition(function sa___prototype1_s__BlackSaber__BlackSaber_anon__87))
    set st___prototype1[22]=CreateTrigger()
    call TriggerAddAction(st___prototype1[22],function sa___prototype1_s__BlackSaber__BlackSaber_anon__88)
    call TriggerAddCondition(st___prototype1[22],Condition(function sa___prototype1_s__BlackSaber__BlackSaber_anon__88))
    set st___prototype32[1]=CreateTrigger()
    call TriggerAddAction(st___prototype32[1],function sa___prototype32_s__BlackSaber__BlackSaber_AI)
    call TriggerAddCondition(st___prototype32[1],Condition(function sa___prototype32_s__BlackSaber__BlackSaber_AI))
    set st___prototype1[23]=CreateTrigger()
    call TriggerAddAction(st___prototype1[23],function sa___prototype1_s__BlackSaber__BlackSaber_D)
    call TriggerAddCondition(st___prototype1[23],Condition(function sa___prototype1_s__BlackSaber__BlackSaber_D))
    set st___prototype1[24]=CreateTrigger()
    call TriggerAddAction(st___prototype1[24],function sa___prototype1_s__BlackSaber__BlackSaber_R)
    call TriggerAddCondition(st___prototype1[24],Condition(function sa___prototype1_s__BlackSaber__BlackSaber_R))
    set st___prototype1[25]=CreateTrigger()
    call TriggerAddAction(st___prototype1[25],function sa___prototype1_s__BlackSaber__BlackSaber_Q)
    call TriggerAddCondition(st___prototype1[25],Condition(function sa___prototype1_s__BlackSaber__BlackSaber_Q))
    set st___prototype1[26]=CreateTrigger()
    call TriggerAddAction(st___prototype1[26],function sa___prototype1_s__BlackSaber__BlackSaber_W)
    call TriggerAddCondition(st___prototype1[26],Condition(function sa___prototype1_s__BlackSaber__BlackSaber_W))
    set st___prototype1[27]=CreateTrigger()
    call TriggerAddAction(st___prototype1[27],function sa___prototype1_s__BlackSaber__BlackSaber_E)
    call TriggerAddCondition(st___prototype1[27],Condition(function sa___prototype1_s__BlackSaber__BlackSaber_E))
    set st___prototype1[28]=CreateTrigger()
    call TriggerAddAction(st___prototype1[28],function sa___prototype1_s__BlackSaber__BlackSaber_HERO_START)
    call TriggerAddCondition(st___prototype1[28],Condition(function sa___prototype1_s__BlackSaber__BlackSaber_HERO_START))
    set st___prototype1[29]=CreateTrigger()
    call TriggerAddAction(st___prototype1[29],function sa___prototype1_s__BlackSaber__BlackSaber_HERO_STOP)
    call TriggerAddCondition(st___prototype1[29],Condition(function sa___prototype1_s__BlackSaber__BlackSaber_HERO_STOP))
    set st___prototype46[2]=CreateTrigger()
    call TriggerAddAction(st___prototype46[2],function sa___prototype46_s__BlackSaber__BlackSaber_Spawn)
    call TriggerAddCondition(st___prototype46[2],Condition(function sa___prototype46_s__BlackSaber__BlackSaber_Spawn))
    set st___prototype32[2]=CreateTrigger()
    call TriggerAddAction(st___prototype32[2],function sa___prototype32_s__DazzleMaster___DazzleMaster_AI)
    call TriggerAddCondition(st___prototype32[2],Condition(function sa___prototype32_s__DazzleMaster___DazzleMaster_AI))
    set st___prototype1[30]=CreateTrigger()
    call TriggerAddAction(st___prototype1[30],function sa___prototype1_s__DazzleMaster___DazzleMaster_anon__37)
    call TriggerAddCondition(st___prototype1[30],Condition(function sa___prototype1_s__DazzleMaster___DazzleMaster_anon__37))
    set st___prototype1[31]=CreateTrigger()
    call TriggerAddAction(st___prototype1[31],function sa___prototype1_s__DazzleMaster___DazzleMaster_anon__38)
    call TriggerAddCondition(st___prototype1[31],Condition(function sa___prototype1_s__DazzleMaster___DazzleMaster_anon__38))
    set st___prototype1[32]=CreateTrigger()
    call TriggerAddAction(st___prototype1[32],function sa___prototype1_s__DazzleMaster___DazzleMaster_anon__39)
    call TriggerAddCondition(st___prototype1[32],Condition(function sa___prototype1_s__DazzleMaster___DazzleMaster_anon__39))
    set st___prototype1[33]=CreateTrigger()
    call TriggerAddAction(st___prototype1[33],function sa___prototype1_s__DazzleMaster___DazzleMaster_anon__44)
    call TriggerAddCondition(st___prototype1[33],Condition(function sa___prototype1_s__DazzleMaster___DazzleMaster_anon__44))
    set st___prototype1[34]=CreateTrigger()
    call TriggerAddAction(st___prototype1[34],function sa___prototype1_s__DazzleMaster___DazzleMaster_anon__45)
    call TriggerAddCondition(st___prototype1[34],Condition(function sa___prototype1_s__DazzleMaster___DazzleMaster_anon__45))
    set st___prototype1[35]=CreateTrigger()
    call TriggerAddAction(st___prototype1[35],function sa___prototype1_s__DazzleMaster___DazzleMaster_anon__42)
    call TriggerAddCondition(st___prototype1[35],Condition(function sa___prototype1_s__DazzleMaster___DazzleMaster_anon__42))
    set st___prototype1[36]=CreateTrigger()
    call TriggerAddAction(st___prototype1[36],function sa___prototype1_s__DazzleMaster___DazzleMaster_anon__47)
    call TriggerAddCondition(st___prototype1[36],Condition(function sa___prototype1_s__DazzleMaster___DazzleMaster_anon__47))
    set st___prototype1[37]=CreateTrigger()
    call TriggerAddAction(st___prototype1[37],function sa___prototype1_s__DazzleMaster___DazzleMaster_anon__48)
    call TriggerAddCondition(st___prototype1[37],Condition(function sa___prototype1_s__DazzleMaster___DazzleMaster_anon__48))
    set st___prototype1[38]=CreateTrigger()
    call TriggerAddAction(st___prototype1[38],function sa___prototype1_s__DazzleMaster___DazzleMaster_anon__49)
    call TriggerAddCondition(st___prototype1[38],Condition(function sa___prototype1_s__DazzleMaster___DazzleMaster_anon__49))
    set st___prototype1[39]=CreateTrigger()
    call TriggerAddAction(st___prototype1[39],function sa___prototype1_s__DazzleMaster___DazzleMaster_anon__50)
    call TriggerAddCondition(st___prototype1[39],Condition(function sa___prototype1_s__DazzleMaster___DazzleMaster_anon__50))
    set st___prototype1[40]=CreateTrigger()
    call TriggerAddAction(st___prototype1[40],function sa___prototype1_s__DazzleMaster___DazzleMaster_anon__51)
    call TriggerAddCondition(st___prototype1[40],Condition(function sa___prototype1_s__DazzleMaster___DazzleMaster_anon__51))
    set st___prototype1[41]=CreateTrigger()
    call TriggerAddAction(st___prototype1[41],function sa___prototype1_s__DazzleMaster___DazzleMaster_anon__52)
    call TriggerAddCondition(st___prototype1[41],Condition(function sa___prototype1_s__DazzleMaster___DazzleMaster_anon__52))
    set st___prototype1[42]=CreateTrigger()
    call TriggerAddAction(st___prototype1[42],function sa___prototype1_s__DazzleMaster___DazzleMaster_D)
    call TriggerAddCondition(st___prototype1[42],Condition(function sa___prototype1_s__DazzleMaster___DazzleMaster_D))
    set st___prototype1[43]=CreateTrigger()
    call TriggerAddAction(st___prototype1[43],function sa___prototype1_s__DazzleMaster___DazzleMaster_Q)
    call TriggerAddCondition(st___prototype1[43],Condition(function sa___prototype1_s__DazzleMaster___DazzleMaster_Q))
    set st___prototype1[44]=CreateTrigger()
    call TriggerAddAction(st___prototype1[44],function sa___prototype1_s__DazzleMaster___DazzleMaster_W)
    call TriggerAddCondition(st___prototype1[44],Condition(function sa___prototype1_s__DazzleMaster___DazzleMaster_W))
    set st___prototype1[45]=CreateTrigger()
    call TriggerAddAction(st___prototype1[45],function sa___prototype1_s__DazzleMaster___DazzleMaster_E)
    call TriggerAddCondition(st___prototype1[45],Condition(function sa___prototype1_s__DazzleMaster___DazzleMaster_E))
    set st___prototype1[46]=CreateTrigger()
    call TriggerAddAction(st___prototype1[46],function sa___prototype1_s__DazzleMaster___DazzleMaster_R)
    call TriggerAddCondition(st___prototype1[46],Condition(function sa___prototype1_s__DazzleMaster___DazzleMaster_R))
    set st___prototype1[47]=CreateTrigger()
    call TriggerAddAction(st___prototype1[47],function sa___prototype1_s__DazzleMaster___DazzleMaster_HERO_START)
    call TriggerAddCondition(st___prototype1[47],Condition(function sa___prototype1_s__DazzleMaster___DazzleMaster_HERO_START))
    set st___prototype1[48]=CreateTrigger()
    call TriggerAddAction(st___prototype1[48],function sa___prototype1_s__DazzleMaster___DazzleMaster_HERO_STOP)
    call TriggerAddCondition(st___prototype1[48],Condition(function sa___prototype1_s__DazzleMaster___DazzleMaster_HERO_STOP))
    set st___prototype1[49]=CreateTrigger()
    call TriggerAddAction(st___prototype1[49],function sa___prototype1_s__DazzleMaster___DazzleMaster_Attack)
    call TriggerAddCondition(st___prototype1[49],Condition(function sa___prototype1_s__DazzleMaster___DazzleMaster_Attack))
    set st___prototype46[3]=CreateTrigger()
    call TriggerAddAction(st___prototype46[3],function sa___prototype46_s__DazzleMaster___DazzleMaster_Spawn)
    call TriggerAddCondition(st___prototype46[3],Condition(function sa___prototype46_s__DazzleMaster___DazzleMaster_Spawn))
    set st___prototype46[4]=CreateTrigger()
    call TriggerAddAction(st___prototype46[4],function sa___prototype46_s__DazzleMaster___DazzleMaster_Death)
    call TriggerAddCondition(st___prototype46[4],Condition(function sa___prototype46_s__DazzleMaster___DazzleMaster_Death))
    set st___prototype35[3]=CreateTrigger()
    call TriggerAddAction(st___prototype35[3],function sa___prototype35_s__KillUi_Show)
    call TriggerAddCondition(st___prototype35[3],Condition(function sa___prototype35_s__KillUi_Show))
    set st___prototype35[4]=CreateTrigger()
    call TriggerAddAction(st___prototype35[4],function sa___prototype35_s__KillUi_Hide)
    call TriggerAddCondition(st___prototype35[4],Condition(function sa___prototype35_s__KillUi_Hide))
    set st___prototype1[50]=CreateTrigger()
    call TriggerAddAction(st___prototype1[50],function sa___prototype1_s__OrdinaryWizard___OrdinaryWizard_anon__29)
    call TriggerAddCondition(st___prototype1[50],Condition(function sa___prototype1_s__OrdinaryWizard___OrdinaryWizard_anon__29))
    set st___prototype1[51]=CreateTrigger()
    call TriggerAddAction(st___prototype1[51],function sa___prototype1_s__OrdinaryWizard___OrdinaryWizard_anon__30)
    call TriggerAddCondition(st___prototype1[51],Condition(function sa___prototype1_s__OrdinaryWizard___OrdinaryWizard_anon__30))
    set st___prototype1[52]=CreateTrigger()
    call TriggerAddAction(st___prototype1[52],function sa___prototype1_s__OrdinaryWizard___OrdinaryWizard_anon__32)
    call TriggerAddCondition(st___prototype1[52],Condition(function sa___prototype1_s__OrdinaryWizard___OrdinaryWizard_anon__32))
    set st___prototype1[53]=CreateTrigger()
    call TriggerAddAction(st___prototype1[53],function sa___prototype1_s__OrdinaryWizard___OrdinaryWizard_anon__33)
    call TriggerAddCondition(st___prototype1[53],Condition(function sa___prototype1_s__OrdinaryWizard___OrdinaryWizard_anon__33))
    set st___prototype1[54]=CreateTrigger()
    call TriggerAddAction(st___prototype1[54],function sa___prototype1_s__OrdinaryWizard___OrdinaryWizard_anon__34)
    call TriggerAddCondition(st___prototype1[54],Condition(function sa___prototype1_s__OrdinaryWizard___OrdinaryWizard_anon__34))
    set st___prototype1[55]=CreateTrigger()
    call TriggerAddAction(st___prototype1[55],function sa___prototype1_s__OrdinaryWizard___OrdinaryWizard_anon__35)
    call TriggerAddCondition(st___prototype1[55],Condition(function sa___prototype1_s__OrdinaryWizard___OrdinaryWizard_anon__35))
    set st___prototype1[56]=CreateTrigger()
    call TriggerAddAction(st___prototype1[56],function sa___prototype1_s__OrdinaryWizard___OrdinaryWizard_Q)
    call TriggerAddCondition(st___prototype1[56],Condition(function sa___prototype1_s__OrdinaryWizard___OrdinaryWizard_Q))
    set st___prototype1[57]=CreateTrigger()
    call TriggerAddAction(st___prototype1[57],function sa___prototype1_s__OrdinaryWizard___OrdinaryWizard_W)
    call TriggerAddCondition(st___prototype1[57],Condition(function sa___prototype1_s__OrdinaryWizard___OrdinaryWizard_W))
    set st___prototype1[58]=CreateTrigger()
    call TriggerAddAction(st___prototype1[58],function sa___prototype1_s__OrdinaryWizard___OrdinaryWizard_R)
    call TriggerAddCondition(st___prototype1[58],Condition(function sa___prototype1_s__OrdinaryWizard___OrdinaryWizard_R))
    set st___prototype1[59]=CreateTrigger()
    call TriggerAddAction(st___prototype1[59],function sa___prototype1_s__OrdinaryWizard___OrdinaryWizard_HERO_START)
    call TriggerAddCondition(st___prototype1[59],Condition(function sa___prototype1_s__OrdinaryWizard___OrdinaryWizard_HERO_START))
    set st___prototype1[60]=CreateTrigger()
    call TriggerAddAction(st___prototype1[60],function sa___prototype1_s__OrdinaryWizard___OrdinaryWizard_HERO_STOP)
    call TriggerAddCondition(st___prototype1[60],Condition(function sa___prototype1_s__OrdinaryWizard___OrdinaryWizard_HERO_STOP))
    set st___prototype46[5]=CreateTrigger()
    call TriggerAddAction(st___prototype46[5],function sa___prototype46_s__OrdinaryWizard___OrdinaryWizard_E)
    call TriggerAddCondition(st___prototype46[5],Condition(function sa___prototype46_s__OrdinaryWizard___OrdinaryWizard_E))
    set st___prototype1[61]=CreateTrigger()
    call TriggerAddAction(st___prototype1[61],function sa___prototype1_s__SL__SL_anon__90)
    call TriggerAddCondition(st___prototype1[61],Condition(function sa___prototype1_s__SL__SL_anon__90))
    set st___prototype1[62]=CreateTrigger()
    call TriggerAddAction(st___prototype1[62],function sa___prototype1_s__SL__SL_anon__91)
    call TriggerAddCondition(st___prototype1[62],Condition(function sa___prototype1_s__SL__SL_anon__91))
    set st___prototype1[63]=CreateTrigger()
    call TriggerAddAction(st___prototype1[63],function sa___prototype1_s__SL__SL_anon__89)
    call TriggerAddCondition(st___prototype1[63],Condition(function sa___prototype1_s__SL__SL_anon__89))
    set st___prototype1[64]=CreateTrigger()
    call TriggerAddAction(st___prototype1[64],function sa___prototype1_s__SL__SL_anon__93)
    call TriggerAddCondition(st___prototype1[64],Condition(function sa___prototype1_s__SL__SL_anon__93))
    set st___prototype1[65]=CreateTrigger()
    call TriggerAddAction(st___prototype1[65],function sa___prototype1_s__SL__SL_anon__95)
    call TriggerAddCondition(st___prototype1[65],Condition(function sa___prototype1_s__SL__SL_anon__95))
    set st___prototype1[66]=CreateTrigger()
    call TriggerAddAction(st___prototype1[66],function sa___prototype1_s__SL__SL_anon__96)
    call TriggerAddCondition(st___prototype1[66],Condition(function sa___prototype1_s__SL__SL_anon__96))
    set st___prototype1[67]=CreateTrigger()
    call TriggerAddAction(st___prototype1[67],function sa___prototype1_s__SL__SL_anon__104)
    call TriggerAddCondition(st___prototype1[67],Condition(function sa___prototype1_s__SL__SL_anon__104))
    set st___prototype1[68]=CreateTrigger()
    call TriggerAddAction(st___prototype1[68],function sa___prototype1_s__SL__SL_anon__105)
    call TriggerAddCondition(st___prototype1[68],Condition(function sa___prototype1_s__SL__SL_anon__105))
    set st___prototype1[69]=CreateTrigger()
    call TriggerAddAction(st___prototype1[69],function sa___prototype1_s__SL__SL_anon__98)
    call TriggerAddCondition(st___prototype1[69],Condition(function sa___prototype1_s__SL__SL_anon__98))
    set st___prototype1[70]=CreateTrigger()
    call TriggerAddAction(st___prototype1[70],function sa___prototype1_s__SL__SL_anon__99)
    call TriggerAddCondition(st___prototype1[70],Condition(function sa___prototype1_s__SL__SL_anon__99))
    set st___prototype1[71]=CreateTrigger()
    call TriggerAddAction(st___prototype1[71],function sa___prototype1_s__SL__SL_anon__101)
    call TriggerAddCondition(st___prototype1[71],Condition(function sa___prototype1_s__SL__SL_anon__101))
    set st___prototype1[72]=CreateTrigger()
    call TriggerAddAction(st___prototype1[72],function sa___prototype1_s__SL__SL_anon__102)
    call TriggerAddCondition(st___prototype1[72],Condition(function sa___prototype1_s__SL__SL_anon__102))
    set st___prototype1[73]=CreateTrigger()
    call TriggerAddAction(st___prototype1[73],function sa___prototype1_s__SL__SL_anon__97)
    call TriggerAddCondition(st___prototype1[73],Condition(function sa___prototype1_s__SL__SL_anon__97))
    set st___prototype1[74]=CreateTrigger()
    call TriggerAddAction(st___prototype1[74],function sa___prototype1_s__SL__SL_anon__106)
    call TriggerAddCondition(st___prototype1[74],Condition(function sa___prototype1_s__SL__SL_anon__106))
    set st___prototype1[75]=CreateTrigger()
    call TriggerAddAction(st___prototype1[75],function sa___prototype1_s__SL__SL_R)
    call TriggerAddCondition(st___prototype1[75],Condition(function sa___prototype1_s__SL__SL_R))
    set st___prototype1[76]=CreateTrigger()
    call TriggerAddAction(st___prototype1[76],function sa___prototype1_s__SL__SL_E)
    call TriggerAddCondition(st___prototype1[76],Condition(function sa___prototype1_s__SL__SL_E))
    set st___prototype1[77]=CreateTrigger()
    call TriggerAddAction(st___prototype1[77],function sa___prototype1_s__SL__SL_Q)
    call TriggerAddCondition(st___prototype1[77],Condition(function sa___prototype1_s__SL__SL_Q))
    set st___prototype1[78]=CreateTrigger()
    call TriggerAddAction(st___prototype1[78],function sa___prototype1_s__SL__SL_W)
    call TriggerAddCondition(st___prototype1[78],Condition(function sa___prototype1_s__SL__SL_W))
    set st___prototype1[79]=CreateTrigger()
    call TriggerAddAction(st___prototype1[79],function sa___prototype1_s__SL__SL_HERO_START)
    call TriggerAddCondition(st___prototype1[79],Condition(function sa___prototype1_s__SL__SL_HERO_START))
    set st___prototype1[80]=CreateTrigger()
    call TriggerAddAction(st___prototype1[80],function sa___prototype1_s__SwordMaster__SwordMaster_anon__110)
    call TriggerAddCondition(st___prototype1[80],Condition(function sa___prototype1_s__SwordMaster__SwordMaster_anon__110))
    set st___prototype1[81]=CreateTrigger()
    call TriggerAddAction(st___prototype1[81],function sa___prototype1_s__SwordMaster__SwordMaster_anon__111)
    call TriggerAddCondition(st___prototype1[81],Condition(function sa___prototype1_s__SwordMaster__SwordMaster_anon__111))
    set st___prototype1[82]=CreateTrigger()
    call TriggerAddAction(st___prototype1[82],function sa___prototype1_s__SwordMaster__SwordMaster_anon__112)
    call TriggerAddCondition(st___prototype1[82],Condition(function sa___prototype1_s__SwordMaster__SwordMaster_anon__112))
    set st___prototype1[83]=CreateTrigger()
    call TriggerAddAction(st___prototype1[83],function sa___prototype1_s__SwordMaster__SwordMaster_anon__114)
    call TriggerAddCondition(st___prototype1[83],Condition(function sa___prototype1_s__SwordMaster__SwordMaster_anon__114))
    set st___prototype32[3]=CreateTrigger()
    call TriggerAddAction(st___prototype32[3],function sa___prototype32_s__SwordMaster__SwordMaster_AI)
    call TriggerAddCondition(st___prototype32[3],Condition(function sa___prototype32_s__SwordMaster__SwordMaster_AI))
    set st___prototype1[84]=CreateTrigger()
    call TriggerAddAction(st___prototype1[84],function sa___prototype1_s__SwordMaster__SwordMaster_W)
    call TriggerAddCondition(st___prototype1[84],Condition(function sa___prototype1_s__SwordMaster__SwordMaster_W))
    set st___prototype1[85]=CreateTrigger()
    call TriggerAddAction(st___prototype1[85],function sa___prototype1_s__SwordMaster__SwordMaster_E)
    call TriggerAddCondition(st___prototype1[85],Condition(function sa___prototype1_s__SwordMaster__SwordMaster_E))
    set st___prototype1[86]=CreateTrigger()
    call TriggerAddAction(st___prototype1[86],function sa___prototype1_s__SwordMaster__SwordMaster_R)
    call TriggerAddCondition(st___prototype1[86],Condition(function sa___prototype1_s__SwordMaster__SwordMaster_R))
    set st___prototype46[6]=CreateTrigger()
    call TriggerAddAction(st___prototype46[6],function sa___prototype46_s__SwordMaster__SwordMaster_Spawn)
    call TriggerAddCondition(st___prototype46[6],Condition(function sa___prototype46_s__SwordMaster__SwordMaster_Spawn))
    set st___prototype1[87]=CreateTrigger()
    call TriggerAddAction(st___prototype1[87],function sa___prototype1_s__WindWalk__WindWalk_anon__54)
    call TriggerAddCondition(st___prototype1[87],Condition(function sa___prototype1_s__WindWalk__WindWalk_anon__54))
    set st___prototype1[88]=CreateTrigger()
    call TriggerAddAction(st___prototype1[88],function sa___prototype1_s__WindWalk__WindWalk_anon__55)
    call TriggerAddCondition(st___prototype1[88],Condition(function sa___prototype1_s__WindWalk__WindWalk_anon__55))
    set st___prototype1[89]=CreateTrigger()
    call TriggerAddAction(st___prototype1[89],function sa___prototype1_s__WindWalk__WindWalk_anon__53)
    call TriggerAddCondition(st___prototype1[89],Condition(function sa___prototype1_s__WindWalk__WindWalk_anon__53))
    set st___prototype1[90]=CreateTrigger()
    call TriggerAddAction(st___prototype1[90],function sa___prototype1_s__WindWalk__WindWalk_anon__56)
    call TriggerAddCondition(st___prototype1[90],Condition(function sa___prototype1_s__WindWalk__WindWalk_anon__56))
    set st___prototype1[91]=CreateTrigger()
    call TriggerAddAction(st___prototype1[91],function sa___prototype1_s__WindWalk__WindWalk_anon__58)
    call TriggerAddCondition(st___prototype1[91],Condition(function sa___prototype1_s__WindWalk__WindWalk_anon__58))
    set st___prototype1[92]=CreateTrigger()
    call TriggerAddAction(st___prototype1[92],function sa___prototype1_s__WindWalk__WindWalk_anon__59)
    call TriggerAddCondition(st___prototype1[92],Condition(function sa___prototype1_s__WindWalk__WindWalk_anon__59))
    set st___prototype1[93]=CreateTrigger()
    call TriggerAddAction(st___prototype1[93],function sa___prototype1_s__WindWalk__WindWalk_anon__57)
    call TriggerAddCondition(st___prototype1[93],Condition(function sa___prototype1_s__WindWalk__WindWalk_anon__57))
    set st___prototype1[94]=CreateTrigger()
    call TriggerAddAction(st___prototype1[94],function sa___prototype1_s__WindWalk__WindWalk_anon__63)
    call TriggerAddCondition(st___prototype1[94],Condition(function sa___prototype1_s__WindWalk__WindWalk_anon__63))
    set st___prototype1[95]=CreateTrigger()
    call TriggerAddAction(st___prototype1[95],function sa___prototype1_s__WindWalk__WindWalk_anon__64)
    call TriggerAddCondition(st___prototype1[95],Condition(function sa___prototype1_s__WindWalk__WindWalk_anon__64))
    set st___prototype1[96]=CreateTrigger()
    call TriggerAddAction(st___prototype1[96],function sa___prototype1_s__WindWalk__WindWalk_anon__60)
    call TriggerAddCondition(st___prototype1[96],Condition(function sa___prototype1_s__WindWalk__WindWalk_anon__60))
    set st___prototype1[97]=CreateTrigger()
    call TriggerAddAction(st___prototype1[97],function sa___prototype1_s__WindWalk__WindWalk_anon__61)
    call TriggerAddCondition(st___prototype1[97],Condition(function sa___prototype1_s__WindWalk__WindWalk_anon__61))
    set st___prototype1[98]=CreateTrigger()
    call TriggerAddAction(st___prototype1[98],function sa___prototype1_s__WindWalk__WindWalk_anon__62)
    call TriggerAddCondition(st___prototype1[98],Condition(function sa___prototype1_s__WindWalk__WindWalk_anon__62))
    set st___prototype1[99]=CreateTrigger()
    call TriggerAddAction(st___prototype1[99],function sa___prototype1_s__WindWalk__WindWalk_anon__68)
    call TriggerAddCondition(st___prototype1[99],Condition(function sa___prototype1_s__WindWalk__WindWalk_anon__68))
    set st___prototype1[100]=CreateTrigger()
    call TriggerAddAction(st___prototype1[100],function sa___prototype1_s__WindWalk__WindWalk_anon__69)
    call TriggerAddCondition(st___prototype1[100],Condition(function sa___prototype1_s__WindWalk__WindWalk_anon__69))
    set st___prototype1[101]=CreateTrigger()
    call TriggerAddAction(st___prototype1[101],function sa___prototype1_s__WindWalk__WindWalk_anon__67)
    call TriggerAddCondition(st___prototype1[101],Condition(function sa___prototype1_s__WindWalk__WindWalk_anon__67))
    set st___prototype1[102]=CreateTrigger()
    call TriggerAddAction(st___prototype1[102],function sa___prototype1_s__WindWalk__WindWalk_anon__70)
    call TriggerAddCondition(st___prototype1[102],Condition(function sa___prototype1_s__WindWalk__WindWalk_anon__70))
    set st___prototype1[103]=CreateTrigger()
    call TriggerAddAction(st___prototype1[103],function sa___prototype1_s__WindWalk__WindWalk_anon__65)
    call TriggerAddCondition(st___prototype1[103],Condition(function sa___prototype1_s__WindWalk__WindWalk_anon__65))
    set st___prototype1[104]=CreateTrigger()
    call TriggerAddAction(st___prototype1[104],function sa___prototype1_s__WindWalk__WindWalk_anon__66)
    call TriggerAddCondition(st___prototype1[104],Condition(function sa___prototype1_s__WindWalk__WindWalk_anon__66))
    set st___prototype1[105]=CreateTrigger()
    call TriggerAddAction(st___prototype1[105],function sa___prototype1_s__WindWalk__WindWalk_R)
    call TriggerAddCondition(st___prototype1[105],Condition(function sa___prototype1_s__WindWalk__WindWalk_R))
    set st___prototype1[106]=CreateTrigger()
    call TriggerAddAction(st___prototype1[106],function sa___prototype1_s__WindWalk__WindWalk_E)
    call TriggerAddCondition(st___prototype1[106],Condition(function sa___prototype1_s__WindWalk__WindWalk_E))
    set st___prototype1[107]=CreateTrigger()
    call TriggerAddAction(st___prototype1[107],function sa___prototype1_s__WindWalk__WindWalk_Q)
    call TriggerAddCondition(st___prototype1[107],Condition(function sa___prototype1_s__WindWalk__WindWalk_Q))
    set st___prototype1[108]=CreateTrigger()
    call TriggerAddAction(st___prototype1[108],function sa___prototype1_s__WindWalk__WindWalk_W)
    call TriggerAddCondition(st___prototype1[108],Condition(function sa___prototype1_s__WindWalk__WindWalk_W))
    set st___prototype1[109]=CreateTrigger()
    call TriggerAddAction(st___prototype1[109],function sa___prototype1_s__WindWalk__WindWalk_HERO_START)
    call TriggerAddCondition(st___prototype1[109],Condition(function sa___prototype1_s__WindWalk__WindWalk_HERO_START))
    set st___prototype1[110]=CreateTrigger()
    call TriggerAddAction(st___prototype1[110],function sa___prototype1_s__WindWalk__WindWalk_HERO_STOP)
    call TriggerAddCondition(st___prototype1[110],Condition(function sa___prototype1_s__WindWalk__WindWalk_HERO_STOP))
    set st___prototype1[111]=CreateTrigger()
    call TriggerAddAction(st___prototype1[111],function sa___prototype1_s__ZZ__ZZ_anon__72)
    call TriggerAddCondition(st___prototype1[111],Condition(function sa___prototype1_s__ZZ__ZZ_anon__72))
    set st___prototype1[112]=CreateTrigger()
    call TriggerAddAction(st___prototype1[112],function sa___prototype1_s__ZZ__ZZ_anon__73)
    call TriggerAddCondition(st___prototype1[112],Condition(function sa___prototype1_s__ZZ__ZZ_anon__73))
    set st___prototype1[113]=CreateTrigger()
    call TriggerAddAction(st___prototype1[113],function sa___prototype1_s__ZZ__ZZ_anon__71)
    call TriggerAddCondition(st___prototype1[113],Condition(function sa___prototype1_s__ZZ__ZZ_anon__71))
    set st___prototype1[114]=CreateTrigger()
    call TriggerAddAction(st___prototype1[114],function sa___prototype1_s__ZZ__ZZ_anon__74)
    call TriggerAddCondition(st___prototype1[114],Condition(function sa___prototype1_s__ZZ__ZZ_anon__74))
    set st___prototype1[115]=CreateTrigger()
    call TriggerAddAction(st___prototype1[115],function sa___prototype1_s__ZZ__ZZ_anon__76)
    call TriggerAddCondition(st___prototype1[115],Condition(function sa___prototype1_s__ZZ__ZZ_anon__76))
    set st___prototype1[116]=CreateTrigger()
    call TriggerAddAction(st___prototype1[116],function sa___prototype1_s__ZZ__ZZ_anon__77)
    call TriggerAddCondition(st___prototype1[116],Condition(function sa___prototype1_s__ZZ__ZZ_anon__77))
    set st___prototype1[117]=CreateTrigger()
    call TriggerAddAction(st___prototype1[117],function sa___prototype1_s__ZZ__ZZ_R)
    call TriggerAddCondition(st___prototype1[117],Condition(function sa___prototype1_s__ZZ__ZZ_R))
    set st___prototype1[118]=CreateTrigger()
    call TriggerAddAction(st___prototype1[118],function sa___prototype1_s__ZZ__ZZ_E)
    call TriggerAddCondition(st___prototype1[118],Condition(function sa___prototype1_s__ZZ__ZZ_E))
    set st___prototype1[119]=CreateTrigger()
    call TriggerAddAction(st___prototype1[119],function sa___prototype1_s__ZZ__ZZ_W)
    call TriggerAddCondition(st___prototype1[119],Condition(function sa___prototype1_s__ZZ__ZZ_W))
    set st___prototype1[120]=CreateTrigger()
    call TriggerAddAction(st___prototype1[120],function sa___prototype1_s__ZZ__ZZ_Q)
    call TriggerAddCondition(st___prototype1[120],Condition(function sa___prototype1_s__ZZ__ZZ_Q))
    set st___prototype1[121]=CreateTrigger()
    call TriggerAddAction(st___prototype1[121],function sa___prototype1_s__ZZ__ZZ_HERO_START)
    call TriggerAddCondition(st___prototype1[121],Condition(function sa___prototype1_s__ZZ__ZZ_HERO_START))
    set st___prototype1[122]=CreateTrigger()
    call TriggerAddAction(st___prototype1[122],function sa___prototype1_s__ZZ__ZZ_HERO_STOP)
    call TriggerAddCondition(st___prototype1[122],Condition(function sa___prototype1_s__ZZ__ZZ_HERO_STOP))
    set st___prototype46[7]=CreateTrigger()
    call TriggerAddAction(st___prototype46[7],function sa___prototype46_s__Respawn___Respawn_Death)
    call TriggerAddCondition(st___prototype46[7],Condition(function sa___prototype46_s__Respawn___Respawn_Death))
    set st___prototype35[5]=CreateTrigger()
    call TriggerAddAction(st___prototype35[5],function sa___prototype35_s__Respawn___Respawn_Press)
    call TriggerAddCondition(st___prototype35[5],Condition(function sa___prototype35_s__Respawn___Respawn_Press))
    set st___prototype35[6]=CreateTrigger()
    call TriggerAddAction(st___prototype35[6],function sa___prototype35_s__Respawn___Respawn_PressSnyc)
    call TriggerAddCondition(st___prototype35[6],Condition(function sa___prototype35_s__Respawn___Respawn_PressSnyc))



























































    call ExecuteFunc("s__Stack_onInit")
    call ExecuteFunc("s__Table___GTable_onInit")
    call ExecuteFunc("s__TakeUi_onInit")
    call ExecuteFunc("s__Buffs_onInit")
    call ExecuteFunc("s__Dash_onInit")
    call ExecuteFunc("s__HitFlys_onInit")
    call ExecuteFunc("s__Players_onInit")
    call ExecuteFunc("s__Spell_onInit")
    call ExecuteFunc("s__Damage_onInit")
    call ExecuteFunc("s__PlayerPress_onInit")
    call ExecuteFunc("s__Units_onInit")
    call ExecuteFunc("s__BlackSaber__BlackSaber_onInit")
    call ExecuteFunc("s__KillUi_onInit")
    call ExecuteFunc("s__OrdinaryWizard___OrdinaryWizard_onInit")
    call ExecuteFunc("s__SL__SL_onInit")
    call ExecuteFunc("s__SwordMaster__SwordMaster_onInit")
    call ExecuteFunc("s__WindWalk__WindWalk_onInit")
    call ExecuteFunc("s__ZZ__ZZ_onInit")
    call ExecuteFunc("s__Respawn___Respawn_onInit")
endfunction

