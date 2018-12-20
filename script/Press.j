  library Press requires Table{
    //按键数据异步/同步类
    //主要用于同步玩家的按键
    //网易提供的事件延迟太高了
    //改为使用YDWE-LUA引擎的message.hook实现

    type PressEventInterface extends function(string);
    type PressSnycEventInterface extends function(player,string);

    public struct Press{
            //提供异步的按键按下/抬起事件与同步的按键按下/同步事件
            //目前仅提供了F2 Q W E R D F C 空格的按键捕捉
            static constant string onPressKeyDown="Press.onPressKeyDown";//任意按键被按下（异步的)
            static constant string onPressKeyUp="Press.onPressKeyUp";//任意按键被抬起（异步的）

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


            //触发指定事件名
            static method Trigger(string eName,string keyName){
                integer i;
                PressEventInterface callback;
                for(1<=i<Table[eName][0]){  
                    callback=PressEventInterface(Table[eName][i]);
                    callback.evaluate(keyName);
                }        
            }

            //注册自定义单位事件
            static method On(string eName,PressEventInterface callback){  
                if(Table[eName][0]==0){ 
                    Table[eName][0]=1;
                }
                Table[eName][Table[eName][0]]=callback;
                Table[eName][0]=Table[eName][0]+1;
            }

    }
 
    public string PressType="";//按键类型 
    public string PressName="";//按键名
    public integer PressCode=0;
    public timer PressTimer;

    //让LUA引擎调用的函数,用于传递参数
    public function PressSnycLuaCallback(){
        if(PressCode==1){ 
            if(PressType=="key_down"){
                Press.Trigger(Press.onPressKeyDown,PressName);
                if(Table[Press.onSnycPressKeyDown][0]!=0) DzSyncData( "Press", "D"+PressName );
            }else{ 
                Press.Trigger(Press.onPressKeyUp,PressName);
                if(Table[Press.onSnycPressKeyDown][0]!=0) DzSyncData( "Press", "U"+PressName );
            }
        }
    }

    //获取同步来的值
    function PressSnycData(){
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

    function onInit(){
        trigger t=CreateTrigger();
        DzTriggerRegisterSyncData( t, "Press", false );
        TriggerAddAction(t, function PressSnycData);
        t=null;
        PressTimer=NewTimer();
        Cheat( "exec-lua:init" );
    }
}  





