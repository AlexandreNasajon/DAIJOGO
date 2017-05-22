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
    print(Jogador1.nome.." aumentou seu storm em 1.")
    Funcoes.printzona(Jogador2.mao)
    print("0 - Retornar")
    input = tonumber(io.read())
    if input == 0 then
            break
    else
        print("VOCÊ SÓ PODE RETORNAR!")
    end
end
}
        
return Cards
