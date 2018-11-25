globals
//globals from Hero:
constant boolean LIBRARY_Hero=true
//endglobals from Hero
//globals from Table:
constant boolean LIBRARY_Table=true
constant integer Table__MAX_INSTANCES=8100
        //Feel free to change max instances if necessary, it will only affect allocation
        //speed which shouldn't matter that much.

    //=========================================================
hashtable Table__ht
//endglobals from Table
//globals from Teams:
constant boolean LIBRARY_Teams=true
force Teams__AllPlayers
// processed:         force  array Teams__Team_Players[3]
// processed:         rect  array Teams__Team_Rect[3]
// processed:         string  array Teams__Team_Name[3]
// processed:         integer  array Teams__Team_Kills[3]
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
rect array Tree__rec
//endglobals from Tree
//globals from Util:
constant boolean LIBRARY_Util=true
//endglobals from Util
//globals from Camera:
constant boolean LIBRARY_Camera=true
//endglobals from Camera
//globals from PlayerEvent:
constant boolean LIBRARY_PlayerEvent=true
trigger PlayerEvent__disconnect=CreateTrigger()
//endglobals from PlayerEvent
//globals from Units:
constant boolean LIBRARY_Units=true
//endglobals from Units
//globals from HeroRare:
constant boolean LIBRARY_HeroRare=true
// processed:     unitpool  array HeroRare__HeroRare[3]
unit HeroRare_LastRandomUnit
//endglobals from HeroRare
//globals from Winner:
constant boolean LIBRARY_Winner=true
//endglobals from Winner
//globals from Init:
constant boolean LIBRARY_Init=true
unit array PlayerHero
unit Origin_Ball
unit Origin_Magic
real Origin_X
real Origin_Y
//endglobals from Init
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
constant integer si__Hero=1
integer s__Hero_ht
constant integer si__Table__GTable=2
integer si__Table__GTable_F=0
integer si__Table__GTable_I=0
integer array si__Table__GTable_V
constant integer si__Table=3
constant integer si__StringTable=4
constant integer si__HandleTable=5
constant integer si__Teams=6
integer si__Teams_F=0
integer si__Teams_I=0
integer array si__Teams_V
constant integer si__Util__Util=7
integer si__Util__Util_F=0
integer si__Util__Util_I=0
integer array si__Util__Util_V
constant integer si__Units=8
integer si__Units_F=0
integer si__Units_I=0
integer array si__Units_V
integer s__Units_ht
player array s__Units_player
integer array s__Units_playerid
boolean array s__Units_isHero
string array s__Units_name
unit array s__Units_unit
integer array s__Units_hero
constant integer si__HeroRares=9
integer si__HeroRares_F=0
integer si__HeroRares_I=0
integer array si__HeroRares_V
boolean s__HeroRares_isRepeat=false
constant integer si__Winner=10
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
force array s__Teams__Team_Players
rect array s__Teams__Team_Rect
string array s__Teams__Team_Name
integer array s__Teams__Team_Kills
integer array s__TimerUtils__data
timer array s__TimerUtils__tT
unitpool array s__HeroRare__HeroRare
integer array si__Table__GTable_type
trigger array st__Table__GTable_onDestroy
integer array si__Units_type
trigger array st__Units_onDestroy
trigger st__HandleTable__getindex
trigger st__HandleTable__setindex
trigger st__HandleTable_flush
trigger st__HandleTable_exists
trigger st__HeroRares_Repeat
trigger st__HeroRares_AddRandomHero
trigger st__Winner_ShowWin
handle f__arg_handle1
integer f__arg_integer1
boolean f__arg_boolean1
unit f__arg_unit1
integer f__arg_this
integer f__result_integer
boolean f__result_boolean

endglobals


//Generated method caller for Table__GTable.onDestroy
function sc__Table__GTable_onDestroy takes integer this returns nothing
    set f__arg_this=this
    call TriggerEvaluate(st__Table__GTable_onDestroy[2])
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
        return 0
    endif

    set si__Table__GTable_type[this]=2
    set si__Table__GTable_V[this]=-1
 return this
