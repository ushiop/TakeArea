library Util{

    //实用的小函数类

    public struct Util{

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

        //从SLK中获取指定单位ID的指定属性
        public static method GetUnitValue(integer id,string valuename)->string{  
            return (EXExecuteScript( "(require'jass.slk').unit[" + I2S(id) + "]."+valuename));
        }

        //从SLK中获取指定技能ID的指定属性
        public static method GetAbilityValue(integer id,string valuename)->string{  
            return (EXExecuteScript( "(require'jass.slk').ability[" + I2S(id) + "]."+valuename));
        }

        //从SLK中获取指定BUFFID的指定属性
        public static method GetBuffValue(integer id,string valuename)->string{  
            return (EXExecuteScript( "(require'jass.slk').buff[" + I2S(id) + "]."+valuename));
        }

        //用抛物线公式计算，并返回结果系数
        //power为轨迹的幅度,now为自变量的当前值，max为自变量的最大值
        public static method GetPwx(real power,real now,real max)->real{
            return   1.00 - ( power * Pow(( (now /max ) - 0.50 ), 2.00) );
        }

        public static method B2S(boolean b)->string{
            if(b==true){
                return "true";
            }else{
                return "false";
            }
        }

        //显示指定范围大小的特效，用来测试范围
        public static method Range(real x,real y,real dis){
            integer i;
            for(0<=i<36){
                DestroyEffect( AddSpecialEffect("Abilities\\Weapons\\SpiritOfVengeanceMissile\\SpiritOfVengeanceMissile.mdl",x+dis*CosBJ(i*10),y+dis*SinBJ(i*10)) );
            }
        }
 
    }
}