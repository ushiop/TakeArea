library Yuuki requires Groups{
    //英雄‘优纪’的技能
    //R级
    struct Yuuki{

        static method Q(Spell e){
            
        }

        static method onInit(){
            Spell.On(Spell.onSpell,'A04H',Yuuki.Q);
        }
    }
}