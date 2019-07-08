library Order{ 
    //关于命令的帮助类

    public struct Order{

        /*
            无论是单位还是点命令，命令ID都是一样的
            851971  - 右键(应该是攻击移动命令)
            851983 - A键(Attack)
            851986 - M键(Move)
        */

        static constant integer RightClick=851971;//右键
        static constant integer Attack=851983;//A键
        static constant integer Move=851986;//M键

        static method ToXY(unit u,string order,real x,real y){//向制定单位发布一个点目标命令在xy处
            IssuePointOrder(u,order,x,y);
        }

        static method To(unit u,string order){//向指定单位发布一个无目标命令
            IssueImmediateOrder(u,order);
        }
    }
}