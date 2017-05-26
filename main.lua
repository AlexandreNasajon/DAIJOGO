math.randomseed(os.time())
local Funcoes = require("Funcoes")
local Jogador = require("Jogador")
local Cards = require("Cards")
Jogador[1].pool = {Cards.Elfo,Cards.Elfo,Cards.Elfo,Cards.Elfo,Cards.Elfo,Cards.Elfo,Cards.Elfo,Cards.Elfo,
    Cards.Stormear,Cards.Stormear,Cards.Stormear,
    Cards.Ganancia,Cards.Ganancia,Cards.Ganancia,
    Cards.Bolt,Cards.Bolt,Cards.Bolt,
    Cards.Cooperar,Cards.Cooperar,Cards.Cooperar,
    Cards.Pote,Cards.Pote,Cards.Pote,
    Cards.Brainstorm,
    Cards.Firestorm
}

Jogador[2].pool = {Cards.Troll,Cards.Troll,Cards.Troll,Cards.Furia,Cards.Furia,Cards.Furia}


tempcard = {}

Jogador[1].deck = {}
Jogador[2].deck = {}

for k,v in pairs(Jogador[1].pool) do
    tempcard = Funcoes.copiar(v,tempcard)
    Jogador[1].deck[#Jogador[1].deck+1] = tempcard
    tempcard = {}
end


for k,v in pairs(Jogador[2].pool) do
    tempcard = Funcoes.copiar(v,tempcard)
    Jogador[2].deck[#Jogador[2].deck+1] = tempcard
    tempcard = {}
end


Funcoes.jogo()
