local Player = require("Player")
local Functions = require("Functions")
local Cards = {}

-- Cards.Traidor = {
--     name = "Traidor   ",
--     power = 10,
--     cost = 1,
--     type = "Unit",
--     stamina = 1,
--     description = "Quando destruído, é invocado no field do oponente com power aumentado em 2.",
--     effect = {ifdies = function(Player1,Player2)
--         Traidor = {}
--         Functions.copiar(Cards.Traidor,Traidor)
--         Traidor.power = Traidor.power+2
--         Functions.summon(Traidor,Player2,Player1)
--         print("Traidor foi invocado no field do oponente com power aumentado em 2.")
--     end
-- }
-- }
Cards.Sphinx = {
    name = "Sphinx    ",
    power = 19,
    cost = 4,
    type = "Unit",
    stamina = 1,
    description = "Ability: draw a card. ULTRA: draw three cards.",
    effect = {ability = function(Player1,Player2)
        Functions.draw(Player1)
        print(Player1.name.." drew a card.")
    end,
    ultra = function(Player1,Player2)
    print(Player1.name.." drew three cards.")
end
}
}
Cards.MindKnight = {
    name = "MindKnight",
    power = 16,
    cost = 2,
    type = "Unit",
    stamina = 1,
    description = "If this destroys a unit, draw a card.",
    effect = {ifdestroys = function(Player1,Player2)
        Functions.draw(Player1)
        print(Player1.name.." drew a card.")
    end
}
}
Cards.GoldKnight = {
    name = "GoldKnight",
    power = 16,
    cost = 2,
    type = "Unit",
    stamina = 1,
    description = "If this destroys a unit, receive 1 gold.",
    effect = {ifdestroys = function(Player1,Player2)
        Functions.getgold(Player1)
        print(Player1.name.." received 1 gold.")
    end
}
}
Cards.Lich = {
    name = "Lich      ",
    power = 17,
    cost = 3,
    type = "Unit",
    stamina = 1,
    description = "If summoned, summon a unit from your graveyard.",
    effect = {ifsummoned = function(Player1,Player2)    
    local h = false
    while h == false do
        print("Select a unit in your graveyard:")
        print("0 - None")
        Functions.printzone(Player1.graveyard)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 0 then
            h = true
        elseif Player1.graveyard[opcao].type == "Unit" then
            local card = Player1.graveyard[opcao]
            Functions.summon(card,Player1)
            print(card.name.." was summoned!")
            while opcao <= #Player1.graveyard do
                Player1.graveyard[opcao] = Player1.graveyard[opcao+1]
                opcao = opcao+1
            end
            h = true
        else
            print("SELECT A VALID OPTION!")
        end
    end
    end
}
}
        
