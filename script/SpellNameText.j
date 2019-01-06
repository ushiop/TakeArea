library SpellNameText{

    //创建一个漂浮文字 
    public function TextAngle(unit u,string name,real time,real text,real angle){
        texttag t= CreateTextTagUnitBJ(name, u, 0, text, 100, 100, 0, 0 ); 
        SetTextTagLifespan( t,time);
        SetTextTagVisibility( t, true );
        SetTextTagVelocityBJ(t, 128.00, angle );
        SetTextTagPermanent( t, false );
        SetTextTagFadepoint(t,time*0.1); 
        t=null;
    }

    //创建一个向上漂浮的漂浮文字
    public function SpellNameText(unit u,string name,real time,real text){
        TextAngle(u,name,time,text,90);
    }

    public function SpellText(unit ua,integer aid,real time,real text){
        Units u=Units.Get(ua);
        Units mj;
 
        if(aid=='A006'||aid=='A00M'||aid=='A00E'||aid=='A00S'||aid=='A015'||aid=='A01B'||aid=='A01F'){
            if(aid=='A006'){
                mj=Units.MJ(u.player.player,'e008',aid,999,u.X(),u.Y(),0,1,0.75,1, "birth","skill_name_huangyanluo.mdx");
            }
            if(aid=='A00M'){
                mj=Units.MJ(u.player.player,'e008',aid,999,u.X(),u.Y(),0,1,0.75,1, "birth","skill_name_fengzhiqixi.mdx");
            }
            if(aid=='A00E'){
                mj=Units.MJ(u.player.player,'e008',aid,999,u.X(),u.Y(),0,1,0.75,1, "birth","skill_name_yuanwugun.mdx");
            }                        
            if(aid=='A00S'){
                mj=Units.MJ(u.player.player,'e008',aid,999,u.X(),u.Y(),0,1,0.75,1, "birth","skill_name_qianniaoqianben.mdx");
            }
            if(aid=='A015'){
                mj=Units.MJ(u.player.player,'e008',aid,999,u.X(),u.Y(),0,1,0.75,1, "birth","skill_name_molizhenji.mdx");
            }            
            if(aid=='A01B'){
                mj=Units.MJ(u.player.player,'e008',aid,999,u.X(),u.Y(),0,1,0.75,1, "birth","skill_name_weishan.mdx");
            }            
            if(aid=='A01F'){
                mj=Units.MJ(u.player.player,'e008',aid,999,u.X(),u.Y(),0,1,0.75,1, "birth","skill_name_kuailebengdi.mdx");
            }
            mj.SetH(75);
            mj.DelayAnime(2,0.7);  
        }else{ 
            SpellNameText(u.unit,GetAbilityName(aid),time,text);
        }
    }

    public function TextForPlayer(player p,unit u,string name,real time,real text,real face){
        texttag t= CreateTextTagUnitBJ(name, u, 0, text, 100, 100, 0, 0 ); 
        SetTextTagLifespan( t,time);
        SetTextTagVisibility( t, true );
        SetTextTagVelocityBJ(t, 128.00,face );
        SetTextTagPermanent( t, false );
        SetTextTagFadepoint(t,time*0.1); 
        if(GetLocalPlayer()==p){
            SetTextTagVisibility(t,true);
        }else{
            SetTextTagVisibility(t,false);
        }
        t=null;        
    }
}