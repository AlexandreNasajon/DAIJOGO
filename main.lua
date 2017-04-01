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
        print("1 - Hand")
        print("2 - Board")
        print("3 - Grave")
        print("4 - Abilities")
        print("5 - End turn")
        
        option = tonumber(io.read())
        
        while option == 1 do
            printhandboardorgrave(Player[t]["hand"])
            print("1 - View card")
            print("2 - Play card")
            print("3 - Return")
            
            option1 = tonumber(io.read())
            
            while option1 == 1 do
                
            while option1 == 2 do
                
            while option1 == 3 do
                break
                
            else
                print("Select a valid option!")
            end
            
        while option == 2 do
            print("1 - Your board")
            print("2 - Opponent's board")
            print("3 - Return")
            
            option2 = tonumber(io.read())
            
            while option2 == 1 do
                print("Your board:")
                printhandboardorgrave(Player[t]["board"])
                print("1 - View card")
                print("2 - Play card")
                print("3 - Return")
            
            while option2 == 2 do
                print("Opponent's board:")
                printhandboardorgrave(Player[y]["board"])
                print("1 - View card")
                print("2 - Return")
                
            while option2 == 3 do
                break
                
            else
                print("Select a valid option!")
            end
            
            
            
        while option == 3 do
            print("1 - Your grave")
            print("2 - Opponent's grave")
            print("3 - Return")
            
            option3 = tonumber(io.read())
            
        while option == 4 do
            print("1 - Your abilities")
            print("2 - Opponent's abilities")
            print("3 - Return")
            
        while option == 5 do
            print("Turn ends.")
            drawcard(Player[y])
            print("Player "..y.." draws a card")
            getgold(Player[y])
            print("Player "..y.." receives 1 gold")
            break -- eu sou um gênio
            
        else
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
