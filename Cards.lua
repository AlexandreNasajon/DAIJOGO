local Jogador = require("Jogador")
local Funcoes = require("Funcoes")
local Cards = {}

Cards.Soldado = {
    nome = "Soldado",
    poder = 2,
    custo = 1,
    tipo = "Unidade",
    stamina = 1,
    zona = deck
}
Cards.Milicia = {
    nome = "Milícia",
    poder = 1,
    custo = 0,
    tipo = "Unidade",
    stamina = 1,
    zona = deck
}
Cards.Elfo = {
    nome = "Elfo",
    poder = 1,
    custo = 1,
    tipo = "Unidade",
    stamina = 1,
    zona = deck,
efeito = function(Jogador1,Jogador2)
    Funcoes.ifsummoned(Cards.Elfo,Jogador1)
    if true then
        Jogador1.deck[#Jogador1.deck+1] = Cards.Remendar
        print("O card Remendar foi adicionado ao deck de "..Jogador1.nome..".")
    end
end    
}
Cards.Healer = {
    nome = "Healer",
    poder = 1,
    custo = 1,
    tipo = "Unidade",
    stamina = 1,
    zona = deck,
efeito = function(Jogador1,Jogador2)
    Funcoes.ifsummoned(Cards.Healer,Jogador1)
    if true then
        Funcoes.getlife(Jogador1,2)
        print(Jogador1.nome.." ganhou 2 de vida.")
    end
end
}
Cards.Golem = {
    nome = "Golem",
    poder = 1,
    custo = 2,
    tipo = "Unidade",
    stamina = 1,
    zona = deck,
efeito = function(Jogador1,Jogador2)
    Funcoes.ifsummoned(Cards.Golem,Jogador1)
    if true then
        Funcoes.getlife(Jogador1,2)
        print(Jogador1.nome.." ganhou 2 de vida.")
    end
    Funcoes.ifdies(Cards.Golem,Jogador1)
    if true then
        Funcoes.draw(Jogador1)
    end
end
}
Cards.Troll = {
    nome = "Troll",
    poder = 2,
    custo = 1,
    tipo = "Unidade",
    stamina = 1,
    zona = deck,
efeito = function(Jogador1,Jogador2)
    Funcoes.ifsummoned(Cards.Troll,Jogador1,Jogador2)
    if true then
        Funcoes.draw(Jogador1)
        Funcoes.dano(Jogador1,1)
        print(Jogador1.nome.." comprou um card e perdeu 1 de vida.")
    end
end    
}
Cards.Impulso= {
    nome = "Impulso",
    poder = nil,
    custo = 0,
    tipo = "Suporte",
    stamina = nil,
    zona = deck,
    descricao = "Compre dois cards e você perde 2 de vida.",
efeito = function(Jogador1,Jogador2)
    Funcoes.draw(Jogador1)
    Funcoes.draw(Jogador1)
    Funcoes.dano(Jogador1,2)
end
}
Cards.Furia = {
    nome = "Fúria",
    poder = nil,
    custo = 0,
    tipo = "Suporte",
    stamina = nil,
    zona = deck,
    descricao = "Aumenta o poder de uma unidade em 1.",
efeito = function(Jogador1,Jogador2)
    print("Selecione uma unidade:")
    Funcoes.printzona(Jogador1.campo)
    local opcao = tonumber(io.read())
    if opcao <= #Jogador1.campo then
        local card = Jogador1.campo[opcao]
        card.poder = card.poder+1
        print(card.nome.." ganhou 1 de poder.")
    else
        print("SELECIONE UMA OPÇÃO VÁLIDA!")
    end
end
}
Cards.Remendar = {
    nome = "Remendar",
    poder = nil,
    custo = 0,
    tipo = "Suporte",
    stamina = nil,
    descricao = "Compre um card e ganha 1 de vida.",
efeito = function(Jogador1,Jogador2)
    Funcoes.draw(Jogador1)
    Funcoes.getlife(Jogador1,1)
    print(Jogador1.nome.." comprou um card e ganhou 1 de vida.")
end
}
Cards.Ganancia = {
    nome = "Ganância",
    poder = nil,
    custo = 0,
    tipo = "Suporte",
    stamina = nil,
    descricao = "Receba 1 de ouro.",
efeito = function(Jogador1,Jogador2)
    Funcoes.getgold(Jogador1)
    print(Jogador1.nome.." recebeu 1 de ouro.")
end
}
Cards.Bolt = {
    nome = "Bolt",
    poder = nil,
    custo = 0,
    tipo = "Suporte",
    stamina = nil,
    descricao = "Causa 2 de dano ao oponente.",
efeito = function(Jogador1,Jogador2)
    Funcoes.dano(Jogador2,2)
    print(Jogador2.nome.." perdeu 2 de vida.")
end
}
Cards.Cooperar = {
    nome = "Cooperar",
    poder = nil,
    custo = 1,
    tipo = "Suporte",
    stamina = nil,
    descricao = "Cada jogador compra um card e você ganha 2 de vida.",
efeito = function(Jogador1,Jogador2)
    Funcoes.draw(Jogador1)
    Funcoes.draw(Jogador2)
    Funcoes.getlife(Jogador1,2)
end
}
Cards.Drenar = {
    nome = "Drenar",
    poder = nil,
    custo = 0,
    tipo = "Suporte",
    stamina = nil,
    zona = deck,
    descricao = "Ganhe 1 de vida e causa 1 de dano ao oponente.",
efeito = function(Jogador1,Jogador2)
    Funcoes.getlife(Jogador1,1)
    Funcoes.dano(Jogador2,1)
end
}
Cards.Pote = {
    nome = "Pote",
    poder = nil,
    custo = 1,
    tipo = "Suporte",
    stamina = nil,
    zona = deck,
    descricao = "Compre dois cards.",
efeito = function(Jogador1,Jogador2)
    Funcoes.draw(Jogador1)
    Funcoes.draw(Jogador1)
    print(Jogador1.nome.." comprou dois cards.")
end
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
Cards.Reviver = {
    nome = "Reviver",
    poder = nil,
    custo = 1,
    tipo = "Suporte",
    stamina = nil,
    zona = deck,
    descricao = "Invoque uma unidade de seu cemitério.",
efeito = function(Jogador1,Jogador2)
    local aconteceu = false
    while aconteceu == false do
        print("Selecione uma unidade no seu cemitério:")
        print("0 - Retornar")
        Funcoes.printzona(Jogador1.cemiterio)
        local opcao = tonumber(io.read())
        if Jogador1.cemiterio[opcao].tipo == "Unidade" then -- erro
            local card = Jogador1.cemiterio[opcao]
            Funcoes.invocar(card,Jogador1)
            print(card.nome.." foi invocado!")
            aconteceu = true
        elseif opcao == 0 then
            Funcoes.getgold(Jogador1)
            Funcoes.getgold(Jogador1)
            break
        else
                print("SELECIONE UMA OPÇÃO VÁLIDA!")
        end
    end
end
}        

return Cards
