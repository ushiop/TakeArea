library PlayerChat requires Events,Players{

    //玩家输入聊天信息的处理

    function Chat(EventArgs e){
        Players p=Players.Get(e.TriggerPlayer); 
        if(e.ChatString=="-AI"){
            if(p.isai==true){
                p.isai=false;
                DisplayTextToPlayer(p.player,0,0,"你已关闭电脑托管~!");
            }else{
                p.isai=true;
                DisplayTextToPlayer(p.player,0,0,"你已开启电脑托管~!"); 
            }
        }
    }

    function onInit(){
        Events.On(Events.onPlayerChat,Chat);
    }
}