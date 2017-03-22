--ignora-----
math.randomseed(os.time())
-------------
function printcarta(carta)
  print(carta["name"],carta["atq"],carta["def"])
end
function printmao(hand)
  i = 1
  while i <= #hand do
    printcarta(hand[i])
  
    i = i+1
  end  
end
card = {
  {["name"] = "mago",["atq"]=25,["def"]=21},
  {["name"] = "demon",["atq"]=20,["def"]=15},
  {["name"] = "knight",["atq"]=10,["def"]=20},
  {["name"] = "Witch",["atq"]=5,["def"]=30},
  {["name"] = "Wolf",["atq"]=10,["def"]=15}
}

deck = {card[1],card[2],card[3],card[4],card[5]}
mao = {deck[math.random(1,5)],deck[math.random(1,5)],deck[math.random(1,5)]}

--numerocartasmao = 3
texto1="sua vez! Sua mão é:"
texto2="digite o número da carta."
--numrand = math.random(1,5)

while #mao>0 do
  print(texto1)
  printmao(mao)
  print(texto2)

  num = tonumber(io.read())

  valido = num<=3 and num>0
  if valido then
    printcarta(mao[num])
    mao[num]=nil
    
    n = num
    while n <= #mao do
      mao[n] = mao[n+1]
      n = n+1
    end
      
    print("Sua nova mao eh:")
    printmao(mao)
  else 
    print("Este numero nao eh valido!")
  end
end
