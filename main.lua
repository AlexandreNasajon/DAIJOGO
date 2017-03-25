math.randomseed(os.time())

function printcard(c)
  print(">",c["type"],c["name"],c["power"],c["resistance"])
end
function printhand(h)
    i = 1
    while i <= #h do
        printcard(h[i])
  
        i = i+1
    end  
end
function printboard(b)
    m = 1
    while m <= #b do
        printcard(b[m])
   
        m = m+1
    end
end

card = {
  {["type"] = "monster",["name"] = "Demon",["power"] = 20,["resistance"]=20},
  {["type"] = "monster",["name"] = "Mage",["power"] = 15,["resistance"]=30},
  {["type"] = "monster",["name"] = "Knight",["power"] = 25,["resistance"]=15},
  {["type"] = "monster",["name"] = "Witch",["power"] = 30,["resistance"]=15},
  {["type"] = "monster",["name"] = "Wolf",["power"] = 15,["resistance"]=15},
  {["type"] = "monster",["name"] = "Tiger",["power"] = 20,["resistance"]=15},
  {["type"] = "monster",["name"] = "Angel",["power"] = 25,["resistance"]=25},
  {["type"] = "monster",["name"] = "Dragon",["power"] = 40,["resistance"]=20},
  {["type"] = "monster",["name"] = "Kraken",["power"] = 35,["resistance"]=30}
}

deck = {card[1],card[2],card[3],card[4],card[5],card[6],card[7],card[8],card[9]}
hand = {H1,H2}
hand[1] = {deck[math.random(1,#deck)],deck[math.random(1,#deck)],deck[math.random(1,#deck)]}
hand[2] = {deck[math.random(1,#deck)],deck[math.random(1,#deck)],deck[math.random(1,#deck)]}
board = {B1,B2}
grave = {G1,G2}
life = {L1,L2}
life[1] = 100
life[2] = 100
t = 1 --turno

while t == 1 do --turno do player 1
    while life[1]>0 do
        print("Player 1's turn")
        print("1 - Play card from hand")
        print("2 - Attack with monster")
        print("3 - End turn")
        
        action = tonumber(io.read())
        
        if action == 1 then
            while #hand[1]>0 do

                print("Your hand is:")
                printhand(hand[1])
                print("Select a card.")
        
                num = tonumber(io.read())

                valid = num<=#hand[1] and num>0
                if valid then
                    printcard(hand[1][num])
                    board[1][#board[1]+1] = hand[1][num]
                    hand[1][num] = nil
        
                        while num <= #hand[1] do
                            hand[1][num] = hand[1][num+1]
                            num = num+1
                        end
                else 
                print("Select a valid card!")        
                end
            end
                
        elseif action == 2 then
            print("Select attacker")
            printboard(board[1])
            attacker = board[1][tonumber(io.read())]
            
            valid = attacker<=#board[1]
            
            if valid then
                print("Select defender")
                printboard(board[2])
                defender = board[2][tonumber(io.read())]
                
                valid = defender<=#board[2]
                
                if valid then
                    defender["resistance"] = defender["resistance"] - attacker["power"]
                    
                    if defender["resistance"] <=0 then
                        grave[2][#grave[2]] = defender                
                    end
                    
                else 
                    print("Select a valid defender!")
                end
                
            else
                print("Select a valid attacker!")
            end
            
        elseif action == 3 then
            t = 2 --faz o turno ir pro player 2
        end
            
        end
        else
                print("Select a valid action!")
        end
    end
end

while t == 2 do --turno do player 2
    while life[2]>0 do
        print("Player 2's turn")
        print("1 - Play card from hand")
        print("2 - Attack with monster")
        print("3 - End turn")
        
        action = tonumber(io.read())
        
        if action == 1 then
            while #hand[2]>0 do

                print("Your hand is:")
                printhand(hand[2])
                print("Select a card.")
        
                num = tonumber(io.read())

                valid = num<=#hand[2] and num>0
                if valid then
                    printcard(hand[2][num])
                    board[2][#board[2]+1] = hand[2][num]
                    hand[2][num] = nil
        
                        while num <= #hand[2] do
                            hand[2][num] = hand[2][num+1]
                            num = num+1
                        end
                else 
                print("Select a valid card!")        
                end
            end
                
        elseif action == 2 then
            print("Select attacker")
            printboard(board[2])
            attacker = board[2][tonumber(io.read())]
            
            valid = attacker<=#board[2]
            
            if valid then
                print("Select defender")
                printboard(board[1])
                defender = board[1][tonumber(io.read())]
                
                valid = defender<=#board[1]
                
                if valid then
                    defender["resistance"] = defender["resistance"] - attacker["power"]
                    
                    if defender["resistance"] <=0 then
                        grave[1][#grave[1]] = defender                
                    end
                    
                else 
                    print("Select a valid defender!")
                end
                
            else
                print("Select a valid attacker!")
            end
            
        elseif action == 3 then
            t = 1 --faz o turno ir pro player 1
        end
            
        else
                print("Select a valid action!")
        end
    end
end
