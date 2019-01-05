    --与网易不兼容，告辞
    require "jass.console".enable = true
    
    --[[local cj=require 'jass.common' 
    local message=require 'jass.message'
    local war3=require 'jass.globals'

    local keys={} 
    local oldkeys={}
    local keyname={[769]="F2",[81]="Q",[87]="W",[69]="E",[82]="R",[68]="D",[70]="F",[67]="C",[32]="SPACE"}
    local pid=cj.GetPlayerId(cj.GetLocalPlayer())

    for i,v in pairs(keyname) do
        keys[i]="key_up"
        oldkeys[i]="key_up"
    end

    function Sync()
        for i,v in pairs(keyname) do   
            if (oldkeys[i]~=keys[i] or keys[i]==nil) then
                keys[i]=oldkeys[i] 
                if(keys[i]=="key_up") then 
                    cj.StoreInteger(war3.gc,pid,i,1)
                else
                    cj.StoreInteger(war3.gc,pid,i,2)
                end
                cj.SyncStoredInteger(war3.gc,pid,i)
                cj.StoreInteger(war3.gc,pid,i, 0) 
            end   
        end
    end
     
    function message.hook(msg)
        if (msg.type=="key_up" or msg.type=="key_down") then
            oldkeys[msg.code]=msg.type 
            Sync()
        end
        return  true
    end]]