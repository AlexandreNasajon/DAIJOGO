math.randomseed(os.time())
local Funcoes = require("Funcoes")
local Jogador = require("Jogador")
local Cards = require("Cards")

local cardtemp = {}

Jogador[1].pool = {Cards.Elfo,Cards.Elfo}
Jogador[1].deck = {}
for k,v in pairs(Jogador[1].pool) do
  cardtemp = Funcoes.copiar(v,cardtemp)
  Jogador[1].deck[#Jogador[1].deck+1] = cardtemp
end

Jogador[2].deck = {Cards.Soldado,Cards.Milicia}
Funcoes.jogo()
