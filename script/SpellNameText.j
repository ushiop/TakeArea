library SpellNameText{
    //创建一个向上漂浮的漂浮文字
    public function SpellNameText(unit u,string name,real time,real text){
        texttag t= CreateTextTagUnitBJ(name, u, 0, text, 100, 100, 0, 0 ); 
        SetTextTagLifespan( t,time);
        SetTextTagVisibility( t, true );
        SetTextTagVelocityBJ(t, 128.00, 90 );
        SetTextTagPermanent( t, false );
        SetTextTagFadepoint(t,time*0.1); 
        t=null;
    }
}