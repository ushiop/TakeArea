library Data{
    //通用自定义数据类
    //多用计时器绑定多种类型的情况
    

    public struct Data{
        integer id;//标识ID，为任意技能或者单位的ID，无实际作用，仅方便用于查找是由哪块代码申请的数据
        integer i[10];//整数型数据
        real r[10];//实数型数据
        integer c[10];//实例型数据(实例ID，由使用方自己转换)
        unit u[4];//单位型数据
        group g[2];//单位组型数据
        string s[2];//字符串型数据
        

        method Destroy(){  
            integer x;  
            for(0<=x<5){
                this.i[x]=0;
                this.r[x]=0.0;
                this.c[x]=0; 
            }
            this.s[0]=null;
            this.s[1]=null;
            for(0<=x<4){ 
                if(this.u[x]!=null){
                    BJDebugMsg("DATA异常:u["+I2S(x)+"]未设空,ID:"+GetAbilityName(this.id)+"/index:"+I2S(this));
                }
            } 
            if(this.g[0]!=null){
                BJDebugMsg("DATA异常:g[0]未设空,ID:"+GetAbilityName(this.id)+"/index:"+I2S(this));
            }
            if(this.g[1]!=null){
                BJDebugMsg("DATA异常:g[1]未设空,ID:"+GetAbilityName(this.id)+"/index:"+I2S(this));
            }
            this.deallocate();
        }

        static method  create(integer id)->Data{
            Data t=Data.allocate();
            t.id=id; 
            //BJDebugMsg("DATA被创建,ID："+I2S(t)+"/AID:"+GetAbilityName(t.id));
            return t;
        }
    }
}