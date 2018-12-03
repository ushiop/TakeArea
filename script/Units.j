library Units requires Table,Players,Events,Util{
 
    //单位基础类
    //管理单位身上的集合数据,创建单位用该类函数,杀死单位也是
    //以及单位事件

    type UnitsEventInterface extends function(Units,Units);

    public struct Units  {
        private static HandleTable ht;

        //属性
        public {
            Players player; 
            boolean isHero;
            string name;
            unit unit; 
            integer uid;
            integer spell;//单位释放技能的回调，用于反向捕捉

            //返回英雄力量
            method Str()->integer{
                    return GetHeroStr(this.unit,true);
            }

            //返回英雄敏捷
            method Agi()->integer{
                return GetHeroAgi(this.unit,true);
            }

            //返回英雄智力
            method Int()->integer{
                return GetHeroInt(this.unit,true);
            }

            //隐藏或者显示单位
            method Show(boolean f){
                ShowUnit(this.unit,f);
            }


            //设置单位模型大小
            method Size(real s){ 
                SetUnitScale( this.unit,s,s,s);
            }

            //设置单位生存时间
            method Life(real time){ 
                UnitApplyTimedLife(this.unit, 'BHwe',time);
            }

            method FlushAnimeId(integer id){
                timer t=NewTimer();
                DelayTimer data=DelayTimer.create();
                data.obj=this;
                data.obj1=id; 
                SetTimerData(t,data);
                TimerStart(t,0,false,function(){
                    DelayTimer d=DelayTimer(GetTimerData(GetExpiredTimer()));  
                    SetUnitAnimationByIndex(Units(d.obj).unit,d.obj1);
                    ReleaseTimer(GetExpiredTimer());
                    d.Destroy(); 
                });
                t=null;
            }

            method AnimeId(integer id){
                SetUnitAnimationByIndex( this.unit,id);
            }

            //播放单位动画名
            method Anime(string name){
                SetUnitAnimation( this.unit,name);
            }

            //设置单位动画播放速率
            method AnimeSpeed(real sp){
                SetUnitTimeScale(this.unit,sp);
            }

            //返回Y坐标
            method Y()->real{
                return GetUnitY(this.unit);
            }

            //返回X坐标
            method X()->real{
                return GetUnitX(this.unit);
            }
 
            //移动某玩家镜头到单位所在的位置
            method Lock(player p){
                if(Players.localplayer==p){
                    PanCameraToTimed(GetUnitX(this.unit),GetUnitY(this.unit), 0 );           
                }     
            }
 
            //返回单位面向角度
            method F()->real{
                return GetUnitFacing(this.unit);
            }

            //设置飞行高度
            method SetH(real h){
                SetUnitFlyHeight(this.unit,h,0);
            }

            //返回飞行高度
            method H()->real{
                return GetUnitFlyHeight(this.unit);
            }

            //移动单位到X,Y的位置,order为是否打断命令
            method Position(real x,real y,boolean order){
                if(order==true){
                    SetUnitPosition(this.unit,x,y);
                }else{
                    SetUnitX(this.unit,x);
                    SetUnitY(this.unit,y);
                }
            }

            //使单位对m造成伤害,dtype,spell为本次伤害所属技能，被动填0
            method Damage(unit m,integer dtype,integer spell,real dmg){
                Damage.To(this.player.hero.unit,m,dtype,spell,dmg);
            }

            //为单位添加技能
            method AddAbility(integer aid){
                UnitAddAbility(this.unit,aid);
            }

            //获取单位是否拥有该技能
            method IsAbility(integer aid)->boolean{
                return GetUnitAbilityLevel(this.unit,aid)>0;
            }

            method SetAbilityLevel(integer aid,integer lv){
                if(this.IsAbility(aid)==false){
                    this.AddAbility(aid);
                }
                SetUnitAbilityLevel(this.unit,aid,lv);
            }

            method RemoveAbility(integer aid){
                UnitRemoveAbility(this.unit,aid);
            }
        }

        //自定义事件
        public {

            static constant string onUnitDeath="Units.UnitDeath";//非英雄单位死亡
            static constant string onHeroDeath="Units.HeroDeath";//英雄单位死亡
            static constant string onUnitSpawn="Units.UnitSpawn";//非英雄单位被创建
            static constant string onHeroSpawn="Units.HeroSpawn";//英雄单位被创建
            static constant string onAlocDeath="Units.AlocDeath";//蝗虫单位死亡
            static constant string onAlocSpawn="Units.AlocSpawn";//蝗虫单位出生

            //触发指定事件名
            static method Trigger(string eName,unit u,unit m){
                integer i;
                UnitsEventInterface callback;
                for(1<=i<Table[eName][0]){  
                    callback=UnitsEventInterface(Table[eName][i]);
                    callback.evaluate(Units.Get(u),Units.Get(m));
                }        
            }

            //注册自定义单位事件
            static method On(string eName,UnitsEventInterface callback){  
                if(Table[eName][0]==0){ 
                    Table[eName][0]=1;
                }
                Table[eName][Table[eName][0]]=callback;
                Table[eName][0]=Table[eName][0]+1;
            }
        }

        //任意单位死亡,触发单位类的自定义事件
        static method onDeath(EventArgs e){ 
            if(IsUnitType(e.TriggerUnit,UNIT_TYPE_HERO)==true){
                if(GetUnitAbilityLevel(e.TriggerUnit,'Aloc')==0){ 
                    Units.Trigger(Units.onHeroDeath,e.TriggerUnit,e.KillUnit);
                }else{
                    Units.Trigger(Units.onAlocDeath,e.TriggerUnit,e.KillUnit); 
                }
            }else{
                if(GetUnitAbilityLevel(e.TriggerUnit,'Aloc')==0){ 
                    Units.Trigger(Units.onUnitDeath,e.TriggerUnit,e.KillUnit); 
                }else{
                    Units.Trigger(Units.onAlocDeath,e.TriggerUnit,e.KillUnit);  
                }
                Units.Destroys(e.TriggerUnit);
            }
        }

        //任意单位被创建，触发自定义事件
        static method onSpawn(unit u){
            if(GetUnitAbilityLevel(u,'Aloc')==0){
                if(IsUnitType(u,UNIT_TYPE_HERO)==true){
                    Units.Trigger(Units.onHeroSpawn,u,null);
                }else{
                    Units.Trigger(Units.onUnitSpawn,u,null);
                }
            }else{
                Units.Trigger(Units.onAlocSpawn,u,null);
            }

        }
 
        static method onInit(){
            ht = HandleTable.create(); 
            Events.On(Events.onUnitDeath,Units.onDeath); 
        }
 

        //创建指定单位实例
        private static method Create(unit u)->Units{
            Units ud=Units.allocate();
            ud.player=Players.Get(GetOwningPlayer(u));
            ud.isHero=IsUnitType(u,UNIT_TYPE_HERO);
            ud.name=GetUnitName(u); 
            ud.uid=GetUnitTypeId(u);
            ud.unit=u;
            ud.spell=0;
            Units.ht[u]=ud; 
            return ud;
        }

        //摧毁指定单位 实例
        private static method Destroys(unit u){
            Units ud=Units.ht[u];  
            ud.unit=null; 
            ud.deallocate();
            Units.ht.flush(u);
            
        }

        //获得指定单位的实例
        public static method Get(unit u)->Units{
            return Units.ht[u];
        }

        //为某个已存在单位注册实例(比如地图上放置的单位)
        //重复注册不会有效果,会触发‘被创建’事件
        public static method Set(unit u){
            if(Units.ht.exists(u)==false){
                Units.Create(u);
                Units.onSpawn(u);
            }
        }

        //创建单位并绑定UNITS实例
        public static method Spawn(player p,integer unitid,real x,real y,real f)->unit{
            unit u=CreateUnit(p,unitid,x,y,f);
            Units.Create(u); 
            Util.UnitAddRemoveAbility(u,'Amrf'); 
            Units.onSpawn(u);
            bj_lastCreatedUnit=u;
            u=null;
            return bj_lastCreatedUnit;
        }

        //创建一个马甲单位
        //modsize 模型大小,animspeed 动画速度,animname 播放的动画名,modpath 模型路径,lifetime 生存时间
        //不会触发'spawn'事件
        public static method MJ(player p,integer uid,real x,real y,real f,real lifetime,real modsize,real animspeed,string animname,string modpath)->Units{
            unit u=CreateUnit(p,uid,x,y,f);
            Units t=Units.Create(u);
            Util.UnitAddRemoveAbility(u,'Amrf'); 
            DzSetUnitModel( u, modpath);
            SetUnitAnimation( u,animname);
            SetUnitScale( u,modsize,modsize,modsize);
            SetUnitTimeScale( u,animspeed);
            UnitApplyTimedLife(u, 'BHwe', lifetime);
            bj_lastCreatedUnit=u;
            u=null;
            return t;
        } 

        //杀死单位
        public static method Kill(unit u){ 
            KillUnit(u);
        }

        //删除单位和实例
        public static method Remove(unit u){ 
            if(Units.Get(u)!=0){ 
                Units.Destroys(u);
            }
            RemoveUnit(u);
        }
     

    }


}