library HeroRare requires Units{

    //英雄池初始化及抽奖类

    private unitpool HeroRare[3];//英雄池 R-SSR[0-2],根据英雄附加值

    public unit HeroRare_LastRandomUnit;//最后一个从奖池抽出来的单位

    public integer HeroType[];

    function onInit(){
        group g=CreateGroup(); 
        HeroRare[0]=CreateUnitPool();
        HeroRare[1]=CreateUnitPool();
        HeroRare[2]=CreateUnitPool(); 
        GroupEnumUnitsInRange(g,0,0,65535,null);
        ForGroup(g,function(){
            unit gu=GetEnumUnit(); 
            if(IsUnitType(gu,UNIT_TYPE_HERO)==true){
                HeroType[GetUnitPointValue(gu)]=GetUnitTypeId(gu);
                HeroRares.AddRandomHero(gu);
            }
            gu=null;
        });
        DestroyGroup(g);
        HeroRares.Repeat(true); 
    }
    public struct HeroRares{
        private static boolean isRepeat=false;//是否可以重复抽取相同英雄

        //设置是否可以重复抽取相同英雄，true为可以
        public static method Repeat(boolean b){
            isRepeat=b;
        }

        //获取是否可以重复抽取相同英雄
        public static method GetRepeat()->boolean{
            return isRepeat;
        }

        //返回单位的稀有度等级,0~2 r-ssr
        public static method GetUnitRare(unit u)->integer{
            string rare=Util.GetUnitValue(GetUnitTypeId(u),"EditorSuffix"); 
            if(rare=="R") return 0;
            if(rare=="SR") return 1;
            if(rare=="SSR") return 2;
            return 0;
        }

        //将一个单位放回对应奖池并删除它
        public static method AddRandomHero(unit u){
            if(GetRepeat()==false){
                UnitPoolAddUnitType(HeroRare[HeroRares.GetUnitRare(u)], GetUnitTypeId(u), 1 );
            }
            Units.Remove(u);
        }

        //为玩家从英雄池中随机一个英雄，随机范围为0-r,r最大为100
        public static method GetRandomHero(player p,real r)->unit{
            real r1=GetRandomReal(0,r);
            //real r1=GetRandomReal(0,50);
            integer index=-1;
            if(r1>0&&r1<=30){
                index=0;
            }else if(r1>30&&r1<=70){
                index=1;
            }else if(r1>70){
                index=2;
            }
            //测试 BJDebugMsg("本次随机池:"+I2S(index));
            HeroRare_LastRandomUnit=PlaceRandomUnit(HeroRare[index], p, 0,0,0);
            Units.Set(HeroRare_LastRandomUnit);
            if(GetRepeat()==false){
                UnitPoolRemoveUnitType( HeroRare[index],GetUnitTypeId(HeroRare_LastRandomUnit));
            }
            return HeroRare_LastRandomUnit;
        }
    }
}