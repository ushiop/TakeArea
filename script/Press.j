  library Press requires Table,Teams,Players{
    //按键数据异步/同步类
    //主要用于同步玩家的按键
    //网易提供的事件延迟太高了
    //改为使用YDWE-LUA引擎的message.hook+GC实现
    //发现网易和LUA.MESSAGE不兼容，重新用网易事件实现
 
    type PressSnycEventInterface extends function(player,string);

    public struct Press{
            //提供同步的按键按下/松开事件
            //目前仅提供了F2 Q W E R D F C 空格的按键捕捉

            static constant string onSnycPressKeyDown="Press.onSnycPressKeyDown";//任意按键被按下（同步）
            static constant string onSnycPressKeyUp="Press.onSnycPressKeyUp";//任意按键被抬起(同步)


            //触发指定事件名
            static method TriggerSnyc(string eName,player n,string keyName){
                integer i;
                PressSnycEventInterface callback;
                for(1<=i<Table[eName][0]){  
                    callback=PressSnycEventInterface(Table[eName][i]);
                    callback.evaluate(n,keyName);
                }        
            }

            //注册自定义单位事件
            static method OnSnyc(string eName,PressSnycEventInterface callback){  
                if(Table[eName][0]==0){ 
                    Table[eName][0]=1;
                }
                Table[eName][Table[eName][0]]=callback;
                Table[eName][0]=Table[eName][0]+1;
            }

    }
 
    public boolean keys[];//按键的状态

    //收到按键同步，触发事件
    function PressSnyc(){ 
        player p=DzGetTriggerSyncPlayer(); 
        string d=DzGetTriggerSyncData();
        string t=SubString(d,0,1);
        string msg=SubString(d,1,StringLength(d));  
        if(t=="D"){ 
            Press.TriggerSnyc(Press.onSnycPressKeyDown,p,msg);
        }else if(t=="U"){ 
            Press.TriggerSnyc(Press.onSnycPressKeyUp,p,msg);
        }
        p=null;       
    }
    
    //! textmacro RegisterKeyActions takes idx,name
    function $name$_Down(){
        if(keys[$idx$]==false){
            keys[$idx$]=true;
            DzSyncData( "Press", "D$name$");
        }
    }

    function $name$_Up(){
        if(keys[$idx$]==true){
            keys[$idx$]=false; 
            DzSyncData( "Press", "U$name$");
        }
    }
    //! endtextmacro
    //! runtextmacro RegisterKeyActions("1","Q");
    //! runtextmacro RegisterKeyActions("2","W");
    //! runtextmacro RegisterKeyActions("3","E");
    //! runtextmacro RegisterKeyActions("4","R");
    //! runtextmacro RegisterKeyActions("5","D");
    //! runtextmacro RegisterKeyActions("6","F");
    //! runtextmacro RegisterKeyActions("7","C");
    //! runtextmacro RegisterKeyActions("8","SPACE");
    //! runtextmacro RegisterKeyActions("9","F2");
    
    function onInit(){ 
        trigger t;

        //! textmacro RegisterKey takes idx,key,name 
        //$name$的按下与释放
        keys[$idx$]=false; 
        
        if(Players.localplayer==Players.localplayer){  
            DzTriggerRegisterKeyEventByCode(null,$key$, 1 ,false ,function $name$_Down);

            DzTriggerRegisterKeyEventByCode(null,$key$, 0 ,false ,function $name$_Up);
                 
        }
        //! endtextmacro
        //! runtextmacro RegisterKey("1","81","Q");
        //! runtextmacro RegisterKey("2","87","W");
        //! runtextmacro RegisterKey("3","69","E");
        //! runtextmacro RegisterKey("4","82","R");
        //! runtextmacro RegisterKey("5","68","D");
        //! runtextmacro RegisterKey("6","70","F");
        //! runtextmacro RegisterKey("7","67","C");
        //! runtextmacro RegisterKey("8","32","SPACE");
        //! runtextmacro RegisterKey("9","113","F2");

        t=CreateTrigger();        
        DzTriggerRegisterSyncData( t, "Press", false );
        TriggerAddAction(t, function PressSnyc);
        t=null;
    }
}  