endfunction

//Generated destructor of Table__GTable
function sc__Table__GTable_deallocate takes integer this returns nothing
    if this==null then
        return
    elseif (si__Table__GTable_V[this]!=-1) then
        return
    endif
    set f__arg_this=this
    call TriggerEvaluate(st__Table__GTable_onDestroy[si__Table__GTable_type[this]])
    set si__Table__GTable_V[this]=si__Table__GTable_F
    set si__Table__GTable_F=this
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

    set si__Units_type[this]=8
    set si__Units_V[this]=-1
 return this
endfunction

//Generated destructor of Units
function sc__Units_deallocate takes integer this returns nothing
    if this==null then
        return
    elseif (si__Units_V[this]!=-1) then
        return
    endif
    set f__arg_this=this
    call TriggerEvaluate(st__Units_onDestroy[si__Units_type[this]])
    set si__Units_V[this]=si__Units_F
    set si__Units_F=this
endfunction

//Generated allocator of Util__Util
function s__Util__Util__allocate takes nothing returns integer
 local integer this=si__Util__Util_F
    if (this!=0) then
        set si__Util__Util_F=si__Util__Util_V[this]
    else
        set si__Util__Util_I=si__Util__Util_I+1
        set this=si__Util__Util_I
    endif
    if (this>8190) then
        return 0
    endif

    set si__Util__Util_V[this]=-1
 return this
endfunction

//Generated destructor of Util__Util
function s__Util__Util_deallocate takes integer this returns nothing
    if this==null then
        return
    elseif (si__Util__Util_V[this]!=-1) then
        return
    endif
    set si__Util__Util_V[this]=si__Util__Util_F
    set si__Util__Util_F=this
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

//Generated method caller for HandleTable.flush
function sc__HandleTable_flush takes integer this,handle key returns nothing
    set f__arg_this=this
    set f__arg_handle1=key
    call TriggerEvaluate(st__HandleTable_flush)
endfunction

//Generated method caller for HandleTable.exists
function sc__HandleTable_exists takes integer this,handle key returns boolean
    set f__arg_this=this
    set f__arg_handle1=key
    call TriggerEvaluate(st__HandleTable_exists)
 return f__result_boolean
endfunction

//Generated allocator of HandleTable
function s__HandleTable__allocate takes nothing returns integer
 local integer this=s__Table__GTable__allocate()
 local integer kthis
    if(this==0) then
        return 0
    endif
    set si__Table__GTable_type[this]=5
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
    set si__Table__GTable_type[this]=4
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
    set si__Table__GTable_type[this]=3
    set kthis=this

 return this
endfunction


//Generated allocator of Hero
function s__Hero__allocate takes nothing returns integer
 local integer this=s__Units__allocate()
 local integer kthis
    if(this==0) then
        return 0
    endif
    set si__Units_type[this]=1
    set kthis=this

 return this
endfunction


//library Hero:
        function s__Hero_onInit takes nothing returns nothing
            set s__Hero_ht=s__HandleTable__allocate()
        endfunction
        //public:
            function s__Hero_Attch takes unit u returns nothing
                if ( sc__HandleTable_exists(s__Hero_ht,u) == false ) then
                    call sc__HandleTable__setindex(s__Hero_ht,u, (s__Hero__allocate()))
                endif
            endfunction
            function s__Hero_DestroyHero takes unit u returns nothing
                local integer ud
                if ( sc__HandleTable_exists(s__Hero_ht,u) == true ) then
                    set ud=(sc__HandleTable__getindex(s__Hero_ht,u))
                    call sc__Units_deallocate(ud)
                    call sc__HandleTable_flush(s__Hero_ht,u)
                endif
            endfunction
            function s__Hero_GetHero takes unit u returns integer
                if ( sc__HandleTable_exists(s__Hero_ht,u) == true ) then
                    return sc__HandleTable__getindex(s__Hero_ht,u)
                endif
                return - 1
            endfunction

