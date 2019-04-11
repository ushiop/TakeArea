library HitFly requires Util{

    type HitFlyEventInterface extends function(HitFlys); 

    public struct HitFlys{
        private static HitFlys Root;//根节点
        private static HitFlys Last;//最后一个节点
        private static real Power=0.98;//下落重力
  
        public{
            real UpPower;//上升力  
            boolean Down=false;//是否触发了ondown
            integer Obj;//这个击飞实例携带的实例化对象ID，由对应类自己转化为实例  
            unit Unit;//被击飞的单位  
            HitFlyEventInterface onDown;//从上升转为下降的那一刻触发
            HitFlyEventInterface onEnd;//落地后触发
            HitFlyEventInterface onRemove;//被移除时触发
            HitFlys Prev;//上一个BUFF节点，为0则无
            HitFlys Next;//下一个BUFF节点，为0则无;

            //删除一个击飞实例
            method Destroy(){
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

 
            //移除某个单位的击飞效果,不会触发onEnd
            static method Remove(unit u){ 
                HitFlys tmp=HitFlys.Find(u);
                if(tmp!=0){ 
                    if(tmp.onRemove!=0) HitFlyEventInterface(tmp.onRemove).evaluate(tmp); 
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
                    tmp.onEnd=0;
                    tmp.onRemove=0;
                    tmp.onDown=0;
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
                        SetUnitFlyHeight(tmp.Unit,GetUnitFlyHeight(tmp.Unit)+tmp.UpPower,0);
                        tmp.UpPower=tmp.UpPower-HitFlys.Power;
                        if(tmp.Down==false){
                            if(tmp.UpPower<0){
                                tmp.Down=true;
                                if(tmp.onDown!=0) HitFlyEventInterface(tmp.onDown).evaluate(tmp);
                            }
                        }
                    }else{
                        SetUnitFlyHeight(tmp.Unit,0,0);
                        if(tmp.onEnd!=0) HitFlyEventInterface(tmp.onEnd).evaluate(tmp); 
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