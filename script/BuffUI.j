library BuffUI requires BzAPI,Buff{
    //模拟的BUFFUI组件
    public struct BuffUI{
        private static Table idht;//技能ID为KEY的表
        private static Table indexht;//UI ID为KEY的表
        private static integer BuffList[];//BUFF数组
        private static integer MaxBuffUI;//注册的UI图标个数
        private static integer BuffBackground;//BUFF条的低图
        private static integer BuffTipBackground;//BUFF提示框的底图
        private static integer BuffTipText;//BUFF提示框的文字
        private static string BuffLevel[];//不同层数的数字贴图路径


        private{
            integer Aid;//BUFF技能的ID
            string BuffName;//BUFF的名字
            string BuffTip;//BUFF的描述
            integer BuffUIBackground;//BUFF图标的定位底图
            integer BuffUIButton;//点击/进入/离开事件
            integer BuffUILevel_0;//BUFF层数的显示底图,0为个位数以此类推，3为千位
            integer BuffUILevel_1;//BUFF层数的显示底图,0为个位数以此类推，3为千位
            integer BuffUILevel_2;//BUFF层数的显示底图,0为个位数以此类推，3为千位
            integer BuffUILevel_3;//BUFF层数的显示底图,0为个位数以此类推，3为千位
            integer BuffLevels;//BUFF层数
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
                    }else{
                        if(b.Aid=='BPSE'||b.Aid=='Bprg'||b.Aid=='Bcrs'){
                            //原生BUFF的处理，眩晕/麻痹等
                            b.BuffLevels=1;
                        }else{
                            //光环BUFF的处理，有图标则必然有实例
                            b.BuffLevels=Buffs.Find(u,b.Aid).Level;
                        }
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
            string lv=I2S(this.BuffLevels);
            integer len=StringLength(lv);
            integer ui[];
            integer i;
            integer s=len; 
            DzFrameSetPoint(this.BuffUIBackground,0, BuffBackground, 0,x,y ); 
            ui[0]=this.BuffUILevel_0;
            ui[1]=this.BuffUILevel_1;
            ui[2]=this.BuffUILevel_2;
            ui[3]=this.BuffUILevel_3;
            if(lv=="1"||lv=="0"){
                len=-1;
            }
            for(0<=i<4){
                if(i<len){  
                    DzFrameSetTexture(ui[i],BuffLevel[S2I(SubStringBJ(lv,s,s))], 0 );
                    s-=1;
                }else{
                    DzFrameSetTexture(ui[i], "nothing.blp", 0 );
                }
            }
        }

        //DzFrameSetPoint( AA, 0, BB, 8, 0, 0 )  0是左上，8是右下
        static method RegBuff(integer id){ 
            real x;
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
            
            //BUFF层数图 
                //个位数
                x=-0.0045; 
                b.BuffUILevel_0=DzCreateFrameByTagName("BACKDROP", "BuffUI_Buff_Level"+I2S(id)+"_0",b.BuffUIBackground, "ShowInfo", 0);
                DzFrameSetTexture(b.BuffUILevel_0, "nothing.blp", 0 );
                DzFrameSetSize(b.BuffUILevel_0,0.008,0.01 );   
                DzFrameSetPoint(b.BuffUILevel_0,0,b.BuffUIBackground, 8,-0.003+x,0.012 );  
                //十位数
                b.BuffUILevel_1=DzCreateFrameByTagName("BACKDROP", "BuffUI_Buff_Level"+I2S(id)+"_1",b.BuffUIBackground, "ShowInfo", 0);
                DzFrameSetTexture(b.BuffUILevel_1, "nothing.blp", 0 );
                DzFrameSetSize(b.BuffUILevel_1,0.008,0.01 );   
                DzFrameSetPoint(b.BuffUILevel_1,0,b.BuffUIBackground, 8,-0.003+x*2,0.012 );    
                //百位数
                b.BuffUILevel_2=DzCreateFrameByTagName("BACKDROP", "BuffUI_Buff_Level"+I2S(id)+"_2",b.BuffUIBackground, "ShowInfo", 0);
                DzFrameSetTexture(b.BuffUILevel_2, "nothing.blp", 0 );
                DzFrameSetSize(b.BuffUILevel_2,0.008,0.01 );   
                DzFrameSetPoint(b.BuffUILevel_2,0,b.BuffUIBackground, 8,-0.003+x*3,0.012 );  
                //千位数
                b.BuffUILevel_3=DzCreateFrameByTagName("BACKDROP", "BuffUI_Buff_Level"+I2S(id)+"_3",b.BuffUIBackground, "ShowInfo", 0);
                DzFrameSetTexture(b.BuffUILevel_3, "nothing.blp", 0 );
                DzFrameSetSize(b.BuffUILevel_3,0.008,0.01  );   
                DzFrameSetPoint(b.BuffUILevel_3,0,b.BuffUIBackground, 8,-0.003+x*4,0.012 );      

            //
            if(Players.localplayer==Players.localplayer){
                //按下
                DzFrameSetScriptByCode(b.BuffUIButton, 1,function(){
                    integer tUI=DzF2I(DzGetTriggerUIEventFrame());
                    BuffUI b=BuffUI(indexht[tUI]); 
                    if(UISelectUnit==Players.Get(Players.localplayer).hero.unit){  
                        DzSyncData( "BuffTip","|cff00FF00我|r 正处于 ["+b.BuffName+"] 状态下!" ); 
                    }else{ 
                        if(IsUnitEnemy(UISelectUnit,Players.localplayer)==true){
                            DzSyncData( "BuffTip","|cffFF0000"+GetUnitName(UISelectUnit)+"|r 正处于 ["+b.BuffName+"] 状态下!" );  
                        }else{ 
                            DzSyncData( "BuffTip","|cff00FF00"+GetUnitName(UISelectUnit)+"|r 正处于 ["+b.BuffName+"] 状态下!" );
                        }
                    }
                }, false);
                DzFrameSetScriptByCode(b.BuffUIButton, 2,function(){
                    integer tUI=DzF2I(DzGetTriggerUIEventFrame());
                    BuffUI b=BuffUI(indexht[tUI]);
                    BackgroundTipShow(true);
                    BackgroundTipText(b.BuffName+" "+b.BuffTip);
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

        static method onTip(){
            YDWEDisplayChat( DzGetTriggerSyncPlayer(), 1, DzGetTriggerSyncData() );
        }

        static method onInit(){ 
            trigger t=CreateTrigger();  
            integer lv;
            //BUFF层数贴图
            for(0<=lv<=9){ 
                BuffLevel[lv]="number_"+I2S(lv)+".blp"; 
            }
            //


            MaxBuffUI=0;
            idht=Table.create();
            indexht=Table.create();
            BuffBackground=DzCreateFrameByTagName("BACKDROP", "BuffUI_Background",DzGetGameUI(), "ShowInfo", 0);
            DzFrameSetTexture( BuffBackground, "nothing.blp", 0 ); 
            BuffTipBackground=DzCreateFrameByTagName("BACKDROP", "BuffUI_Background_Tip",DzGetGameUI(), "ShowInfo", 0);
            BackgroundTipSize(0.4,0.015);
            BackgroundTipMove(-0.06,-0.172);
            BackgroundTipShow(false);
            DzFrameSetTexture( BuffTipBackground, "UI\\Widgets\\EscMenu\\Human\\editbox-background.blp", 0 ); 
            BuffTipText=DzCreateFrameByTagName("TEXT", "BuffUI_Background_Tip_TEXT",BuffTipBackground, "ShowInfo", 0);
            DzFrameSetSize( BuffTipText, 0.4,0.015 ); 
            DzFrameSetPoint( BuffTipText,0,BuffTipBackground,0,0,-0.001);   
            BackgroundTipSize(0.28,0.015);
                  
            DzTriggerRegisterSyncData( t, "BuffTip", false );
            TriggerAddAction(t, function BuffUI.onTip);
            t=null;
        }
    }
}