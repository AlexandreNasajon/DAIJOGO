math.randomseed(os.time())


Player = {
        {
        ["life"] = 100,
        ["deck"] = {},
        ["hand"] = {},
        ["board"] = {},
        ["grave"] = {},
        ["gold"] = 0,
        ["abilities"] = {},
        ["storm"] = 0
},

{
        ["life"] = 100,
        ["deck"] = {},
        ["hand"] = {},
        ["board"] = {},
        ["grave"] = {},
        ["gold"] = 0,
        ["abilities"] = {},
        ["storm"] = 0
    }
}

--Player.1.life = 100
--Player.1.deck = {}

pool = {---unit
        {["cost"] = 2,["type"] = "unit",["name"] = "Lich",["power"] = 13,["life"]=26,["attacks"] = 1,["effect"] = "If summoned, add a card in your grave to your hand."},
        {["cost"] = 1,["type"] = "unit",["name"] = "Eater",["power"] = 3,["life"]= 3,["attacks"] = 1,["effect"] = "If summoned, gains 3 power and 3 life for each unit in your grave."},
        {["cost"] = 1,["type"] = "unit",["name"] = "Serpent",["power"] = 7,["life"]= 1,["attacks"] = 1,["effect"] = "If this card goes to your grave, you may pay 7 life to put it into your hand."}
--         {["cost"] = 1,["type"] = "unit",["name"] = "",["power"] = ,["life"]=,["effect"] = ""},
--         {["cost"] = 1,["type"] = "unit",["name"] = "",["power"] = ,["life"]=,["effect"] = ""},
--         {["cost"] = 1,["type"] = "unit",["name"] = "",["power"] = ,["life"]=,["effect"] = ""},
--         {["cost"] = 1,["type"] = "unit",["name"] = "",["power"] = ,["life"]=,["effect"] = ""}
        

--         {["cost"],["type"],["name"],["effect"]}
}

draftpool = {}


-- function licheffect()
--         
--     if Player[t]["board"] == pool[1] then
--             
--         drawcard(Player[t])
--             
--     end
-- end


printcard = function(c)
    
    if c["type"] == "unit" then
        print("Name","Cost","Type","Power","Life","Attacks")
        print(c["name"],c["cost"],c["type"],c["power"],c["life"],c["attacks"])
        print("Effect:")
        print(c["effect"])
        
    elseif c["type"] == "support" then
        print("Name","Cost","Type")
        print(c["name"],c["cost"],c["type"])
        print("Effect:")
        print(c["effect"])
        
    elseif c["type"] == "ability" then
        print("Name","Type")
        print(c["name"],c["type"])
        print("Effect:")
        print(c["effect"])
    end
end

