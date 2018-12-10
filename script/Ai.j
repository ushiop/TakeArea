library Ai requires Teams,Groups{
    
    //非玩家英雄的自动施法、移动类
    //对于没有实现AI接口的英雄
    //点目标技能会在1000码内释放
    //无目标技能会在300码内释放
    //无论什么类型，都会按这个命令串顺序释放
    // curse - dispel - charm - channel - doom

    type AiEventInterface extends function(unit);


    function AISpell(unit ua){
        Units u=Units.Get(ua);
        unit target,no;
        real x=u.X(),y=u.Y();
        real x1,y1;
        IssuePointOrder(u.unit, "attack",GetUnitX(Origin_Ball), GetUnitY(Origin_Ball));
        if(u.ai!=0){
            AiEventInterface(u.ai).evaluate(u.unit);
        }else{
            target=GroupFind(u.unit,x,y,1000,true);
            if(target!=null){ 
                x1=GetUnitX(target);
                y1=GetUnitY(target); 
                no=GroupFind(u.unit,x,y,300,true);
                if(no!=null){ 
                    u.SetF(Util.XY(u.unit,no),true);
                    IssueImmediateOrder( u.unit, "doom" );
                    no=null;
                }
                IssuePointOrder(u.unit, "doom",x1,y1);
                
                no=GroupFind(u.unit,x,y,300,true);
                if(no!=null){
                    u.SetF(Util.XY(u.unit,no),true);
                    IssueImmediateOrder( u.unit, "channel" );
                    no=null;
                }
                IssuePointOrder(u.unit, "channel",x1,y1);

                no=GroupFind(u.unit,x,y,300,true);
                if(no!=null){
                    u.SetF(Util.XY(u.unit,no),true);
                    IssueImmediateOrder( u.unit, "charm" );
                    no=null;
                }
                IssuePointOrder(u.unit, "charm",x1,y1); 

                no=GroupFind(u.unit,x,y,300,true);
                if(no!=null){
                    u.SetF(Util.XY(u.unit,no),true);
                    IssueImmediateOrder( u.unit, "dispel" );
                    no=null;
                }
                IssuePointOrder(u.unit, "dispel",x1,y1);

                no=GroupFind(u.unit,x,y,300,true);
                if(no!=null){
                    u.SetF(Util.XY(u.unit,no),true);
                    IssueImmediateOrder( u.unit, "curse" );
                    no=null;
                }
                IssuePointOrder(u.unit, "curse",x1,y1); 
            }
        }
    }


    function onLoop(){
        ForForce(Teams.GetAllPlayers(),function(){
            Players p=Players.Get(GetEnumPlayer());
            if(p.isai==true&&p.hero.Alive()){ 
                AISpell(p.hero.unit);
            }
        });
    }

    //任意英雄造成伤害
    function onDmged(DamageArgs dmg){
        Units u=dmg.DamageUnit;
        if(u.player.isai==true){ 
            AISpell(u.unit);
        }
    }

    //任意英雄受到伤害
    function onDmg(DamageArgs dmg){
        Units u=dmg.TriggerUnit;        
        if(u.player.isai==true){ 
            AISpell(u.unit);
        }
    }


    function onInit(){
        Damage.On(Damage.onHeroDamageed,onDmged);
        Damage.On(Damage.onHeroDamage,onDmg);
        TimerStart(NewTimer(),1,true,function onLoop);
    }
}