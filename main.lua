math.randomseed(os.time())

function printcard(c)
    
    if c["type"] == "monster" then
        print("Type","Name","Power","Resistance")
        print(c["type"],c["name"],c["power"],c["resistance"])
        
    elseif c["type"] == "spell" then
        print("Type","Name","Effect")
        print(c["type"],c["name"],c["effect"])
        
    end
end

function drawcard(p) -- player
   
    p["hand"][#p["hand"]+1] = p["deck"][math.random(1,#p["deck"])]
    
end

function printhandboardorgrave(h)
    i = 1
    print("#","Type","Name","Power","Resistance")
    while i <= #h do
        print(i,h[i]["type"],h[i]["name"],h[i]["power"],h[i]["resistance"])
  
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
    
    
    
    end -- while #Player1["deck"]<7
    
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
    
    end -- while #Player2["deck"]<7
    
end -- function draft(pool)

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

drawcard(Player1)
drawcard(Player1)
drawcard(Player1)
drawcard(Player2)
drawcard(Player2)
drawcard(Player2)

while Player1["life"] > 0 and Player2["life"] > 0 do

t = 1     

    while t == 1 do
        print("Player 1 turn")
        print("You draw a card")
        drawcard(Player1)
        print("1 - Play card from hand")
        print("2 - Attack with monster")
        print("3 - End turn")
            
        option = tonumber(io.read())
        
        if option == 1 then
            print("Your hand is:")
            printhandboardorgrave(Player1["hand"])
            print(#Player1["hand"]+1.." - Return")
            
            opt = tonumber(io.read())
            
            valid = opt<=#Player1["hand"] and opt>0
            
            if valid then
                printcard(Player1["hand"][opt])
                Player1["board"][#Player1["board"]+1] = Player1["hand"][opt]
                Player1["hand"][opt] = nil
                print("The board is now:")
                printhandboardorgrave(Player1["board"])
        
                    while opt <= #Player1["hand"] do
                        Player1["hand"][opt] = Player1["hand"][opt+1]
                        opt = opt+1
                    end
                    
            elseif opt == #Player1["hand"]+1 then
                    
            else 
                print("Select a valid card!")        
            end
            
            
        elseif option == 2 then
            
            
            
        elseif option == 3 then
            
            t = 2
                
        else 
            print("Select a valid option!")
        end
            
            

        while t == 2 do
            print("Player 2 turn")
            print("You draw a card")
            drawcard(Player2)
            print("1 - Play card from hand")
            print("2 - Attack with monster")
            print("3 - End turn")
            
            option = tonumber(io.read())
            
                
            if option == 1 then
                print("Your hand is:")
                printhandboardorgrave(Player2["hand"])
                print(#Player2["hand"]+1.." - Return")
            
                opt = tonumber(io.read())
            
                valid = opt<=#Player2["hand"] and opt>0

                if valid then
                    printcard(Player2["hand"][opt])
                    Player2["board"][#Player2["board"]+1] = Player2["hand"][opt]
                    Player1["hand"][opt] = nil
                    print("The board is now:")
                    printhandboardorgrave(Player2["board"])
        
                        while opt <= #Player2["hand"] do
                            Player2["hand"][opt] = Player2["hand"][opt+1]
                            opt = opt+1
                        end
                    
                elseif opt == #Player2["hand"]+1 then
                        
                else 
                    print("Select a valid card!")        
                end
                
            
            elseif option == 2 then
            
            
            
            elseif option == 3 then
            
                t = 1
                
            else 
                print("Select a valid option!")
                
            end
            
        end -- while t == 2
            
    end -- while t == 1
end -- while Player1["life"] > 0 and Player2["life"] > 0 do
