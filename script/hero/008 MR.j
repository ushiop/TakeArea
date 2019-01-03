library MR requires Groups{
    //英雄‘鸣人’的技能
    //R级
    struct MR{

        static method Chat(EventArgs e){
            
        }

        static method onInit(){
            Events.On(Events.onPlayerChat,Chat);
        }
    }
}