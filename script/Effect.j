library Effect requires TimerUtils{
    //特效库，提供对特效的延迟删除/JAPI动作等操作
    public struct Effect{
        real h;//特效的当前高度
        real x;//特效的当前X坐标
        real y;//特效的当前Y坐标
        real size;//特效的当前大小(可能是缩放？)
        real animespeed;//特效的当前播放速度
        real rotX;//X轴旋转度
        real rotY;//Y轴旋转度
        real rotZ;//Z轴旋转度
        real sizeX;//X轴缩放
        real sizeY;//Y轴缩放
        real sizeZ;//Z轴缩放
        unit u;//绑定的单位 
        Timers t;//延迟删除计时器
        effect e;//特效 

        static method create()->Effect{
            Effect v=Effect.allocate();
            v.h=0;
            v.x=0;
            v.y=0;
            v.size=1;
            v.animespeed=1;
            v.rotX=0;
            v.rotY=0;
            v.rotZ=0;
            v.sizeX=0;
            v.sizeY=0;
            v.sizeZ=0;
            v.t=0;
            v.u=null;
            v.e=null;
            return v;
        }

        //删除特效
        method Destroy(){
            DestroyEffect(this.e);
            if(this.t!=0){ 
                this.t.Destroy();
                this.t=0;
            }
            //BJDebugMsg("特效删除");
            this.u=null;
            this.e=null;
            this.deallocate();
        }

        //该特效在延迟time秒后删除,重复调用可以修改延迟时间
        method Delay(real time){
            if(this.t==0){ 
                this.t=Timers.Start(time,this,function(Timers t){
                    Effect e=Effect(t.Data());   
                    e.Destroy();  
                }); 
            }else{
                this.t.SetTime(time);
            } 
        }

        //设置特效大小
        method Size(real s){
            this.size=s;
            EXSetEffectSize( this.e,this.size);
        }

        method AnimeSpeed(real s){
            this.animespeed=s;
            EXSetEffectSpeed(this.e, this.animespeed );
        }

        //在坐标处创建特效
        static method To(string model,real x,real y)->Effect{
            Effect e=Effect.create();
            e.x=x;
            e.y=y;
            e.e=AddSpecialEffect(model,x,y);
            return e;
        }

        //在指定单位身上创建特效并绑定到指定附加点
        static method ToUnit(string model,unit u,string oname)->Effect{
            Effect e=Effect.create(); 
            e.u=u;
            e.e=AddSpecialEffectTarget(model,u,oname);
            return e;
        }        
    }
}