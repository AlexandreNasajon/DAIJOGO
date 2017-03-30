math.randomseed(os.time())

Player1 = {
    ["life"] = 100,
    ["deck"] = {},
    ["hand"] = {},
    ["board"] = {},
    ["grave"] = {},
    ["gold"] = 0

}

Player2 = {
    ["life"] = 100,
    ["deck"] = {},
    ["hand"] = {},
    ["board"] = {},
    ["grave"] = {},
    ["gold"] = 0

}

function printcard(c)
    
    if c["type"] == "monster" then
        print("Cost","Type","Name","Power","Resistance")
        print(c["cost"],c["type"],c["name"],c["power"],c["resistance"])
        
    elseif c["type"] == "support" then
        print("Cost","Type","Name","Effect")
        print(c["cost"],c["type"],c["name"],c["effect"])
        
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
    print("#","Cost","Type","Name","Power","Resistance")
    while i <= #h do
        print(i,h[i]["cost"],h[i]["type"],h[i]["name"],h[i]["power"],h[i]["resistance"])
  
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
        print("#","Cost","Type","Name","Power","Resistance")
        while i <= 5 do
            
            print(i,draftpool[i]["cost"],draftpool[i]["type"],draftpool[i]["name"],draftpool[i]["power"],draftpool[i]["resistance"])
   
        i = i+1
        end
        
        action = tonumber(io.read())
    
        if action<6 and action>0 then
            Player1["deck"][#Player1["deck"]+1] = draftpool[action]
            print("You picked "..draftpool[action]["name"].."!")
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
        print("#","Cost","Type","Name","Power","Resistance")
        while i <= 5 do
            
            print(i,draftpool[i]["cost"],draftpool[i]["type"],draftpool[i]["name"],draftpool[i]["power"],draftpool[i]["resistance"])
   
        i = i+1
        end
        
        action = tonumber(io.read())
    
        if action<6 and action>0 then
            Player2["deck"][#Player2["deck"]+1] = draftpool[action]
            print("You picked "..draftpool[action]["name"].."!")
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

pool = {---MONSTER
        {["cost"] = 1,["type"] = "monster",["name"] = "Zombie",["power"] = 4,["resistance"]=5},
        {["cost"] = 2,["type"] = "monster",["name"] = "Demon",["power"] = 15,["resistance"]=24},
        {["cost"] = 1,["type"] = "monster",["name"] = "Knight",["power"] = 10,["resistance"]=15},
        {["cost"] = 1,["type"] = "monster",["name"] = "Witch",["power"] = 11,["resistance"]=15},
        {["cost"] = 1,["type"] = "monster",["name"] = "Wolf",["power"] = 4,["resistance"]=7},
        {["cost"] = 1,["type"] = "monster",["name"] = "Tiger",["power"] = 7,["resistance"]=9},
        {["cost"] = 2,["type"] = "monster",["name"] = "Angel",["power"] = 16,["resistance"]=25},
        {["cost"] = 2,["type"] = "monster",["name"] = "Dragon",["power"] = 17,["resistance"]=30},
        {["cost"] = 1,["type"] = "monster",["name"] = "Mermaid",["power"] = 7,["resistance"]=12},
        
        ---SUPPORT
        {["cost"] = 1,["type"] = "support",["name"] = "Greed",["effect"] = drawcard(Player1)}
        --if t == 1 then

      --  elseif t == 2 then
         --   drawcard(Player2)
        --    drawcard(Player2)
       -- end
      
        
       -- {["cost"] = 0,["type"] = "support",["name"] = "Lust",["effect"] = 
        
      --  },
        
      --  {["cost"] = 0,["type"] = "support",["name"] = "Gluttony",["effect"] = },
        
     --   {["cost"] = 0,["type"] = "support",["name"] = "Sloth",["effect"] = },
        
    --    {["cost"] = 0,["type"] = "support",["name"] = "Wrath",["effect"] = },
        
   --     {["cost"] = 0,["type"] = "support",["name"] = "Envy",["effect"] = },
        
   --     {["cost"] = 0,["type"] = "support",["name"] = "Pride",["effect"] = }
}

draftpool = {}

draft(pool)

print("GAME START!")

getgold(Player1)
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
        print("Life: "..Player1["life"],"Gold: "..Player1["gold"])
        print("1 - Play card from hand")
        print("2 - Attack with monster")
        print("3 - End turn")
            
        option = tonumber(io.read())
        
        if option == 1 then
            print("Your hand is:")
            printhandboardorgrave(Player1["hand"])
            print(1+#Player1["hand"].." - Return")
            
            opt = tonumber(io.read())
            
            valid = opt<=#Player1["hand"] and opt>0
            
            if valid and Player1["hand"][opt]["cost"]<=Player1["gold"] then
                Player1["gold"] = Player1["gold"] - Player1["hand"][opt]["cost"]
                
                if Player1["hand"][opt]["type"] == "monster" then
                    printcard(Player1["hand"][opt])
                    Player1["board"][#Player1["board"]+1] = Player1["hand"][opt]
                    Player1["hand"][opt] = nil
                    print("The board is now:")
                    printhandboardorgrave(Player1["board"])
            
                        while opt <= #Player1["hand"] do
                            Player1["hand"][opt] = Player1["hand"][opt+1]
                            opt = opt+1
                        end
                        ------------    PROBLEMA -----------------
                elseif Player1["hand"][opt]["type"] == "support" then
                    printcard(Player1["hand"][opt])
                    Player1["hand"][opt]["effect"]
                    Player1["grave"][#Player1["grave"+1]] = Player1["hand"][opt]
                    Player1["hand"][opt] = nil
                --------------------- EU VOU MATAR ALGUEM  ---------------
                end
                
            elseif valid and Player1["hand"][opt]["cost"]>Player1["gold"] then
                print("You don't have enough gold!")
                    
            elseif opt == #Player1["hand"]+1 then -- opção não válida
                    
            else 
                print("Select a valid card!")        
            end
            
        elseif option == 2 then
            
            print("The board is:")
                    printhandboardorgrave(Player1["board"])
                    print("Select an attacker:")
                    
                    num = tonumber(io.read())
                    
                    attacker = Player1["board"][num]

                    if num<=#Player1["board"] then
                        
                        print("Select a target.")
                        print("1 - Opponent")
                        if #Player2["board"]>0 then
                        print("2 - Monsters")
                        end
                        
                        target = tonumber(io.read())
                        
                        if target == 1 then
                        Player2["life"] = Player2["life"] - attacker["power"]
                        print("Player 2's life is now: "..Player2["life"])
                        
                        elseif target == 2 and #Player2["board"]>0 then
                            printhandboardorgrave(Player2["board"])
                            print("Select a defender.")
                            num = tonumber(io.read())
                            defender = Player2["board"][num]
                            if num<=#Player2["board"] then
                            defender["resistance"] = defender["resistance"] - attacker["power"]
                            print(defender["name"].."'s resistance is now "..defender["resistance"])
                            if defender["resistance"]<=0 then
                                Player2["grave"][1+#PLayer2["grave"]] = defender
                                Player2["board"][num] = nil
                                print(defender["name"].." was destroyed as a result of battle. It was sent to the grave.")
                                print("Player 2's grave is now: ")
                                printhandboardorgrave(Player2["grave"])
                                
                            end
                                
                            else
                                print("Select a defender!")
                            end
                        
                        else
                            print("Select a target!")
                        end
                        
                    else
                        print("Select an attacker!")
                    end
            
        elseif option == 3 then
            
            t = 2
            drawcard(Player2)
            print("Player 2 draws a card")
            getgold(Player2)
            print("Player 2 receives 1 gold")
                
        else 
            print("Select a valid option!")
        end
            
            ---------------------TURNO DO PLAYER 2-------------------------

        while t == 2 do
            print("Player 2 turn")
            print("Life: "..Player2["life"],"Gold: "..Player2["gold"])
            print("1 - Play card from hand")
            print("2 - Attack with monster")
            print("3 - End turn")
            
            option = tonumber(io.read())
            
                
        if option == 1 then
            print("Your hand is:")
            printhandboardorgrave(Player2["hand"])
            print(1+#Player2["hand"].." - Return")
            
            opt = tonumber(io.read())
            
            valid = opt<=#Player2["hand"] and opt>0
            
            if valid and Player2["hand"][opt]["cost"]<=Player2["gold"] then
                Player2["gold"] = Player2["gold"] - Player2["hand"][opt]["cost"]
                
                if Player2["hand"][opt]["type"] == "monster" then
                    printcard(Player2["hand"][opt])
                    Player2["board"][#Player2["board"]+1] = Player2["hand"][opt]
                    Player2["hand"][opt] = nil
                    print("The board is now:")
                    printhandboardorgrave(Player2["board"])
            
                        while opt <= #Player2["hand"] do
                            Player2["hand"][opt] = Player2["hand"][opt+1]
                            opt = opt+1
                        end
                        
                elseif Player2["hand"][opt]["type"] == "support" then
                    printcard(Player2["hand"][opt])
                    -- aplicar efeito
                    Player2["grave"][#Player2["grave"]+1] = Player2["hand"][opt]
                    Player2["hand"][opt] = nil
                
                end
                
            elseif valid and Player2["hand"][opt]["cost"]>Player2["gold"] then
                print("You don't have enough gold!")
                    
            elseif opt == #Player2["hand"]+1 then -- opção não válida
                    
            else 
                print("Select a valid card!")        
            end
            
            elseif option == 2 then
                
                print("The board is:")
                    printhandboardorgrave(Player2["board"])
                    print("Select an attacker:")
                    
                    num = tonumber(io.read())
                    
                    attacker = Player2["board"][num]

                    if num<=#Player2["board"] then
                        
                        print("Select a target.")
                        print("1 - Opponent")
                        if #Player1["board"]>0 then
                        print("2 - Monsters")
                        end
                        
                        target = tonumber(io.read())
                        
                        if target == 1 then
                            Player1["life"] = Player1["life"] - attacker["power"]
                            print("Player 1's life is now: "..Player1["life"])
                        
                        elseif target == 2 and #Player1["board"]>0 then
                            printhandboardorgrave(Player1["board"])
                            print("Select a defender.")
                            num = tonumber(io.read())
                            defender = Player1["board"][num]
                            if num<=#Player1["board"] then
                            defender["resistance"] = defender["resistance"] - attacker["power"]
                            print(defender["name"].."'s resistance is now "..defender["resistance"])
                            if defender["resistance"]<=0 then
                                Player1["grave"][1+#PLayer1["grave"]] = defender
                                Player1["board"][num] = nil
                                print(defender["name"].." was destroyed as a result of battle. It was sent to the grave.")
                                print("Player 2's grave is now: ")
                                printhandboardorgrave(Player1["grave"])
                                
                            end
                                
                            else
                                print("Select a defender!")
                            end
                        
                        else
                            print("Select a target!")
                        end
                        
                    else
                        print("Select an attacker!")
                    end
            
            elseif option == 3 then
            
                t = 1
                drawcard(Player1)
                print("Player 1 draws a card")
                getgold(Player1)
                print("Player 1 receives 1 gold")
                
            else 
                print("Select a valid option!")
                
            end
            
        end -- while t == 2
            
    end -- while t == 1
end -- while Player1["life"] > 0 and Player2["life"] > 0 do
    
if Player1["life"]<1 then
    print("Player 2 wins the game!")
    
elseif Player2["life"]<1 then
    print("Player 1 wins the game!")
end
