math.randomseed(os.time())
local Funcoes = require("Funcoes")
local Jogador = require("Jogador")
local Cards = require("Cards")
Jogador[1].deck = {Cards.Soldado,Cards.Milicia}
Jogador[2].deck = {Cards.Soldado,Cards.Milicia}
Funcoes.jogo()