//library Hero ends
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
            call FlushChildHashtable(Table__ht, ((this))) // INLINED!!
        endfunction

        //=============================================================
        // initialize it all.
        //
        function s__Table__GTable_onInit takes nothing returns nothing
            set Table__ht=InitHashtable()
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
            call FlushChildHashtable(Table__ht, (((- StringHash(firstkey))))) // INLINED!!
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
            call FlushChildHashtable(Table__ht, (((- StringHash(firstkey))))) // INLINED!!
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
            call FlushChildHashtable(Table__ht, (((- StringHash(firstkey))))) // INLINED!!
        endfunction

        function s__HandleTable__staticgetindex takes string firstkey returns integer
            return (- StringHash(firstkey))
        endfunction

//end of: Table__make("HandleTable","handle","GetHandleId(key)" )


//library Table ends
//library Teams:

    //private:  //玩家阵营相关内容初始化类 //玩家组
        function Teams__anon__1 takes nothing returns boolean
            return GetPlayerSlotState(GetFilterPlayer()) == PLAYER_SLOT_STATE_PLAYING
        endfunction
        function Teams__anon__2 takes nothing returns boolean
            return IsPlayerInForce(GetFilterPlayer(), Teams__AllPlayers) == true and GetPlayerTeam(GetFilterPlayer()) == 0
        endfunction
        function Teams__anon__3 takes nothing returns boolean
            return IsPlayerInForce(GetFilterPlayer(), Teams__AllPlayers) == true and GetPlayerTeam(GetFilterPlayer()) == 1
        endfunction
        function Teams__anon__4 takes nothing returns boolean
            return IsPlayerInForce(GetFilterPlayer(), Teams__AllPlayers) == true and GetPlayerTeam(GetFilterPlayer()) == 2
        endfunction
    function Teams__onInit takes nothing returns nothing
        set Teams__AllPlayers=GetPlayersMatching(Condition(function Teams__anon__1))
        set s__Teams__Team_Players[0]= GetPlayersMatching(Condition(function Teams__anon__2))
        set s__Teams__Team_Players[1]= GetPlayersMatching(Condition(function Teams__anon__3))
        set s__Teams__Team_Players[2]= GetPlayersMatching(Condition(function Teams__anon__4))
        set s__Teams__Team_Rect[0]= gg_rct_A_TEAM
        set s__Teams__Team_Rect[1]= gg_rct_B_TEAM
        set s__Teams__Team_Rect[2]= gg_rct_C_TEAM
        set s__Teams__Team_Name[0]= "A组"
        set s__Teams__Team_Name[1]= "B组"
        set s__Teams__Team_Name[2]= "C组"
    endfunction
        function s__Teams_GetTeamKills takes integer p returns integer
            return s__Teams__Team_Kills[p]
        endfunction
        function s__Teams_AddTeamKills takes integer p,integer k returns nothing
            set s__Teams__Team_Kills[p]= s__Teams__Team_Kills[p] + k
        endfunction
        function s__Teams_GetAllPlayers takes nothing returns force
            return Teams__AllPlayers
        endfunction
        function s__Teams_ActionsForAllPlayer takes code f returns nothing
            call ForForce(Teams__AllPlayers, f)
        endfunction
        function s__Teams_ActionsForTeamPlayer takes integer tid,code f returns nothing
            call ForForce(s__Teams__Team_Players[tid], f)
        endfunction
        function s__Teams_PlayerRemoveForce takes player p returns nothing
            call ForceRemovePlayer(Teams__AllPlayers, p)
            call ForceRemovePlayer(s__Teams__Team_Players[GetPlayerTeam(p)], p)
        endfunction
        function s__Teams_GetTeamName takes player p returns string
            return s__Teams__Team_Name[GetPlayerTeam(p)]
        endfunction
        function s__Teams_GetTeamNameByIndex takes integer p returns string
            return s__Teams__Team_Name[p]
        endfunction
        function s__Teams_GetTeamRect takes player p returns rect
            return s__Teams__Team_Rect[GetPlayerTeam(p)]
        endfunction
        function s__Teams_GetTeamForce takes player p returns force
            return s__Teams__Team_Players[GetPlayerTeam(p)]
        endfunction
        function s__Teams_GetTeamForceByIndex takes integer p returns force
            return s__Teams__Team_Players[p]
        endfunction
        function s__Teams_GetTeamNumber takes player p returns integer
            return CountPlayersInForceBJ((s__Teams__Team_Players[GetPlayerTeam((p))])) // INLINED!!
        endfunction
        function s__Teams_GetTeamNumberByIndex takes integer p returns integer
            return CountPlayersInForceBJ((s__Teams__Team_Players[(p)])) // INLINED!!
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





            set s__TimerUtils__data[GetHandleId(t) - TimerUtils__VOFFSET]= value









    endfunction

    function GetTimerData takes timer t returns integer





            // orange





            return s__TimerUtils__data[GetHandleId(t) - TimerUtils__VOFFSET]









    endfunction

    //==========================================================================================

    //==========================================================================================
    function NewTimer takes nothing returns timer
        if ( TimerUtils__tN == 0 ) then
            //If this happens then the QUANTITY rule has already been broken, try to fix the
            // issue, else fail.

                set s__TimerUtils__tT[0]= CreateTimer()

                    if ( GetHandleId(s__TimerUtils__tT[0]) - TimerUtils__VOFFSET < 0 ) or ( GetHandleId(s__TimerUtils__tT[0]) - TimerUtils__VOFFSET >= TimerUtils__ARRAY_SIZE ) then
                        //all right, couldn't fix it
                        call BJDebugMsg("NewTimer: Unable to allocate a timer, you should probably set TimerUtils_USE_HASH_TABLE to true or fix timer leaks.")
                        return null
                    endif








        else
            set TimerUtils__tN=TimerUtils__tN - 1
        endif
        set s__TimerUtils__data[GetHandleId((s__TimerUtils__tT[TimerUtils__tN] )) - TimerUtils__VOFFSET]= ( 0) // INLINED!!
     return s__TimerUtils__tT[TimerUtils__tN]
    endfunction

    //==========================================================================================
    function ReleaseTimer takes timer t returns nothing
        if ( t == null ) then
            return
        endif
        if ( TimerUtils__tN == TimerUtils__ARRAY_SIZE ) then
            //stack is full, the map already has much more troubles than the chance of bug
            call DestroyTimer(t)
        else
            call PauseTimer(t)
            if ( (s__TimerUtils__data[GetHandleId((t)) - TimerUtils__VOFFSET]) == TimerUtils__HELD ) then // INLINED!!
                return
            endif
            set s__TimerUtils__data[GetHandleId((t )) - TimerUtils__VOFFSET]= ( TimerUtils__HELD) // INLINED!!
            set s__TimerUtils__tT[TimerUtils__tN]= t
            set TimerUtils__tN=TimerUtils__tN + 1
        endif
    endfunction

    function TimerUtils__init takes nothing returns nothing
     local integer i=0
     local integer o=- 1
     local boolean oops= false
     










            loop
                set i=0
                loop
                    exitwhen ( i == TimerUtils__QUANTITY )
                    set s__TimerUtils__tT[i]= CreateTimer()
                    if ( i == 0 ) then
                        set TimerUtils__VOFFSET=GetHandleId(s__TimerUtils__tT[i])

                            set o=TimerUtils__VOFFSET



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
        function s__Util__Util_XY takes unit u,unit m returns real
            return bj_RADTODEG * Atan2(GetUnitY(m) - GetUnitY(u), GetUnitX(m) - GetUnitX(u))
        endfunction
        function s__Util__Util_XYEX takes real x,real y,real x1,real y1 returns real
            return bj_RADTODEG * Atan2(y1 - y, x1 - x)
        endfunction
        function s__Util__Util_XY2 takes unit u,unit m returns real
            local real dx=GetUnitX(m) - GetUnitX(u)
            local real dy=GetUnitY(m) - GetUnitY(u)
            return SquareRoot(dx * dx + dy * dy)
        endfunction
        function s__Util__Util_XY2EX takes real x,real y,real x1,real y1 returns real
            local real dx=x1 - x
            local real dy=y1 - y
            return SquareRoot(dx * dx + dy * dy)
        endfunction
        function s__Util__Util_UnitAddRemoveAbility takes unit u,integer i returns nothing
            call UnitAddAbility(u, i)
            call UnitRemoveAbility(u, i)
        endfunction

