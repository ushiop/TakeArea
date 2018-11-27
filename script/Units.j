library Units requires Table,Players,Events{

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
        }

        //自定义事件
        public {

            static constant string onUnitDeath="Units.UnitDeath";//非英雄单位死亡
            static constant string onHeroDeath="Units.HeroDeath";//英雄单位死亡
            static constant string onUnitSpawn="Units.UnitSpawn";//非英雄单位被创建
            static constant string onHeroSpawn="Units.HeroSpawn";//英雄单位被创建

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
                Units.Trigger(Units.onHeroDeath,e.TriggerUnit,e.KillUnit);
            }else{
                Units.Trigger(Units.onUnitDeath,e.TriggerUnit,e.KillUnit);
            }
        }

        //任意单位被创建，触发自定义事件
        static method onSpawn(unit u){
            if(IsUnitType(u,UNIT_TYPE_HERO)==true){
                Units.Trigger(Units.onHeroSpawn,u,null);
            }else{
                Units.Trigger(Units.onUnitSpawn,u,null);
            }
        }
 
        static method onInit(){
            ht = HandleTable.create(); 
            Events.On(Events.onUnitDeath,Units.onDeath); 
        }
 

        //创建指定单位实例
        private static method Create(unit u){
            Units ud=Units.allocate();
            ud.player=Players.Get(GetOwningPlayer(u));
            ud.isHero=IsUnitType(u,UNIT_TYPE_HERO);
            ud.name=GetUnitName(u); 
            ud.uid=GetUnitTypeId(u);
            ud.unit=u;
            Units.ht[u]=ud; 
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
            UnitAddAbility(u,'Amrf');
            UnitRemoveAbility(u,'Amrf');
            Units.onSpawn(u);
            bj_lastCreatedUnit=u;
            u=null;
            return bj_lastCreatedUnit;
        }

        //杀死单位,如果不是英雄则删除实例
        public static method Kill(unit u){
            if(Get(u).isHero==false){
                Units.Destroys(u);
            }
            KillUnit(u);
        }

        //删除单位和实例
        public static method Remove(unit u){ 
            Units.Destroys(u);
            RemoveUnit(u);
        }
     

    }


}