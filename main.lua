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
hand1 = {deck[math.random(1,#deck)],deck[math.random(1,#deck)],deck[math.random(1,#deck)]}
hand2 = {deck[math.random(1,#deck)],deck[math.random(1,#deck)],deck[math.random(1,#deck)]}
board1 = {}
board2= {}
grave1 = {}
grave2 = {}
life1 = 100
life2 = 100
t = 1 -- turno

while life1>0 do
    print("Player 1's turn")
    print("1 - Play card from hand")
    print("2 - Attack with monster")
    
    action = tonumber(io.read())
    
    if action == 1 then
        while #hand1>0 do

            print("Your hand is:")
            printhand(hand1)
            print("Select a card.")
    
            num = tonumber(io.read())

            valid = num<=#hand1 and num>0
            if valid then
                printcard(hand1[num])
                board1[#board1+1] = hand1[num]
                hand1[num] = nil
    
                    while num <= #hand1 do
                        hand1[num] = hand1[num+1]
                        num = num+1
                    end
            else 
            print("Select a valid card!")        
            
        end
    end
        
    if action == 2 then
        printboard(board)
        print("Select attacker")
        attacker = tonumber(io.read())
        
        valid = attacker<=#board
        
        if valid then
            print("Select defender")
            printboard(board2)
        
        else
        print("Select a valid action!")

end
