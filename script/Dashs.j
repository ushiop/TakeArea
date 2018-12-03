library Dashs requires TimerUtils{
    //冲锋类

    type DashEventInterface extends function(Dash);
    type DashsEventInterface extends function(unit,Dash);

    public struct Dash{

        public{
            static constant integer NORMAL=0;//匀速冲锋
            static constant integer PWX=1;//抛物线比例冲锋（即慢-快-慢)
            static constant integer ADD=2;//加速冲锋
            static constant integer SUB=3;//减速冲锋


            //停止指定单位身上的所有冲锋类特效,会触发onend以及onremove
            static method AllStop(unit u){
                Dash tmp=Root,tmp1;
                while(tmp!=0){
                    tmp1=tmp.Next;
                    if(tmp!=Root){
                        if(tmp.Unit==u){
                            tmp.Stop();
                        }
                    }
                    tmp=tmp1;
                }
            }

            //使一个单位开始冲锋
            //朝angle方向冲锋dis距离，冲锋类型为dashtype(由dash定义),速度为speed,是否无视地形fly,是否打断命令order
            //打断命令时,fly属性无效化,永远是false;
            static method Start(unit u,real angle,real dis,integer dashtype,real speed,boolean fly,boolean order)->Dash{
                Dash tmp=Dash.allocate();
                tmp.Unit=u;
                tmp.MaxDis=dis;
                tmp.NowDis=0.0;
                tmp.Angle=angle;
                tmp.Speed=speed;
                tmp.MaxSpeed=speed;
                tmp.DashType=dashtype;
                tmp.X=GetUnitX(u);
                tmp.Y=GetUnitY(u);
                tmp.LastX=tmp.X;
                tmp.LastY=tmp.Y;
                tmp.Obj=0;
                tmp.onMove=0;
                tmp.onEnd=0;
                tmp.onRemove=0;
                tmp.Fly=fly;
                tmp.Order=order;
                tmp.Prev=Last;
                tmp.Next=0;
                Last.Next=tmp; 
                Last=tmp;
                if(Units.Get(u).isHero==true){
                    Dash.Trigger(Dash.onHeroDash,u,tmp);
                }else{
                    Dash.Trigger(Dash.onUnitDash,u,tmp);
                }
                return tmp;
            }
        }

        private{
            static Dash Root;//根节点
            static Dash Last;//最后一个节点
  
            static method onLoop(){
                Dash tmp=Root,tmp1;
                boolean walk=false;
                real speed;  
                while(tmp!=0){
                    tmp1=tmp.Next;
                    if(tmp!=Root){
                        walk=false;
                        speed=0;   
                        if(tmp.NowDis<tmp.MaxDis&&IsUnitAliveBJ(tmp.Unit)==true){
                            tmp.LastX=tmp.X;
                            tmp.LastY=tmp.Y;
                            if(tmp.DashType==Dash.NORMAL){
                                speed=tmp.MaxSpeed;
                            }else if(tmp.DashType==Dash.PWX){
                                speed=tmp.MaxSpeed*(Util.GetPwx(3.99,tmp.NowDis,tmp.MaxDis)); 
                            }else if(tmp.DashType==Dash.ADD){
                                speed=tmp.MaxSpeed*(Util.GetPwx(3.99,tmp.NowDis/2,tmp.MaxDis)); 
                            }else if(tmp.DashType==Dash.SUB){
                                speed=tmp.MaxSpeed*(1-Util.GetPwx(3.99,tmp.NowDis/2,tmp.MaxDis));  
                            }
                            tmp.X=GetUnitX(tmp.Unit)+speed*CosBJ(tmp.Angle);
                            tmp.Y=GetUnitY(tmp.Unit)+speed*SinBJ(tmp.Angle); 
                            if(tmp.Fly==true){
                                walk=true;
                            }else{
                                if(speed>=64) 
                                { 
                                    walk=IsTerrainWalkable(tmp.X,tmp.Y);
                                }else{ 
                                    walk=IsTerrainWalkable(GetUnitX(tmp.Unit)+64*CosBJ(tmp.Angle),GetUnitY(tmp.Unit)+64*SinBJ(tmp.Angle));
                                } 
                            } 
                            if(walk==true){
                                walk=RectContainsCoords(gg_rct_main,tmp.X,tmp.Y);
                            }
                            if(walk==false||(tmp.DashType==Dash.SUB&&speed<1.0)){
                                
                                tmp.NowDis=tmp.MaxDis;
                            }else{
                                tmp.Speed=speed;
                                tmp.NowDis=tmp.NowDis+speed;
                                Units.Get(tmp.Unit).Position(tmp.X,tmp.Y,tmp.Order);
                                if(tmp.onMove!=0) DashEventInterface(tmp.onMove).evaluate(tmp);
                            } 
                        }else{  
                            if(tmp.onEnd!=0) DashEventInterface(tmp.onEnd).evaluate(tmp);
                            tmp.Destroy();
                        }
                    }    
                    tmp=tmp1;
                } 
            } 
 
            static method onInit(){
                Root=Dash.allocate();
                Last=Root;
                TimerStart(NewTimer(),0.01,true,function Dash.onLoop);  
            }
        }

        public{
            unit Unit;//冲锋的单位
            real Angle;//冲锋的角度
            real MaxDis;//最大冲锋距离
            real NowDis;//已冲锋距离
            real Speed;//冲锋速度(每0.01秒)
            real MaxSpeed;//最大冲锋速度
            real LastX;//上一个X坐标(即本次位移之前的坐标)
            real LastY;//上一个Y坐标(即本次位移之前的坐标)
            real X;//当前坐标
            real Y;//当前坐标
            boolean Fly;//是否无视地形
            boolean Order;//是否打断命令
            integer DashType;//冲锋类型
            integer Obj;//自定义数据实例，由对应类自行转换
            DashEventInterface onMove;//冲锋每一次位移时触发
            DashEventInterface onEnd;//冲锋结束时触发
            DashEventInterface onRemove;//冲锋被提前停止时触发(会触发onEnd)
            Dash Prev;//上一个节点
            Dash Next;//下一个节点

            method Destroy(){
                this.Unit=null;
                if(Dash.Last==this){ 
                    this.Prev.Next=0;       
                    Dash.Last=this.Prev;
                }else{
                    this.Prev.Next=this.Next;
                    this.Next.Prev=this.Prev;
                }
                this.deallocate();   
            }

            //停止冲锋
            method Stop(){
                if(this.onRemove!=0) DashEventInterface(this.onRemove).evaluate(this);
                if(this.onEnd!=0) DashEventInterface(this.onEnd).evaluate(this);
                this.Destroy();
            }

            static constant string onHeroDash="Dashs.HeroDash";//英雄单位开始冲锋
            static constant string onUnitDash="Dashs.UnitDash";//非英雄单位开始冲锋

            //触发指定事件名
            static method Trigger(string eName,unit u,Dash m){
                integer i;
                DashsEventInterface callback;
                for(1<=i<Table[eName][0]){  
                    callback=DashsEventInterface(Table[eName][i]);
                    callback.evaluate(u,m);
                }        
            }

            //注册自定义单位事件
            static method On(string eName,DashsEventInterface callback){  
                if(Table[eName][0]==0){ 
                    Table[eName][0]=1;
                }
                Table[eName][Table[eName][0]]=callback;
                Table[eName][0]=Table[eName][0]+1;
            }
        }
    }
}