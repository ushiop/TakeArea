library PlayerChat requires Events{

    //玩家输入聊天信息的处理

    function Chat(EventArgs e){
        BJDebugMsg(e.ChatString);
    }

    function onInit(){
        Events.On(Events.onPlayerChat,Chat);
    }
}