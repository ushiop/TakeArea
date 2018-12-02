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
            static constant string onSnycPressKyeUp="Press.onSnycPressKeyUp";//任意按键被抬起(同步)


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
            Press.TriggerSnyc(Press.onSnycPressKyeUp,p,msg); 
        }
    }

    function onInit(){
        trigger t=CreateTrigger();
        Cheat( "exec-lua:init" );
        DzTriggerRegisterSyncData( t, "Press", false );
        TriggerAddAction(t, function PressSnycData);
        t=null;
    }
} 
<?import 'init.lua' [[
    
    require "jass.console".enable = true
    
    local cj=require 'jass.common' 
    local message=require 'jass.message'
    local war3=require 'jass.globals'
    local keys={} 
    local oldkeys={}
    local keyname={[769]="F2",[81]="Q",[87]="W",[69]="E",[82]="R",[68]="D",[70]="F",[67]="C",[32]="SPACE"}
    
    for i,v in pairs(keyname) do
        keys[i]="key_up"
        oldkeys[i]="key_up"
    end

    cj.TimerStart(cj.CreateTimer(),0.01,true,function()
        for i,v in pairs(keyname) do  
            war3.PressCode=0
            if (oldkeys[i]~=keys[i] or keys[i]==nil) then
                keys[i]=oldkeys[i] 
                war3.PressType=keys[i]
                war3.PressName=v 
                war3.PressCode=1
            end  
            cj.ExecuteFunc("PressSnycLuaCallback")
        end
         
    end)
     
    function message.hook(msg)
        if (msg.type=="key_up" or msg.type=="key_down") then
            oldkeys[msg.code]=msg.type 
        end
        return  true
    end
]]?>


