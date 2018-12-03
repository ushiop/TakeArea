library SpellNameText{
    //创建一个向上漂浮的漂浮文字
    function SpellNameText(unit u,string name,real time,real text){
        texttag t= CreateTextTagUnitBJ(name, u, 0, text, 100, 100, 100, 0 );
        DestroyTextTag( t() );
        SetTextTagLifespan( t,time)
        SetTextTagVisibility( t, true );
        SetTextTagVelocity( t, 64.00, 90 );
        SetTextTagPermanent( t, true );
        t=null;
    }
}