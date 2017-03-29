math.randomseed(os.time())

function printhandboardorgrave(h)
    i = 1
    print("#","Type","Name","Power","Resistance")
    while i <= #h do
        print(m,h[m]["type"],h[m]["name"],h[m]["power"],h[m]["resistance"])
  
        i = i+1
    end  
end

function draft(pool)
    
    while #Player1["deck"]<7 do
        print("Player 1's draft.")
        print("Build a deck with 7 cards!")
        print("Pick a card:")
    
        m = 1
        while m <= 5 do
            draftpool[#draftpool+1] = pool[math.random(1,#pool)]
    
            m = m+1
        end
    
        i = 1
        print("#","Type","Name","Power","Resistance")
        while i <= 5 do
            
            print(i,draftpool[i]["type"],draftpool[i]["name"],draftpool[i]["power"],draftpool[i]["resistance"])
   
        i = i+1
        end
        
        action = tonumber(io.read())
    
        if action<6 and action>0 then
            Player1["deck"][#Player1["deck"]+1] = draftpool[action]
            print("You picked a "..draftpool[action]["name"].."!")
            draftpool[1] = nil
            draftpool[2] = nil
            draftpool[3] = nil
            draftpool[4] = nil
            draftpool[5] = nil
        
        else
            print("Pick a valid card!")
        end
    
    
    
    end
    
    while #Player2["deck"]<7 do
        print("Player 2's draft.")
        print("Build a deck with 7 cards!")
        print("Pick a card:")
    
        m = 1
        while m <= 5 do
            draftpool[#draftpool+1] = pool[math.random(1,#pool)]
    
            m = m+1
        end
    
        i = 1
        print("#","Type","Name","Power","Resistance")
        while i <= 5 do
            
            print(i,draftpool[i]["type"],draftpool[i]["name"],draftpool[i]["power"],draftpool[i]["resistance"])
   
        i = i+1
        end
        
        action = tonumber(io.read())
    
        if action<6 and action>0 then
            Player2["deck"][#Player2["deck"]+1] = draftpool[action]
            print("You picked a "..draftpool[action]["name"].."!")
            draftpool[1] = nil
            draftpool[2] = nil
            draftpool[3] = nil
            draftpool[4] = nil
            draftpool[5] = nil
        
        else
            print("Pick a valid card!")
        end
    
    end
    
end

pool = {
        {["type"] = "monster",["name"] = "Zombie",["power"] = 4,["resistance"]=5},
        {["type"] = "monster",["name"] = "Demon",["power"] = 15,["resistance"]=24},
        {["type"] = "monster",["name"] = "Knight",["power"] = 10,["resistance"]=19},
        {["type"] = "monster",["name"] = "Witch",["power"] = 13,["resistance"]=22},
        {["type"] = "monster",["name"] = "Wolf",["power"] = 4,["resistance"]=7},
        {["type"] = "monster",["name"] = "Tiger",["power"] = 7,["resistance"]=9},
        {["type"] = "monster",["name"] = "Angel",["power"] = 16,["resistance"]=25},
        {["type"] = "monster",["name"] = "Dragon",["power"] = 17,["resistance"]=30},
        {["type"] = "monster",["name"] = "Kraken",["power"] = 12,["resistance"]=27},
}

draftpool = {}

Player1 = {
    ["life"] = 100,
    ["deck"] = {},
    ["hand"] = {},
    ["board"] = {},
    ["grave"] = {}

}

Player2 = {
    ["life"] = 100,
    ["deck"] = {},
    ["hand"] = {},
    ["board"] = {},
    ["grave"] = {}

}

draft(pool)

print("GAME START!")

t = 1     

while t == 1 do
    print("Player 1 turn")
    print("1 - Play card from hand")
    print("2 - Attack with monster")
    print("3 - End turn")
        
    option = tonumber(io.read())
        
    if option == 3 then
        
        t = 2
            
    end
        
           

    while t == 2 do
        print("Player 2 turn")
        print("1 - Play card from hand")
        print("2 - Attack with monster")
        print("3 - End turn")
        
        option = tonumber(io.read())
        
        if option == 3 then
        
            t = 1
            
        end
        
    end -- while t == 2
        
end -- while t == 1
