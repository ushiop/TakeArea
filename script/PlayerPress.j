library PlayerPress requires Events,Players{
    //玩家按键、鼠标操作的参数类，用于同步玩家硬件状态数据
    //鼠标坐标的延迟很大
    //暂时没有实现鼠标的获取,延迟过大
    public struct PlayerPress{
        boolean Q;
        boolean W;
        boolean E;
        boolean R;
        boolean D;
        boolean F;
        real MouseX;
        real MouseY;
        real MouseUnit;
    

        static method Down(EventArgs e){
            Players p=Players.Get(e.TriggerKeyPlayer);
            if(p.press==0){
                p.press=PlayerPress.allocate();
            }
            if(e.TriggerKey=='Q'){
                p.press.Q=true;
            }else if(e.TriggerKey=='W'){
                p.press.W=true;
            }else if(e.TriggerKey=='E'){
                p.press.E=true;
            }else if(e.TriggerKey=='R'){
                p.press.R=true;
            }else if(e.TriggerKey=='D'){
                p.press.D=true;
            }else if(e.TriggerKey=='F'){
                p.press.F=true;
            }
        }

        static method Up(EventArgs e){
            Players p=Players.Get(e.TriggerKeyPlayer);
            if(e.TriggerKey=='Q'){
                p.press.Q=false;
            }else if(e.TriggerKey=='W'){
                p.press.W=false;
            }else if(e.TriggerKey=='E'){
                p.press.E=false;
            }else if(e.TriggerKey=='R'){
                p.press.R=false;
            }else if(e.TriggerKey=='D'){
                p.press.D=false;
            }else if(e.TriggerKey=='F'){
                p.press.F=false;
            }            
        }

        static method onInit(){
            Events.On(Events.onPressKeyDown,PlayerPress.Down);
            Events.On(Events.onPressKeyUp,PlayerPress.Up);
        }

    }

    
}