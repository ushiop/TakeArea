library DelayTimer requires TimerUtils{
    //延时计时器类
    //多用于0秒计时器

    public struct DelayTimer{
        integer obj;//携带数据1
        integer obj1;//携带数据2
        integer obj3;//携带数据3
        integer obj4;//携带数据4
        integer obj5;//携带数据5
        integer obj6;//携带数据6

        method Destroy(){
            this.deallocate();
        }

        static method  create()->DelayTimer{
            DelayTimer t=DelayTimer.allocate();
            return t;
        }
    }
}