//library Util ends
//library Camera:

        function Camera__anon__5 takes nothing returns nothing
            call SetCameraField(CAMERA_FIELD_TARGET_DISTANCE, 3000.00, 0)
        endfunction
    function Camera__onInit takes nothing returns nothing
        call CameraSetSmoothingFactor(998.00)
        call TimerStart(NewTimer(), 0.01, true, function Camera__anon__5)
    endfunction

//library Camera ends
//library PlayerEvent:

        function PlayerEvent__anon__8 takes nothing returns nothing
            call AdjustPlayerStateBJ(GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD) / ( (CountPlayersInForceBJ((s__Teams__Team_Players[GetPlayerTeam(((GetTriggerPlayer())))]))) - 1 ), GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD) // INLINED!!
        endfunction
    function PlayerEvent__onDisconnect takes nothing returns nothing
        local player p=GetTriggerPlayer()
        local integer index=GetConvertedPlayerId(p)
        local integer x
        local unit u=PlayerHero[index]
        call ReviveHero(u, GetUnitX(u), GetUnitY(u), false)
        call SetUnitPosition(u, GetRectCenterX((s__Teams__Team_Rect[GetPlayerTeam((p))])), GetRectCenterY((s__Teams__Team_Rect[GetPlayerTeam((p))]))) // INLINED!!
        set x=1
        loop
        exitwhen ( x > 6 )
            call UnitRemoveItemFromSlotSwapped(x, u)
        set x=x + 1
        endloop
        call sc__HeroRares_AddRandomHero(u)
        set x=(CountPlayersInForceBJ((s__Teams__Team_Players[GetPlayerTeam(((p)))]))) - 1 // INLINED!!
        if ( x != 0 ) then
            call ForForce((s__Teams__Team_Players[GetPlayerTeam((p))]), function PlayerEvent__anon__8) // INLINED!!
        endif
        call s__Teams_PlayerRemoveForce(p)
        call DisplayTimedTextToForce((Teams__AllPlayers), 5.00, GetPlayerName(p) + " 离开了游戏，金钱将平分给他的队友。") // INLINED!!
        set p=null
        set u=null
    endfunction
        function PlayerEvent__anon__9 takes nothing returns nothing
            call TriggerRegisterPlayerEventLeave(PlayerEvent__disconnect, GetEnumPlayer())
        endfunction
    function PlayerEvent__onInit takes nothing returns nothing
        call ForForce(Teams__AllPlayers, (function PlayerEvent__anon__9)) // INLINED!!
        call TriggerAddAction(PlayerEvent__disconnect, function PlayerEvent__onDisconnect)
        set PlayerEvent__disconnect=null
    endfunction

