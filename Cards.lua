local Jogador = require("Jogador")
local Funcoes = require("Funcoes")
local Cards = {}

Cards.AlmaGuia = {
    nome = "ALma Guia ",
    poder = 11,
    custo = 1,
    tipo = "Unidade",
    stamina = 1,
    descricao = "Quando destruído, procure em seu deck por um card de unidade com poder menor ou igual a 10 e adicione-o à sua mão, depois seu deck é embaralhado.",
    efeito = {ifdies = function(Jogador1,Jogador2)
    local h = false
        while h == false do
            print("Selecione uma unidade com poder menor ou igual a 10:")
            print("0 - Nenhuma")
            Funcoes.printzona(Jogador1.deck)
            local opcao = tonumber(io.read())
            if opcao ~= nil and opcao == 0 then
                h = true
            elseif opcao ~= nil and opcao <= #Jogador1.deck and Jogador1.deck[opcao].tipo == "Unidade" and Jogador1.deck[opcao].poder < 11 then
                Jogador1.mao[#Jogador1.mao+1] = Jogador1.deck[opcao]
                while opcao <= #Jogador1.deck do
                    Jogador1.deck[opcao] = Jogador1.deck[opcao+1]
                    opcao = opcao+1
                end
                h = true
            else
                print("SELECIONE UMA OPÇÃO VÁLIDA!")
            end
        end
        Funcoes.shuffle2(Jogador1.deck)
    end
}
}
Cards.Recrutador = {
    nome = "Recrutador",
    poder = 12,
    custo = 2,
    tipo = "Unidade",
    stamina = 1,
    descricao = "Quando invocado, procure em seu deck por um card de unidade com custo menor ou igual a 1 e adicione-o à sua mão, depois seu deck é embaralhado.",
    efeito = {ifsummoned = function(Jogador1,Jogador2)
    local h = false
        while h == false do
            print("Selecione uma unidade com custo menor ou igual a 1:")
            print("0 - Nenhuma")
            Funcoes.printzona(Jogador1.deck)
            local opcao = tonumber(io.read())
            if opcao ~= nil and opcao == 0 then
                h = true
            elseif opcao ~= nil and opcao <= #Jogador1.deck and Jogador1.deck[opcao].tipo == "Unidade" and Jogador1.deck[opcao].custo < 2 then
                Jogador1.mao[#Jogador1.mao+1] = Jogador1.deck[opcao]
                while opcao <= #Jogador1.deck do
                    Jogador1.deck[opcao] = Jogador1.deck[opcao+1]
                    opcao = opcao+1
                end
                h = true
            else
                print("SELECIONE UMA OPÇÃO VÁLIDA!")
            end
        end
        Funcoes.shuffle2(Jogador1.deck)
    end
}
}
Cards.Dragao = {
    nome = "Dragão    ",
    poder = 25,
    custo = 3,
    tipo = "Unidade",
    stamina = 1,
    descricao = "Quando invocado, sacrifique uma unidade.",
    efeito = {ifsummoned = function(Jogador1,Jogador2)
        local h = false
        while h == false do
            print("Sacrifique uma unidade:")
            Funcoes.printzona(Jogador1.campo)
            local opcao = tonumber(io.read())
            if opcao ~= nil and opcao <= #Jogador1.campo then
                Funcoes.destruir(Jogador1.campo[opcao],Jogador1,Jogador2)
                h = true
            else
                print("VOCÊ DEVE SACRIFICAR UMA UNIDADE!")
            end
        end
    end
}
}
Cards.Elfo = {
    nome = "Elfo      ",
    poder = 9,
    custo = 1,
    tipo = "Unidade",
    stamina = 1,
    descricao = "Quando invocado, adicione três cards 'Remendar' ao seu deck.",
    efeito = {ifsummoned = function(Jogador1,Jogador2)
        tempcard = {}
        tempcard = Funcoes.copiar(Cards.Remendar,tempcard)
        Jogador1.deck[#Jogador1.deck+1] = tempcard
        Jogador1.deck[#Jogador1.deck+1] = tempcard
        Jogador1.deck[#Jogador1.deck+1] = tempcard
        tempcard = {}
        Funcoes.shuffle2(Jogador1.deck)
        print("Três cards 'Remendar' foram adicionados ao deck de "..Jogador1.nome..".")
    end
}
}
Cards.Anjo = {
    nome = "Anjo      ",
    poder = 14,
    custo = 2,
    tipo = "Unidade",
    stamina = 1,
    descricao = "Quando invocado, adicione sete cards 'Remendar' ao seu deck.",
    efeito = {ifsummoned = function(Jogador1,Jogador2)
        tempcard = {}
        tempcard = Funcoes.copiar(Cards.Remendar,tempcard)
        Jogador1.deck[#Jogador1.deck+1] = tempcard
        Jogador1.deck[#Jogador1.deck+1] = tempcard
        Jogador1.deck[#Jogador1.deck+1] = tempcard
        Jogador1.deck[#Jogador1.deck+1] = tempcard
        Jogador1.deck[#Jogador1.deck+1] = tempcard
        Jogador1.deck[#Jogador1.deck+1] = tempcard
        Jogador1.deck[#Jogador1.deck+1] = tempcard
        tempcard = {}
        Funcoes.shuffle2(Jogador1.deck)
        print("Sete cards 'Remendar' foram adicionados ao deck de "..Jogador1.nome..".")
    end
}
}
Cards.Coveiro = {
    nome = "Coveiro   ",
    poder = 10,
    custo = 1,
    tipo = "Unidade",
    stamina = 1,
    descricao = "Quando invocado, adicione até uma unidade do seu cemitério à sua mão.",
    efeito = {ifsummoned = function(Jogador1,Jogador2)
    h = false
    while h == false do
        print("Adicione até uma unidade do seu cemitério à sua mão:")
        print("0 - Nenhuma")
            Funcoes.printzona(Jogador1.cemiterio)
            opcao = tonumber(io.read())
            if opcao ~= nil and opcao == 0 then
                h = true
            elseif opcao ~= nil and opcao <= #Jogador1.cemiterio and opcao > 0 and Jogador1.cemiterio[opcao].tipo == "Unidade" then
                Jogador1.mao[#Jogador1.mao+1] = Jogador1.cemiterio[opcao]
                while opcao <= #Jogador1.cemiterio do
                    Jogador1.cemiterio[opcao] = Jogador1.cemiterio[opcao+1]
                    opcao = opcao+1
                end
                h = true
            else
                print("Nenhuma unidade foi adicionada à sua mão.")
                h = true
            end
    end
    end
}
}
Cards.Arqueologo = {
    nome = "Arqueólogo",
    poder = 7,
    custo = 1,
    tipo = "Unidade",
    stamina = 1,
    descricao = "Quando invocado, adicione até um suporte do seu cemitério à sua mão.",
    efeito = {ifsummoned = function(Jogador1,Jogador2)
    h = false
    while h == false do
        print("Adicione até um suporte do seu cemitério à sua mão:")
        print("0 - Nenhum")
            Funcoes.printzona(Jogador1.cemiterio)
            opcao = tonumber(io.read())
            if opcao ~= nil and opcao == 0 then
                h = true
            elseif opcao ~= nil and opcao <= #Jogador1.cemiterio and opcao > 0 and Jogador1.cemiterio[opcao].tipo == "Suporte" then
                Jogador1.mao[#Jogador1.mao+1] = Jogador1.cemiterio[opcao]
                while opcao <= #Jogador1.cemiterio do
                    Jogador1.cemiterio[opcao] = Jogador1.cemiterio[opcao+1]
                    opcao = opcao+1
                end
                h = true
            else
                print("Nenhum suporte foi adicionada à sua mão.")
                h = true
            end
    end
    end
}
}
Cards.StormTitan = {
    nome = "Storm Titan",
    poder = 17,
    custo = 3,
    tipo = "Unidade",
    stamina = 1,
    descricao = "Quando invocado, adicione os cards 'Brainstorm', 'Firestorm' e 'Lifestorm' à sua mão.",
    efeito = {ifsummoned = function(Jogador1,Jogador2)
        tempcard = {}
        tempcard = Funcoes.copiar(Cards.Brainstorm,tempcard)
        Jogador1.mao[#Jogador1.mao+1] = tempcard
        tempcard = {}
        tempcard = Funcoes.copiar(Cards.Firestorm,tempcard)
        Jogador1.mao[#Jogador1.mao+1] = tempcard
        tempcard = {}
        tempcard = Funcoes.copiar(Cards.Lifestorm,tempcard)
        Jogador1.mao[#Jogador1.mao+1] = tempcard
        tempcard = {}
        print("Os cards 'Brainstorm','Firestorm' e 'Lifestorm' foram adicionados à mão de "..Jogador1.nome..".")
    end
}
}
Cards.Stormdude = {
    nome = "Stormdude ",
    poder = 11,
    custo = 1,
    tipo = "Unidade",
    stamina = 1,
    descricao = "Quando invocado, Storm +2.",
    efeito = {ifsummoned = function(Jogador1,Jogador2)
        Funcoes.storm(Jogador1,2)
    end
}
}
Cards.Vampiro = {
    nome = "Vampiro   ",
    poder = 13,
    custo = 1,
    tipo = "Unidade",
    stamina = 1,
    descricao = "Quando invocado, ganhe 13 de vida e seu oponente perde 13 de vida.",
    efeito = {ifsummoned = function(Jogador1,Jogador2)
        Funcoes.getlife(Jogador1,13)
        Funcoes.dano(Jogador2,13)
    print(Jogador1.nome.." ganhou 13 de vida e "..Jogador2.nome.." perdeu 13 de vida.")
    end
}
}
Cards.Demonio = {
    nome = "Demonio   ",
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
Cards.RedAristocrat = {
    nome = "Red Arist.",
    poder = 11,
    custo = 1,
    tipo = "Unidade",
    stamina = 1,
    descricao = "Habilidade: sacrifique uma unidade para causar 15 de dano ao oponente.",
    efeito = {habilidade = function(Jogador1,Jogador2)
        print("Sacrifique uma unidade:")
        Funcoes.printzona(Jogador1.campo)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao <= #Jogador1.campo and opcao > 0  then
            Funcoes.destruir(Jogador1.campo[opcao],Jogador1,Jogador2)
            Funcoes.dano(Jogador2,15)
            print(Jogador2.nome.." recebeu 15 de dano.")
        else
            print("Nenhuma unidade foi sacrificada, então nada aconteceu.")
        end
    end
}
}
Cards.BlueAristocrat = {
    nome = "Blue Arist.",
    poder = 11,
    custo = 1,
    tipo = "Unidade",
    stamina = 1,
    descricao = "Habilidade: sacrifique uma unidade para comprar um card.",
    efeito = {habilidade = function(Jogador1,Jogador2)
        print("Sacrifique uma unidade:")
        Funcoes.printzona(Jogador1.campo)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao <= #Jogador1.campo and opcao > 0  then
            Funcoes.destruir(Jogador1.campo[opcao],Jogador1,Jogador2)
            Funcoes.draw(Jogador1)
            print(Jogador1.nome.." comprou um card.")
        else
            print("Nenhuma unidade foi sacrificada, então nada aconteceu.")
        end
    end
}
}
Cards.YellowAristocrat = {
    nome = "Yellow Arist.",
    poder = 11,
    custo = 1,
    tipo = "Unidade",
    stamina = 1,
    descricao = "Habilidade: sacrifique uma unidade para receber 1 de ouro.",
    efeito = {habilidade = function(Jogador1,Jogador2)
        print("Sacrifique uma unidade:")
        Funcoes.printzona(Jogador1.campo)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao <= #Jogador1.campo and opcao > 0 then
            Funcoes.destruir(Jogador1.campo[opcao],Jogador1,Jogador2)
            Funcoes.getgold(Jogador1)
            print(Jogador1.nome.." recebeu 1 de ouro")
        else
            print("Nenhuma unidade foi sacrificada, então nada aconteceu.")
        end
    end
}
}
Cards.GreenAristocrat = {
    nome = "Green Arist.",
    poder = 11,
    custo = 1,
    tipo = "Unidade",
    stamina = 1,
    descricao = "Habilidade: sacrifique uma unidade para ganhar 15 de vida.",
    efeito = {habilidade = function(Jogador1,Jogador2)
        print("Sacrifique uma unidade:")
        Funcoes.printzona(Jogador1.campo)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao <= #Jogador1.campo and opcao > 0  then
            Funcoes.destruir(Jogador1.campo[opcao],Jogador1,Jogador2)
            Funcoes.getlife(Jogador1,15)
            print(Jogador1.nome.." ganhou 15 de vida.")
        else
            print("Nenhuma unidade foi sacrificada, então nada aconteceu.")
        end
    end
}
}
Cards.Gnome = {
    nome = "Gnome     ",
    poder = 4,
    custo = 1,
    tipo = "Unidade",
    stamina = 1,
    descricao = "Quando destruído, compre dois cards.",
    efeito = {ifdies = function(Jogador1,Jogador2)
        Funcoes.draw(Jogador1)
        Funcoes.draw(Jogador1)
        print(Jogador1.nome.." comprou dois cards.")
    end
}
}
Cards.Dwarf = {
    nome = "Dwarf     ",
    poder = 6,
    custo = 1,
    tipo = "Unidade",
    stamina = 1,
    descricao = "Quando destruído, receba 2 de ouro.",
    efeito = {ifdies = function(Jogador1,Jogador2)
        Funcoes.getgold(Jogador1)
        Funcoes.getgold(Jogador1)
        print(Jogador1.nome.." recebeu 2 de ouro.")
    end
}
}
Cards.Mago = {
    nome = "Mago      ",
    poder = 9,
    custo = 1,
    tipo = "Unidade",
    stamina = 1,
    descricao = "Habilidade: compre um card e depois descarte um card.",
    efeito = {habilidade = function(Jogador1,Jogador2)
        Funcoes.draw(Jogador1)
        print(Jogador1.nome.." comprou um card.")
        Funcoes.discard(Jogador1)
        print(Jogador1.nome.." descartou um card.")
    end
}
}
Cards.Serpente = {
    nome = "Serpente  ",
    poder = 5,
    custo = 1,
    tipo = "Unidade",
    stamina = 1,
    descricao = "Se este card for descartado da sua mão, você pode pagar 7 de vida para devolvê-lo à sua mão.",
    efeito = {ifdiscarded = function(Jogador1,Jogador2)
        print("Pagar 7 de vida para devolver Serpente à sua mão?")
        print("1 - Sim")
        print("2 - Não")
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 1 then
            tempcard = {}
            Funcoes.copiar(Cards.Serpente,tempcard)
            Jogador1.mao[#Jogador1.mao+1] = tempcard
            tempcard = {}
            print(Jogador1.nome.." perdeu 7 de vida e Serpente voltou para a mão de "..Jogador1.nome..".")
        else
            print("Serpente não foi devolvida para a mão.")
        end
    end
}
}
Cards.Healer = {
    nome = "Healer    ",
    poder = 14,
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
Cards.Golem = {
    nome = "Golem     ",
    poder = 16,
    custo = 2,
    tipo = "Unidade",
    stamina = 1,
    descricao = "Quando invocado, ganhe 10 de vida. Quando destruído, compre um card.",
efeito = {ifsummoned = function(Jogador1,Jogador2)
        Funcoes.getlife(Jogador1,2)
        print(Jogador1.nome.." ganhou 2 de vida.")
    end,
    ifdies = function(Jogador1,Jogador2)
        Funcoes.draw(Jogador1)
        print(Jogador1.nome.." comprou um card.")
    end
}
}
Cards.Troll = {
    nome = "Troll     ",
    poder = 11,
    custo = 1,
    tipo = "Unidade",
    stamina = 1,
    descricao = "Quando invocado, compre um card e perca 10 de vida.",
efeito = {ifsummoned = function(Jogador1,Jogador2)
        Funcoes.draw(Jogador1)
        Funcoes.dano(Jogador1,10)
        print(Jogador1.nome.." comprou um card e perdeu 10 de vida.")
    end  
}
}
Cards.Impulso= {
    nome = "Impulso   ",
    poder = nil,
    custo = 0,
    tipo = "Suporte",
    stamina = nil,
    descricao = "Compre dois cards e você perde 20 de vida.",
efeito = function(Jogador1,Jogador2)
    Funcoes.draw(Jogador1)
    Funcoes.draw(Jogador1)
    Funcoes.dano(Jogador1,20)
    print(Jogador1.nome.." comprou dois cards e perdeu 20 de vida.")
end
}
Cards.Furia = {
    nome = "Fúria     ",
    poder = nil,
    custo = 0,
    tipo = "Suporte",
    stamina = nil,
    descricao = "Storm +1; Uma unidade ganha 3 de poder.",
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
Cards.Investida = {
    nome = "Investida ",
    poder = nil,
    custo = 0,
    tipo = "Suporte",
    stamina = nil,
    descricao = "Storm +1; Uma unidade recebe energia adicional para atacar ou ativar uma habilidade neste turno.",
efeito = function(Jogador1,Jogador2)
    Jogador1.storm = Jogador1.storm+1
    print(Jogador1.nome.." aumentou seu storm em 1.")
    print("Selecione uma unidade:")
    Funcoes.printzona(Jogador1.campo)
    local opcao = tonumber(io.read())
    if opcao <= #Jogador1.campo and opcao > 0 then
        local card = Jogador1.campo[opcao]
        card.stamina = card.stamina+1
        print(card.nome.." recebeu energia adicional.")
    else
        print("SELECIONE UMA OPÇÃO VÁLIDA!")
    end
end
}
Cards.Stormear = {
    nome = "Stormear  ",
    poder = nil,
    custo = 0,
    tipo = "Suporte",
    stamina = nil,
    descricao = "Storm +3.",
efeito = function(Jogador1,Jogador2)
    Funcoes.storm(Jogador1,3)
end
}
Cards.Remendar = {
    nome = "Remendar  ",
    poder = nil,
    custo = 0,
    tipo = "Suporte",
    stamina = nil,
    descricao = "Storm +1; Compre um card e ganhe 7 de vida.",
efeito = function(Jogador1,Jogador2)
    Jogador1.storm = Jogador1.storm+1
    print(Jogador1.nome.." aumentou seu storm em 1.")
    Funcoes.draw(Jogador1)
    Funcoes.getlife(Jogador1,7)
    print(Jogador1.nome.." comprou um card e ganhou 7 de vida.")
end
}
Cards.Ganancia = {
    nome = "Ganância  ",
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
Cards.VenderAlma = {
    nome = "Vender Alma",
    poder = nil,
    custo = 0,
    tipo = "Suporte",
    stamina = nil,
    descricao = "Receba 2 de ouro e perca 20 de vida.",
efeito = function(Jogador1,Jogador2)
    Funcoes.getgold(Jogador1)
    Funcoes.getgold(Jogador1)
    Funcoes.dano(Jogador1,20)
    print(Jogador1.nome.." recebeu 1 de ouro e perdeu 20 de vida.")
end
}
Cards.Burn = {
    nome = "Burn      ",
    poder = nil,
    custo = 0,
    tipo = "Suporte",
    stamina = nil,
    descricao = "Storm +1; Causa 15 de dano ao oponente.",
efeito = function(Jogador1,Jogador2)
    Jogador1.storm = Jogador1.storm+1
    print(Jogador1.nome.." aumentou seu storm em 1.")
    Funcoes.dano(Jogador2,15)
    print(Jogador2.nome.." perdeu 15 de vida.")
end
}
Cards.Cooperar = {
    nome = "Cooperar  ",
    poder = nil,
    custo = 0,
    tipo = "Suporte",
    stamina = nil,
    descricao = "Storm +1; Cada jogador compra um card.",
efeito = function(Jogador1,Jogador2)
    Jogador1.storm = Jogador1.storm+1
    print(Jogador1.nome.." aumentou seu storm em 1.")
    Funcoes.draw(Jogador1)
    Funcoes.draw(Jogador2)
    print("Cada jogador comprou um card.")
end
}
Cards.Drenar = {
    nome = "Drenar    ",
    poder = nil,
    custo = 0,
    tipo = "Suporte",
    stamina = nil,
    descricao = "Storm +1; Ganhe 10 de vida e causa 10 de dano ao oponente.",
efeito = function(Jogador1,Jogador2)
    Jogador1.storm = Jogador1.storm+1
    print(Jogador1.nome.." aumentou seu storm em 1.")
    Funcoes.getlife(Jogador1,10)
    Funcoes.dano(Jogador2,10)
    print(Jogador1.nome.." ganhou 10 de vida e "..Jogador2.nome.." perdeu 10 de vida.")
end
}
Cards.Destruir = {
    nome = "Destruir  ",
    poder = nil,
    custo = 1,
    tipo = "Suporte",
    stamina = nil,
    descricao = "Destrua uma unidade do seu oponente.",
efeito = function(Jogador1,Jogador2)
    h = false
    while h == false do
        print("Selecione uma unidade para destruir:")
        Funcoes.printzona(Jogador2.campo)
        opcao = tonumber(io.read())
        if opcao ~= nil and opcao <= #Jogador2.campo and opcao > 0 then
            Funcoes.destruir(Jogador2.campo[opcao],Jogador2,Jogador1)
            h = true
        else
            print("SELECIONE UMA OPÇÃO VÁLIDA! @.@")
        end
    end
end
}
Cards.Pote = {
    nome = "Pote      ",
    poder = nil,
    custo = 1,
    tipo = "Suporte",
    stamina = nil,
    descricao = "Compre dois cards.",
efeito = function(Jogador1,Jogador2)
    Funcoes.draw(Jogador1)
    Funcoes.draw(Jogador1)
    print(Jogador1.nome.." comprou dois cards.")
end
}
Cards.AsCaras = {
    nome = "As Caras  ",
    poder = nil,
    custo = 1,
    tipo = "Suporte",
    stamina = nil,
    descricao = "Copie o efeito do último suporte que você conjurou.",
efeito = function(Jogador1,Jogador2)
    if Jogador1.lastsupport.efeito ~= nil and Jogador1.lastsupport ~= {} and Jogador1.lastsupport.nome ~= "As Caras  " then
        Jogador1.lastsupport.efeito(Jogador1,Jogador2)
    else
        print("VOCÊ PRECISA CONJURAR UM SUPORTE ANTES DE JOGAR ESTE CARD! >.<")
    end
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
    nome = "Firestorm ",
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
Cards.Lifestorm = {
    nome = "Lifestorm ",
    poder = nil,
    custo = 1,
    tipo = "Suporte",
    stamina = nil,
    descricao = "Ganhe 5X de vida; X = storm.",
efeito = function(Jogador1,Jogador2)
    Funcoes.getlife(Jogador1,5*Jogador1.storm)
    print(Jogador1.nome.." ganhou "..5*Jogador1.storm.." de vida.")
end
}
Cards.Espiar = {
    nome = "Espiar    ",
    poder = nil,
    custo = 0,
    tipo = "Suporte",
    stamina = nil,
    descricao = "Storm +1; Compre um card e depois olhe a mão de seu oponente. Você perde 10 de vida.",
efeito = function(Jogador1,Jogador2)
    Jogador1.storm = Jogador1.storm+1
    print(Jogador1.nome.." aumentou seu storm em 1.")
    Funcoes.draw(Jogador1)
    print(Jogador1.nome.." comprou um card.")
    print("A mão de "..Jogador2.nome.." é:")
    Funcoes.printzona(Jogador2.mao)
    print("Digite qualquer coisa para retornar.")
    input = tonumber(io.read())
    Funcoes.dano(Jogador1,10)
    print(Jogador1.nome.."")
    if input then 
    end
end
}
Cards.Lembrar = {
    nome = "Lembrar   ",
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
        print("0 - Nenhum")
        Funcoes.printzona(Jogador1.cemiterio)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 0 then
            h = true
        elseif opcao ~= nil and opcao <= #Jogador1.cemiterio then
           Jogador1.mao[#Jogador1.mao+1] = Jogador1.cemiterio[opcao]
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
Cards.Reviver = {
    nome = "Reviver   ",
    poder = nil,
    custo = 2,
    tipo = "Suporte",
    stamina = nil,
    zona = deck,
    descricao = "Invoque uma unidade de seu cemitério.",
efeito = function(Jogador1,Jogador2)
    local h = false
    while h == false do
        print("Selecione uma unidade no seu cemitério:")
        print("0 - Nenhuma")
        Funcoes.printzona(Jogador1.cemiterio)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 0 then
            h = true
        elseif Jogador1.cemiterio[opcao].tipo == "Unidade" then
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
Cards.Reanimar = {
    nome = "Reanimar  ",
    poder = nil,
    custo = 1,
    tipo = "Suporte",
    stamina = nil,
    zona = deck,
    descricao = "Invoque uma unidade de seu cemitério. Você perde 15 de vida.",
efeito = function(Jogador1,Jogador2)
    local h = false
    while h == false do
        print("Selecione uma unidade no seu cemitério:")
        print("0 - Nenhuma")
        Funcoes.printzona(Jogador1.cemiterio)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 0 then
            h = true
        elseif opcao ~= nil and Jogador1.cemiterio[opcao].tipo == "Unidade" then
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
    Funcoes.dano(Jogador1,15)
    print(Jogador1.nome.." perdeu 15 de vida.")
end
}
Cards.Tutor = {
    nome = "Tutor     ",
    poder = nil,
    custo = 1,
    tipo = "Suporte",
    stamina = nil,
    descricao = "Procure em seu deck por um card e adicione-o à sua mão, depois seu deck é embaralhado. Você perde 21 de vida.",
    efeito = function(Jogador1,Jogador2)
    local h = false
        while h == false do
            print("Selecione um card:")
            print("0 - Nenhum")
            Funcoes.printzona(Jogador1.deck)
            local opcao = tonumber(io.read())
            if opcao ~= nil and opcao == 0 then
                h = true
            elseif opcao ~= nil and opcao <= #Jogador1.deck then
                Jogador1.mao[#Jogador1.mao+1] = Jogador1.deck[opcao]
                while opcao <= #Jogador1.deck do
                    Jogador1.deck[opcao] = Jogador1.deck[opcao+1]
                    opcao = opcao+1
                end
                h = true
            else
                print("SELECIONE UMA OPÇÃO VÁLIDA!")
            end
        end
        Funcoes.shuffle2(Jogador1.deck)
        Funcoes.dano(Jogador1,21)
        print(Jogador1.nome.." perdeu 21 de vida.")
    end
}
Cards.Selecionar = {
    nome = "Selecionar",
    poder = nil,
    custo = 0,
    tipo = "Suporte",
    stamina = nil,
    descricao = "Storm +1; Olhe os dois cards do topo de seu deck, adicione um à sua mão e o outro ao seu cemitério. Você perde 14 de vida.",
    efeito = function(Jogador1,Jogador2)
    Funcoes.storm(Jogador1,1)
    local h = false
    local topo = {Jogador1.deck[#Jogador1.deck],Jogador1.deck[#Jogador1.deck-1]}
            Jogador1.deck[#Jogador1.deck] = nil
            Jogador1.deck[#Jogador1.deck] = nil
        while h == false do
            print("Selecione um card:")
            print("0 - Nenhum")
            Funcoes.printzona(topo)
            local opcao = tonumber(io.read())
            if opcao ~= nil and opcao == 0 then
                h = true
            elseif opcao ~= nil and opcao <= #topo and opcao > 0 then
                Jogador1.mao[#Jogador1.mao+1] = topo[opcao]
                if opcao == 1 then
                    Jogador1.cemiterio[#Jogador1.cemiterio+1] = topo[2]
                    topo = {}
                elseif opcao == 2 then
                    Jogador1.cemiterio[#Jogador1.cemiterio+1] = topo[1]
                    topo = {}
                end
                Funcoes.dano(Jogador1,14)
                print(Jogador1.nome.." perdeu 14 de vida.")
                h = true
            else
                print("SELECIONE UMA OPÇÃO VÁLIDA!")
            end
        end
    end
}
Cards.Blinker = {
    nome = "Blinker   ",
    poder = nil,
    custo = 1,
    tipo = "Aliado",
    stamina = 1,
    lealdade = 4,
    descricao = "Habilidade: Selecione uma unidade sua. Exile-a e depois invoque-a novamente.",
    efeito = {habilidade = function(Jogador1,Jogador2)
    local h = false
        while h == false do
        print("Selecione uma unidade:")
        print("0 - Nenhuma")
            Funcoes.printzona(Jogador1.campo)
            local opcao = tonumber(io.read())
            if opcao ~= nil and opcao == 0 then
                h = true
            elseif opcao ~= nil and opcao <= #Jogador1.campo and opcao > 0 then
                card = Jogador1.campo[opcao]
                Funcoes.exilar(Jogador1.campo[opcao],Jogador1,Jogador2)
                Funcoes.invocar(card,Jogador1,Jogador2)
                h = true
            else
                print("SELECIONE UMA OPCAO VÁLIDA!")
            end
        end
    end
}
}

return Cards
