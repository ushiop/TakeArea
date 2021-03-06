library SpellNameText requires TimerUtils{

    struct TagText{
        unit u;
        string fullmsg;
        real time;
        integer now=0;
        integer max;
        integer steep;
        real angle;
        texttag txg;
        real font;
        real timertime;

        static method Create()->TagText{
            return TagText.allocate();
        }

        method Destroy(){
            this.u=null;
            this.txg=null;
            this.deallocate();
        }
    }

    //让单位喊话,文字会逐渐出现，steep为一次多出的字数 
    //delay为延迟多久出现
    //font为字体大小
    function RuaText1(){
        timer t=GetExpiredTimer();
        TagText this=TagText(GetTimerData(t)); 
        TimerStart(t,this.timertime,true,function RuaText1);
        SetTextTagVisibility(this.txg,true);
        if(this.now<this.max){
            this.now+=this.steep;
            SetTextTagPosUnit(this.txg,this.u,0 );
            SetTextTagTextBJ(this.txg,SubString(this.fullmsg,0,this.now),this.font+(GetRandomReal(0,0.75)*this.font)); 
        }else{
            SetTextTagTextBJ(this.txg,SubString(this.fullmsg,0,this.now),this.font);
            SetTextTagLifespan(this.txg,this.time);
            SetTextTagFadepoint(this.txg,this.time*0.1); 
            this.Destroy();
            ReleaseTimer(t); 
        }
    }

    public function RuaText(unit u,string msg,real font,real time,integer steep,real angle,real delay,real timertime){
        TagText t=TagText.Create();
        timer t1=NewTimer();
        t.txg=CreateTextTagUnitBJ("", u, 0, font, 100, 100, 0, 0 );  
        SetTextTagVisibility( t.txg, false );
        SetTextTagPermanent( t.txg, false );   
        t.u=u;
        t.fullmsg=msg;
        t.time=time;
        t.now=0;
        t.max=StringLength(msg);
        t.steep=steep;
        t.angle=angle;
        t.font=font;
        t.timertime=timertime;
        SetTextTagVelocityBJ(t.txg,t.max*4,angle );
        SetTimerData(t1,t);
        TimerStart(t1,delay,true,function RuaText1);
        t1=null;
    }


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
 
        if(aid=='A07I'||aid=='A070'||aid=='A069'||aid=='A05T'||aid=='A055'||aid=='A04Q'||aid=='A03Z'||aid=='A03G'||aid=='A02J'||aid=='A006'||aid=='A00M'||aid=='A00E'||aid=='A00S'||aid=='A015'||aid=='A01B'||aid=='A01F'||aid=='A027'){
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
            if(aid=='A027'){
                mj=Units.MJ(u.player.player,'e008',aid,999,u.X(),u.Y(),0,1,0.75,1, "birth","skill_name_mr_dayuluoxuanwan.mdx");
            }
            if(aid=='A02J'){
                mj=Units.MJ(u.player.player,'e008',aid,999,u.X(),u.Y(),0,1,0.75,1, "birth","skill_name_tr_xingbao.mdx");            
            }
            if(aid=='A03G'){
                mj=Units.MJ(u.player.player,'e008',aid,999,u.X(),u.Y(),0,1,0.75,1, "birth","skill_name_aw_wanglingzhiguodu.mdx");            
            }  
            if(aid=='A03Z'){
                mj=Units.MJ(u.player.player,'e008',aid,999,u.X(),u.Y(),0,1,0.75,1, "birth","skill_name_sd_feileishenzhen.mdx");            
            }
            if(aid=='A04Q'){
                mj=Units.MJ(u.player.player,'e008',aid,999,u.X(),u.Y(),0,1,0.75,1, "birth","skill_name_yuuki_chengfeng.mdx");            
            }
            if(aid=='A055'){
                mj=Units.MJ(u.player.player,'e008',aid,999,u.X(),u.Y(),0,1,0.75,1, "birth","skill_name_bigzz_tianzhao.mdx");            
            }
            if(aid=='A05T'){
                mj=Units.MJ(u.player.player,'e008',aid,999,u.X(),u.Y(),0,1,0.75,1, "birth","skill_name_shiki_niubozi.mdx");            
            }
            if(aid=='A069'){
                mj=Units.MJ(u.player.player,'e008',aid,999,u.X(),u.Y(),0,1,0.75,1, "birth","skill_name_zg_shiqifenge.mdx");            
            }
            if(aid=='A070'){
                mj=Units.MJ(u.player.player,'e008',aid,999,u.X(),u.Y(),0,1,0.75,1, "birth","skill_name_ichigo_xuhua.mdx");            
            }
            if(aid=='A07I'){
                mj=Units.MJ(u.player.player,'e008',aid,999,u.X(),u.Y(),0,1,0.75,1, "birth","skill_name_xn_huosui.mdx");            
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