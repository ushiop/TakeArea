library PlayerChat requires Events,Players,Winner{

    //玩家输入聊天信息的处理

    function Chat(EventArgs e){
        Players p=Players.Get(e.TriggerPlayer); 
        string msg;
        integer s;
        if(e.ChatString=="-PC"){
            if(p.pcmode==true){
                p.pcmode=false;
                DisplayTextToPlayer(p.player,0,0,"你已关闭电脑托管~!");
            }else{
                p.pcmode=true;
                DisplayTextToPlayer(p.player,0,0,"你已开启电脑托管~!"); 
            }
        }
        if(SubString(e.ChatString,0,2)=="-K"&&p.player==Admin){
            if(Winner.GetKillStart()==false){  
                msg=SubString(e.ChatString,2,1);
                s=S2I(msg);
                if(s!=0){
                    Winner.SetMaxKills(s);
                    DisplayTextToForce(Teams.GetAllPlayers(), "玩家["+p.name+"]已将胜利所需的击杀总数调整为["+msg+"]个" );
                }
            }
        }
    }

    function onInit(){
        Events.On(Events.onPlayerChat,Chat);
    }
}