//library PlayerEvent ends
//library Units:
        //public:
        function s__Units_onInit takes nothing returns nothing
            set s__Units_ht=s__HandleTable__allocate()
        endfunction
        function s__Units_Create takes unit u returns nothing
            local integer ud=s__Units__allocate()
            set s__Units_player[ud]=GetOwningPlayer(u)
            set s__Units_playerid[ud]=GetConvertedPlayerId(s__Units_player[ud])
            set s__Units_isHero[ud]=IsUnitType(u, UNIT_TYPE_HERO)
            set s__Units_name[ud]=GetUnitName(u)
            set s__Units_unit[ud]=u
            if ( s__Units_isHero[ud] == true ) then
                call s__Hero_Attch(u)
            endif
            set s__Units_hero[ud]=s__Hero_GetHero(u)
            call SaveInteger(Table__ht, ((s__Units_ht)), GetHandleId((u)), ( (ud))) // INLINED!!
        endfunction
        function s__Units_Destroys takes unit u returns nothing
            local integer ud=((LoadInteger(Table__ht, ((s__Units_ht)), GetHandleId((u))))) // INLINED!!
            call s__Hero_DestroyHero(u)
            call sc__Units_deallocate(ud)
            call RemoveSavedInteger(Table__ht, ((s__Units_ht)), GetHandleId((u))) // INLINED!!
        endfunction
        function s__Units_Get takes unit u returns integer
            return ((LoadInteger(Table__ht, ((s__Units_ht)), GetHandleId((u))))) // INLINED!!
        endfunction
        function s__Units_Set takes unit u returns nothing
            if ( (HaveSavedInteger(Table__ht, ((s__Units_ht)), GetHandleId((u)))) == false ) then // INLINED!!
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
            if ( s__Units_isHero[(LoadInteger(Table__ht, ((s__Units_ht)), GetHandleId(((u)))))] == false ) then // INLINED!!
                call s__Units_Destroys(u)
            endif
        endfunction
        function s__Units_Remove takes unit u returns nothing
            call RemoveUnit(u)
            call s__Units_Destroys(u)
        endfunction