drawcard = function(p) -- player
   
    p["hand"][#p["hand"]+1] = p["deck"][math.random(1,#p["deck"])]
    
end

getgold = function(p)
   
    p["gold"] = p["gold"]+1
    
end

 printhandboardorgrave = function(h)
    i = 1
    while i <= #h do
        if h[i]["type"] == "unit" then
            print("#","Name","Cost","Type","Power","Life")
            print(i,h[i]["name"],h[i]["cost"],h[i]["type"],h[i]["power"],h[i]["life"])
            
        i = i+1
            
        elseif h[i]["type"] == "support" then
            print("#","Name","Cost","Type","Effect")
            print(i,h[i]["name"],h[i]["cost"],h[i]["type"],h[i]["effect"])
            
        i = i+1
            
        elseif h[i]["type"] == "ability" then
            print("#","Name","Type","Effect")
            print(i,h[i]["name"],h[i]["type"],h[i]["effect"])
  
        i = i+1
        end
    end  
end

draft = function(Player)
    
        while #Player["deck"]<2 do
            print("Player "..v.."'s draft.")
            print("Build a 10 card deck!")
        
            local m = 1
            while m <= 5 do
                draftpool[#draftpool+1] = pool[math.random(1,#pool)]
        
                m = m+1
            end
        
            local i = 1
            print("#","Name","Cost","Type","Power","Life")
            print("--------------------------------------------")
            while i <= 5 do
                print(i,draftpool[i]["name"],draftpool[i]["cost"],draftpool[i]["type"],draftpool[i]["power"],draftpool[i]["life"]) -- problema attempt to index field '?' (a nil value)
    
            i = i+1
            end
            
            
            action = tonumber(io.read())
                        
            if action == nil or action<1 or action>5 then
                print("Pick a valid card!")
                
            else
                Player["deck"][#Player["deck"]+1] = draftpool[action]
                print("You picked "..draftpool[action]["name"].."!")
                print("Your deck has "..#Player["deck"].." card(s) now. Pick "..10-#Player["deck"].." more!")
                draftpool[1] = nil
                draftpool[2] = nil
                draftpool[3] = nil
                draftpool[4] = nil
                draftpool[5] = nil
            end
        
        end -- while #Player["deck"]<10
    
end -- function draft(Player)
    
turn = function(t)
    while t == 1 or t == 2 do
        print("Player "..t.." turn")
        print("Life: "..Player[t]["life"],"Gold: "..Player[t]["gold"])
        print("1 - Hand")
        print("2 - Board")
        print("3 - Grave")
        print("4 - Abilities")
        print("5 - End turn")
        
        option = tonumber(io.read())
        
        while option == 1 do -------------------------HAND-------------------------------------
            print("Your hand is:")
            printhandboardorgrave(Player[t]["hand"])
            print(1+#Player[t]["hand"].." - Return")
            print("Select a card.")
            
            option1 = tonumber(io.read())
            
            while option1<=#Player[t]["hand"] and option1>0 do
                print("1 - View card")
                print("2 - Play card")
                print("3 - Return")
                
                option11 = tonumber(io.read())
                
                while option11 == 1 do
                    printcard(Player[t]["hand"][option1])
                    print("1 - Return")
                    
                    option111 = tonumber(io.read())
                    
                    if option111 == 1 then
                        break
                        
                    else
                        print("Select a valid option!")
                    end
                end
                    
                if option11 == 2 and Player[t]["hand"][option1]["cost"]<=Player[t]["gold"] then
                        print("You play "..Player[t]["hand"][option1]["name"]..".")
                        Player[t]["board"][1+#Player[t]["board"]] = Player[t]["hand"][option1]
                        Player[t]["hand"][option1] = nil
                        
                        while option1 <= #Player[t]["hand"] do
                            Player[t]["hand"][option1] = Player[t]["hand"][option1+1]
                            option1 = option1+1
                        end
                        
                elseif option11 == 2 and Player[t]["hand"][option1]["cost"]>Player[t]["gold"] then
                    print("You don't have enough gold!")
                    
                elseif option11 == 3 then
                    break
                    
                else
                    print("Select a valid option!")
                end
                
            end
                
            if option1 == 1+#Player[t]["hand"] then
                break
                
            else
                print("Select a valid option!")
            end
            
        end
            
        while option == 2 do --------------------------------YOUR BOARD----------------------------------
            print("1 - Your board")
            print("2 - Opponent's board")
            print("3 - Return")
            
            option2 = tonumber(io.read())
            
            while option2 == 1 do
                print("Your board:")
                printhandboardorgrave(Player[t]["board"])
                print(1+#Player[t]["board"].." - Return")
                
                option21 = tonumber(io.read())
                
                while option21<=#Player[t]["board"] and option21>0 do
                    printcard(Player[t]["board"][option21])
                    print("1 - Attack")
                    print("2 - Return")
                    
                    option211 = tonumber(io.read())
                    
                    while option211 == 1 do ----------------------------ATTACK----------------------------------------
                        
                        attacker = Player[t]["board"][option21]
                            
                        print("Select a target.")
                        print("1 - Opponent")
                        if #Player[y]["board"]>0 then
                        print("2 - Unit")
                        print("3 - Return")
                        else
                        print("2 - Return")
                        end
                        
                        target = tonumber(io.read())
                        
                        if target == 1 then
                        Player[y]["life"] = Player[y]["life"] - attacker["power"]
                        print("Player"..y.."'s life is now: "..Player[y]["life"])
                        
                        elseif target == 2 and #Player[y]["board"]>0 then
                            printhandboardorgrave(Player[y]["board"])
                            print("Select a defender.")
                                                        
                            local defender = Player[y]["board"][tonumber(io.read())]
                                                        
                            
                                                        
                                                        
                            
                        elseif target == 3 and #Player[y]["board"]>0 then
                            break
                            
                        elseif target == 2 and #Player[y]["board"]<=0 then
                            break
                            
                        else
                            print("Select a valid option!")
                        end
                    end
                        
                    if option211 == 2 then ------------------------RETURN-------------------------------------
                        break
                        
                    else
                        print("Select a valid option!")
                    end
                    
                end
                
                if option21 == 1+#Player[t]["board"] then -----------------------RETURN----------------------------
                    break
                    
                else
                    print("Select a valid option!")
                end
                    
            end
            
            while option2 == 2 do --------------------------OPPONENT BOARD-----------------------------------
                print("Opponent's board:")
                printhandboardorgrave(Player[y]["board"])
                print("1 - View card")
                print("2 - Return")
                
                option22 = tonumber(io.read())
                
            end
                
            if option2 == 3 then
                break
                
                
            elseif option2>3 and option2<1 then
                print("Select a valid option!")
            end
            
        end
            
            
        while option == 3 do
            print("1 - Your grave")
            print("2 - Opponent's grave")
            print("3 - Return")
            
            option3 = tonumber(io.read())
            
        end
            
        while option == 4 do
            print("1 - Your abilities")
            print("2 - Opponent's abilities")
            print("3 - Return")
            
            option4 = tonumber(io.read())
            
        end
            
        if option == 5 then
            print("Turn ends.")
            drawcard(Player[y])
            print("Player "..y.." draws a card")
            getgold(Player[y])
            print("Player "..y.." receives 1 gold")
            break -- eu sou um gênio
            
        elseif option>5 and option<1 then
            print("Select a valid option!")
        end
    end -- while
end -- function

function game()
    
    while Player[1]["life"] > 0 and Player[2]["life"] > 0 do
        t = 1  y = 2
        turn(t)
        t = 2  y = 1
        turn(t)
    end
    
    if Player[1]["life"]<1 then
        print("Player 2 wins the game!")
    
    elseif Player[2]["life"]<1 then
        print("Player 1 wins the game!")
    end

    
end -- function game()
    
os.execute("clear")

v = 1
draft(Player[v])
v = 2
draft(Player[v])

print("GAME START!")

getgold(Player[1])
drawcard(Player[1])
drawcard(Player[1])
drawcard(Player[1])
drawcard(Player[2])
drawcard(Player[2])
drawcard(Player[2])

game()
