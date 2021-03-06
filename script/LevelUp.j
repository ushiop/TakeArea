library LevelUp requires Events{
    //英雄升级管理类，解锁技能条件、调整AI等级

    integer MaxLv=1;
    integer LvFix=0;
    integer MinLv=0,MinFindLock=0;

    //获取最低等级
    public function GetGameMinLevel()->integer{
        return MinLv;
    }

    function LvUp(EventArgs e){
        integer tmp_lv[];
        integer lv=GetUnitLevel(e.TriggerUnit),m,lmax=0,tmp_i,v;
        Players p=Units.Get(e.TriggerUnit).player,tmp_p;
        if(LvFix==0){
            LvFix=1; 
            Timers.Start(90,0,function(Timers t){
                DisplayTextToForce(Teams.GetAllPlayers(), "[等级补偿]所有玩家等级+1");
                ForForce(Teams.GetAllPlayers(),function(){
                    Players p=Players.Get(GetEnumPlayer()); 
                    SetHeroLevel(p.hero.unit,GetHeroLevel(p.hero.unit)+1, true ); 
                });             
                if(t.Expired()>10){
                    t.Destroy();
                }               
            });
        }
        //获取最低等级
        if(MinFindLock==0){
            MinFindLock=1; 
            for(0<=m<9){
                tmp_p=Players.Get(Player(m));
                if(tmp_p.isonline==true){
                    tmp_lv[lmax]=GetHeroLevel(tmp_p.hero.unit);
                    lmax+=1;
                }
            }
            for(0<=m<lmax){
                for(m<=v<lmax){
                    if(tmp_lv[m]>tmp_lv[v]){
                        tmp_i=tmp_lv[m];
                        tmp_lv[m]=tmp_lv[v];
                        tmp_lv[v]=tmp_i;
                    }
                }
            } 
            MinLv=tmp_lv[0];
            Timers.Start(0.1,0,function(Timers t){
                MinFindLock=0;
                t.Destroy();
            });
        }
        if(lv>MaxLv){
            MaxLv=lv;
            ForForce(Teams.GetAllPlayers(),function(){
                Players p=Players.Get(GetEnumPlayer());
                if(p.isai==true){
                    SetHeroLevel(p.hero.unit,MaxLv, true );
                }
            });
        }
        p.hero.ArmorUpdata();//升级，因此重新获取护甲和计算护甲值
        p.hero.PowerStringUpdata();
        p.hero.str_lv=I2S(GetHeroLevel(p.hero.unit));
        if(lv>=5&&p.lv5==null){
            p.lv5=Units.Spawn(p.player,'e003',0,0,0);
        }        
        if(lv>=10&&p.lv10==null){
            p.lv10=Units.Spawn(p.player,'e004',0,0,0);
        }        
        if(lv>=15&&p.lv15==null){
            p.lv15=Units.Spawn(p.player,'e005',0,0,0);
        }        
        if(lv>=20&&p.lv20==null){
            p.lv20=Units.Spawn(p.player,'e006',0,0,0);
        }        
        if(lv>=25&&p.lv25==null){
            p.lv25=Units.Spawn(p.player,'e007',0,0,0);
        }
    }

    function onInit(){
        Events.On(Events.onHeroLevelUp,LvUp);
         
    }
}