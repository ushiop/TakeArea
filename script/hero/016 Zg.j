library Zg requires Groups{
    //英雄‘眼镜·七夜’的技能
    //SR
    /*
        27 - Q前摇
        24 - Q动作
    */ 
    struct Zg{  
        static method HERO_START(Spell e){
            Units u=Units.Get(e.Spell);
            if(e.Id=='A05X'){
                u.FlushAnimeId(27);
            }
            e.Destroy();
        }

        static method onInit(){

            Spell.On(Spell.onReady,'A05X',Zg.HERO_START); 
        }
    }
} 