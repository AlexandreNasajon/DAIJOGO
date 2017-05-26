local Jogador = require("Jogador")
local Funcoes = require("Funcoes")
local Cards = {}

Cards.Elfo = {
    nome = "Elfo",
    poder = 9,
    custo = 1,
    tipo = "Unidade",
    stamina = 1,
    descricao = "Quando invocado, adicione um card 'Remendar' ao seu deck.",
    efeito = {ifsummoned = function(Jogador1,Jogador2)
        Jogador1.deck[#Jogador1.deck+1] = Cards.Remendar
        Funcoes.shuffle2(Jogador1.deck)
        print("Um card 'Remendar' foi adicionado ao deck de "..Jogador1.nome..".")
    end
}
}
Cards.Anjo = {
    nome = "Anjo",
    poder = 18,
    custo = 2,
    tipo = "Unidade",
    stamina = 1,
    descricao = "Quando invocado, adicione três cards 'Remendar' ao seu deck.",
    efeito = {ifsummoned = function(Jogador1,Jogador2)
        Jogador1.deck[#Jogador1.deck+1] = Cards.Remendar
        Jogador1.deck[#Jogador1.deck+1] = Cards.Remendar
        Jogador1.deck[#Jogador1.deck+1] = Cards.Remendar
        Funcoes.shuffle2(Jogador1.deck)
        print("Três cards 'Remendar' foram adicionados ao deck de "..Jogador1.nome..".")
    end
}
}
Cards.Demonio = {
    nome = "Demonio",
    poder = 17,
    custo = 2,
    tipo = "Unidade",
    stamina = 1,
    descricao = "Quando invocado, compre dois cards e perca 20 de vida.",
    efeito = {ifsummoned = function(Jogador1,Jogador2)
        Funcoes.draw(Jogador1)
        Funcoes.draw(Jogador1)
        Funcoes.dano(Jogador1,20)
        print(Jogador1.nome.." comprou dois cards e perdeu 20 de vida.")
    end
}
}
Cards.RedAistocrat = {
    nome = "Red Arist.",
    poder = 1,
    custo = 1,
    tipo = "Unidade",
    stamina = 1,
    descricao = "Habilidade: sacrifique uma unidade para causar 15 de dano ao oponente.",
    efeito = {habilidade = function(Jogador1,Jogador2)
        print("Sacrifique uma unidade:")
        Funcoes.printzona(Jogador1.campo)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao <= #Jogador1.campo then
            Funcoes.destruir(Jogador1.campo[opcao],Jogador1,Jogador2)
            Funcoes.dano(Jogador2,15)
            print(Jogador1.campo[opcao][nome].." foi sacrificado.")
            print(Jogador2.nome.." recebeu 15 de dano.")
            Cards.RedAristocrat.stamina = Cards.RedAristocrat.stamina-1
        else
            print("Nenhuma unidade foi sacrificada, então nenhum dano foi causado.")
        end
    end
}
}
Cards.Healer = {
    nome = "Healer",
    poder = 12,
    custo = 1,
    tipo = "Unidade",
    stamina = 1,
    descricao = "Quando invocado, ganhe 14 de vida.",
    efeito = {ifsummoned = function(Jogador1,Jogador2)
        Funcoes.getlife(Jogador1,14)
        print(Jogador1.nome.." ganhou 14 de vida.")
    end
}
}
------------------------------------------------------------------------------------------------------------------NENHUMA CARTA ABAIXO DAQUI TÁ PRONTA------------------------------------------------------
Cards.Golem = {
    nome = "Golem",
    poder = 2,
    custo = 2,
    tipo = "Unidade",
    stamina = 1,
    zona = deck,
efeito = function(Jogador1,Jogador2)
    if Funcoes.ifsummoned(Cards.Golem,Jogador1,Jogador2) == true then
        Funcoes.getlife(Jogador1,2)
        print(Jogador1.nome.." ganhou 2 de vida.")
    end
    if Funcoes.ifdies(Cards.Golem,Jogador1,Jogador2) == true then
        Funcoes.draw(Jogador1)
        print(Jogador1.nome.." comprou um card.")
    end
end
}
Cards.Troll = {
    nome = "Troll",
    poder = 15,
    custo = 1,
    tipo = "Unidade",
    stamina = 1,
    zona = deck,
efeito = function(Jogador1,Jogador2)
    Funcoes.ifsummoned(Cards.Troll,Jogador1,Jogador2)
    if true then
        Funcoes.draw(Jogador1)
        Funcoes.dano(Jogador1,10)
        print(Jogador1.nome.." comprou um card e perdeu 10 de vida.")
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
    descricao = "Compre dois cards e você perde 20 de vida.",
efeito = function(Jogador1,Jogador2)
    Funcoes.draw(Jogador1)
    Funcoes.draw(Jogador1)
    Funcoes.dano(Jogador1,20)
    print(Jogador1.nome.." comprou dois cards e perdeu 20 de vida.")
end
}
Cards.Furia = {
    nome = "Fúria",
    poder = nil,
    custo = 0,
    tipo = "Suporte",
    stamina = nil,
    zona = deck,
    descricao = "Storm +1; Aumenta o poder de uma unidade em 3.",
efeito = function(Jogador1,Jogador2)
    Jogador1.storm = Jogador1.storm+1
    print(Jogador1.nome.." aumentou seu storm em 1.")
    print("Selecione uma unidade:")
    Funcoes.printzona(Jogador1.campo)
    local opcao = tonumber(io.read())
    if opcao <= #Jogador1.campo and opcao > 0 then
        local card = Jogador1.campo[opcao]
        card.poder = card.poder+3
        print(card.nome.." ganhou 3 de poder.")
    else
        print("SELECIONE UMA OPÇÃO VÁLIDA!")
    end
end
}
Cards.Stormear = {
    nome = "Stormear",
    poder = nil,
    custo = 0,
    tipo = "Suporte",
    stamina = nil,
    descricao = "Storm +2.",
efeito = function(Jogador1,Jogador2)
    Funcoes.storm(Jogador1,2)
    print(Jogador1.nome.." aumentou seu storm em 2.")
end
}
Cards.Remendar = {
    nome = "Remendar",
    poder = nil,
    custo = 0,
    tipo = "Suporte",
    stamina = nil,
    descricao = "Storm +1; Compre um card e ganhe 5 de vida.",
efeito = function(Jogador1,Jogador2)
    Jogador1.storm = Jogador1.storm+1
    print(Jogador1.nome.." aumentou seu storm em 1.")
    Funcoes.draw(Jogador1)
    Funcoes.getlife(Jogador1,5)
    print(Jogador1.nome.." comprou um card e ganhou 5 de vida.")
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
    descricao = "Storm +1; Causa 9 de dano ao oponente.",
efeito = function(Jogador1,Jogador2)
    Jogador1.storm = Jogador1.storm+1
    print(Jogador1.nome.." aumentou seu storm em 1.")
    Funcoes.dano(Jogador2,9)
    print(Jogador2.nome.." perdeu 9 de vida.")
end
}
Cards.Cooperar = {
    nome = "Cooperar",
    poder = nil,
    custo = 1,
    tipo = "Suporte",
    stamina = nil,
    descricao = "Storm +2; Cada jogador compra um card.",
efeito = function(Jogador1,Jogador2)
    Jogador1.storm = Jogador1.storm+1
    print(Jogador1.nome.." aumentou seu storm em 2.")
    Funcoes.draw(Jogador1)
    Funcoes.draw(Jogador2)
    print("Cada jogador comprou um card.")
end
}
Cards.Drenar = {
    nome = "Drenar",
    poder = nil,
    custo = 0,
    tipo = "Suporte",
    stamina = nil,
    zona = deck,
    descricao = "Storm +1; Ganhe 10 de vida e causa 10 de dano ao oponente.",
efeito = function(Jogador1,Jogador2)
    Jogador1.storm = Jogador1.storm+1
    print(Jogador1.nome.." aumentou seu storm em 1.")
    Funcoes.getlife(Jogador1,10)
    Funcoes.dano(Jogador2,10)
    print(Jogador1.nome.." ganhou 10 de vida e "..Jogador2.nome.." perdeu 10 de vida.")
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
Cards.Brainstorm = {
    nome = "Brainstorm",
    poder = nil,
    custo = 1,
    tipo = "Suporte",
    stamina = nil,
    descricao = "Compre X cards; X = storm.",
efeito = function(Jogador1,Jogador2)
    i = Jogador1.storm
    while i > 0 do
        Funcoes.draw(Jogador1)
        i = i-1
    end
    print(Jogador1.nome.." comprou "..Jogador1.storm.." cards.")
end    
}
Cards.Firestorm = {
    nome = "Firestorm",
    poder = nil,
    custo = 1,
    tipo = "Suporte",
    stamina = nil,
    descricao = "Causa 3X de dano ao oponente; X = storm.",
efeito = function(Jogador1,Jogador2)
    Funcoes.dano(Jogador2,3*Jogador1.storm)
    print(Jogador2.nome.." perdeu "..3*Jogador1.storm.." de vida.")
end
}
Cards.Espiar = {
    nome = "Espiar",
    poder = nil,
    custo = 0,
    tipo = "Suporte",
    stamina = nil,
    descricao = "Storm +1; Olhe a mão de seu oponente.",
efeito = function(Jogador1,Jogador2)
    Jogador1.storm = Jogador1.storm+1
    print(Jogador1.nome.." aumentou seu storm em 1.")
    Funcoes.printzona(Jogador2.mao)
    print("Digite qualquer coisa para retornar.")
    input = tonumber(io.read())
    if input then 
    end
end
}
Cards.Lembrar = {
    nome = "Lembrar",
    poder = nil,
    custo = 1,
    tipo = "Suporte",
    stamina = nil,
    zona = deck,
    descricao = "Adicione um card do seu cemitério à sua mão.",
efeito = function(Jogador1,Jogador2)
    local h = false
    while h == false do
       print("Selecione um card no seu cemitério:")
       Funcoes.printzona(Jogador1.cemiterio)
       local opcao = tonumber(io.read())
       if opcao ~= nil and opcao <= #Jogador1.cemiterio then
           Jogador1.mao[#Jogador1.mao+1] = Jogador1.cemiterio[opcao]
           Jogador1.cemiterio[opcao] = nil
           h = true
       else
           print("SELECIONE UMA OPÇÃO VÁLIDA! *__*")
       end
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
    local h = false
    while h == false do
        print("Selecione uma unidade no seu cemitério:")
        Funcoes.printzona(Jogador1.cemiterio)
        local opcao = tonumber(io.read())
        if Jogador1.cemiterio[opcao].tipo == "Unidade" then
            local card = Jogador1.cemiterio[opcao]
            Funcoes.invocar(card,Jogador1)
            print(card.nome.." foi invocado!")
            while opcao <= #Jogador1.cemiterio do
                Jogador1.cemiterio[opcao] = Jogador1.cemiterio[opcao+1]
                opcao = opcao+1
            end
            h = true
        else
                print("SELECIONE UMA OPÇÃO VÁLIDA!")
        end
    end
end
}        

return Cards
