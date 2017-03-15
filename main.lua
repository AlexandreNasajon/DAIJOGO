--ignora-----
math.randomseed(os.time())
-------------

card = {
  {["name"] = "mago",["atq"]=25,["def"]=21},
  {["name"] = "demon",["atq"]=20,["def"]=15},
  {["name"] = "knight",["atq"]=10,["def"]=20},
  {["name"] = "Witch",["atq"]=5,["def"]=30},
  {["name"] = "Wolf",["atq"]=10,["def"]=15}
}

deck = {card[1],card[2],card[3],card[4],card[5]}

--numerocartasmao = 3
texto1="sua vez! Sua mão é:"
texto2="digite o número da carta."
--numrand = math.random(1,5)
mao = {deck[math.random(1,5)],deck[math.random(1,5)],deck[math.random(1,5)]}
print(texto1)
print(mao[1]["name"],mao[1]["atq"],mao[1]["def"])
print(mao[2]["name"],mao[2]["atq"],mao[2]["def"])
print(mao[3]["name"],mao[3]["atq"],mao[3]["def"])
print(texto2)

num = tonumber(io.read())

t={}
valido = num<=3 and num>0
if valido then
  print(t[num][1],t[num][2],t[num][3])
else 
  print("Este numero nao eh valido!")
end
