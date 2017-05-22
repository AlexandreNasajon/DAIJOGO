local Funcoes = require("Funcoes")
local Cards = {}

Cards.Soldado = {
    nome = "Soldado",
    poder = 2,
    custo = 1,
    tipo = "Unidade",
    stamina = 1
}
Cards.Milicia = {
    nome = "Milícia",
    poder = 1,
    custo = 0,
    tipo = "Unidade",
    stamina = 1
}
Cards.Elfo = {
    nome = "Elfo",
    poder = 1,
    custo = 1,
    tipo = "Unidade",
    stamina = 1
}
Cards.Espiar = {
    nome = "Espiar",
    poder = nil,
    custo = 0,
    tipo = "Suporte",
    stamina = nil,
    descricao = "Storm; Olhe a mão de seu oponente.",
efeito = function(Cards.Espiar,Jogador1,Jogador2)
    Jogador1.storm = Jogador1.storm+1
    Funcoes.printzona(Jogador2.mao)
end
}
        
return Cards
