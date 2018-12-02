    --键盘捕捉
    --与Press.j协作，提供异步/同步的按键事件
    require "jass.console".enable = true
    
    local cj=require 'jass.common' 
    local message=require 'jass.message'
    local war3=require 'jass.globals'
    local keys={} 
    local oldkeys={}
    local keyname={[769]="F2",[81]="Q",[87]="W",[69]="E",[82]="R",[68]="D",[70]="F",[67]="C",[32]="SPACE"}
    
    for i,v in pairs(keyname) do
        keys[i]="key_up"
        oldkeys[i]="key_up"
    end

    cj.TimerStart(cj.CreateTimer(),0.01,true,function()
        for i,v in pairs(keyname) do  
            war3.PressCode=0
            if (oldkeys[i]~=keys[i] or keys[i]==nil) then
                keys[i]=oldkeys[i] 
                war3.PressType=keys[i]
                war3.PressName=v 
                war3.PressCode=1
            end  
            cj.ExecuteFunc("PressSnycLuaCallback")
        end
         
    end)
     
    function message.hook(msg)
        if (msg.type=="key_up" or msg.type=="key_down") then
            oldkeys[msg.code]=msg.type 
        end
        return  true
    end