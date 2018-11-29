library Buff requires Util{

    type BuffEventInterface extends function(Buffs);
    type AddBuffEventInterface extends function(unit,Buffs);

    public struct Buffs{
        private static Buffs Root;//根节点
        private static Buffs Last;//最后一个节点

        public{
            real MaxTime;//总持续时间
            real NowTime;//当前持续时间
            integer Ability;//作为主体的技能ID
            integer Buff;//作为BUFF图标的技能ID
            integer Obj;//这个BUFF携带的实例化对象ID，由对应类自己转化为实例 
            unit Unit;//BUFF的携带者  
            BuffEventInterface onTime;//BUFF计时时触发的事件
            BuffEventInterface onEnd;//BUFF正常到期时触发的事件
            BuffEventInterface onRemove;//BUFF被移除时触发的事件(不会触发onEnd)
            BuffEventInterface onDelay;//BUFF被增加最大持续时间时触发
            BuffEventInterface onFlush;//BUFF被刷新时间时触发
            Buffs Prev;//上一个BUFF节点，为0则无
            Buffs Next;//下一个BUFF节点，为0则无;

            //删除一个BUFF实例
            method Destroy(){
                this.Unit=null;
                if(Buffs.Last==this){ 
                    this.Prev.Next=0;       
                    Buffs.Last=this.Prev;
                }else{
                    this.Prev.Next=this.Next;
                    this.Next.Prev=this.Prev;
                }
                this.deallocate();         
            }

            //从单位身上删除buff,会触发onRemove
            static method Remove(unit u,integer aid,integer bid){ 
                Buffs tmp=Buffs.Find(u,aid,bid);
                if(tmp!=Buffs.Root){
                    UnitRemoveAbility(u,aid);
                    UnitRemoveAbility(u,bid);
                    if(tmp.onRemove!=0) BuffEventInterface(tmp.onRemove).evaluate(tmp); 
                    tmp.Destroy();
                }
            }

            //在所有BUFF中寻找u身上的aidbuff实例并返回
            static method Find(unit u,integer aid,integer bid)->Buffs{ 
                Buffs tmp=Buffs.Root;
                while(tmp.Next!=0){
                    if(tmp.Unit==u&&tmp.Buff==bid&&tmp.Ability==aid){
                        break;
                    }else{
                        tmp=tmp.Next;
                    }
                }
                return tmp;
            }

            //添加一个aidBUFF给u,持续time,bid为BUFF图标技能的ID
            //已经有的BUFF将在原来的时间上加上新的时间
            //dealy为true时，时间叠加，否则为设置时间为time
            //对于原生技能BUFF，不会执行任何动作并返回根节点
            //通过技能的目标属性是否为'自己'来判断是原生技能还是光环模拟的BUFF
            static method Add(unit u,integer aid,integer bid,real time,boolean dealy)->Buffs{
                string target=Util.GetAbilityValue(aid,"targs1"); 
                Buffs tmp;
                if(target=="self"){
                    tmp=Buffs.Find(u,aid,bid);
                    if(tmp==Buffs.Root){
                        tmp=Buffs.allocate();
                        tmp.NowTime=time;
                        tmp.MaxTime=time;
                        tmp.Ability=aid;
                        tmp.Buff=bid;
                        tmp.Unit=u; 
                        tmp.Obj=0;  
                        tmp.onTime=0;
                        tmp.onEnd=0;
                        tmp.onRemove=0;
                        tmp.onDelay=0;
                        tmp.onFlush=0;
                        tmp.Prev=Buffs.Last;
                        tmp.Next=0; 
                        Buffs.Last.Next=tmp; 
                        Buffs.Last=tmp; 
                        UnitAddAbility(u,aid); 
                        if(Units.Get(u).isHero==true){ 
                            Buffs.Trigger(Buffs.onHeroBuff,u,tmp);
                        }else{ 
                            Buffs.Trigger(Buffs.onUnitBuff,u,tmp);
                        }
                        return tmp; 
                    }else{
                        if(dealy==true){
                            tmp.MaxTime=tmp.MaxTime+time; 
                            if(tmp.onDelay!=0) BuffEventInterface(tmp.onDelay).evaluate(tmp); 
                        }else{
                            tmp.NowTime=time;
                            tmp.MaxTime=time; 
                            if(tmp.onFlush!=0) BuffEventInterface(tmp.onFlush).evaluate(tmp); 
                        } 
                        return tmp;
                    }
                }else{
                    Buffs.Skill(u,Util.GetAbilityValue(aid,"Order"),aid,1);    
                    return Buffs.Root;
                } 
            }

            //对目标单位发布一个魔兽原版技能
            static method Skill(unit u,string order,integer aid,integer lv){
                UnitAddAbility(u,aid);
                SetUnitAbilityLevel(u,aid,lv);
                Buffs.Trigger(Buffs.onUnitSkill,u,0);
                IssueTargetOrder(Origin_Magic,order,u);
                UnitRemoveAbility(u,aid);
            }

            static constant string onUnitBuff="Buffs.UnitBuff";//非英雄获得BUFF
            static constant string onHeroBuff="Buffs.HeroBuff";//英雄单位获得BUFF
            static constant string onUnitSkill="Buffs.UnitSkill";//任意单位被施放原版技能

            //触发指定事件名
            static method Trigger(string eName,unit u,Buffs m){
                integer i;
                AddBuffEventInterface callback;
                for(1<=i<Table[eName][0]){  
                    callback=AddBuffEventInterface(Table[eName][i]);
                    callback.evaluate(u,m);
                }        
            }

            //注册自定义单位事件
            static method On(string eName,AddBuffEventInterface callback){  
                if(Table[eName][0]==0){ 
                    Table[eName][0]=1;
                }
                Table[eName][Table[eName][0]]=callback;
                Table[eName][0]=Table[eName][0]+1;
            }
 
             
        }

        //计时循环
        private static method onLoop(){
            Buffs tmp=Root,tmp1;
            while(tmp!=0){ 
                tmp1=tmp.Next;
                if(tmp!=Root){
                    if(tmp.NowTime>0&&IsUnitAliveBJ(tmp.Unit)==true){ 
                        tmp.NowTime=tmp.NowTime-0.01;
                        if(tmp.onTime!=0) BuffEventInterface(tmp.onTime).evaluate(tmp); 
                    }else{
                        UnitRemoveAbility(tmp.Unit,tmp.Ability);
                        UnitRemoveAbility(tmp.Unit,tmp.Buff);
                        if(tmp.onEnd!=0) BuffEventInterface(tmp.onEnd).evaluate(tmp); 
                        tmp.Destroy();
                    }
                } 
                tmp=tmp1;
            }
        }
 

        static method onInit(){
            Root=Buffs.allocate();
            Last=Root;
            TimerStart(NewTimer(),0.01,true,function Buffs.onLoop); 
        }
    }
}