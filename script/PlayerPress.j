library PlayerPress requires Press{
    //玩家按键、鼠标操作的参数类

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
    

        static method Down(player ps,string e){
            Players p=Players.Get(ps);
            if(p.press==0){
                p.press=PlayerPress.allocate();
            }
            if(e=="Q"){
                p.press.Q=true;
            }else if(e=="W"){
                p.press.W=true;
            }else if(e=="E"){
                p.press.E=true;
            }else if(e=="R"){
                p.press.R=true;
            }else if(e=="D"){
                p.press.D=true;
            }else if(e=="F"){
                p.press.F=true;
            }
        }

        static method Up(player ps,string e){
            Players p=Players.Get(ps);
            if(e=="Q"){
                p.press.Q=false;
            }else if(e=="W"){
                p.press.W=false;
            }else if(e=="E"){
                p.press.E=false;
            }else if(e=="R"){
                p.press.R=false;
            }else if(e=="D"){
                p.press.D=false;
            }else if(e=="F"){
                p.press.F=false;
            }            
        } 
        static method onInit(){
            Press.OnSnyc(Press.onSnycPressKeyDown,PlayerPress.Down);
            Press.OnSnyc(Press.onSnycPressKeyUp,PlayerPress.Up);
        }

    }

    
}