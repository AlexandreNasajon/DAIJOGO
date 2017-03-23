
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
  {["type"] = "monster",["name"] = "Angel",["power"] = 25,["resistance"]=25}
}

deck = {card[1],card[2],card[3],card[4],card[5],card[6],card[7]}
hand = {deck[math.random(1,#card)],deck[math.random(1,#card)],deck[math.random(1,#card)]}
board = {}

while #hand>0 do

  print("Your hand is:")
  printhand(hand)
  print("Select a card.")

  num = tonumber(io.read())

  valid = num<=#hand and num>0
  if valid then
    printcard(hand[num])
    board[#board+1] = hand[num]
    hand[num] = nil
    
    n = num
    while n <= #hand do
      hand[n] = hand[n+1]
      n = n+1
    end
      
   
    print("The board is:")
    printboard(board)
  else 
    print("Select a valid card!")
  end
end
