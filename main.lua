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

function draft(Player)
    
        while #Player["deck"]<10 do
            print("Player "..v.."'s draft.")
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
                print(i,draftpool[i]["cost"],draftpool[i]["type"],draftpool[i]["name"],draftpool[i]["power"],draftpool[i]["resistance"]) -- problema attempt to index field '?' (a nil value)
    
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

function turn(t)
    while t == 1 or t == 2 do
        print("Player "..t.." turn")
        print("Life: "..Player[t]["life"],"Gold: "..Player[t]["gold"])
        print("1 - Play card from hand")
        print("2 - Attack with monster")
        print("3 - End turn")
        
        option = tonumber(io.read())
        
        if option == 1 then
            print("Your hand is:")
            printhandboardorgrave(Player[t]["hand"])
            print(1+#Player[t]["hand"].." - Return")
            
            opt = tonumber(io.read())
            
            valid = opt<=#Player[t]["hand"] and opt>0
            
            if valid and Player[t]["hand"][opt]["cost"]<=Player[t]["gold"] then
                Player[t]["gold"] = Player[t]["gold"] - Player[t]["hand"][opt]["cost"]
                
                if Player[t]["hand"][opt]["type"] == "monster" then
                    printcard(Player[t]["hand"][opt])
                    Player[t]["board"][#Player[t]["board"]+1] = Player[t]["hand"][opt]
                    Player[t]["hand"][opt] = nil
                    print("The board is now:")
                    printhandboardorgrave(Player[t]["board"])
            
                        while opt <= #Player[t]["hand"] do
                            Player[t]["hand"][opt] = Player[t]["hand"][opt+1]
                            opt = opt+1
                        end
                        
                                  ------------    PROBLEMA -----------------
--                 elseif Player[t]["hand"][opt]["type"] == "support" then
--                     printcard(Player[t]["hand"][opt])
--                     Player1["hand"][opt]["effect"]
--                     Player[t]["grave"][#Player[t]["grave"+1]] = Player[t]["hand"][opt]
--                     Player[t]["hand"][opt] = nil
                --------------------- EU VOU MATAR ALGUEM  ---------------
                end
                
            elseif valid and Player[t]["hand"][opt]["cost"]>Player[t]["gold"] then
                print("You don't have enough gold!")
                    
            elseif opt == #Player[t]["hand"]+1 then -- opção não válida
                    
            else 
                print("Select a valid card!")        
            end
            
        elseif option == 2 then
            
            print("The board is:")
                    printhandboardorgrave(Player[t]["board"])
                    print("Select an attacker:")
                    
                    num = tonumber(io.read())
                    
                    attacker = Player[t]["board"][num]

                    if num<=#Player[t]["board"] then
                        
                        print("Select a target.")
                        print("1 - Opponent")
                        if #Player[y]["board"]>0 then
                        print("2 - Monsters")
                        end
                        
                        target = tonumber(io.read())
                        
                        if target == 1 then
                        Player[y]["life"] = Player[y]["life"] - attacker["power"]
                        print("Player"..y.."'s life is now: "..Player[y]["life"])
                        
                        elseif target == 2 and #Player[y]["board"]>0 then
                            printhandboardorgrave(Player[y]["board"])
                            print("Select a defender.")
                            num = tonumber(io.read())
                            defender = Player[y]["board"][num]
                            if num<=#Player[y]["board"] then
                            defender["resistance"] = defender["resistance"] - attacker["power"]
                            print(defender["name"].."'s resistance is now "..defender["resistance"])
                            if defender["resistance"]<=0 then
                                Player[y]["grave"][#Player[y]["grave"]+1] = defender -- problema
                                Player[y]["board"][num] = nil
                                print(defender["name"].." was destroyed as a result of battle. It was sent to the grave.")
                                print("Player"..y.."'s grave is now: ")
                                printhandboardorgrave(Player[y]["grave"])
                                
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
            print("Turn ends.")
            drawcard(Player[y])
            print("Player "..y.." draws a card")
            getgold(Player[y])
            print("Player "..y.." receives 1 gold")
            break 
            
        else 
            print("Select a valid option!")
        end
    
    end -- while t == 1 or t == 2 do
        
end -- function turn(t)
    
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

