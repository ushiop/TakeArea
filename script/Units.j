library Units requires Table,Players{

    //单位基础类
    //管理单位身上的集合数据,创建单位用该类函数,杀死单位也是

    public struct Units{
        private static HandleTable ht;

        public {
            Players player; 
            boolean isHero;
            string name;
            unit unit; 
            integer uid;
        }

        static method onInit(){
            ht = HandleTable.create();
        }


        //创建指定单位实例
        private static method Create(unit u){
            Units ud=Units.allocate();
            ud.player=Players.Get(GetOwningPlayer(u));
            ud.isHero=IsUnitType(u,UNIT_TYPE_HERO);
            ud.name=GetUnitName(u); 
            ud.uid=GetUnitTypeId(u);
            ud.unit=u;
            if(ud.isHero==true){
                 
            }
             
            
            Units.ht[u]=integer(ud); 
        }

        //摧毁指定单位 实例
        private static method Destroys(unit u){
            Units ud=Units(Units.ht[u]); 
            ud.unit=null; 
            ud.deallocate();
            Units.ht.flush(u);
            
        }

        //获得指定单位的实例
        public static method Get(unit u)->Units{
            return Units(Units.ht[u]);
        }

        //为某个已存在单位注册实例(比如地图上放置的单位)
        //重复注册不会有效果
        public static method Set(unit u){
            if(Units.ht.exists(u)==false){
                Units.Create(u);
            }
        }

        //创建单位并绑定UNITS实例
        public static method Spawn(player p,integer unitid,real x,real y,real f)->unit{
            unit u=CreateUnit(p,unitid,x,y,f);
            Units.Create(u);
            UnitAddAbility(u,'Amrf');
            UnitRemoveAbility(u,'Amrf');
            bj_lastCreatedUnit=u;
            u=null;
            return bj_lastCreatedUnit;
        }

        //杀死单位,如果不是英雄则删除实例
        public static method Kill(unit u){
            KillUnit(u);
            if(Get(u).isHero==false){
                Units.Destroys(u);
            }
        }

        public static method Remove(unit u){
            RemoveUnit(u);
            Units.Destroys(u);
        }
     

    }


}