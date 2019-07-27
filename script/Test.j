library Test requires Util{
    //测试类
    //提供各种测试命令及小工具

    private{
        integer PlayerEscAnimeId[];//玩家自定义值，记录测试播放动作的
        real RangeDis[];//玩家特效距离
        real RangeR[];//玩家特效范围
        unit SelectUnits[];//玩家选择的单位
    }


    function Select(EventArgs e){
        SelectUnits[Players.Get(e.TriggerPlayer).playerid]=e.TriggerUnit;
    }

    //指令
    function Chat(EventArgs e){
        Players p=Players.Get(e.TriggerPlayer);
        Units u;
        if(e.ChatString=="-reset"){
            PlayerEscAnimeId[p.playerid]=0;
            BJDebugMsg("动作序号已重置");
        }
        if(e.ChatString=="1"){
            if(p.hero.unit!=null){//对自己造成伤害
                p.hero.Damage(p.hero.unit,Damage.Chaos,'A02F',500);
                p.hero.Damage(p.hero.unit,Damage.Chaos,'A02F',500);
            }
        }
        if(e.ChatString=="2"){
            if(p.hero.unit!=null){//对自己造成伤害
                p.hero.Damage(p.hero.unit,Damage.Magic,'A02A',500);
            }
        }
        if(e.ChatString=="3"){
            if(p.hero.unit!=null){//对自己造成伤害
                p.hero.Damage(p.hero.unit,Damage.Physics,'A02B',500);
            }
        }  
        if(e.ChatString=="4"){
            if(p.hero.unit!=null){//对自己造成伤害
                Buffs.Skill(p.hero.unit,'A00F',1);
            }
        } 
        if(e.ChatString=="5"){
            if(p.hero.unit!=null){//时停自己
                p.hero.TimeStop(true);
            }
        } 
        if(e.ChatString=="6"){
            if(p.hero.unit!=null){//解除自己的时停
                p.hero.TimeStop(false);
            }
        } 
        if(e.ChatString=="7"){
            if(p.hero.unit!=null){//解除自己的时停
                BJDebugMsg("??");
                HitFlys.Remove(p.hero.unit);
            }
        } 
        if(e.ChatString=="8"){
            if(p.hero.unit!=null){//解除自己的时停
                
                HitFlys.Add(p.hero.unit,25);
            }
        } 
        if(e.ChatString=="info"){
            u=Units.Get(SelectUnits[p.playerid]);
            BJDebugMsg("------------单位信息---------");
            BJDebugMsg("名字:"+u.name+"/是否处于硬直:"+Util.B2S(u.IsPause())+"/是否处于时停:"+Util.B2S(u.IsTimeStop()));
        }
        if(e.ChatString=="pause"){
            if(AI_ENABLED==true){
                AI_ENABLED=false;
                BJDebugMsg("[-----警告-----]AI已关闭");
            }else{
                AI_ENABLED=true;
                BJDebugMsg("[-----警告-----]AI已开启");
            }
        } 
        if(e.ChatString=="p"){
            if(p.hero.unit!=null){
                BJDebugMsg("暂停计数："+I2S(p.hero.pauses));
            }
        }
        if(SubString(e.ChatString,0,7)=="-ranged"){//特效距离
            RangeDis[p.playerid]=S2R(SubString(e.ChatString,7,1));
            BJDebugMsg("特效距离已设为:"+R2S(RangeDis[p.playerid]));
        }
        if(SubString(e.ChatString,0,7)=="-ranger"){//特效角度
            RangeR[p.playerid]=S2R(SubString(e.ChatString,7,1));
            BJDebugMsg("特效范围已设为:"+R2S(RangeR[p.playerid]));
        }
        if(e.ChatString=="-range"){
            if(p.hero.unit!=null){//创建特效
                Util.Range(p.hero.X()+RangeDis[p.playerid]*CosBJ(p.hero.F()),p.hero.Y()+RangeDis[p.playerid]*SinBJ(p.hero.F()),RangeR[p.playerid]);
            }
        }
        /*if(e.ChatString=="955"){
            BJDebugMsg(GetMapName()+"/"+GetPluginVersion());
        }
        if(e.ChatString=="966"){//打开掉线跟踪器
            open_code_run_logs(true);
        }
        if(e.ChatString=="977"){//故意异步
            if(p.player==Players.localplayer){
                Units.Spawn(p.player,'H00A',0,0,0);
            }
        }*/
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
        /*Events.On(Events.onPlayerPressEsc,Esc);
        Events.On(Events.onPlayerChat,Chat);
        Events.On(Events.onPlayerSelectUnit,Select);*/
    }
}   