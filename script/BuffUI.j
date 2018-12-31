library BuffUI requires BzAPI{
    //模拟的BUFFUI组件
    public struct BuffUI{
        private static Table idht;//技能ID为KEY的表
        private static Table indexht;//UI ID为KEY的表
        private static integer BuffList[];//BUFF数组
        private static integer MaxBuffUI;//注册的UI图标个数
        private static integer BuffBackground;//BUFF条的低图
        private static integer BuffTipBackground;//BUFF提示框的底图
        private static integer BuffTipText;//BUFF提示框的文字


        private{
            integer Aid;//BUFF技能的ID
            string BuffName;//BUFF的名字
            string BuffTip;//BUFF的描述
            integer BuffUIBackground;//BUFF图标的定位底图
            integer BuffUIButton;//点击/进入/离开事件
            boolean ShowState;//是否在显示
        }

        //刷新BUFF UI
        static method Flush(unit u){
            integer x=0; 
            integer i;
            BuffUI b; 
            for(0<=i<MaxBuffUI){
                b=BuffUI(idht[BuffList[i]]); 
                if(b.ShowState==true){
                    if(GetUnitAbilityLevel(u,b.Aid)==0){
                        b.Show(false);
                    }
                    b.Move(0.001+(x*0.02),-0.003);
                    x+=1;
                }else{
                    if(GetUnitAbilityLevel(u,b.Aid)==1){
                        b.Show(true);
                    }               
                }
            }
        }

        method Show(boolean f){
            this.ShowState=f;
            DzFrameShow(this.BuffUIBackground,f);
        }

        method Move(real x,real y){
            DzFrameSetPoint(this.BuffUIBackground,0, BuffBackground, 0,x,y );
        }

        static method RegBuff(integer id){
            BuffUI b=BuffUI.allocate();
            b.Aid=id;
            b.BuffName= Util.GetBuffValue(id,"Bufftip");
            b.BuffTip=Util.GetBuffValue(id,"Buffubertip");
            b.BuffUIBackground=DzCreateFrameByTagName("BACKDROP", "BuffUI_Buff_Background"+I2S(id),BuffBackground, "ShowInfo", 0);
            b.ShowState=true;
            DzFrameSetTexture( b.BuffUIBackground, Util.GetBuffValue(id,"Buffart"), 0 );
            DzFrameSetSize( b.BuffUIBackground, 0.02,0.02 );   
            DzFrameSetPoint(b.BuffUIBackground,0, BuffBackground, 0,0.001,-0.003 );
            b.BuffUIButton=DzCreateFrameByTagName("GLUETEXTBUTTON","BuffUI_Buff_Button"+I2S(id) ,b.BuffUIBackground , "Button", 0);
            DzFrameSetSize(b.BuffUIButton, 0.02,0.02 ); 
            DzFrameSetPoint(b.BuffUIButton, 4, b.BuffUIBackground, 4, 0.00, 0.00 );
            if(Players.localplayer==Players.localplayer){
                //按下
                DzFrameSetScriptByCode(b.BuffUIButton, 1,function(){
                    integer tUI=DzF2I(DzGetTriggerUIEventFrame());
                    BuffUI b=BuffUI(indexht[tUI]); 
                    if(UISelectUnit==Players.Get(Players.localplayer).hero.unit){ 
                        YDWEDisplayChat( DzGetTriggerUIEventPlayer(), 1,"|cff00FF00我|r 正处于 ["+b.BuffName+"] 状态下!" );
                    }else{ 
                        if(IsUnitEnemy(UISelectUnit,Players.localplayer)==true){
                            YDWEDisplayChat( DzGetTriggerUIEventPlayer(), 1,"|cffFF0000"+GetUnitName(UISelectUnit)+"|r 正处于 ["+b.BuffName+"] 状态下!" );
                        }else{ 
                            YDWEDisplayChat( DzGetTriggerUIEventPlayer(), 1,"|cff00FF00"+GetUnitName(UISelectUnit)+"|r 正处于 ["+b.BuffName+"] 状态下!" );
                        }
                    }
                }, false);
                DzFrameSetScriptByCode(b.BuffUIButton, 2,function(){
                    integer tUI=DzF2I(DzGetTriggerUIEventFrame());
                    BuffUI b=BuffUI(indexht[tUI]);
                    BackgroundTipShow(true);
                    BackgroundTipText(b.BuffName+"|n|n"+b.BuffTip);
                }, false);
                DzFrameSetScriptByCode(b.BuffUIButton, 3,function(){ 
                    BackgroundTipShow(false); 
                }, false);
            } 
            idht[id]=b;
            indexht[DzF2I(b.BuffUIButton)]=b;   
            BuffList[MaxBuffUI]=id;
            MaxBuffUI+=1;
        }

        //设置BUFF栏的大小
        static method BackgroundSize(real x,real y){ 
            DzFrameSetSize( BuffBackground, x,y );
        }

        //移动BUFF栏的位置
        static method BackgroundMove(real x,real y){ 
            DzFrameSetPoint( BuffBackground,0,DzGetGameUI(),4,x,y);  
        }

        //隐藏或者显示BUFF栏
        static method BackgroundShow(boolean b){
            DzFrameShow(BuffBackground,b);
        }

        //设置提示栏的大小
        static method BackgroundTipSize(real x,real y){ 
            DzFrameSetSize( BuffTipBackground, x,y );
        }

        //移动提示栏的位置
        static method BackgroundTipMove(real x,real y){ 
            DzFrameSetPoint( BuffTipBackground,0,DzGetGameUI(),4,x,y);  
        }

        //隐藏或显示提示栏
        static method BackgroundTipShow(boolean b){
            DzFrameShow(BuffTipBackground,b);
        }

        //设置提示栏的文字
        static method BackgroundTipText(string text){ 
            DzFrameSetText(BuffTipText, text); 
        }

        static method onInit(){ 
            MaxBuffUI=0;
            idht=Table.create();
            indexht=Table.create();
            BuffBackground=DzCreateFrameByTagName("BACKDROP", "BuffUI_Background",DzGetGameUI(), "ShowInfo", 0);
            DzFrameSetTexture( BuffBackground, "nothing.blp", 0 ); 
            BuffTipBackground=DzCreateFrameByTagName("BACKDROP", "BuffUI_Background_Tip",DzGetGameUI(), "ShowInfo", 0);
            BackgroundTipSize(0.15,0.15);
            BackgroundTipMove(0.248,-0.148);
            BackgroundTipShow(false);
            DzFrameSetTexture( BuffTipBackground, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", 0 ); 
            BuffTipText=DzCreateFrameByTagName("TEXT", "BuffUI_Background_Tip_TEXT",BuffTipBackground, "ShowInfo", 0);
            DzFrameSetSize( BuffTipText, 0.15,0.15 );
            DzFrameSetPoint( BuffTipText,0,BuffTipBackground,0,0,-0.001);   
        }
    }
}