Cards.SoulGuide = {
    name = "Soul Guide ",
    power = 11,
    cost = 1,
    type = "Unit",
    stamina = 1,
    description = "If destroyed, search your deck for a unit card with power 10 or less and add it to your hand, then your deck is shuffled.",
    effect = {ifdies = function(Player1,Player2)
    local h = false
        while h == false do
            print("Select a unit with power 10 or less:")
            print("0 - None")
            Functions.printzone(Player1.deck)
            local opcao = tonumber(io.read())
            if opcao ~= nil and opcao == 0 then
                h = true
            elseif opcao ~= nil and opcao <= #Player1.deck and Player1.deck[opcao].type == "Unit" and Player1.deck[opcao].power < 11 then
                Player1.hand[#Player1.hand+1] = Player1.deck[opcao]
                while opcao <= #Player1.deck do
                    Player1.deck[opcao] = Player1.deck[opcao+1]
                    opcao = opcao+1
                end
                h = true
            else
                print("SELECT A VALID OPTION!")
            end
        end
        Functions.shuffle2(Player1.deck)
    end
}
}
Cards.Recruiter = {
    name = "Recruiter ",
    power = 15,
    cost = 2,
    type = "Unit",
    stamina = 1,
    description = "If summoned, search your deck for a unit card with cost 1 or less and add it to your hand, then your deck is shuffled.",
    effect = {ifsummoned = function(Player1,Player2)
    local h = false
        while h == false do
            print("Select a unit with cost 1 or less:")
            print("0 - None")
            Functions.printzone(Player1.deck)
            local opcao = tonumber(io.read())
            if opcao ~= nil and opcao == 0 then
                h = true
            elseif opcao ~= nil and opcao <= #Player1.deck and Player1.deck[opcao].type == "Unit" and Player1.deck[opcao].cost < 2 then
                Player1.hand[#Player1.hand+1] = Player1.deck[opcao]
                while opcao <= #Player1.deck do
                    Player1.deck[opcao] = Player1.deck[opcao+1]
                    opcao = opcao+1
                end
                h = true
            else
                print("SELECIONE UMA OPÇÃO VÁLIDA!")
            end
        end
        Functions.shuffle2(Player1.deck)
    end
}
}
Cards.Dragon = {
    name = "Dragon    ",
    power = 25,
    cost = 3,
    type = "Unit",
    stamina = 1,
    description = "Quando invocado, sacrifique uma Unit. ULTRA: receive 3 gold.",
    effect = {ifsummoned = function(Player1,Player2)
        local h = false
        while h == false do
            print("Sacrifique uma Unit:")
            Functions.printzone(Player1.field)
            local opcao = tonumber(io.read())
            if opcao ~= nil and opcao ~= 0 and opcao <= #Player1.field then
                Functions.destroy(Player1.field[opcao],Player1,Player1,Player2)
                h = true
            else
                print("VOCÊ DEVE SACRIFICAR UMA Unit!")
            end
        end,
        ultra = function(Player1,Player2)
            Functions.getgold(Player1)
            Functions.getgold(Player1)
            Functions.getgold(Player1)
            print(Player1.name.." received 3 gold.")
        end
    end
}
}
Cards.Elfo = {
    name = "Elfo      ",
    power = 6,
    cost = 1,
    type = "Unit",
    stamina = 1,
    description = "Quando invocado, reduza o power de uma Unit em 6.",
    effect = {ifsummoned = function(Player1,Player2)
local h = false
    while h == false do
        print("Selecione uma Unit:")
        print("0 - Nenhuma")
        Functions.printzone(Player2.field)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 0 then
            h = true
        elseif opcao <= #Player2.field and opcao > 0 then
            local card = Player2.field[opcao]
            card.power = card.power-6
            print(card.name.." perdeu 6 de power.")
            h = true
        else
            print("SELECIONE UMA OPÇÃO VÁLIDA!")
        end
    end
end
}
}
Cards.Anjo = {
    name = "Anjo      ",
    power = 18,
    cost = 2,
    type = "Unit",
    stamina = 1,
    description = "Quando invocado, embaralhe sete cards 'Remendar' ao seu deck.",
    effect = {ifsummoned = function(Player1,Player2)
        tempcard = {}
        tempcard = Functions.copiar(Cards.Remendar,tempcard)
        Player1.deck[#Player1.deck+1] = tempcard
        Player1.deck[#Player1.deck+1] = tempcard
        Player1.deck[#Player1.deck+1] = tempcard
        Player1.deck[#Player1.deck+1] = tempcard
        Player1.deck[#Player1.deck+1] = tempcard
        Player1.deck[#Player1.deck+1] = tempcard
        Player1.deck[#Player1.deck+1] = tempcard
        tempcard = {}
        Functions.shuffle2(Player1.deck)
        print("Sete cards 'Remendar' foram embaralhados ao deck de "..Player1.name..".")
    end
}
}
Cards.Coveiro = {
    name = "Coveiro   ",
    power = 10,
    cost = 1,
    type = "Unit",
    stamina = 1,
    description = "Quando invocado, adicione até uma Unit do seu cemitério à sua mão.",
    effect = {ifsummoned = function(Player1,Player2)
    h = false
    while h == false do
        print("Adicione até uma Unit do seu cemitério à sua mão:")
        print("0 - Nenhuma")
            Functions.printzone(Player1.graveyard)
            opcao = tonumber(io.read())
            if opcao ~= nil and opcao == 0 then
                h = true
            elseif opcao ~= nil and opcao <= #Player1.graveyard and opcao > 0 and Player1.graveyard[opcao].type == "Unit" then
                Player1.hand[#Player1.hand+1] = Player1.graveyard[opcao]
                while opcao <= #Player1.graveyard do
                    Player1.graveyard[opcao] = Player1.graveyard[opcao+1]
                    opcao = opcao+1
                end
                h = true
            else
                print("Nenhuma Unit foi adicionada à sua mão.")
                h = true
            end
    end
    end
}
}
Cards.Arqueologo = {
    name = "Arqueólogo",
    power = 7,
    cost = 1,
    type = "Unit",
    stamina = 1,
    description = "Quando invocado, adicione até um Support do seu cemitério à sua mão.",
    effect = {ifsummoned = function(Player1,Player2)
    h = false
    while h == false do
        print("Adicione até um Support do seu cemitério à sua mão:")
        print("0 - Nenhum")
            Functions.printzone(Player1.graveyard)
            opcao = tonumber(io.read())
            if opcao ~= nil and opcao == 0 then
                h = true
            elseif opcao ~= nil and opcao <= #Player1.graveyard and opcao > 0 and Player1.graveyard[opcao].type == "Support" then
                Player1.hand[#Player1.hand+1] = Player1.graveyard[opcao]
                while opcao <= #Player1.graveyard do
                    Player1.graveyard[opcao] = Player1.graveyard[opcao+1]
                    opcao = opcao+1
                end
                h = true
            else
                print("Nenhum Support foi adicionada à sua mão.")
                h = true
            end
    end
    end
}
}
Cards.StormTitan = {
    name = "Storm Titan",
    power = 17,
    cost = 3,
    type = "Unit",
    stamina = 1,
    description = "Quando invocado, adicione os cards 'Brainstorm', 'Firestorm' e 'Lifestorm' à sua mão.",
    effect = {ifsummoned = function(Player1,Player2)
        tempcard = {}
        tempcard = Functions.copiar(Cards.Brainstorm,tempcard)
        Player1.hand[#Player1.hand+1] = tempcard
        tempcard = {}
        tempcard = Functions.copiar(Cards.Firestorm,tempcard)
        Player1.hand[#Player1.hand+1] = tempcard
        tempcard = {}
        tempcard = Functions.copiar(Cards.Lifestorm,tempcard)
        Player1.hand[#Player1.hand+1] = tempcard
        tempcard = {}
        print("Os cards 'Brainstorm','Firestorm' e 'Lifestorm' foram adicionados à mão de "..Player1.name..".")
    end
}
}
Cards.Stormdude = {
    name = "Stormdude ",
    power = 12,
    cost = 1,
    type = "Unit",
    stamina = 1,
    description = "ability: Storm +3.",
    effect = {ability = function(Player1,Player2)
        Functions.storm(Player1,3)
    end
}
}
Cards.Vampiro = {
    name = "Vampiro   ",
    power = 13,
    cost = 1,
    type = "Unit",
    stamina = 1,
    description = "Quando invocado, ganhe 13 de life e seu oponente perde 13 de life.",
    effect = {ifsummoned = function(Player1,Player2)
        Functions.getlife(Player1,13)
        Functions.damage(Player2,13)
    print(Player1.name.." ganhou 13 de life e "..Player2.name.." perdeu 13 de life.")
    end
}
}
Cards.Demonio = {
    name = "Demonio   ",
    power = 17,
    cost = 2,
    type = "Unit",
    stamina = 1,
    description = "Quando invocado, compre dois cards e perca 20 de life.",
    effect = {ifsummoned = function(Player1,Player2)
        Functions.draw(Player1)
        Functions.draw(Player1)
        Functions.damage(Player1,20)
        print(Player1.name.." comprou dois cards e perdeu 20 de life.")
    end
}
}
Cards.RedAristocrat = {
    name = "Red Arist.",
    power = 12,
    cost = 1,
    type = "Unit",
    stamina = 1,
    description = "ability: sacrifique uma Unit para causar 17 de damage ao oponente.",
    effect = {ability = function(Player1,Player2)
        print("Sacrifique uma Unit:")
        Functions.printzone(Player1.field)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao <= #Player1.field and opcao > 0  then
            Functions.destroy(Player1.field[opcao],Player1,Player1,Player2)
            Functions.damage(Player2,17)
            print(Player2.name.." recebeu 17 de damage.")
        else
            print("Nenhuma Unit foi sacrificada, então nada aconteceu.")
        end
    end
}
}
Cards.BlueAristocrat = {
    name = "Blue Arist.",
    power = 12,
    cost = 1,
    type = "Unit",
    stamina = 1,
    description = "ability: sacrifique uma Unit para comprar um card.",
    effect = {ability = function(Player1,Player2)
        print("Sacrifique uma Unit:")
        Functions.printzone(Player1.field)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao <= #Player1.field and opcao > 0  then
            Functions.destroy(Player1.field[opcao],Player1,Player1,Player2)
            Functions.draw(Player1)
            print(Player1.name.." comprou um card.")
        else
            print("Nenhuma Unit foi sacrificada, então nada aconteceu.")
        end
    end
}
}
Cards.YellowAristocrat = {
    name = "Yellow Arist.",
    power = 12,
    cost = 1,
    type = "Unit",
    stamina = 1,
    description = "ability: sacrifique uma Unit para receber 1 de gold.",
    effect = {ability = function(Player1,Player2)
        print("Sacrifique uma Unit:")
        Functions.printzone(Player1.field)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao <= #Player1.field and opcao > 0 then
            Functions.destroy(Player1.field[opcao],Player1,Player1,Player2)
            Functions.getgold(Player1)
            print(Player1.name.." recebeu 1 de gold")
        else
            print("Nenhuma Unit foi sacrificada, então nada aconteceu.")
        end
    end
}
}
Cards.GreenAristocrat = {
    name = "Green Arist.",
    power = 12,
    cost = 1,
    type = "Unit",
    stamina = 1,
    description = "ability: sacrifique uma Unit para ganhar 20 de life.",
    effect = {ability = function(Player1,Player2)
        print("Sacrifique uma Unit:")
        Functions.printzone(Player1.field)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao <= #Player1.field and opcao > 0  then
            Functions.destroy(Player1.field[opcao],Player1,Player1,Player2)
            Functions.getlife(Player1,20)
            print(Player1.name.." ganhou 20 de life.")
        else
            print("Nenhuma Unit foi sacrificada, então nada aconteceu.")
        end
    end
}
}
Cards.Gname = {
    name = "Gname     ",
    power = 7,
    cost = 1,
    type = "Unit",
    stamina = 1,
    description = "Quando destruído, compre um card.",
    effect = {ifdies = function(Player1,Player2)
        Functions.draw(Player1)
        print(Player1.name.." comprou um card.")
    end
}
}
Cards.Dwarf = {
    name = "Dwarf     ",
    power = 8,
    cost = 1,
    type = "Unit",
    stamina = 1,
    description = "Quando destruído, receba 1 de gold.",
    effect = {ifdies = function(Player1,Player2)
        Functions.getgold(Player1)
        print(Player1.name.." recebeu 1 de gold.")
    end
}
}
Cards.Mago = {
    name = "Mago      ",
    power = 9,
    cost = 1,
    type = "Unit",
    stamina = 1,
    description = "ability: compre dois cards e depois descarte dois cards.",
    effect = {ability = function(Player1,Player2)
        Functions.draw(Player1)
        Functions.draw(Player1)
        print(Player1.name.." comprou dois cards.")
        Functions.discard(Player1)
        Functions.discard(Player1)
    end
}
}
Cards.Serpente = {
    name = "Serpente  ",
    power = 5,
    cost = 1,
    type = "Unit",
    stamina = 1,
    description = "Se este card for descartado da sua mão, você pode pagar 7 de life para devolvê-lo à sua mão.",
    effect = {ifdiscarded = function(Player1,Player2)
        print("Pagar 7 de life para devolver Serpente à sua mão?")
        print("1 - Sim")
        print("2 - Não")
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 1 then
            tempcard = {}
            Functions.copiar(Cards.Serpente,tempcard)
            Player1.hand[#Player1.hand+1] = tempcard
            tempcard = {}
            print(Player1.name.." perdeu 7 de life e Serpente voltou para a mão de "..Player1.name..".")
        else
            print("Serpente não foi devollife para a mão.")
        end
    end
}
}
Cards.Healer = {
    name = "Healer    ",
    power = 9,
    cost = 1,
    type = "Unit",
    stamina = 1,
    description = "Quando invocado, ganhe 18 de life.",
    effect = {ifsummoned = function(Player1,Player2)
        Functions.getlife(Player1,18)
        print(Player1.name.." ganhou 18 de life.")
    end
}
}
Cards.Golem = {
    name = "Golem     ",
    power = 15,
    cost = 2,
    type = "Unit",
    stamina = 1,
    description = "Quando invocado, ganhe 14 de life. Quando destruído, compre um card.",
effect = {ifsummoned = function(Player1,Player2)
        Functions.getlife(Player1,14)
        print(Player1.name.." ganhou 14 de life.")
    end,
    ifdies = function(Player1,Player2)
        Functions.draw(Player1)
        print(Player1.name.." comprou um card.")
    end
}
}
Cards.Devedor = {
    name = "Devedor",
    power = 12,
    cost = 1,
    type = "Unit",
    stamina = 1,
    description = "Quando invocado, compre um card e ganhe 10 de life. Quando destruído, descarte um card e você perde 15 de life.",
    effect = {ifsummoned = function(Player1,Player2)
        Functions.draw(Player1)
        Functions.getlife(Player1,10)
    end,
    ifdies = function(Player1)
    Functions.discard(Player1)
    Functions.damage(Player1,15)
end
}
}
Cards.Troll = {
    name = "Troll     ",
    power = 10,
    cost = 1,
    type = "Unit",
    stamina = 1,
    description = "Quando invocado, compre um card e perca 10 de life.",
effect = {ifsummoned = function(Player1,Player2)
        Functions.draw(Player1)
        Functions.damage(Player1,10)
        print(Player1.name.." comprou um card e perdeu 10 de life.")
    end  
}
}
-----------------------------------------SupportS----------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Cards.Impulso= {
    name = "Impulso   ",
    power = nil,
    cost = 0,
    type = "Support",
    stamina = nil,
    description = "Compre dois cards e você perde 20 de life.",
effect = function(Player1,Player2)
    Functions.draw(Player1)
    Functions.draw(Player1)
    Functions.damage(Player1,20)
    print(Player1.name.." comprou dois cards e perdeu 20 de life.")
end
}
Cards.Furia = {
    name = "Fúria     ",
    power = nil,
    cost = 0,
    type = "Support",
    stamina = nil,
    description = "Uma Unit sua ganha 5 de power.",
effect = function(Player1,Player2)
    print("Selecione uma Unit:")
    print("0 - Nenhuma")
    Functions.printzone(Player1.field)
    local opcao = tonumber(io.read())
    if opcao ~= nil and opcao == 0 then
        h = true
    elseif opcao <= #Player1.field and opcao > 0 then
        local card = Player1.field[opcao]
        card.power = card.power+5
        print(card.name.." ganhou 5 de power.")
    else
        print("SELECIONE UMA OPÇÃO VÁLIDA!")
    end
end
}
Cards.Adoecer = {
    name = "Adoecer   ",
    power = nil,
    cost = 0,
    type = "Support",
    stamina = nil,
    description = "Uma Unit de seu oponente perde 7 de power.",
effect = function(Player1,Player2)
local h = false
    while h == false do
        print("Selecione uma Unit:")
        print("0 - Nenhuma")
        Functions.printzone(Player2.field)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 0 then
            h = true
        elseif opcao <= #Player2.field and opcao > 0 then
            local card = Player2.field[opcao]
            card.power = card.power-7
            print(card.name.." perdeu 7 de power.")
            h = true
        else
            print("SELECIONE UMA OPÇÃO VÁLIDA!")
        end
    end
end
}
Cards.Investida = {
    name = "Investida ",
    power = nil,
    cost = 0,
    type = "Support",
    stamina = nil,
    description = "Storm +1; Uma Unit recebe energia adicional para atacar ou ativar uma ability neste turn.",
effect = function(Player1,Player2)
    Player1.storm = Player1.storm+1
    print(Player1.name.." aumentou seu storm em 1.")
    print("Selecione uma Unit:")
    print("0 - Nenhuma")
    Functions.printzone(Player1.field)
    local opcao = tonumber(io.read())
    if opcao ~= nil and opcao == 0 then
        h = true
    elseif opcao <= #Player1.field and opcao > 0 then
        local card = Player1.field[opcao]
        card.stamina = card.stamina+1
        print(card.name.." recebeu energia adicional.")
    else
        print("SELECIONE UMA OPÇÃO VÁLIDA!")
    end
end
}
Cards.Stormear = {
    name = "Stormear  ",
    power = nil,
    cost = 0,
    type = "Support",
    stamina = nil,
    description = "Storm +3.",
effect = function(Player1,Player2)
    Functions.storm(Player1,3)
end
}
Cards.Remendar = {
    name = "Remendar  ",
    power = nil,
    cost = 0,
    type = "Support",
    stamina = nil,
    description = "Storm +1; Compre um card e ganhe 7 de life.",
effect = function(Player1,Player2)
    Player1.storm = Player1.storm+1
    print(Player1.name.." aumentou seu storm em 1.")
    Functions.draw(Player1)
    Functions.getlife(Player1,7)
    print(Player1.name.." comprou um card e ganhou 7 de life.")
end
}
Cards.Ganancia = {
    name = "Ganância  ",
    power = nil,
    cost = 0,
    type = "Support",
    stamina = nil,
    description = "Receba 1 de gold.",
effect = function(Player1,Player2)
    Functions.getgold(Player1)
    print(Player1.name.." recebeu 1 de gold.")
end
}
Cards.VenderAlma = {
    name = "Vender Alma",
    power = nil,
    cost = 0,
    type = "Support",
    stamina = nil,
    description = "Receba 2 de gold e perca 20 de life.",
effect = function(Player1,Player2)
    Functions.getgold(Player1)
    Functions.getgold(Player1)
    Functions.damage(Player1,20)
    print(Player1.name.." recebeu 2 de gold e perdeu 20 de life.")
end
}
Cards.Escralifeo = {
    name = "Escravidão",
    power = nil,
    cost = 0,
    type = "Support",
    stamina = nil,
    description = "Sacrifique uma Unit. Se fizer isso, receba 2 de gold.",
effect = function(Player1,Player2)
    local h = false
    while h == false do
        print("Selecione uma Unit:")
        print("0 - Nenhuma")
        Functions.printzone(Player1.field)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 0 then
            h = true
        elseif opcao ~= nil and opcao <= #Player1.field and opcao > 0 then
            local card = Player1.field[opcao]
            Functions.destroy(Player1.field[opcao],Player1,Player1,Player2)
            h = true
            g = true
        else
            print("SELECIONE UMA OPÇÃO VÁLIDA!")
        end
        if h == true and g == true then
            Functions.getgold(Player1)
            Functions.getgold(Player1)
            print(Player1.name.." recebeu 2 de gold.")
        end
    end
end
}
Cards.Sacrificio = {
    name = "Sacrifício",
    power = nil,
    cost = 0,
    type = "Support",
    stamina = nil,
    description = "Sacrifique uma Unit. Se fizer isso, compre dois cards.",
effect = function(Player1,Player2)
    local h = false
    while h == false do
        print("Selecione uma Unit:")
        print("0 - Nenhuma")
        Functions.printzone(Player1.field)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 0 then
            h = true
        elseif opcao ~= nil and opcao <= #Player1.field and opcao > 0 then
            local card = Player1.field[opcao]
            Functions.destroy(Player1.field[opcao],Player1,Player1,Player2)
            h = true
            g = true
        else
            print("SELECIONE UMA OPÇÃO VÁLIDA!")
        end
        if h == true and g == true then
            Functions.draw(Player1)
            Functions.draw(Player1)
            print(Player1.name.." comprou dois cards.")
        end
    end
end
}
-- Cards.Vicio = {
--     name = "Vício     ",
--     power = nil,
--     cost = 0,
--     type = "Support",
--     stamina = nil,
--     description = "Descarte um card. Se fizer isso, receba 2 de gold.",
-- effect = function(Player1,Player2)
--     Functions.discard(Player1)
--     Functions.getgold(Player1)
--     Functions.getgold(Player1)
--     print(Player1.name.." recebeu 2 de gold.")
-- end
-- }
Cards.Burn = {
    name = "Burn      ",
    power = nil,
    cost = 0,
    type = "Support",
    stamina = nil,
    description = "Storm +1; Causa 15 de damage ao oponente.",
effect = function(Player1,Player2)
    Player1.storm = Player1.storm+1
    print(Player1.name.." aumentou seu storm em 1.")
    Functions.damage(Player2,15)
    print(Player2.name.." perdeu 15 de life.")
end
}
Cards.Cooperar = {
    name = "Cooperar  ",
    power = nil,
    cost = 0,
    type = "Support",
    stamina = nil,
    description = "Storm +1; Cada Player compra um card.",
effect = function(Player1,Player2)
    Player1.storm = Player1.storm+1
    print(Player1.name.." aumentou seu storm em 1.")
    Functions.draw(Player1)
    Functions.draw(Player2)
    print("Cada Player comprou um card.")
end
}
Cards.Drenar = {
    name = "Drenar    ",
    power = nil,
    cost = 0,
    type = "Support",
    stamina = nil,
    description = "Storm +1; Ganhe 10 de life e causa 10 de damage ao oponente.",
effect = function(Player1,Player2)
    Player1.storm = Player1.storm+1
    print(Player1.name.." aumentou seu storm em 1.")
    Functions.getlife(Player1,10)
    Functions.damage(Player2,10)
    print(Player1.name.." ganhou 10 de life e "..Player2.name.." perdeu 10 de life.")
end
}
Cards.destroy = {
    name = "destroy  ",
    power = nil,
    cost = 1,
    type = "Support",
    stamina = nil,
    description = "Destrua uma Unit de seu oponente.",
effect = function(Player1,Player2)
    h = false
    while h == false do
        print("Selecione uma Unit para destroy:")
        print("0 - Nenhuma")
        Functions.printzone(Player2.field)
        opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 0 then
            h = true
        elseif opcao ~= nil and opcao <= #Player2.field and opcao > 0 then
            Functions.destroy(Player2.field[opcao],Player1,Player2,Player1)
            h = true
        else
            print("SELECIONE UMA OPÇÃO VÁLIDA! @.@")
        end
    end
end
}
Cards.Esmagar = {
    name = "Esmagar   ",
    power = nil,
    cost = 0,
    type = "Support",
    stamina = nil,
    description = "Destrua uma Unit de seu oponente com power menor ou igual a 10.",
effect = function(Player1,Player2)
    h = false
    while h == false do
        print("Selecione uma Unit com power menor ou igual a 10 para destroy:")
        print("0 - Nenhuma")
        Functions.printzone(Player2.field)
        opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 0 then
            h = true
        elseif opcao ~= nil and opcao <= #Player2.field and opcao > 0 and Player2.field[opcao].power < 11 then
            Functions.destroy(Player2.field[opcao],Player1,Player2,Player1)
            h = true
        elseif opcao ~= nil and opcao <= #Player2.field and opcao > 0 and Player2.field[opcao].power > 10 then
            print("ESTA Unit TEM power MAIOR DO QUE 10!")
            h = true
        else
            print("SELECIONE UMA OPÇÃO VÁLIDA! @.@")
        end
    end
end
}
Cards.Pote = {
    name = "Pote      ",
    power = nil,
    cost = 1,
    type = "Support",
    stamina = nil,
    description = "Compre dois cards.",
effect = function(Player1,Player2)
    Functions.draw(Player1)
    Functions.draw(Player1)
    print(Player1.name.." comprou dois cards.")
end
}
Cards.AsCaras = {
    name = "As Caras  ",
    power = nil,
    cost = 1,
    type = "Support",
    stamina = nil,
    description = "Copie o effect do último Support que você conjurou.",
effect = function(Player1,Player2)
    if Player1.lastsupport.effect ~= nil and Player1.lastsupport ~= {} and Player1.lastsupport.name ~= "As Caras  " then
        Player1.lastsupport.effect(Player1,Player2)
    else
        print("VOCÊ PRECISA cast UM Support ANTES DE JOGAR ESTE CARD! >.<")
    end
end
}
Cards.Brainstorm = {
    name = "Brainstorm",
    power = nil,
    cost = 2,
    type = "Support",
    stamina = nil,
    description = "Compre X cards; X = storm.",
effect = function(Player1,Player2)
    i = Player1.storm
    while i > 0 do
        Functions.draw(Player1)
        i = i-1
    end
    print(Player1.name.." comprou "..Player1.storm.." cards.")
end    
}
Cards.Firestorm = {
    name = "Firestorm ",
    power = nil,
    cost = 0,
    type = "Support",
    stamina = nil,
    description = "Causa 3X de damage ao oponente; X = storm.",
effect = function(Player1,Player2)
    Functions.damage(Player2,3*Player1.storm)
    print(Player2.name.." perdeu "..3*Player1.storm.." de life.")
end
}
Cards.Lifestorm = {
    name = "Lifestorm ",
    power = nil,
    cost = 0,
    type = "Support",
    stamina = nil,
    description = "Ganhe 5X de life; X = storm.",
effect = function(Player1,Player2)
    Functions.getlife(Player1,5*Player1.storm)
    print(Player1.name.." ganhou "..5*Player1.storm.." de life.")
end
}
Cards.Concentrar = {
    name = "Concentrar",
    power = nil,
    cost = 0,
    type = "Support",
    stamina = nil,
    description = "Se seu storm for maior ou igual a 5, compre dois cards; se for maior ou igual a 9, compre um card adicional.",
effect = function(Player1,Player2)
    if Player1.storm > 4 then
        Functions.draw(Player1)
        Functions.draw(Player1)
        print(Player1.name.." comprou dois cards.")
    end
    if Player1.storm > 8 then
        Functions.draw(Player1)
        print(Player1.name.." comprou um card adicional.")
    end
end    
}
Cards.Espiar = {
    name = "Espiar    ",
    power = nil,
    cost = 0,
    type = "Support",
    stamina = nil,
    description = "Compre um card e depois olhe a mão de seu oponente. Você perde 10 de life.",
effect = function(Player1,Player2)
    Functions.draw(Player1)
    print(Player1.name.." comprou um card.")
    print("A mão de "..Player2.name.." é:")
    Functions.printzone(Player2.hand)
    print("Digite qualquer coisa para retornar.")
    input = tonumber(io.read())
    Functions.damage(Player1,10)
    print(Player1.name.."")
    if input then 
    end
end
}
Cards.Lembrar = {
    name = "Lembrar   ",
    power = nil,
    cost = 1,
    type = "Support",
    stamina = nil,
    zone = deck,
    description = "Adicione um card de seu cemitério à sua mão.",
effect = function(Player1,Player2)
    local h = false
    while h == false do
        print("Selecione um card em seu cemitério:")
        print("0 - Nenhum")
        Functions.printzone(Player1.graveyard)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 0 then
            h = true
        elseif opcao ~= nil and opcao <= #Player1.graveyard then
           Player1.hand[#Player1.hand+1] = Player1.graveyard[opcao]
            while opcao <= #Player1.graveyard do
                Player1.graveyard[opcao] = Player1.graveyard[opcao+1]
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
    name = "Reviver   ",
    power = nil,
    cost = 2,
    type = "Support",
    stamina = nil,
    zone = deck,
    description = "Invoque uma Unit de seu cemitério.",
effect = function(Player1,Player2)
    local h = false
    while h == false do
        print("Selecione uma Unit no seu cemitério:")
        print("0 - Nenhuma")
        Functions.printzone(Player1.graveyard)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 0 then
            h = true
        elseif Player1.graveyard[opcao].type == "Unit" then
            local card = Player1.graveyard[opcao]
            Functions.summon(card,Player1)
            print(card.name.." foi invocado!")
            while opcao <= #Player1.graveyard do
                Player1.graveyard[opcao] = Player1.graveyard[opcao+1]
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
    name = "Reanimar  ",
    power = nil,
    cost = 1,
    type = "Support",
    stamina = nil,
    zone = deck,
    description = "Invoque uma Unit de seu cemitério. Você perde 15 de life.",
effect = function(Player1,Player2)
    local h = false
    while h == false do
        print("Selecione uma Unit no seu cemitério:")
        print("0 - Nenhuma")
        Functions.printzone(Player1.graveyard)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 0 then
            h = true
        elseif opcao ~= nil and Player1.graveyard[opcao].type == "Unit" then
            local card = Player1.graveyard[opcao]
            Functions.summon(card,Player1)
            print(card.name.." foi invocado!")
            while opcao <= #Player1.graveyard do
                Player1.graveyard[opcao] = Player1.graveyard[opcao+1]
                opcao = opcao+1
            end
            h = true
        else
            print("SELECIONE UMA OPÇÃO VÁLIDA!")
        end
    end
    Functions.damage(Player1,15)
    print(Player1.name.." perdeu 15 de life.")
end
}
Cards.Tutor = {
    name = "Tutor     ",
    power = nil,
    cost = 1,
    type = "Support",
    stamina = nil,
    description = "Procure em seu deck por um card e adicione-o à sua mão, depois seu deck é embaralhado. Você perde 17 de life.",
    effect = function(Player1,Player2)
    local h = false
        while h == false do
            print("Selecione um card:")
            print("0 - Nenhum")
            Functions.printzone(Player1.deck)
            local opcao = tonumber(io.read())
            if opcao ~= nil and opcao == 0 then
                h = true
            elseif opcao ~= nil and opcao <= #Player1.deck then
                Player1.hand[#Player1.hand+1] = Player1.deck[opcao]
                while opcao <= #Player1.deck do
                    Player1.deck[opcao] = Player1.deck[opcao+1]
                    opcao = opcao+1
                end
                h = true
            else
                print("SELECIONE UMA OPÇÃO VÁLIDA!")
            end
        end
        Functions.shuffle2(Player1.deck)
        Functions.damage(Player1,17)
        print(Player1.name.." perdeu 17 de life.")
    end
}
Cards.Selecionar = {
    name = "Selecionar",
    power = nil,
    cost = 0,
    type = "Support",
    stamina = nil,
    description = "Olhe os dois cards do topo de seu deck, adicione um à sua mão e o outro ao seu cemitério. Você perde 12 de life.",
    effect = function(Player1,Player2)--------talvez transformar em tabela
        local h = false
        local topo = {Player1.deck[#Player1.deck],Player1.deck[#Player1.deck-1]}
        Player1.deck[#Player1.deck] = nil
        Player1.deck[#Player1.deck] = nil
        while h == false do
            print("Selecione um card:")
            print("0 - Nenhum")
            Functions.printzone(topo)
            local opcao = tonumber(io.read())
            if opcao ~= nil and opcao == 0 then
                h = true
            elseif opcao ~= nil and opcao <= #topo and opcao > 0 then
                Player1.hand[#Player1.hand+1] = topo[opcao]
                if opcao == 1 then
                    Player1.graveyard[#Player1.graveyard+1] = topo[2]
                    topo = {}
                elseif opcao == 2 then
                    Player1.graveyard[#Player1.graveyard+1] = topo[1]
                    topo = {}
                end
                Functions.damage(Player1,12)
                print(Player1.name.." perdeu 12 de life.")
                h = true
            else
                print("SELECIONE UMA OPÇÃO VÁLIDA!")
            end
        end
    end
}
Cards.Projetar = {
    name = "Projetar  ",
    power = nil,
    cost = 0,
    type = "Support",
    stamina = nil,
    description = "Adicione os três cards do topo de seu deck ao seu cemitério, depois embaralhe até três cards de seu cemitério em seu deck.",
    effect = function(Player1,Player2)
        Player1.graveyard[#Player1.graveyard+1] = Player1.deck[#Player1.deck]
        Player1.deck[#Player1.deck] = nil
        Player1.graveyard[#Player1.graveyard+1] = Player1.deck[#Player1.deck]
        Player1.deck[#Player1.deck] = nil
        Player1.graveyard[#Player1.graveyard+1] = Player1.deck[#Player1.deck]
        Player1.deck[#Player1.deck] = nil
        local h = 3
        while h > 0 do
            print("Você pode embaralhar até "..h.." cards em seu deck.")
            print("Selecione um card:")
            print("0 - Nenhum")
            Functions.printzone(Player1.graveyard)
            local opcao = tonumber(io.read())
            if opcao ~= nil and opcao == 0 then
                h = h-1
            elseif opcao ~= nil and opcao <= #Player1.graveyard and opcao > 0 then
                local card = Player1.graveyard[opcao]
                Player1.deck[#Player1.deck+1] = card
                print("O card "..card.name.."foi selecionado.")
                local j = Functions.find(Player1.graveyard,card)
                while j <= #Player1.graveyard do
                    Player1.graveyard[j] = Player1.graveyard[j+1]
                    j = j+1
                end
                h = h-1
            else
                print("SELECIONE UMA OPÇÃO VÁLIDA!")
            end
        end
        Functions.shuffle2(Player1.deck)
        print("O deck de "..Player1.name.." foi embaralhado.")
    end
}
---------------------------------AllyS------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Cards.Blinker = {
    name = "Blinker   ",
    power = nil,
    cost = 1,
    type = "Ally",
    stamina = 1,
    lealdade = 4,
    description = "ability: Selecione uma Unit sua. Exile-a e depois invoque-a novamente.",
    effect = {ability = function(Player1,Player2)
        local h = false
        while h == false do
            print("Selecione uma Unit:")
            print("0 - Nenhuma")
            Functions.printzone(Player1.field)
            local opcao = tonumber(io.read())
            if opcao ~= nil and opcao == 0 then
                h = true
            elseif opcao ~= nil and opcao <= #Player1.field and opcao > 0 then
                card = Player1.field[opcao]
                Functions.exilar(Player1.field[opcao],Player1,Player2)
                Functions.summon(card,Player1,Player2)
                h = true
            else
                print("SELECIONE UMA OPCAO VÁLIDA!")
            end
        end
    end
}
}
Cards.Seletor = {
    name = "Seletor   ",
    power = nil,
    cost = 1,
    type = "Ally",
    stamina = 1,
    lealdade = 3,
    description = "ability: Olhe os dois cards do topo de seu deck. Adicione um à sua mão e o outro ao seu cemitério.",
    effect = {ability = function(Player1,Player2)
        local h = false
        local topo = {Player1.deck[#Player1.deck],Player1.deck[#Player1.deck-1]}
        Player1.deck[#Player1.deck] = nil
        Player1.deck[#Player1.deck] = nil
        while h == false do
            print("Selecione um card:")
            print("0 - Nenhum")
            Functions.printzone(topo)
            local opcao = tonumber(io.read())
            if opcao ~= nil and opcao == 0 then
                h = true
            elseif opcao ~= nil and opcao <= #topo and opcao > 0 then
                Player1.hand[#Player1.hand+1] = topo[opcao]
                if opcao == 1 then
                    Player1.graveyard[#Player1.graveyard+1] = topo[2]
                    topo = {}
                elseif opcao == 2 then
                    Player1.graveyard[#Player1.graveyard+1] = topo[1]
                    topo = {}
                end
                h = true
            else
                print("SELECIONE UMA OPÇÃO VÁLIDA!")
            end
        end
    end
    }
}
Cards.Administrador = {
    name = "Admin.    ",
    power = nil,
    cost = 0,
    type = "Ally",
    stamina = 1,
    lealdade = 5,
    description = "ability: Compre dois cards e depois descarte dois cards.",
    effect = {ability = function(Player1,Player2)
    Functions.draw(Player1)
    Functions.draw(Player1)
    print(Player1.name.." comprou dois cards.")
    Functions.discard(Player1)
    Functions.discard(Player1)
    end
}
}

Cards.Librarian = {
    name = "Librarian",
    power = nil,
    cost = 0,
    type = "Ally",
    stamina = 1,
    lealdade = 3,
    description = "ability: Se você tiver pelo menos 5 cards na mão, compre um card.",
    effect = {ability = function(Player1,Player2)
    if #Player1.hand > 4 then
        Functions.draw(Player1)
        print(Player1.name.." comprou um card.")
    else
        print("VOCÊ TEM MENOS DO QUE 5 CARDS NA MÃO!!!")
    end
    end
}    
}
-- Cards.LordeCubo = {
--     name = "Lorde Cubo",
--     power = nil,
--     cost = 0,
--     type = "Ally",
--     stamina = 1,
--     lealdade = 10,
--     description = "ability: Escolha um - coloque o card do topo de seu deck no cubo; ou troque um card da sua mão por um card do cubo.",
--     effect = {ability = function(Player1,Player2)
--         local h = false
--         while h == false do
--             print("Escolha um:")
--             print("0 - Nenhum")
--             print("1 - Colocar o card do topo do deck no cubo")
--             print("2 - Trocar um card da mão por um card do cubo")
--             Functions.printzone(topo)
--             local opcao = tonumber(io.read())
--             if opcao ~= nil and opcao == 0 then
--                 h = true
--             elseif opcao == 1 then
--                 cubo[#cubo] = Player1.deck[#Player1.deck]
--                 Player1.deck[#Player1.deck] = nil
--                 h = true
--             elseif opcao == 2 then
--                 
--             else
--             end
--         end
--     end
--     }
-- }
-------------------MAGIA------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Cards.Providencia = {
    name = "Providência",
    power = nil,
    cost = 0,
    type = "Magic",
    stamina = nil,
    description = "Compre dois cards.",
effect = function(Player1,Player2)
    Functions.draw(Player1)
    Functions.draw(Player1)
    print(Player1.name.." comprou dois cards.")
end
}
Cards.Sorte = {
    name = "Sorte",
    power = nil,
    cost = 0,
    type = "Magic",
    stamina = nil,
    description = "Receba 2 de gold.",
effect = function(Player1,Player2)
    Functions.getgold(Player1)
    Functions.getgold(Player1)
    print(Player1.name.." recebeu 2 de gold.")
end
}
Cards.Suportar = {
    name = "Suportar",
    power = nil,
    cost = 0,
    type = "Magic",
    stamina = nil,
    description = "Procure em seu deck por um card de Support e adicione-o à sua mão, depois seu deck é embaralhado.",
effect = function(Player1,Player2)
    local h = false
    while h == false do
        print("Selecione um Support:")
        print("0 - Nenhum")
        Functions.printzone(Player1.deck)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 0 then
            h = true
        elseif opcao ~= nil and opcao <= #Player1.deck and Player1.deck[opcao].type == "Support" then
            Player1.hand[#Player1.hand+1] = Player1.deck[opcao]
            while opcao <= #Player1.deck do
                Player1.deck[opcao] = Player1.deck[opcao+1]
                opcao = opcao+1
            end
            h = true
        else
            print("SELECIONE UMA OPÇÃO VÁLIDA!")
        end
    end
    Functions.shuffle2(Player1.deck)
end
}
Cards.Recrutar = {
    name = "Recrutar  ",
    power = nil,
    cost = 0,
    type = "Magic",
    stamina = nil,
    description = "Procure em seu deck por um card de Unit e adicione-o à sua mão, depois seu deck é embaralhado.",
effect = function(Player1,Player2)
    local h = false
    while h == false do
        print("Selecione um Support:")
        print("0 - Nenhum")
        Functions.printzone(Player1.deck)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 0 then
            h = true
        elseif opcao ~= nil and opcao <= #Player1.deck and Player1.deck[opcao].type == "Unit" then
            Player1.hand[#Player1.hand+1] = Player1.deck[opcao]
            while opcao <= #Player1.deck do
                Player1.deck[opcao] = Player1.deck[opcao+1]
                opcao = opcao+1
            end
            h = true
        else
            print("SELECIONE UMA OPÇÃO VÁLIDA!")
        end
    end
    Functions.shuffle2(Player1.deck)
end
}
Cards.Renascer = {
    name = "Renascer  ",
    power = nil,
    cost = 0,
    type = "Magic",
    stamina = nil,
    zone = deck,
    description = "Invoque uma Unit de seu cemitério.",
effect = function(Player1,Player2)
    local h = false
    while h == false do
        print("Selecione uma Unit no seu cemitério:")
        print("0 - Nenhuma")
        Functions.printzone(Player1.graveyard)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 0 then
            h = true
        elseif Player1.graveyard[opcao].type == "Unit" then
            local card = Player1.graveyard[opcao]
            Functions.summon(card,Player1)
            print(card.name.." foi invocado!")
            while opcao <= #Player1.graveyard do
                Player1.graveyard[opcao] = Player1.graveyard[opcao+1]
                opcao = opcao+1
            end
            h = true
        else
            print("SELECIONE UMA OPÇÃO VÁLIDA!")
        end
    end
end
}
Cards.Recuperar = {
    name = "Recuperar ",
    power = nil,
    cost = 0,
    type = "Magic",
    stamina = nil,
    zone = deck,
    description = "Add a card from your graveyard to your hand.",
effect = function(Player1,Player2)
    local h = false
    while h == false do
        print("Selecione um card em seu cemitério:")
        print("0 - Nenhum")
        Functions.printzone(Player1.graveyard)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 0 then
            h = true
        elseif opcao ~= nil and opcao <= #Player1.graveyard then
           Player1.hand[#Player1.hand+1] = Player1.graveyard[opcao]
            while opcao <= #Player1.graveyard do
                Player1.graveyard[opcao] = Player1.graveyard[opcao+1]
                opcao = opcao+1
            end
           h = true
        else
            print("SELECIONE UMA OPÇÃO VÁLIDA!")
        end
    end
end
}
Cards.Eliminar = {
    name = "Eliminar  ",
    power = nil,
    cost = 0,
    type = "Magic",
    stamina = nil,
    description = "Destroy one of your opponent's units.",
effect = function(Player1,Player2)
    h = false
    while h == false do
        print("Selecione uma Unit para destroy:")
        print("0 - Nenhuma")
        Functions.printzone(Player2.field)
        opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 0 then
            h = true
        elseif opcao ~= nil and opcao <= #Player2.field and opcao > 0 then
            Functions.destroy(Player2.field[opcao],Player1,Player2,Player1)
            h = true
        else
            print("SELECIONE UMA OPÇÃO VÁLIDA! @.@")
        end
    end
end
}
-------------------EX------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Cards.ExDragon = {
    name = "Ex Dragon",
    power = 30,
    cost = 0,
    type = "Unit",
    stamina = 1,
    description = "If summoned, destroy a unit your opponent controls. ULTRA: Receive 3 gold.",
    origin = Cards.Dragon,
    effect = {ifsummoned = function(Player1,Player2)
        h = false
        while h == false do
            print("Select a unit to destroy:")
            print("0 - None")
            Functions.printzone(Player2.field)
            opcao = tonumber(io.read())
            if opcao ~= nil and opcao == 0 then
                h = true
            elseif opcao ~= nil and opcao <= #Player2.field and opcao > 0 then
                Functions.destroy(Player2.field[opcao],Player1,Player2,Player1)
                h = true
            else
                print("SELECT A VALID OPTION! @.@")
            end
        end
    end,
    ultra = function(Player1,Player2)
        Functions.getgold(Player1)
        Functions.getgold(Player1)
        Functions.getgold(Player1)
        print(Player1.name.." received 3 gold.")
    end
}
}

return Cards