//library Units ends
//library HeroRare:

        function HeroRare__anon__6 takes nothing returns nothing
            local unit gu=GetEnumUnit()
            if ( IsUnitType(gu, UNIT_TYPE_HERO) == true ) then
                call sc__HeroRares_AddRandomHero(gu)
            endif
            set gu=null
        endfunction
    function HeroRare__onInit takes nothing returns nothing
        local group g=CreateGroup()
        set s__HeroRare__HeroRare[0]= CreateUnitPool()
        set s__HeroRare__HeroRare[1]= CreateUnitPool()
        set s__HeroRare__HeroRare[2]= CreateUnitPool()
        call GroupEnumUnitsInRange(g, 0, 0, 65535, null)
        call ForGroup(g, function HeroRare__anon__6)
        call DestroyGroup(g)
        set s__HeroRares_isRepeat=(true) // INLINED!!
        call BJDebugMsg("HeroRare_OK")
    endfunction
        function s__HeroRares_Repeat takes boolean b returns nothing
            set s__HeroRares_isRepeat=b
        endfunction
        function s__HeroRares_GetRepeat takes nothing returns boolean
            return s__HeroRares_isRepeat
        endfunction
        function s__HeroRares_AddRandomHero takes unit u returns nothing
            if ( (s__HeroRares_isRepeat) == false ) then // INLINED!!
                call UnitPoolAddUnitType(s__HeroRare__HeroRare[GetUnitPointValue(u)], GetUnitTypeId(u), 1)
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
            set HeroRare_LastRandomUnit=PlaceRandomUnit(s__HeroRare__HeroRare[index], p, 0, 0, 0)
            call s__Units_Set(HeroRare_LastRandomUnit)
            if ( (s__HeroRares_isRepeat) == false ) then // INLINED!!
                call UnitPoolRemoveUnitType(s__HeroRare__HeroRare[index], GetUnitTypeId(HeroRare_LastRandomUnit))
            endif
            return HeroRare_LastRandomUnit
        endfunction

