library Units requires Table,Players,Events,Util{
 
    //单位基础类
    //管理单位身上的集合数据,创建单位用该类函数,杀死单位也是
    //以及单位事件

    type UnitsEventInterface extends function(Units,Units);

    public struct Units  {
        private static HandleTable ht;

        //属性
        public {
            Players player; //玩家对象
            boolean isHero;//是否是英雄
            string name;//单位名字
            unit unit; //单位本体
            boolean move;//是否能被位移
            integer uid;//单位类型ID
            integer spell;//单位释放技能的回调，用于反向捕捉
            integer aid;//如果是马甲，则为所属技能，用于标识是什么技能的马甲
            integer aidindex;//如果是马甲，则为所属技能的马甲ID，用于表示具体的马甲
            Data Obj;//自定义数据
            integer pauses;//暂停计数
            integer moves;//位移计数
            integer ai;//AI施法的接口
            real createtime;//被创建时间
            real movespeed;//理论移动速度（只是用于计算，并没有突破522的实际移动速度)
            real animespeed;//动画播放速度(仅用于记录,实际上没啥用)
            integer color_red;//红色的值
            integer color_green;//绿色
            integer color_blue;//蓝色
            integer color_alpha;//透明度
            real modelsize;//模型缩放
            real dashspeedscale;//冲锋速度系数,仅用于Dash类的速度计算,默认为1,单位是百分比
            integer ex_str;//额外力量
            integer ex_agi;//额外敏捷
            integer ex_int;//额外智力

            //返回单位的自定义值
            method Data()->integer{
                return GetUnitUserData(this.unit);
            }

            //设置单位的自定义值
            method SetData(integer i){
                SetUnitUserData(this.unit,i);
            }

            //获取单位的冲锋速度系数
            method DashSpeedScale()->real{
                return dashspeedscale;
            }

            //在当前的冲锋速度系数上增减x
            method SetDashSpeedScale(real x){
                this.dashspeedscale+=x;
            }

            //返回单位武器类型
            method Weapon()->integer{
                if(this.IsAbility('A02Z')==true){
                    return Units.WeaponKnife;//刀
                }else if(this.IsAbility('A031')==true){
                    return Units.WeaponBow;//弓
                }else if(this.IsAbility('A033')==true){
                    return Units.WeaponAxe;//斧
                }else if(this.IsAbility('A02Y')==true){
                    return Units.WeaponSword;//剑
                }else if(this.IsAbility('A030')==true){
                    return Units.WeaponFist;//拳（空手）
                }else if(this.IsAbility('A032')==true){
                    return Units.WeaponPike;//长枪
                }else if(this.IsAbility('A039')==true){
                    return Units.WeaponWand;//法杖
                }else{
                    return Units.WeaponUnknow;//未知武器
                }
            }

            //返回单位性别
            method Sex()->integer{
                if(this.IsAbility('A021')==true){
                    return Units.SexMan;
                }else if(this.IsAbility('A022')==true){
                    return Units.SexWomen;
                }else{
                    return Units.SexUnknow;
                }
            }

            //返回单位的移动速度
            method MoveSpeed()->real{
                return GetUnitMoveSpeed(this.unit);
            }

            //增加/减少单位移动速度，可以超过522，但仅用于计算，游戏中不会实际超过522
            method SetMoveSpeed(real r){
                this.movespeed+=r;
                if(this.movespeed>=522){
                    SetUnitMoveSpeed(this.unit,522);
                }else if(this.movespeed<=0){
                    SetUnitMoveSpeed(this.unit,0);
                }else{
                    SetUnitMoveSpeed(this.unit,this.movespeed);
                }
            }

            method SetMP(real r){
                SetUnitState(this.unit,UNIT_STATE_MANA,r);
            }

            method SetHP(real r){
                SetUnitState(this.unit,UNIT_STATE_LIFE,r); 
            }

            method MaxMP()->real{
                return GetUnitState(this.unit, UNIT_STATE_MAX_MANA);
            }

            method MaxHP()->real{ 
                return GetUnitState(this.unit, UNIT_STATE_MAX_LIFE);
            }

            method MP()->real{
                return GetUnitState(this.unit, UNIT_STATE_MANA);
            }

            method HP()->real{ 
                return GetUnitState(this.unit, UNIT_STATE_LIFE);
            }

            //在time秒内将透明度由nowA转变为maxA
            method DelayAlpha(integer nowA,integer maxA,real time){
                timer t=NewTimer();
                Data data=Data.create('A010');
                data.c[0]=this;
                data.i[0]=R2I((maxA-nowA) / (time/0.01));
                data.i[1]=nowA;
                data.i[2]=maxA;
                data.r[3]=time;
                this.Alpha(nowA);
                SetTimerData(t,data);
                TimerStart(t,0.01,true,function(){
                    Data data=Data(GetTimerData(GetExpiredTimer())); 
                    Units u=Units(data.c[0]);
                    if(data.r[3]<=0||u.Alive()==false){
                        u.Alpha(data.i[2]);
                        data.Destroy();
                        ReleaseTimer(GetExpiredTimer());
                    }else{
                        data.r[3]-=0.01;
                        data.i[1]+=data.i[0];
                        u.Alpha(data.i[1]);
                    }
                });
                t=null;                     
            }

            //设置单位颜色,0-255
            method Color(integer r,integer g,integer b){ 
                this.color_red=r;
                this.color_green=g;
                this.color_blue=b;
                SetUnitVertexColor(this.unit, r, g, b, this.color_alpha );
            }

            //设置单位透明度,0-255,0为不可见
            method Alpha(integer a){
                this.color_alpha=a;
                SetUnitVertexColor(this.unit, this.color_red,this.color_green,this.color_blue,a );
            }

            //暂停单位
            method Pause(boolean p){
                if(p==true){
                    if(this.pauses==0){ 
                        EXPauseUnit(this.unit,p);
                    }
                    this.pauses+=1;
                }else{
                    this.pauses-=1;
                    if(this.pauses==0){ 
                        EXPauseUnit(this.unit,p);
                    }
                }

            }

            //取消该单位身上绑定的OBJ对象(并没有销毁)
            method RemoveObj(){
                if(this.Obj!=0){
                    this.Obj=0;
                }
            }

            //绑定自定义数据到单位上
            method AddObj(Data obj){
                this.Obj=obj;
            }

            //是否存活
            method Alive()->boolean{
                return IsUnitAliveBJ(this.unit);
            }

            //返回额外力量
            method ExStr()->integer{
                return this.ex_str;
            }

            //返回额外敏捷
            method ExAgi()->integer{
                return this.ex_agi;
            }

            //返回额外智力
            method ExInt()->integer{
                return this.ex_int;
            }

            //设置额外力量
            method SetExStr(integer s){
                this.ex_str+=s; 
                ModifyHeroStat( bj_HEROSTAT_STR,this.unit, bj_MODIFYMETHOD_ADD, s );
            }
            //设置额外敏捷
            method SetExAgi(integer s){ 
                this.ex_agi+=s;
                ModifyHeroStat( bj_HEROSTAT_AGI,this.unit, bj_MODIFYMETHOD_ADD, s );
            }            
            //设置额外智力
            method SetExInt(integer s){
                this.ex_int+=s;
                ModifyHeroStat( bj_HEROSTAT_INT,this.unit, bj_MODIFYMETHOD_ADD, s );
            }

            //返回英雄力量
            //true为包含额外属性
            method Str(boolean f)->integer{
                if(f==true){ 
                    return GetHeroStr(this.player.hero.unit,f);
                }else{
                    return GetHeroStr(this.player.hero.unit,true) - this.player.hero.ExStr();
                }
            }

            //返回英雄敏捷
            method Agi(boolean f)->integer{
                if(f==true){ 
                    return GetHeroAgi(this.player.hero.unit,f);
                }else{ 
                    return GetHeroAgi(this.player.hero.unit,true) - this.player.hero.ExAgi();
                }
            }

            //返回英雄智力
            method Int(boolean f)->integer{
                if(f==true){ 
                    return GetHeroInt(this.player.hero.unit,f);
                }else{ 
                    return GetHeroInt(this.player.hero.unit,true) - this.player.hero.ExInt();
                }
            }

            //隐藏或者显示单位
            method Show(boolean f){
                ShowUnit(this.unit,f);
            }


            //设置单位模型大小
            method Size(real s){ 
                this.modelsize=s;
                SetUnitScale( this.unit,s,s,s);
            }

            //设置单位生存时间
            method Life(real time){ 
                UnitApplyTimedLife(this.unit, 'BHwe',time);
            }

            //0秒后播放指定动画
            method FlushAnimeId(integer id){
                this.DelayAnime(id,0);
            }

            //播放指定动画
            method AnimeId(integer id){
                SetUnitAnimationByIndex( this.unit,id);
            }

            //替换模型为path
            method Model(string path){
                DzSetUnitModel(this.unit,path);
            }

            //延迟一定时间后替换单位模型,0秒为立即替换（不开启计时器)
            method DelayModel(string path,real delay){
                timer t;
                Data data;
                if(delay==0){
                    this.Model(path);
                }else{
                    t=NewTimer();
                    data=Data.create('A001');
                    data.c[0]=this;
                    data.s[0]=path;
                    data.r[0]=delay;
                    SetTimerData(t,data);
                    TimerStart(t,0.01,true,function(){
                        Data d=Data(GetTimerData(GetExpiredTimer()));
                        if(d.r[0]<=0||Units(d.c[0]).Alive()==false){ 
                            Units(d.c[0]).Model(d.s[0]); 
                            ReleaseTimer(GetExpiredTimer());
                            d.Destroy();
                        }else{
                            d.r[0]-=0.01;
                        }
                    });
                    t=null;
                }
            }

            //延迟一定时间后播放动画
            method DelayAnime(integer id,real delay){
                timer t=NewTimer();
                Data data=Data.create('A000');
                data.c[0]=this;
                data.i[0]=id;
                data.r[0]=delay;
                SetTimerData(t,data);
                TimerStart(t,0.01,true,function(){
                    Data d=Data(GetTimerData(GetExpiredTimer()));  
                    Units u=Units(d.c[0]);
                    if(d.r[0]<=0||u.Alive()==false){ 
                        u.AnimeId(d.i[0]);
                        d.Destroy(); 
                        ReleaseTimer(GetExpiredTimer());
                    }else{
                        d.r[0]-=0.01;
                    }
                });
                t=null;               
            }

            //延迟一定时间后设置模型大小
            method DelaySize(real s,real delay){
                timer t=NewTimer();
                Data data=Data.create('A003');
                data.c[0]=this;
                data.r[0]=s;
                data.r[1]=delay;
                SetTimerData(t,data);
                TimerStart(t,0.01,true,function(){
                    Data d=Data(GetTimerData(GetExpiredTimer()));  
                    Units u=Units(d.c[0]);
                    if(d.r[1]<=0||u.Alive()==false){

                        u.Size(d.r[0]);
                        d.Destroy(); 
                        ReleaseTimer(GetExpiredTimer());
                    }else{
                        d.r[1]-=0.01;
                    }
                });
                t=null;                    
            }

            //延迟一定时间后设置动画播放速度
            method DelayAnimeSpeed(real speed,real delay){
                timer t=NewTimer();
                Data data=Data.create('A002');
                data.c[0]=this;
                data.r[0]=speed;
                data.r[1]=delay;
                SetTimerData(t,data);
                TimerStart(t,0.01,true,function(){
                    Data d=Data(GetTimerData(GetExpiredTimer()));  
                    Units u=Units(d.c[0]);
                    if(d.r[1]<=0||u.Alive()==false){ 
                        u.AnimeSpeed(d.r[0]);
                        d.Destroy(); 
                        ReleaseTimer(GetExpiredTimer());
                    }else{
                        d.r[1]-=0.01;
                    }
                });
                t=null;               
            } 

            //延迟一定时间后解除暂停并设置动画速度为1倍
            method DelayReleaseAnimePause(real delay){
                timer t=NewTimer();
                Data data=Data.create('A004');
                data.c[0]=this;
                data.r[0]=delay;
                SetTimerData(t,data);
                TimerStart(t,0.01,true,function(){
                    Data d=Data(GetTimerData(GetExpiredTimer()));  
                    Units u=Units(d.c[0]);
                    if(d.r[0]<=0||u.Alive()==false){

                        u.AnimeSpeed(1);
                        u.Pause(false);
                        d.Destroy(); 
                        ReleaseTimer(GetExpiredTimer());
                    }else{
                        d.r[0]-=0.01;
                    }
                });
                t=null;       
            }

            //播放单位动画名
            method Anime(string name){
                SetUnitAnimation( this.unit,name);
            }

            //设置单位动画播放速率
            method AnimeSpeed(real sp){
                this.animespeed=sp;
                SetUnitTimeScale(this.unit,sp);
            }

            //返回Y坐标
            method Y()->real{
                return GetUnitY(this.unit);
            }

            //返回X坐标
            method X()->real{
                return GetUnitX(this.unit);
            }
 
            //移动某玩家镜头到单位所在的位置
            method Lock(player p){
                if(Players.localplayer==p){
                    PanCameraToTimed(GetUnitX(this.unit),GetUnitY(this.unit), 0 );           
                }     
            }

            //让某玩家选择单位
            method Select(player p){
                SelectUnitForPlayerSingle(this.unit,p );
            }
 
            //设置单位面向角度,ex为是否使用JAPI（立即转身)
            method SetF(real f,boolean ex){
                SetUnitFacing(this.unit,f);
                if(ex==true){
                    EXSetUnitFacing(this.unit,f);
                } 
            }

            //返回单位面向角度
            method F()->real{
                return GetUnitFacing(this.unit);
            }

            //设置飞行高度
            method SetH(real h){
                SetUnitFlyHeight(this.unit,h,0);
            }

            //返回飞行高度
            method H()->real{
                return GetUnitFlyHeight(this.unit);
            }

            //设置单位开启/关闭碰撞
            method Pz(boolean f){
                SetUnitPathing( this.unit,f );
            }

            //设置单位是否可以移动,默认为true
            method PositionEnabled(boolean f){
                if(f==true){
                    this.moves-=1;
                    if(this.moves==0){ 
                        this.move=f;
                    }
                }else{
                    if(this.moves==0){ 
                        this.move=f;
                    }
                    this.moves+=1;
                }
            }

            //移动单位到X,Y的位置,order为是否打断命令
            method Position(real x,real y,boolean order){
                if(this.move==true){
                    if(order==true){
                        SetUnitPosition(this.unit,x,y);
                    }else{
                        SetUnitX(this.unit,x);
                        SetUnitY(this.unit,y);
                    }
                }

            }

            //使单位对m造成伤害,dtype,spell为本次伤害所属技能，被动填0
            method Damage(unit m,real dtype,integer spell,real dmg){ 
                Damage.To(this.player.hero.unit,m,dtype,spell,dmg);
            }

            //为单位添加技能
            method AddAbility(integer aid){
                UnitAddAbility(this.unit,aid);
            }

            //获取单位是否拥有该技能
            method IsAbility(integer aid)->boolean{
                return GetUnitAbilityLevel(this.unit,aid)>0;
            }

            method SetAbilityLevel(integer aid,integer lv){
                if(this.IsAbility(aid)==false){
                    this.AddAbility(aid);
                }
                SetUnitAbilityLevel(this.unit,aid,lv);
            }

            method RemoveAbility(integer aid){
                UnitRemoveAbility(this.unit,aid);
            } 

            method GetAbilityCD(integer id)->real{
                return YDWEGetUnitAbilityState(this.unit, id, 1);
            }

            method SetAbilityCD(integer id,real cd){
                YDWESetUnitAbilityState(this.unit,id, 1,cd);
            }
        }

        //自定义事件
        public {

            static constant integer MJType_TSW='A02O';//马甲投射物标记
            static constant integer MJType_FZW='A02P';//马甲放置物标记
            static constant integer MJType_CDW='A02Q';//马甲场地物标记

            static constant integer WeaponUnknow=0;//未知武器
            static constant integer WeaponSword=1;//剑
            static constant integer WeaponKnife=2;//刀
            static constant integer WeaponAxe=3;//斧
            static constant integer WeaponBow=4;//弓
            static constant integer WeaponFist=5;//拳(空手)
            static constant integer WeaponPike=6;//长枪
            static constant integer WeaponWand=7;//法杖


            static constant integer SexUnknow=0;//未知性别..
            static constant integer SexMan=1;//男性角色
            static constant integer SexWomen=2;//女性角色


            static constant string onUnitDeath="Units.UnitDeath";//非英雄单位死亡
            static constant string onHeroDeath="Units.HeroDeath";//英雄单位死亡
            static constant string onUnitSpawn="Units.UnitSpawn";//非英雄单位被创建
            static constant string onHeroSpawn="Units.HeroSpawn";//英雄单位被创建
            static constant string onAlocDeath="Units.AlocDeath";//蝗虫单位死亡
            static constant string onAlocSpawn="Units.AlocSpawn";//蝗虫单位出生

            //触发指定事件名
            static method Trigger(string eName,unit u,unit m){
                integer i;
                UnitsEventInterface callback;
                for(1<=i<Table[eName][0]){  
                    callback=UnitsEventInterface(Table[eName][i]);
                    callback.evaluate(Units.Get(u),Units.Get(m));
                }        
            }

            //注册自定义单位事件
            static method On(string eName,UnitsEventInterface callback){  
                if(Table[eName][0]==0){ 
                    Table[eName][0]=1;
                }
                Table[eName][Table[eName][0]]=callback;
                Table[eName][0]=Table[eName][0]+1;
            }
        }

        //任意单位开始腐化（真的死亡)
        //非英雄单位在这个时候才清空绑定的数据
        static method onDeacy(EventArgs e){
            if(IsUnitType(e.TriggerUnit,UNIT_TYPE_HERO)==false){ 
                Units.Destroys(e.TriggerUnit);
            }
        }

        //任意单位死亡,触发单位类的自定义事件
        static method onDeath(EventArgs e){ 
            if(IsUnitType(e.TriggerUnit,UNIT_TYPE_HERO)==true){
                if(GetUnitAbilityLevel(e.TriggerUnit,'Aloc')==0){ 
                    SetUnitState( e.TriggerUnit, UNIT_STATE_LIFE, -0.001 ); 
                    Units.Trigger(Units.onHeroDeath,e.TriggerUnit,e.KillUnit);
                }else{
                    //英雄蝗虫单位死亡
                    Units.Trigger(Units.onAlocDeath,e.TriggerUnit,e.KillUnit); 
                }
            }else{
                if(GetUnitAbilityLevel(e.TriggerUnit,'Aloc')==0){ 
                    SetUnitState( e.TriggerUnit, UNIT_STATE_LIFE, -0.001 ); 
                    Units.Trigger(Units.onUnitDeath,e.TriggerUnit,e.KillUnit); 
                }else{
                    Units.Trigger(Units.onAlocDeath,e.TriggerUnit,e.KillUnit); 
                    Units.Destroys(e.TriggerUnit); 
                }
            }
        }

        //任意单位被创建，触发自定义事件
        static method onSpawn(unit u){
            if(GetUnitAbilityLevel(u,'Aloc')==0){
                if(IsUnitType(u,UNIT_TYPE_HERO)==true){
                    Units.Trigger(Units.onHeroSpawn,u,null);
                }else{
                    Units.Trigger(Units.onUnitSpawn,u,null);
                }
            }else{
                Units.Trigger(Units.onAlocSpawn,u,null);
            }

        }
 
        static method onInit(){
            ht = HandleTable.create(); 
            Events.On(Events.onUnitDeath,Units.onDeath); 
            Events.On(Events.onUnitDeacy,Units.onDeacy);
        }
 

        //创建指定单位实例
        private static method Create(unit u)->Units{
            Units ud=Units.allocate();
            ud.player=Players.Get(GetOwningPlayer(u));
            ud.isHero=IsUnitType(u,UNIT_TYPE_HERO);
            ud.name=GetUnitName(u); 
            ud.uid=GetUnitTypeId(u);
            ud.unit=u;
            ud.spell=0;
            ud.aid=0;
            ud.aidindex=0;
            ud.ai=0;
            ud.move=true;
            ud.Obj=0;
            ud.pauses=0;
            ud.moves=0;
            ud.movespeed=GetUnitMoveSpeed(u);
            ud.createtime=GameTime;
            ud.animespeed=1;
            ud.modelsize=S2R(Util.GetUnitValue(ud.uid,"modelScale"));
            ud.color_red=255;
            ud.color_green=255;
            ud.color_blue=255;
            ud.color_alpha=255;
            ud.dashspeedscale=1;
            ud.ex_str=0;
            ud.ex_agi=0;
            ud.ex_int=0;
            Units.ht[u]=ud; 
            return ud;
        }

        //摧毁指定单位 实例
        private static method Destroys(unit u){
            Units ud=Units.ht[u];  
            //if(ud.Obj!=0) Data(ud.Obj).Destroy();
            ud.unit=null; 
            ud.deallocate();
            Units.ht.flush(u);
            
        }

        //获得指定单位的实例
        public static method Get(unit u)->Units{
            return Units.ht[u];
        }

        //为某个已存在单位注册实例(比如地图上放置的单位)
        //重复注册不会有效果,会触发‘被创建’事件
        public static method Set(unit u){
            if(Units.ht.exists(u)==false){
                Util.UnitAddRemoveAbility(u,'Amrf');
                Units.Create(u);
                Units.onSpawn(u);
            }
        }

        //创建单位并绑定UNITS实例
        public static method Spawn(player p,integer unitid,real x,real y,real f)->unit{
            unit u=CreateUnit(p,unitid,x,y,f);
            Units.Create(u); 
            Util.UnitAddRemoveAbility(u,'Amrf'); 
            Units.onSpawn(u);
            bj_lastCreatedUnit=u;
            u=null;
            return bj_lastCreatedUnit;
        }

        //创建一个马甲单位
        //modsize 模型大小,animspeed 动画速度,animname 播放的动画名,modpath 模型路径,lifetime 生存时间
        //不会触发'spawn'事件
        public static method MJ(player p,integer uid,integer aid,integer aindex,real x,real y,real f,real lifetime,real modsize,real animspeed,string animname,string modpath)->Units{
            unit u=CreateUnit(p,uid,x,y,f);
            Units t=Units.Create(u);
            t.aid=aid;
            t.aidindex=aindex;
            t.animespeed=animspeed;
            t.modelsize=modsize;
            Util.UnitAddRemoveAbility(u,'Amrf'); 
            DzSetUnitModel( u, modpath);
            if(t.IsAbility('A01Z')==true){
                //是伪蝗虫单位，需要进行隐藏/显示处理，来修复替换模型后不会播放动画的问题
                //目前该问题只在我电脑上出现过，原因不明。
                ShowUnit(u,false);
                ShowUnit(u,true);
                t.AddAbility('Aloc');
            } 
            SetUnitAnimation( u,animname);
            SetUnitScale( u,modsize,modsize,modsize);
            SetUnitTimeScale( u,animspeed);
            UnitApplyTimedLife(u, 'BHwe', lifetime);
            bj_lastCreatedUnit=u;
            u=null;
            return t;
        } 

        //杀死单位
        public static method Kill(unit u){ 
            KillUnit(u);
        }

        //删除单位和实例
        public static method Remove(unit u){ 
            if(Units.Get(u)!=0){ 
                Units.Destroys(u);
            }
            RemoveUnit(u);
        }
     

    }


}