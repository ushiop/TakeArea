library PlayerPress requires Press{
    //玩家按键、鼠标操作的参数类
    //键盘按键捕捉由press事件完成
    //鼠标坐标同步由计时器定时获取，然后同步的方式来完成
    //同步间隔为0.5秒，更短的时间会造成较大的延迟。

    public struct PlayerPress{
        boolean Q;
        boolean W;
        boolean E;
        boolean R;
        boolean D;
        boolean F;
        real MouseX;
        real MouseY; 

        static method onMouse(){
            if(Players.localplayer==Players.localplayer){
                DzSyncData( "Mouse", "X"+R2S(DzGetMouseTerrainX()) );
                DzSyncData( "Mouse", "Y"+R2S(DzGetMouseTerrainY()) );
            }
        }

        static method MouseSyncData(){
            player p=DzGetTriggerSyncPlayer(); 
            string d=DzGetTriggerSyncData();
            string t=SubString(d,0,1);
            string msg=SubString(d,1,StringLength(d));
            if(t=="X"){
                Players.Get(p).press.MouseX=S2R(msg);
            }else if(t=="Y"){
                Players.Get(p).press.MouseY=S2R(msg);
            }
            p=null;
        }

        static method create()->PlayerPress{
            PlayerPress p=PlayerPress.allocate();
            p.Q=false;
            p.W=false;
            p.E=false;
            p.R=false;
            p.D=false;
            p.F=false;
            p.MouseX=0;
            p.MouseY=0;
            return p;
        }

        static method Down(player ps,string e){
            Players p=Players.Get(ps);
            
            //BJDebugMsg(p.name+"按下了"+e);
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
            //BJDebugMsg(p.name+"松开了"+e);
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
            trigger t=CreateTrigger();        
            DzTriggerRegisterSyncData( t, "Mouse", false );
            TriggerAddAction(t, function PlayerPress.MouseSyncData);
            t=null;
            Press.OnSnyc(Press.onSnycPressKeyDown,PlayerPress.Down);
            Press.OnSnyc(Press.onSnycPressKeyUp,PlayerPress.Up);       

        }

    }
    function onInit(){

            TimerStart(NewTimer(),0.5,true,function PlayerPress.onMouse);
    }

    
}