//library HeroRare ends
//library Winner:
        function s__Winner_Death takes unit u returns nothing
            local integer ud=(LoadInteger(Table__ht, ((s__Units_ht)), GetHandleId(((u))))) // INLINED!!
            local integer p=s__Units_playerid[ud]
            call s__Teams_AddTeamKills(p , 1)
            if ( (s__Teams__Team_Kills[(p)]) >= s__Winner_MaxKills ) then // INLINED!!
                set s__Winner_GameEnd=true
                call DisplayTimedTextToForce((Teams__AllPlayers), 5.00, "游戏结束啦！！！！！！！！！！！ " + (s__Teams__Team_Name[(p)]) + " 获得了最终的胜利！！") // INLINED!!
                call sc__Winner_ShowWin(p)
            endif
        endfunction
            function s__Winner_anon__10 takes nothing returns nothing
                if ( IsPlayerInForce(GetEnumPlayer(), (s__Teams__Team_Players[(s__Winner_WinTeam)])) == true ) then // INLINED!!
                    call CustomVictoryBJ(GetEnumPlayer(), true, false)
                else
                    call CustomDefeatBJ(GetEnumPlayer(), "失败！")
                endif
            endfunction
        function s__Winner_ShowWin takes integer teamid returns nothing
            set s__Winner_WinTeam=teamid
            call ForForce((Teams__AllPlayers), function s__Winner_anon__10) // INLINED!!
        endfunction
        function s__Winner_ShowTip takes nothing returns nothing
            call StopSoundBJ(gg_snd_ItemReceived, false)
            call PlaySoundBJ(gg_snd_ItemReceived)
            call PingMinimap(s__Winner_OX, s__Winner_OY, 3.00)
        endfunction  //夺旗判定 - 范围900码
            function s__Winner_anon__11 takes nothing returns boolean
                return IsUnitType(GetFilterUnit(), UNIT_TYPE_HERO) == true
            endfunction
        function s__Winner_onLoop takes nothing returns nothing
            local group g
            local unit tmp
            local integer numbers
            local integer ntmp
            local integer array team_numbers
            local real rtmp
            if ( s__Winner_GameEnd == false ) then
                set g=CreateGroup()
                call GroupEnumUnitsInRange(g, s__Winner_OX, s__Winner_OY, 900, Condition(function s__Winner_anon__11))
                set numbers=CountUnitsInGroup(g)
                loop
                exitwhen ( FirstOfGroup(g) == null )
                    set tmp=FirstOfGroup(g)
                    set team_numbers[GetPlayerTeam(GetOwningPlayer(GetEnumUnit()))]=team_numbers[GetPlayerTeam(GetOwningPlayer(GetEnumUnit()))] + 1
                    call GroupRemoveUnit(g, tmp)
                    set tmp=null
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
                        call DisplayTimedTextToForce((Teams__AllPlayers), 5.00, "中央球已被" + (s__Teams__Team_Name[(ntmp)]) + "占领！") // INLINED!!
                    endif
                elseif ( numbers == 0 ) then
                    if ( s__Winner_NowTime > 0 ) then
                        set s__Winner_NowTime=s__Winner_NowTime - ( 0.01 * (CountPlayersInForceBJ((s__Teams__Team_Players[((s__Winner_Team))]))) ) // INLINED!!
                    else
                        call DisplayTimedTextToForce((Teams__AllPlayers), 5.00, (s__Teams__Team_Name[(s__Winner_Team)]) + " 已经丢失了中央球的控制权，中央球现在是中立状态！") // INLINED!!
                        set s__Winner_NowTime=0
                        set s__Winner_Team=- 1
                        call s__Winner_ShowTip()
                    endif
                elseif ( s__Winner_NowTime >= s__Winner_MaxTime ) then
                    set s__Winner_GameEnd=true
                    call PlaySoundBJ(gg_snd_Winner)
                    call DisplayTimedTextToForce((Teams__AllPlayers), 5.00, "游戏结束啦！！！！！！！！！！！ " + (s__Teams__Team_Name[(s__Winner_Team)]) + " 获得了最终的胜利！！") // INLINED!!
                    call s__Winner_ShowWin(s__Winner_Team)
                else
                    set rtmp=( 0.02 * team_numbers[s__Winner_Team] ) - ( 0.01 * ( numbers - team_numbers[s__Winner_Team] ) )
                    set s__Winner_NowTime=s__Winner_NowTime + rtmp
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

    //public:  //中央球、阵初始化、杂物初始化类 //玩家英雄
        function Init__anon__0 takes nothing returns nothing
            local unit u
            call UnitShareVision(Origin_Ball, GetEnumPlayer(), true) //目前没有SR、SSR池英雄，随机上限定位R级
            set u=s__HeroRares_GetRandomHero(GetEnumPlayer() , 20)
            set PlayerHero[GetConvertedPlayerId(GetEnumPlayer())]=u
            call SetUnitPosition(u, GetRectCenterX((s__Teams__Team_Rect[GetPlayerTeam((GetEnumPlayer()))])), GetRectCenterY((s__Teams__Team_Rect[GetPlayerTeam((GetEnumPlayer()))]))) // INLINED!!
            set u=null
        endfunction
    function Init__onInit takes nothing returns nothing
        set Origin_Ball=gg_unit_e000_0010
        set Origin_Magic=gg_unit_e001_0011
        set Origin_X=GetUnitX(Origin_Ball)
        set Origin_Y=GetUnitY(Origin_Ball)
        call SetUnitTimeScale(Origin_Magic, 0)
        call s__Winner_start()
        call ForForce(Teams__AllPlayers, (function Init__anon__0)) // INLINED!!
    endfunction

