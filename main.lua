carta1={"mago",25,21}
carta2={"demon",20,15}
carta3={"knight",10,20}
texto1="sua vez! Sua mão é:"
texto2="digite o número da carta."

print(texto1)
print(carta1[1],carta1[2],carta1[3])
print(carta2[1],carta2[2],carta2[3])
print(carta3[1],carta3[2],carta3[3])
print(texto2)

num = tonumber(io.read())
t={carta1,carta2,carta3}
print(t[num][1],t[num][2],t[num][3])
