  library Press requires Table,Teams{
    //按键数据异步/同步类
    //主要用于同步玩家的按键
    //网易提供的事件延迟太高了
    //改为使用YDWE-LUA引擎的message.hook+GC实现
 
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
 
    public string PressType="";//按键类型 
    public string PressName="";//按键名
    public integer PressCode=0; 
    public gamecache gc;
    public string keys[];//键码
    public string keynames[];//键名

    //用计时器每0.01秒获取同步的键盘值
    public function GCSnyc(){
        Teams.ActionsForAllPlayer(function(){
            Players p=Players.Get(GetEnumPlayer());
            integer i,s;  
            for(0<=i<9){
                s=GetStoredInteger(gc,p.playerids,keys[i]);
                if(s!=0){
                    if(s==1){
                        Press.TriggerSnyc(Press.onSnycPressKeyUp,p.player,keynames[i]);
                    }else{
                        Press.TriggerSnyc(Press.onSnycPressKeyDown,p.player,keynames[i]);
                    }
                    StoreInteger(gc,p.playerids,keys[i],0);
                }
            } 
        });
    }
  

    function onInit(){ 
        keys[0]="769";
        keynames[0]="F2";
        keys[1]="81";
        keynames[1]="Q";
        keys[2]="87";
        keynames[2]="W";
        keys[3]="69";
        keynames[3]="E";
        keys[4]="82";
        keynames[4]="R";
        keys[5]="68";
        keynames[5]="D";
        keys[6]="70";
        keynames[6]="F";
        keys[7]="67";
        keynames[7]="C";
        keys[8]="32";
        keynames[8]="SPACE";
        gc=InitGameCache("press");
        Cheat("exec-lua:init");
        TimerStart(NewTimer(),0.01,true,function GCSnyc);
    }
}  





