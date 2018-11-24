library Tree{

    //树林生成类
 
    private rect rec[];//树林生成区域

    function onInit(){
        trigger t;
        location d;
        integer i,x;
        rec[0]=gg_rct_ShuLin_01;
        rec[1]=gg_rct_YeGuai_01;
        rec[2]=gg_rct_YeGuai_02;
        t=CreateTrigger();
        TriggerAddAction(t, function(){
            PolledWait(30.00);
            DestructableRestoreLife( GetDyingDestructable(), GetDestructableMaxLife(GetDyingDestructable()), true );
        });
        for(0<=i<100){
            for(0<=x<3){
                d=GetRandomLocInRect(rec[x]);
                CreateDestructableLoc( 'B000',d, GetRandomDirectionDeg(), GetRandomReal(1.00, 2.00), GetRandomInt(0, 4) );
                TriggerRegisterDeathEvent(t, GetLastCreatedDestructable());
                RemoveLocation(d);
                d=null;
            }
        }
        t=null;
    }
}