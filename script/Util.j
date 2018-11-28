library Util{

    //实用的小函数类

    struct Util{

        //返回U到M的角度
        public static method XY(unit u,unit m)->real{
            return bj_RADTODEG*Atan2(GetUnitY(m)-GetUnitY(u),GetUnitX(m)-GetUnitX(u));
        }

        //返回XY到XY1的角度
        public static method XYEX(real x,real y,real x1,real y1)->real{
            return bj_RADTODEG*Atan2(y1-y,x1-x);
        }

        //返回U到M的距离
        public static method XY2(unit u,unit m)->real{
            real dx=GetUnitX(m)-GetUnitX(u);
            real dy=GetUnitY(m)-GetUnitY(u);
            return SquareRoot(dx*dx+dy*dy);
        
        }

        //返回XY到XY1的距离
        public static method XY2EX(real x,real y,real x1,real y1)->real{
            real dx=x1-x;
            real dy=y1-y;
            return SquareRoot(dx*dx+dy*dy);
        }

        //在U身上添加删除一次技能i
        public static method UnitAddRemoveAbility(unit u,integer i){
            UnitAddAbility(u,i);
            UnitRemoveAbility(u,i);
        }

        //从SLK中获取指定ID的指定属性
        public static method GetValue(integer id,string valuename)->string{
            return EXExecuteScript( "(require'jass.slk').unit[" + I2S(id) + "].+"+valuename);
        }
 
    }
}