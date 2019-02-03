library Timers requires TimerUtils{

    //中心计时器类，因timerutils的上限为256，又不想修改，所以用中心计时器的方式实现一部分计时器需求
    //如单位中的渐隐/延迟动画效果均用该类实现

    type TimersEventInterface extends function(Timers); 

    public struct Timers{
        private static Timers Root;//根节点
        private static Timers Last;//最后一个节点 
  
        public{
            boolean Pause;//计时器的状态，是否处于暂停
            real MaxTime;//计时器的触发间隔
            real NowTime;//计时器的剩余触发时间
            integer TimerExpired;//计时器已触发了几次
            integer Obj;//计时器绑定的数据
            TimersEventInterface onTime;//计时器到期时触发
            Timers Prev;//上一个BUFF节点，为0则无
            Timers Next;//下一个BUFF节点，为0则无;

            //删除一个计时器实例
            method Destroy(){
                if(Timers.Last==this){ 
                    this.Prev.Next=0;       
                    Timers.Last=this.Prev;
                }else{
                    this.Prev.Next=this.Next;
                    this.Next.Prev=this.Prev;
                }
                this.deallocate();         
            } 

            //创建一个计时器返回，该方法创建的计时器处于暂停状态，所有参数为默认值
            static method New()->Timers{ 
                Timers tmp=Timers.allocate();
                tmp.Pause=true;
                tmp.MaxTime=0;
                tmp.NowTime=0;
                tmp.TimerExpired=0;
                tmp.Obj=0;
                tmp.onTime=0;
                tmp.Prev=Timers.Last;
                tmp.Next=0; 
                Timers.Last.Next=tmp; 
                Timers.Last=tmp; 
                return tmp;
            } 

            //创建一个计时器并以指定参数设置，并返回，该方法创建的计时器处于非暂停状态
            static method Start(real delay,integer Obj,TimersEventInterface on)->Timers{
                Timers tmp=Timers.New();
                tmp.Pause=false;
                tmp.MaxTime=delay;
                tmp.NowTime=delay;
                tmp.Obj=Obj;
                tmp.onTime=on;
                return tmp;
            }
        }

        //计时循环
        public static method onLoop(){
            Timers tmp=Root,tmp1;
            while(tmp!=0){ 
                tmp1=tmp.Next;
                if(tmp!=Root){
                    if(tmp.Pause==false){
                        if(tmp.NowTime<=0){
                            TimersEventInterface(tmp.onTime).evaluate(tmp);
                            tmp.NowTime=tmp.MaxTime;
                            tmp.TimerExpired+=1;
                        }else{
                            tmp.NowTime-=0.01;
                        }
                    }
                } 
                tmp=tmp1;
            }
        }
 

        static method onInit(){
            Root=Timers.New();
            Last=Root;
        }
    }
    function onInit(){
        TimerStart(NewTimer(),0.01,true,function Timers.onLoop); 
    }
}