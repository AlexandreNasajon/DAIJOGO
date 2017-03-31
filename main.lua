math.randomseed(os.time())


Player = {
        {
        ["life"] = 100,
        ["deck"] = {},
        ["hand"] = {},
        ["board"] = {},
        ["grave"] = {},
        ["gold"] = 0,
        ["abilities"] = {}
},

{
        ["life"] = 100,
        ["deck"] = {},
        ["hand"] = {},
        ["board"] = {},
        ["grave"] = {},
        ["gold"] = 0,
        ["abilities"] = {}
    }
}

function printcard(c)
    
    if c["type"] == "monster" then
        print("Cost","Type","Name","Power","Resistance")
        print(c["cost"],c["type"],c["name"],c["power"],c["resistance"])
        
    elseif c["type"] == "support" then
        print("Cost","Type","Name","Effect")
        print(c["cost"],c["type"],c["name"],c["effect"])
        
    elseif c["type"] == "ability" then
        print("Type","Name","Effect")
        print(c["type"],c["name"],c["effect"])
    end
end

function drawcard(p) -- player
   
    p["hand"][#p["hand"]+1] = p["deck"][math.random(1,#p["deck"])]
    
end

function getgold(p)
   
    p["gold"] = p["gold"]+1
    
end

function printhandboardorgrave(h)
    i = 1
    while i <= #h do
        if h[i]["type"] == "monster" then
            print("#","Cost","Type","Name","Power","Resistance")
            print(i,h[i]["cost"],h[i]["type"],h[i]["name"],h[i]["power"],h[i]["resistance"])
            
        i = i+1
            
        elseif h[i]["type"] == "support" then
            print("Cost","Type","Name","Effect")
            print(h[i]["cost"],h[i]["type"],h[i]["name"],h[i]["effect"])
            
        i = i+1
            
        elseif h[i]["type"] == "ability" then
            print("Type","Name","Effect")
            print(h[i]["type"],h[i]["name"],h[i]["effect"])
  
        i = i+1
        end
    end  
end

function draft(pool)
    
    t = 1
    while t == 1 or t == 2 do
        while #Player[t]["deck"]<10 do
            print("Player "..t.."'s draft.")
            print("Build a 10 card deck!")
        
            m = 1
            while m <= 5 do
                draftpool[#draftpool+1] = pool[math.random(1,#pool)]
        
                m = m+1
            end
        
            i = 1
            print("#","Cost","Type","Name","Power","Resistance")
            print("--------------------------------------------------------")
            while i <= 5 do
                
                print(i,draftpool[i]["cost"],draftpool[i]["type"],draftpool[i]["name"],draftpool[i]["power"],draftpool[i]["resistance"])
    
            i = i+1
            end
            
            action = tonumber(io.read())
            
        
            if action == nil or action<1 or action>5 then
                print("Pick a valid card!")
                
            else
                Player[t]["deck"][#Player[t]["deck"]+1] = draftpool[action]
                print("You picked "..draftpool[action]["name"].."!")
                print ("Your deck has "..#Player[t]["deck"].." card(s) now. Pick "..10-#Player[t]["deck"].." more!")
                draftpool[1] = nil
                draftpool[2] = nil
                draftpool[3] = nil
                draftpool[4] = nil
                draftpool[5] = nil
            end
        
        end -- while #Player[t]["deck"]<3
        
        if #Player[t]["deck"] == 10 then
            
            t = 2
        
        end
        
    end -- while t == 1 or t == 2
    
end -- function draft(pool)
    
pool = {---MONSTER
        {["cost"] = 1,["type"] = "monster",["name"] = "Zombie",["power"] = 4,["resistance"]=5},
        {["cost"] = 2,["type"] = "monster",["name"] = "Demon",["power"] = 15,["resistance"]=24},
        {["cost"] = 1,["type"] = "monster",["name"] = "Knight",["power"] = 10,["resistance"]=15},
        {["cost"] = 1,["type"] = "monster",["name"] = "Witch",["power"] = 11,["resistance"]=15},
        {["cost"] = 1,["type"] = "monster",["name"] = "Wolf",["power"] = 4,["resistance"]=7},
        {["cost"] = 1,["type"] = "monster",["name"] = "Tiger",["power"] = 7,["resistance"]=9},
        {["cost"] = 2,["type"] = "monster",["name"] = "Angel",["power"] = 16,["resistance"]=25},
        {["cost"] = 2,["type"] = "monster",["name"] = "Dragon",["power"] = 17,["resistance"]=30},
        {["cost"] = 1,["type"] = "monster",["name"] = "Mermaid",["power"] = 7,["resistance"]=12}
}

draftpool = {}

draft(pool)