//library Init ends
//===========================================================================
// 
// 抢地盘
// 
//   Warcraft III map script
//   Generated by the Warcraft III World Editor
//   Date: Sun Nov 25 17:40:14 2018
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

call ExecuteFunc("jasshelper__initstructs692436890")
call ExecuteFunc("Teams__onInit")
call ExecuteFunc("TimerUtils__init")
call ExecuteFunc("Tree__onInit")
call ExecuteFunc("Camera__onInit")
call ExecuteFunc("PlayerEvent__onInit")
call ExecuteFunc("HeroRare__onInit")
call ExecuteFunc("Init__onInit")

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
function sa__Table__GTable_onDestroy takes nothing returns boolean
local integer this=f__arg_this
            call FlushChildHashtable(Table__ht, ((this))) // INLINED!!
   return true
endfunction
function sa__Winner_ShowWin takes nothing returns boolean
local integer teamid=f__arg_integer1
            set s__Winner_WinTeam=teamid
            call ForForce((Teams__AllPlayers), function s__Winner_anon__10) // INLINED!!
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
function sa__HandleTable_flush takes nothing returns boolean
local integer this=f__arg_this
local handle key=f__arg_handle1
            call RemoveSavedInteger(Table__ht, (this), GetHandleId(key))
   return true
endfunction
function sa__HandleTable_exists takes nothing returns boolean
local integer this=f__arg_this
local handle key=f__arg_handle1
set f__result_boolean= HaveSavedInteger(Table__ht, (this), GetHandleId(key))
   return true
endfunction

function jasshelper__initstructs692436890 takes nothing returns nothing
    set st__Table__GTable_onDestroy[2]=CreateTrigger()
    set st__Table__GTable_onDestroy[3]=st__Table__GTable_onDestroy[2]
    set st__Table__GTable_onDestroy[4]=st__Table__GTable_onDestroy[2]
    set st__Table__GTable_onDestroy[5]=st__Table__GTable_onDestroy[2]
    call TriggerAddCondition(st__Table__GTable_onDestroy[2],Condition( function sa__Table__GTable_onDestroy))
    set st__Winner_ShowWin=CreateTrigger()
    call TriggerAddCondition(st__Winner_ShowWin,Condition( function sa__Winner_ShowWin))
    set st__HeroRares_Repeat=CreateTrigger()
    call TriggerAddCondition(st__HeroRares_Repeat,Condition( function sa__HeroRares_Repeat))
    set st__HeroRares_AddRandomHero=CreateTrigger()
    call TriggerAddCondition(st__HeroRares_AddRandomHero,Condition( function sa__HeroRares_AddRandomHero))
    set st__Units_onDestroy[8]=null
    set st__Units_onDestroy[1]=null
    set st__HandleTable__getindex=CreateTrigger()
    call TriggerAddCondition(st__HandleTable__getindex,Condition( function sa__HandleTable__getindex))
    set st__HandleTable__setindex=CreateTrigger()
    call TriggerAddCondition(st__HandleTable__setindex,Condition( function sa__HandleTable__setindex))
    set st__HandleTable_flush=CreateTrigger()
    call TriggerAddCondition(st__HandleTable_flush,Condition( function sa__HandleTable_flush))
    set st__HandleTable_exists=CreateTrigger()
    call TriggerAddCondition(st__HandleTable_exists,Condition( function sa__HandleTable_exists))











    call ExecuteFunc("s__Hero_onInit")
    call ExecuteFunc("s__Table__GTable_onInit")
    call ExecuteFunc("s__Units_onInit")
endfunction

