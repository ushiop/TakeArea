library HitFly requires Util{

    type HitFlyEventInterface extends function(HitFlys); 

    public struct HitFlys{
        private static HitFlys Root;//根节点
        private static HitFlys Last;//最后一个节点
        public static real Power=0.98;//下落重力 
  
        public{ 
            static string onDown="HitFlys.onDown";
            static string onEnd="HitFlys.onEnd";
            static string onRemove="HitFlys.onRemove";
            real LocalPower;//私有重力,默认为全局重力
            real UpPower;//上升力  
            boolean Down=false;//是否触发了ondown
            integer Obj;//这个击飞实例携带的实例化对象ID，由对应类自己转化为实例  
            unit Unit;//被击飞的单位  
            /*
            HitFlyEventInterface onDown;//从上升转为下降的那一刻触发
            HitFlyEventInterface onEnd;//落地后触发
            HitFlyEventInterface onRemove;//被移除时触发，然后触发onEnd
            上述事件为避免相同实例重复注册导致的覆盖BUG，已改为由HitFlys.Lister实现
            
                HitFlys.Lister(HitFlys.Add(),HitFlys.onDown|onEnd|onRemove,function(HitFlys h){
                    //.....
                };)
            */
            integer Listers;//拥有的监听者数量，为0则不触发事件
            HitFlys Prev;//上一个BUFF节点，为0则无
            HitFlys Next;//下一个BUFF节点，为0则无;

            //删除一个击飞实例
            method Destroy(){
                HitFlys.DeleteLister(this);
                this.Unit=null;
                if(HitFlys.Last==this){ 
                    this.Prev.Next=0;       
                    HitFlys.Last=this.Prev;
                }else{
                    this.Prev.Next=this.Next;
                    this.Next.Prev=this.Prev;
                }

                this.deallocate();         
            }

 
            //移除某个单位的击飞效果,会触发onEnd
            static method Remove(unit u){ 
                HitFlys tmp=HitFlys.Find(u);
                if(tmp!=0){ 
                    //if(tmp.onRemove!=0) HitFlyEventInterface(tmp.onRemove).evaluate(tmp); 
                    if(tmp.Listers!=0){
                        HitFlys.ListerTrigger(HitFlys.onRemove,tmp);
                        HitFlys.ListerTrigger(HitFlys.onEnd,tmp);
                    }
                    tmp.Destroy();
                }
            }

            //在所有击飞中寻找u身上实例并返回
            static method Find(unit u)->HitFlys{ 
                HitFlys tmp=HitFlys.Root;
                while(tmp!=0){ 
                    if(tmp.Unit==u){
                        break;
                    }else{
                        tmp=tmp.Next;
                    }
                } 
                return tmp;
            }

            //重置一个单位的上升力为0
            static method Reset(unit u){
                HitFlys tmp=HitFlys.Find(u);
                if(tmp!=0){ 
                    tmp.UpPower=0;
                }
            }

            //重置一个单位的击飞重力
            static method ResetPower(unit u){
                HitFlys tmp=HitFlys.Find(u);        
                if(tmp!=0){
                    tmp.LocalPower=HitFlys.Power; 
                }
            }

            //添加一个击飞给目标单位,上升力度为up
            //重复添加则会叠加上升力
            static method Add(unit u,real up)->HitFlys{ 
                HitFlys tmp=HitFlys.Find(u);
                if(tmp==0){
                    tmp=HitFlys.allocate();
                    tmp.Unit=u;
                    tmp.UpPower=up;
                    tmp.Down=false;
                    tmp.Obj=0;
                    tmp.Listers=0;
                    tmp.LocalPower=HitFlys.Power;
                    tmp.Prev=HitFlys.Last;
                    tmp.Next=0; 
                    HitFlys.Last.Next=tmp; 
                    HitFlys.Last=tmp; 
                    HitFlys.Trigger(HitFlys.onUnitHitFly,tmp);
                }else{
                    tmp.UpPower=tmp.UpPower+up; 
                } 
                return tmp;
            }
 
            static constant string onUnitHitFly="HitFlys.UnitHitFly";//任意单位被击飞

            //注册不同击飞实例的单独事件
            static method Lister(HitFlys HitFlysId,string eventname,HitFlyEventInterface callback){ 
                string eName="HitFlys_"+I2S(HitFlysId)+"_Event_"+eventname; 
                HitFlysId.Listers+=1;
                if(Table[eName][0]==0){ 
                    Table[eName][0]=1;
                }
                Table[eName][Table[eName][0]]=callback;
                Table[eName][0]=Table[eName][0]+1;
            } 

            //触发不同击飞实例的单独事件
            static method ListerTrigger(string eventname,HitFlys m){
                integer i;
                string eName="HitFlys_"+I2S(m)+"_Event_"+eventname; 
                HitFlyEventInterface callback;
                for(1<=i<Table[eName][0]){  
                    callback=HitFlyEventInterface(Table[eName][i]);
                    callback.evaluate(m);
                }        
            }

            //删除一个击飞实例的监听器
            static method DeleteLister(HitFlys m){
                integer i;
                string eName="HitFlys_"+I2S(m)+"_Event_"+HitFlys.onRemove; 
                for(1<=i<Table[eName][0]){  
                    Table[eName][i]=0;
                }  
                Table[eName][0]=0;
                eName="HitFlys_"+I2S(m)+"_Event_"+HitFlys.onEnd; 
                for(1<=i<Table[eName][0]){    
                    Table[eName][i]=0;
                }  
                Table[eName][0]=0; 
                eName="HitFlys_"+I2S(m)+"_Event_"+HitFlys.onDown;
                for(1<=i<Table[eName][0]){   
                    Table[eName][i]=0;
                }  
                Table[eName][0]=0; 
            }

            //触发指定事件名
            static method Trigger(string eName,HitFlys m){
                integer i;
                HitFlyEventInterface callback;
                for(1<=i<Table[eName][0]){  
                    callback=HitFlyEventInterface(Table[eName][i]);
                    callback.evaluate(m);
                }        
            }

            //注册自定义单位事件
            static method On(string eName,HitFlyEventInterface callback){  
                if(Table[eName][0]==0){ 
                    Table[eName][0]=1;
                }
                Table[eName][Table[eName][0]]=callback;
                Table[eName][0]=Table[eName][0]+1;
            }
 
             
        }

        //计时循环
        public static method onLoop(){
            HitFlys tmp=Root,tmp1;
            while(tmp!=0){ 
                tmp1=tmp.Next;
                if(tmp!=Root){
                    if(GetUnitFlyHeight(tmp.Unit)>10||tmp.UpPower>0){ 
                        if(Units.Get(tmp.Unit).IsTimeStop()==false){ 
                            SetUnitFlyHeight(tmp.Unit,GetUnitFlyHeight(tmp.Unit)+tmp.UpPower,0);
                            tmp.UpPower=tmp.UpPower-tmp.LocalPower;
                            if(tmp.Down==false){
                                if(tmp.UpPower<0){
                                    tmp.Down=true;
                                    //if(tmp.onDown!=0) HitFlyEventInterface(tmp.onDown).evaluate(tmp);
                                    if(tmp.Listers!=0) HitFlys.ListerTrigger(HitFlys.onDown,tmp);
                                }
                            }
                        }
                    }else{
                        SetUnitFlyHeight(tmp.Unit,0,0);
                        //if(tmp.onEnd!=0) HitFlyEventInterface(tmp.onEnd).evaluate(tmp); 
                        if(tmp.Listers!=0) HitFlys.ListerTrigger(HitFlys.onEnd,tmp);
                        tmp.Destroy();
                    }
                } 
                tmp=tmp1;
            }
        }
 

        static method onInit(){
            Root=HitFlys.allocate();
            Last=Root;
        }
    }
    function onInit(){
        TimerStart(NewTimer(),0.01,true,function HitFlys.onLoop); 
    }
}