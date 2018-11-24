library Hero{
    //英雄类的基类
    public struct Hero extends Units{

        private static HandleTable ht;

        static method onInit(){
            ht = HandleTable.create();
        }

        public {

            //为一个英雄创建英雄基类的实例
            static method Attch(unit u){
                if(Hero.ht.exists(u)==false){
                    Hero.ht[u]=integer(Hero.allocate()); 
                }
            }
            
            //摧毁一个英雄基类的实例
            static method DestroyHero(unit u){
                Hero ud;
                if(Hero.ht.exists(u)==true){
                    ud=Hero(Hero.ht[u]);
                    ud.deallocate();
                    Hero.ht.flush(u);
                } 
            }

            //获得某个单位对应的英雄实例
            static method GetHero(unit u)->Hero{
                if(Hero.ht.exists(u)==true){
                    return Hero.ht[u];
                }
                return -1; 
            }
        }


    }
}