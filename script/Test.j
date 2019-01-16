library Test requires Util{
    //测试类
    //提供各种测试命令及小工具

    private{
        integer PlayerEscAnimeId[];//玩家自定义值，记录测试播放动作的
        real RangeDis[];//玩家特效距离
        real RangeR[];//玩家特效范围
    }

    //指令
    function Chat(EventArgs e){
        Players p=Players.Get(e.TriggerPlayer);
        if(e.ChatString=="-reset"){
            PlayerEscAnimeId[p.playerid]=0;
            BJDebugMsg("动作序号已重置");
        }
        if(e.ChatString=="1"){
            if(p.hero.unit!=null){//对自己造成伤害
                p.hero.Damage(p.hero.unit,Damage.Chaos,0,500);
            }
        }
        if(SubString(e.ChatString,0,7)=="-ranged"){//特效距离
            RangeDis[p.playerid]=SubString(e.ChatString,7,1);
        }
        if(SubString(e.ChatString,0,7)=="-ranger"){//特效角度
            RangeR[p.playerid]=SubString(e.ChatString,7,1);
        }
        if(e.ChatString=="-range"){
            if(p.hero.unit!=null){//创建特效
                Util.Range(p.hero.X()+RangeDis[p.playerid]*CosBJ(p.hero.F()),p.hero.Y()+RangeDis[p.playerid]*SinBJ(p.hero.F()),RangeR[p.playerid]);
            }
        }
    }

    //ESC功能，满级，重置CD，开启共享，播放动画
    function Esc(EventArgs e){
        Players p=Players.Get(e.TriggerPlayer);
        if(p.hero.unit!=null){
            p.hero.SetMP(p.hero.MaxMP());
            UnitResetCooldown( p.hero.unit);
            SetHeroLevel(p.hero.unit, 25, true );
            p.hero.AnimeId(PlayerEscAnimeId[p.playerid]);
            BJDebugMsg("动作序号:"+I2S(PlayerEscAnimeId[p.playerid]));
            PlayerEscAnimeId[p.playerid]+=1;
            p.AddMoney(50000);
            SetPlayerAlliance( Player(PLAYER_NEUTRAL_AGGRESSIVE),p.player, ALLIANCE_SHARED_CONTROL, true );
            SetPlayerAlliance( Player(PLAYER_NEUTRAL_PASSIVE),p.player, ALLIANCE_SHARED_CONTROL, true );
            SetPlayerAlliance( Player(4),p.player, ALLIANCE_SHARED_CONTROL, true );
            SetPlayerAlliance( Player(1),p.player, ALLIANCE_SHARED_CONTROL, true );
        }
    }

    function onInit(){
        Events.On(Events.onPlayerPressEsc,Esc);
        Events.On(Events.onPlayerChat,Chat);
    }
}