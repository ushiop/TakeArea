    --键盘捕捉
    --与Press.j协作，提供异步/同步的按键事件
    --部分玩家会在HOOK消息部分崩溃，原因不明。。
    --2018/12/02 测试过程
    --第一次启动：虾子按下按键后崩溃，推测为键盘消息HOOK导致
    --第二次启动：删除了键盘消息HOOK，不崩溃
    --第三次启动：添加了内置JAPI、打开了崩溃跟踪器，添加了键盘消息HOOK，不崩溃
    --第四次启动：使用的是第一次启动的版本的地图，重新用YDWE编译过，不崩溃
    require "jass.console".enable = false
    
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