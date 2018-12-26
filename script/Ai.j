library Ai requires Teams,Groups{
    
    //非玩家英雄的自动施法、移动类
    //对于没有实现AI接口的英雄
    //点目标技能会在1000码内释放
    //无目标技能会在400码内释放
    //相同的顺序，无目标和点目标有2套命令串顺序
    //在调整施法顺序的时候将对应的命令串填入即可
    // 点目标：curse - dispel - charm  - channel -  doom    
    // 无目标: heal  -  hex   - impale - inferno - instant

    type AiEventInterface extends function(unit);


    function AISpell(unit ua){
        Units u=Units.Get(ua);
        unit target,no;
        real x=u.X(),y=u.Y();
        real x1,y1;
        real mps=u.MP()/u.MaxMP();
        if(mps>0.2){ 
            IssuePointOrder(u.unit, "attack",GetUnitX(Origin_Ball), GetUnitY(Origin_Ball));
        }else{
            IssuePointOrder(u.unit, "attack",GetRectCenterX(Teams.GetTeamRect(u.player.player)), GetRectCenterY(Teams.GetTeamRect(u.player.player)));
        }
        if(u.ai!=0){
            AiEventInterface(u.ai).evaluate(u.unit);
        }else{
            target=GroupFind(u.unit,x,y,1000,true,false);
            if(target!=null){ 
                x1=GetUnitX(target);
                y1=GetUnitY(target); 
                no=GroupFind(u.unit,x,y,400,true,false);
                if(no!=null){  
                    u.SetF(Util.XY(u.unit,no),true);
                    x1=GetUnitX(no);
                    y1=GetUnitY(no); 
                    IssueImmediateOrder( u.unit, "instant" );
                    no=null;
                }
                IssuePointOrder(u.unit, "doom",x1,y1);
               
                
                no=GroupFind(u.unit,x,y,400,true,false);
                if(no!=null){ 
                    u.SetF(Util.XY(u.unit,no),true);
                    x1=GetUnitX(no);
                    y1=GetUnitY(no); 
                    IssueImmediateOrder( u.unit, "inferno" );
                    no=null;
                }
                IssuePointOrder(u.unit, "channel",x1,y1);
                

                no=GroupFind(u.unit,x,y,400,true,false);
                if(no!=null){ 
                    u.SetF(Util.XY(u.unit,no),true);
                    x1=GetUnitX(no);
                    y1=GetUnitY(no); 
                    IssueImmediateOrder( u.unit, "impale" ); 
                    no=null;
                }  
                IssuePointOrder(u.unit, "charm",x1,y1);  
                

                no=GroupFind(u.unit,x,y,400,true,false);
                if(no!=null){ 
                    u.SetF(Util.XY(u.unit,no),true);
                    x1=GetUnitX(no);
                    y1=GetUnitY(no); 
                    IssueImmediateOrder( u.unit, "hex" );
                    no=null;
                }
                IssuePointOrder(u.unit, "dispel",x1,y1);
                

                no=GroupFind(u.unit,x,y,400,true,false);
                if(no!=null){ 
                    u.SetF(Util.XY(u.unit,no),true);
                    x1=GetUnitX(no);
                    y1=GetUnitY(no); 
                    IssueImmediateOrder( u.unit, "heal" );
                    no=null;
                }
                IssuePointOrder(u.unit, "curse",x1,y1); 
                
            }
        }
        target=null;
        no=null;
    }


    function onLoop(){
        ForForce(Teams.GetAllPlayers(),function(){
            Players p=Players.Get(GetEnumPlayer());
            if(p.isai==true&&p.hero.Alive()){ 
                AISpell(p.hero.unit);
            }
        });
    }


    //任意英雄受到伤害
    function onDmg(DamageArgs dmg){
        Units u=dmg.TriggerUnit;        
        if(u.player.isai==true){ 
            AISpell(u.unit);
        }
    }


    function onInit(){
        Damage.On(Damage.onHeroDamage,onDmg);
        TimerStart(NewTimer(),1,true,function onLoop);
    }
}