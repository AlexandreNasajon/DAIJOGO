local Player = require("Player")
local Functions = require("Functions")
local Cards = {}

-- Cards.LampDjinn = {
--     name = "Lamp Djinn  ",
--     power = 21,
--     cost = 3,
--     tipo = "Unit",
--     stamina = 1,
--     description = "If summoned, choose three: draw a card; or receive 1 gold; or gain 21 life; or add a support from your graveyard to your hand; or a unit gains 5 power; or a unit loses 7 power.",
--     effect = {ifsummoned = function(card,Player1,Player2)
--         local i = 3
--         while i > 0 do
--             print("Choose "..i..":")
--             print("1 - Draw a card")
--             print("2 - Receive 1 gold")
--             print("3 - Gain 21 life")
--             print("4 - Add a support from your graveyard to your hand")
--             print("5 - A unit gains 5 power")
--             print("6 - A unit loses 7 power")
--             local option = tonumber(io.read())
--             i = i-1
--         end
--     end
--     }
-- }
Cards.Traitor = {
    name = "Traitor   ",
    power = 10,
    cost = 1,
    tipo = "Unit",
    stamina = 1,
    description = "If destroyed, it is summoned on your opponent's field with its power raised by 2.",
    effect = {ifdies = function(card,Player1,Player2)
        card.power = card.power+2
        Functions.summon(card,Player2,Player1)
        print("Traitor was summoned on your opponent's field with its power raised by 2.")
    end
}
}
Cards.GreenSlime = {
    name = "Green Slime ",
    power = 12,
    cost = 1,
    tipo = "Unit",
    stamina = 1,
    description = "At the end of your turn, summon a copy of this unit.",
    effect = {ateot = function(card,Player1,Player2)
        tempcard = {}
        Functions.copiar(card,tempcard)
        Functions.summon(tempcard,Player1,Player2)
        tempcard = {}
    end
    }
}
Cards.Sphinx = {
    name = "Sphinx    ",
    power = 19,
    cost = 4,
    tipo = "Unit",
    stamina = 1,
    description = "Ability: Gain 4 life for each card in your hand. ULTRA: draw five cards.",
    effect = {ability = function(card,Player1,Player2)
        local x = #Player1.hand
        Functions.getlife(Player1,4*x)
        print(Player1.name.." gained "..4*x.." life.")
    end,
    ultra = function(card,Player1,Player2)
        Functions.draw(Player1)
        Functions.draw(Player1)
        Functions.draw(Player1)
        Functions.draw(Player1)
        Functions.draw(Player1)
    print(Player1.name.." drew five cards.")
end
}
}
Cards.MindKnight = {
    name = "MindKnight",
    power = 16,
    cost = 2,
    tipo = "Unit",
    stamina = 1,
    description = "If this destroys a unit, draw a card.",
    effect = {ifdestroys = function(card,Player1,Player2)
        Functions.draw(Player1)
        print(Player1.name.." drew a card.")
    end
}
}
Cards.GoldKnight = {
    name = "GoldKnight",
    power = 16,
    cost = 2,
    tipo = "Unit",
    stamina = 1,
    description = "If this destroys a unit, receive 1 gold.",
    effect = {ifdestroys = function(card,Player1,Player2)
        Functions.getgold(Player1)
        print(Player1.name.." received 1 gold.")
    end
}
}
Cards.Lich = {
    name = "Lich      ",
    power = 20,
    cost = 4,
    tipo = "Unit",
    stamina = 1,
    description = "Ability: Summon a unit from your graveyard.",
    effect = {ability = function(card,Player1,Player2)
    local h = false
    while h == false do
        print("Select a unit in your graveyard:")
        print("0 - None")
        Functions.printzone(Player1.graveyard)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 0 then
            h = true
        elseif Player1.graveyard[opcao].tipo == "Unit" then
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
    tipo = "Unit",
    stamina = 1,
    description = "If destroyed, search your deck for a unit card with power 10 or less and add it to your hand, then your deck is shuffled.",
    effect = {ifdies = function(card,Player1,Player2)
    local h = false
        while h == false do
            print("Select a unit with power 10 or less:")
            print("0 - None")
            Functions.printzone(Player1.deck)
            local opcao = tonumber(io.read())
            if opcao ~= nil and opcao == 0 then
                h = true
            elseif opcao ~= nil and opcao <= #Player1.deck and Player1.deck[opcao].tipo == "Unit" and Player1.deck[opcao].power < 11 then
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
    tipo = "Unit",
    stamina = 1,
    description = "If summoned, search your deck for a unit card with cost 1 or less and add it to your hand, then your deck is shuffled.",
    effect = {ifsummoned = function(card,Player1,Player2)
    local h = false
        while h == false do
            print("Select a unit with cost 1 or less:")
            print("0 - None")
            Functions.printzone(Player1.deck)
            local opcao = tonumber(io.read())
            if opcao ~= nil and opcao == 0 then
                h = true
            elseif opcao ~= nil and opcao <= #Player1.deck and Player1.deck[opcao].tipo == "Unit" and Player1.deck[opcao].cost < 2 then
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
Cards.Dragon = {
    name = "Dragon    ",
    power = 25,
    cost = 3,
    tipo = "Unit",
    stamina = 1,
    description = "If summoned, destroy a unit you control. ULTRA: receive 5 gold.",
    effect = {ifsummoned = function(card,Player1,Player2)
        local h = false
        while h == false do
            print("Destroy a unit you control:")
            Functions.printzone(Player1.field)
            local opcao = tonumber(io.read())
            if opcao ~= nil and opcao ~= 0 and opcao <= #Player1.field then
                Functions.destroy(Player1.field[opcao],Player1,Player1,Player2)
                h = true
            else
                print("YOU MUST DESTROY A UNIT YOU CONTROL!")
            end
        end
        end,
        ultra = function(card,Player1,Player2)
            Functions.getgold(Player1)
            Functions.getgold(Player1)
            Functions.getgold(Player1)
            Functions.getgold(Player1)
            Functions.getgold(Player1)
            print(Player1.name.." received 5 gold.")
        end
}
}
Cards.Elf = {
    name = "Elf       ",
    power = 6,
    cost = 1,
    tipo = "Unit",
    stamina = 1,
    description = "If summoned, you may have an enemy unit lose 6 power.",
    effect = {ifsummoned = function(card,Player1,Player2)
local h = false
    while h == false do
        print("Select a unit:")
        print("0 - None")
        Functions.printzone(Player2.field)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 0 then
            h = true
        elseif opcao <= #Player2.field and opcao > 0 then
            local card = Player2.field[opcao]
            card.power = card.power-6
            print(card.name.." lost 6 power.")
            h = true
        else
            print("SELECT A VALID OPTION!")
        end
    end
end
}
}
Cards.Angel = {
    name = "Angel     ",
    power = 18,
    cost = 2,
    tipo = "Unit",
    stamina = 1,
    description = "If summoned, shuffle seven 'Patch' cards into your deck.",
    effect = {ifsummoned = function(card,Player1,Player2)
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
        print("Seven 'Patch' cards were shuffle into "..Player1.name.." deck.")
    end
}
}
Cards.Gravedigger = {
    name = "Gravedigger",
    power = 10,
    cost = 1,
    tipo = "Unit",
    stamina = 1,
    description = "If summoned, add a unit from your graveyard to your hand.",
    effect = {ifsummoned = function(card,Player1,Player2)
    h = false
    while h == false do
        print("Add a unit from your graveyard to your hand:")
        print("0 - None")
            Functions.printzone(Player1.graveyard)
            opcao = tonumber(io.read())
            if opcao ~= nil and opcao == 0 then
                h = true
            elseif opcao ~= nil and opcao <= #Player1.graveyard and opcao > 0 and Player1.graveyard[opcao].tipo == "Unit" then
                Player1.hand[#Player1.hand+1] = Player1.graveyard[opcao]
                while opcao <= #Player1.graveyard do
                    Player1.graveyard[opcao] = Player1.graveyard[opcao+1]
                    opcao = opcao+1
                end
                h = true
            else
                print("No unit was added to your hand.")
                h = true
            end
    end
    end
}
}
Cards.Archaeologist = {
    name = "Archaeologist",
    power = 7,
    cost = 1,
    tipo = "Unit",
    stamina = 1,
    description = "If summoned, add a support from your graveyard to your hand.",
    effect = {ifsummoned = function(card,Player1,Player2)
    h = false
    while h == false do
        print("Add a support from your graveyard to your hand:")
        print("0 - None")
            Functions.printzone(Player1.graveyard)
            opcao = tonumber(io.read())
            if opcao ~= nil and opcao == 0 then
                h = true
            elseif opcao ~= nil and opcao <= #Player1.graveyard and opcao > 0 and Player1.graveyard[opcao].tipo == "Support" then
                Player1.hand[#Player1.hand+1] = Player1.graveyard[opcao]
                while opcao <= #Player1.graveyard do
                    Player1.graveyard[opcao] = Player1.graveyard[opcao+1]
                    opcao = opcao+1
                end
                h = true
            else
                print("No support was added to your hand.")
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
    tipo = "Unit",
    stamina = 1,
    description = "Ability: Storm +5. ULTRA: add a 'Brainstorm', a 'Firestorm' and a 'Lifestorm' cards to your hand.",
    effect = {ability = function(card,Player1,Player2)
        Functions.storm(Player1,5)
    end,
        ultra = function(card,Player1,Player2)
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
        print("The cards 'Brainstorm','Firestorm' and 'Lifestorm' were added to "..Player1.name.." hand.")
    end
}
}
Cards.Stormbringer = {
    name = "Stormbringer ",
    power = 12,
    cost = 1,
    tipo = "Unit",
    stamina = 1,
    description = "Ability: Storm +2.",
    effect = {ability = function(card,Player1,Player2)
        Functions.storm(Player1,2)
    end
}
}
Cards.Vampire = {
    name = "Vampire   ",
    power = 13,
    cost = 1,
    tipo = "Unit",
    stamina = 1,
    description = "If summoned, gain 13 life and your opponent loses 13 life.",
    effect = {ifsummoned = function(card,Player1,Player2)
        Functions.getlife(Player1,13)
        Functions.damage(Player2,13)
    print(Player1.name.." gained 13 life and "..Player2.name.." lost 13 life.")
    end
}
}
Cards.Demon = {
    name = "Demon       ",
    power = 17,
    cost = 2,
    tipo = "Unit",
    stamina = 1,
    description = "If summoned, draw two cards and lose 20 life.",
    effect = {ifsummoned = function(card,Player1,Player2)
        Functions.draw(Player1)
        Functions.draw(Player1)
        Functions.damage(Player1,20)
        print(Player1.name.." drew two cards and lost 20 life.")
    end
}
}
Cards.RedAristocrat = {
    name = "Red Arist.",
    power = 12,
    cost = 1,
    tipo = "Unit",
    stamina = 1,
    description = "Ability: Destroy a unit you control to have this unit gain 4 power.",
    effect = {ability = function(card,Player1,Player2)
        print("Destroy a unit you control:")
        Functions.printzone(Player1.field)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao <= #Player1.field and opcao > 0  then
            Functions.destroy(Player1.field[opcao],Player1,Player1,Player2)
            card.power = card.power+4
            print(Player2.name.." gained 4 power.")
        else
            print("No unit was destroyed, so nothing happened.")
        end
    end
}
}
Cards.BlueAristocrat = {
    name = "Blue Arist.",
    power = 12,
    cost = 1,
    tipo = "Unit",
    stamina = 1,
    description = "Ability: Destroy a unit you control to draw a card.",
    effect = {ability = function(card,Player1,Player2)
        print("Destroy a unit you control:")
        Functions.printzone(Player1.field)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao <= #Player1.field and opcao > 0  then
            Functions.destroy(Player1.field[opcao],Player1,Player1,Player2)
            Functions.draw(Player1)
            print(Player1.name.." drew a card.")
        else
            print("No unit was destroyed, so nothing happened.")
        end
    end
}
}
Cards.YellowAristocrat = {
    name = "Yellow Arist.",
    power = 12,
    cost = 1,
    tipo = "Unit",
    stamina = 1,
    description = "Ability: Destroy a unit you control to receive 1 gold.",
    effect = {ability = function(card,Player1,Player2)
        print("Destroy a unit you control:")
        Functions.printzone(Player1.field)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao <= #Player1.field and opcao > 0 then
            Functions.destroy(Player1.field[opcao],Player1,Player1,Player2)
            Functions.getgold(Player1)
            print(Player1.name.." received 1 gold")
        else
            print("No unit was destroyed, so nothing happened.")
        end
    end
}
}
Cards.GreenAristocrat = {
    name = "Green Arist.",
    power = 12,
    cost = 1,
    tipo = "Unit",
    stamina = 1,
    description = "Ability: Destroy a unit you control to gain 20 life.",
    effect = {ability = function(card,Player1,Player2)
        print("Destroy a unit you control:")
        Functions.printzone(Player1.field)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao <= #Player1.field and opcao > 0  then
            Functions.destroy(Player1.field[opcao],Player1,Player1,Player2)
            Functions.getlife(Player1,20)
            print(Player1.name.." gained 20 life.")
        else
            print("No unit was destroyed, so nothing happened.")
        end
    end
}
}
Cards.Gnome = {
    name = "Gnome     ",
    power = 7,
    cost = 1,
    tipo = "Unit",
    stamina = 1,
    description = "If destroyed, draw a card.",
    effect = {ifdies = function(card,Player1,Player2)
        Functions.draw(Player1)
        print(Player1.name.." drew a card.")
    end
}
}
Cards.Dwarf = {
    name = "Dwarf     ",
    power = 8,
    cost = 1,
    tipo = "Unit",
    stamina = 1,
    description = "If destroyed, receive 1 gold.",
    effect = {ifdies = function(card,Player1,Player2)
        Functions.getgold(Player1)
        print(Player1.name.." received 1 gold.")
    end
}
}
Cards.Mage = {
    name = "Mage      ",
    power = 9,
    cost = 1,
    tipo = "Unit",
    stamina = 1,
    description = "Ability: draw two cards then discard two cards.",
    effect = {ability = function(card,Player1,Player2)
        Functions.draw(Player1)
        Functions.draw(Player1)
        print(Player1.name.." drew two cards.")
        Functions.discard(Player1)
        Functions.discard(Player1)
        print(Player1.name.." discarded two cards.")
    end
}
}
Cards.Serpent = {
    name = "Serpent   ",
    power = 5,
    cost = 1,
    tipo = "Unit",
    stamina = 1,
    description = "If you discard this card from your hand, you may pay 7 life to add it to your hand.",
    effect = {ifdiscarded = function(card,Player1,Player2)
        print("Pay 7 life to add Serpent to your hand?")
        print("1 - Yes")
        print("2 - No")
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 1 then
            tempcard = {}
            Functions.copiar(Cards.Serpente,tempcard)
            Player1.hand[#Player1.hand+1] = tempcard
            tempcard = {}
            print(Player1.name.." lost 7 life and Serpent was added to that player's hand.")
        else
            print("Serpent was not added to your hand.")
        end
    end
}
}
Cards.Healer = {
    name = "Healer      ",
    power = 9,
    cost = 1,
    tipo = "Unit",
    stamina = 1,
    description = "If summoned, gain 18 life.",
    effect = {ifsummoned = function(card,Player1,Player2)
        Functions.getlife(Player1,18)
        print(Player1.name.." gained 18 life.")
    end
}
}
Cards.Golem = {
    name = "Golem       ",
    power = 16,
    cost = 2,
    tipo = "Unit",
    stamina = 1,
    description = "If summoned, gain 12 life. If destroyed, draw a card.",
effect = {ifsummoned = function(card,Player1,Player2)
        Functions.getlife(Player1,12)
        print(Player1.name.." gained 12 life.")
    end,
    ifdies = function(card,Player1,Player2)
        Functions.draw(Player1)
        print(Player1.name.." drew a card.")
    end
}
}
Cards.Debtor = {
    name = "Debtor      ",
    power = 14,
    cost = 1,
    tipo = "Unit",
    stamina = 1,
    description = "If summoned, draw a card and gain 10 life. If destroyed, discard a card and you lose 20 life..",
    effect = {ifsummoned = function(card,Player1,Player2)
        Functions.draw(Player1)
        Functions.getlife(Player1,10)
        print(Player1.name.."drew a card and gained 10 life.")
    end,
    ifdies = function(Player1)
    if #Player1.hand > 0 then
        Functions.discard(Player1)
        print(Player1.name.." discarded a card.")
    end
    Functions.damage(Player1,20)
    print(Player1.name.." lost 20 life.")
end
}
}
Cards.Troll = {
    name = "Troll     ",
    power = 10,
    cost = 1,
    tipo = "Unit",
    stamina = 1,
    description = "If summoned, draw a card and you lose 8 life..",
effect = {ifsummoned = function(card,Player1,Player2)
        Functions.draw(Player1)
        Functions.damage(Player1,8)
        print(Player1.name.." drew a card and lost 8 life.")
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
Cards.Impulse= {
    name = "Impulse     ",
    power = nil,
    cost = 0,
    tipo = "Support",
    stamina = nil,
    description = "Draw two cards and you lose 20 life.",
effect = function(card,Player1,Player2)
    Functions.draw(Player1)
    Functions.draw(Player1)
    Functions.damage(Player1,20)
    print(Player1.name.." drew two cards and lost 20 life.")
end
}
Cards.Fury = {
    name = "Fury        ",
    power = nil,
    cost = 0,
    tipo = "Support",
    stamina = nil,
    description = "A unit you control gains 5 power.",
effect = function(card,Player1,Player2)
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
Cards.Sicken = {
    name = "Sicken      ",
    power = nil,
    cost = 0,
    tipo = "Support",
    stamina = nil,
    description = "An enemy unit loses 7 power.",
effect = function(card,Player1,Player2)
local h = false
    while h == false do
        print("Select a unit:")
        print("0 - None")
        Functions.printzone(Player2.field)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 0 then
            h = true
        elseif opcao <= #Player2.field and opcao > 0 then
            local card = Player2.field[opcao]
            card.power = card.power-7
            print(card.name.." lost 7 power.")
            h = true
        else
            print("SELECT A VALID OPTION!")
        end
    end
end
}
Cards.Investida = {
    name = "Investida ",
    power = nil,
    cost = 0,
    tipo = "Support",
    stamina = nil,
    description = "Storm +1; Uma Unit recebe energia adicional para atacar ou ativar uma ability neste turn.",
effect = function(card,Player1,Player2)
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
    tipo = "Support",
    stamina = nil,
    description = "Storm +3.",
effect = function(card,Player1,Player2)
    Functions.storm(Player1,3)
end
}
Cards.Remendar = {
    name = "Remendar  ",
    power = nil,
    cost = 0,
    tipo = "Support",
    stamina = nil,
    description = "Storm +1; Compre um card e ganhe 7 de life.",
effect = function(card,Player1,Player2)
    Player1.storm = Player1.storm+1
    print(Player1.name.." aumentou seu storm em 1.")
    Functions.draw(Player1)
    Functions.getlife(Player1,7)
    print(Player1.name.." comprou um card e ganhou 7 de life.")
end
}
Cards.Greed = {
    name = "Greed       ",
    power = nil,
    cost = 0,
    tipo = "Support",
    stamina = nil,
    description = "Receive 1 gold.",
effect = function(card,Player1,Player2)
    Functions.getgold(Player1)
    print(Player1.name.." received 1 gold.")
end
}
Cards.SellSoul = {
    name = "Sell Soul   ",
    power = nil,
    cost = 0,
    tipo = "Support",
    stamina = nil,
    description = "Receive 2 gold and you lose 20 life.",
effect = function(card,Player1,Player2)
    Functions.getgold(Player1)
    Functions.getgold(Player1)
    Functions.damage(Player1,20)
    print(Player1.name.." received 2 gold and lost 20 life.")
end
}
Cards.Escravidao = {
    name = "Escravidão",
    power = nil,
    cost = 0,
    tipo = "Support",
    stamina = nil,
    description = "Sacrifique uma Unit. Se fizer isso, receba 2 de gold.",
effect = function(card,Player1,Player2)
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
    tipo = "Support",
    stamina = nil,
    description = "Sacrifique uma Unit. Se fizer isso, compre dois cards.",
effect = function(card,Player1,Player2)
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
            Functions.destroy(card,Player1,Player1,Player2)
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
--     tipo = "Support",
--     stamina = nil,
--     description = "Descarte um card. Se fizer isso, receba 2 de gold.",
-- effect = function(card,Player1,Player2)
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
    tipo = "Support",
    stamina = nil,
    description = "Storm +1; Causa 15 de damage ao oponente.",
effect = function(card,Player1,Player2)
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
    tipo = "Support",
    stamina = nil,
    description = "Storm +1; Cada Player compra um card.",
effect = function(card,Player1,Player2)
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
    tipo = "Support",
    stamina = nil,
    description = "Storm +1; Ganhe 10 de life e causa 10 de damage ao oponente.",
effect = function(card,Player1,Player2)
    Player1.storm = Player1.storm+1
    print(Player1.name.." aumentou seu storm em 1.")
    Functions.getlife(Player1,10)
    Functions.damage(Player2,10)
    print(Player1.name.." ganhou 10 de life e "..Player2.name.." perdeu 10 de life.")
end
}
Cards.Destroy = {
    name = "Destroy   ",
    power = nil,
    cost = 1,
    tipo = "Support",
    stamina = nil,
    description = "Destrua uma Unit de seu oponente.",
effect = function(card,Player1,Player2)
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
    tipo = "Support",
    stamina = nil,
    description = "Destrua uma Unit de seu oponente com power menor ou igual a 10.",
effect = function(card,Player1,Player2)
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
    tipo = "Support",
    stamina = nil,
    description = "Compre dois cards.",
effect = function(card,Player1,Player2)
    Functions.draw(Player1)
    Functions.draw(Player1)
    print(Player1.name.." comprou dois cards.")
end
}
Cards.Concentrate = {
    name = "Concentrate",
    power = nil,
    cost = 0,
    tipo = "Support",
    stamina = nil,
    description = "If your storm is 3 or more, draw a card; then if your storm is 7 or more, draw an additional card.",
effect = function(card,Player1,Player2)
    if Player1.storm > 2 then
        Functions.draw(Player1)
        print(Player1.name.." drew a card.")
    end
    if Player1.storm > 6 then
        Functions.draw(Player1)
        print(Player1.name.." drew an additional card.")
    end
end    
}
Cards.Espiar = {
    name = "Espiar    ",
    power = nil,
    cost = 0,
    tipo = "Support",
    stamina = nil,
    description = "Compre um card e depois olhe a mão de seu oponente. Você perde 10 de life.",
effect = function(card,Player1,Player2)
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
    tipo = "Support",
    stamina = nil,
    zone = deck,
    description = "Adicione um card de seu cemitério à sua mão.",
effect = function(card,Player1,Player2)
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
    tipo = "Support",
    stamina = nil,
    zone = deck,
    description = "Invoque uma Unit de seu cemitério.",
effect = function(card,Player1,Player2)
    local h = false
    while h == false do
        print("Selecione uma Unit no seu cemitério:")
        print("0 - Nenhuma")
        Functions.printzone(Player1.graveyard)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 0 then
            h = true
        elseif Player1.graveyard[opcao].tipo == "Unit" then
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
    tipo = "Support",
    stamina = nil,
    zone = deck,
    description = "Invoque uma Unit de seu cemitério. Você perde 15 de life.",
effect = function(card,Player1,Player2)
    local h = false
    while h == false do
        print("Selecione uma Unit no seu cemitério:")
        print("0 - Nenhuma")
        Functions.printzone(Player1.graveyard)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 0 then
            h = true
        elseif opcao ~= nil and Player1.graveyard[opcao].tipo == "Unit" then
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
    tipo = "Support",
    stamina = nil,
    description = "Procure em seu deck por um card e adicione-o à sua mão, depois seu deck é embaralhado. Você perde 17 de life.",
    effect = function(card,Player1,Player2)
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
    tipo = "Support",
    stamina = nil,
    description = "Olhe os dois cards do topo de seu deck, adicione um à sua mão e o outro ao seu cemitério. Você perde 12 de life.",
    effect = function(card,Player1,Player2)--------talvez transformar em tabela
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
    tipo = "Support",
    stamina = nil,
    description = "Adicione os três cards do topo de seu deck ao seu cemitério, depois embaralhe até três cards de seu cemitério em seu deck.",
    effect = function(card,Player1,Player2)
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
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Cards.Blinker = {
    name = "Blinker   ",
    power = nil,
    cost = 1,
    tipo = "Ally",
    stamina = 1,
    loyalty = 4,
    description = "ability: Selecione uma Unit sua. Exile-a e depois invoque-a novamente.",
    effect = {ability = function(card,Player1,Player2)
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
    tipo = "Ally",
    stamina = 1,
    loyalty = 3,
    description = "Ability: Olhe os dois cards do topo de seu deck. Adicione um à sua mão e o outro ao seu cemitério.",
    effect = {ability = function(card,Player1,Player2)
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
    tipo = "Ally",
    stamina = 1,
    loyalty = 5,
    description = "Ability: Compre dois cards e depois descarte dois cards.",
    effect = {ability = function(card,Player1,Player2)
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
    tipo = "Ally",
    stamina = 1,
    loyalty = 3,
    description = "Ability: Se você tiver pelo menos 5 cards na mão, compre um card.",
    effect = {ability = function(card,Player1,Player2)
    if #Player1.hand > 4 then
        Functions.draw(Player1)
        print(Player1.name.." comprou um card.")
    else
        print("VOCÊ TEM MENOS DO QUE 5 CARDS NA MÃO!!!")
    end
    end
}    
}
Cards.StormPriest = {
    name = "Storm Priest",
    power = nil,
    cost = 1,
    tipo = "Ally",
    stamina = 1,
    loyalty = 5,
    description = "Ability: Storm +3.",
    effect = {ability = function(card,Player1,Player2)
        Functions.storm(Player1,3)
    end
}    
}
-- Cards.CubeLord = {
--     name = "Cube Lord",
--     power = nil,
--     cost = 0,
--     tipo = "Ally",
--     stamina = 1,
--     loyalty = 12,
--     description = "Ability: Choose one - Add the top card of your deck to the Cube; or add a card from the Cube to your hand then add a card from your hand to the Cube.",
--     effect = {ability = function(card,Player1,Player2)
--         if cube ~= {} then problema aquiAQUIAQUIAQUIAQUIAQUIAQUIAQUIAQUIAQUIAQUI
--             local cube = {}
--             local h = false
--             while h == false do
--                 print("Choose one:")
--                 print("0 - None")
--                 print("1 - Add the top card of your deck to the Cube")
--                 print("2 - Switch a card from your hand with one from the Cube")
--                 local opcao = tonumber(io.read())
--                 if opcao == 0 then
--                     h = true
--                 elseif opcao == 1 then
--                     cube[#cube+1] = Player1.deck[#Player1.deck]
--                     Player1.deck[#Player1.deck] = nil
--                     h = true
--                 elseif opcao == 2 then
--                     local c = false
--                     while c == false do
--                         print("Add a card from the Cube to your hand:")
--                         Functions.printzone(cube)
--                         local option = tonumber(io.read())
--                         if option <= #cube then
--                             Player1.hand[#Player1.hand+1] = cube[option]
--                             while option <= #cube do
--                                 cube[option] = cube[option+1]
--                                 option = option+1
--                             end
--                             c = true
--                         else
--                             print("SELECT A VALID OPTION! :X")
--                         end
--                         
--                         local g = false
--                         while g == false do
--                             print("Add a card from your hand to the Cube:")
--                             Functions.printzone(Player1.hand)
--                             local option = tonumber(io.read())
--                             if option <= #Player1.hand and option > 0 then
--                                 cube[#cube+1] = Player1.hand[option]
--                                 while option <= #Player1.hand do
--                                     Player1.hand[option] = Player1.hand[option+1]
--                                     option = option+1
--                                 end
--                                 g = true
--                             else
--                                 print("SELECT A VALID OPTION! >.<")
--                             end
--                         end
--                     end
--                 else
--                     print("SELECT A VALID OPTION!")
--                 end
--             end
--         end
--     end
--     }
-- }
-------------------MAGIC------------------------------------------------------------------------------------------------------------------------------------------------------------
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
Cards.Providencia = {
    name = "Providência",
    power = nil,
    cost = 0,
    tipo = "Spell",
    stamina = nil,
    description = "Compre dois cards.",
effect = function(card,Player1,Player2)
    Functions.draw(Player1)
    Functions.draw(Player1)
    print(Player1.name.." comprou dois cards.")
end
}
Cards.Sorte = {
    name = "Sorte",
    power = nil,
    cost = 0,
    tipo = "Spell",
    stamina = nil,
    description = "Receba 2 de gold.",
effect = function(card,Player1,Player2)
    Functions.getgold(Player1)
    Functions.getgold(Player1)
    print(Player1.name.." recebeu 2 de gold.")
end
}
Cards.Suportar = {
    name = "Suportar",
    power = nil,
    cost = 0,
    tipo = "Spell",
    stamina = nil,
    description = "Procure em seu deck por um card de Support e adicione-o à sua mão, depois seu deck é embaralhado.",
effect = function(card,Player1,Player2)
    local h = false
    while h == false do
        print("Selecione um Support:")
        print("0 - Nenhum")
        Functions.printzone(Player1.deck)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 0 then
            h = true
        elseif opcao ~= nil and opcao <= #Player1.deck and Player1.deck[opcao].tipo == "Support" then
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
    tipo = "Spell",
    stamina = nil,
    description = "Procure em seu deck por um card de Unit e adicione-o à sua mão, depois seu deck é embaralhado.",
effect = function(card,Player1,Player2)
    local h = false
    while h == false do
        print("Selecione um Support:")
        print("0 - Nenhum")
        Functions.printzone(Player1.deck)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 0 then
            h = true
        elseif opcao ~= nil and opcao <= #Player1.deck and Player1.deck[opcao].tipo == "Unit" then
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
    tipo = "Spell",
    stamina = nil,
    zone = deck,
    description = "Invoque uma Unit de seu cemitério.",
effect = function(card,Player1,Player2)
    local h = false
    while h == false do
        print("Selecione uma Unit no seu cemitério:")
        print("0 - Nenhuma")
        Functions.printzone(Player1.graveyard)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 0 then
            h = true
        elseif Player1.graveyard[opcao].tipo == "Unit" then
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
    tipo = "Spell",
    stamina = nil,
    zone = deck,
    description = "Add a card from your graveyard to your hand.",
effect = function(card,Player1,Player2)
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
    tipo = "Spell",
    stamina = nil,
    description = "Destroy one of your opponent's units.",
effect = function(card,Player1,Player2)
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
Cards.LayWaste = {
    name = "Lay Waste",
    power = nil,
    cost = 0,
    tipo = "Spell",
    stamina = nil,
    description = "Destroy all units.",
    effect = function(card,Player1,Player2)
    while #Player1.field > 0 do
        Functions.destroy(Player1.field[#Player1.field],Player1,Player1,Player2)
    end
    while #Player2.field > 0 do
        Functions.destroy(Player2.field[#Player2.field],Player1,Player2,Player1)
    end
end
}
Cards.Brainstorm = {
    name = "Brainstorm",
    power = nil,
    cost = 0,
    tipo = "Spell",
    stamina = nil,
    description = "Draw X cards then discard four cards; X = storm.",
effect = function(card,Player1,Player2)
    i = Player1.storm
    while i > 0 do
        Functions.draw(Player1)
        i = i-1
    end
    Functions.discard(Player1)
    Functions.discard(Player1)
    Functions.discard(Player1)
    Functions.discard(Player1)
    print(Player1.name.." drew "..Player1.storm.." cards.")
end    
}
Cards.Firestorm = {
    name = "Firestorm ",
    power = nil,
    cost = 0,
    tipo = "Spell",
    stamina = nil,
    description = "Causa 3X de damage ao oponente; X = storm.",
effect = function(card,Player1,Player2)
    Functions.damage(Player2,3*Player1.storm)
    print(Player2.name.." perdeu "..3*Player1.storm.." de life.")
end
}
Cards.Lifestorm = {
    name = "Lifestorm ",
    power = nil,
    cost = 0,
    tipo = "Spell",
    stamina = nil,
    description = "Ganhe 5X de life; X = storm.",
effect = function(card,Player1,Player2)
    Functions.getlife(Player1,5*Player1.storm)
    print(Player1.name.." ganhou "..5*Player1.storm.." de life.")
end
}
Cards.AsCaras = {
    name = "As Caras    ",
    power = nil,
    cost = 0,
    tipo = "Spell",
    stamina = nil,
    description = "Copie o effect do último Support que você conjurou.",
effect = function(card,Player1,Player2)
    if Player1.lastsupport.effect ~= nil and Player1.lastsupport ~= {} and Player1.lastsupport.name ~= "As Caras  " then
        Player1.lastsupport.effect(Player1,Player2)
    else
        print("VOCÊ PRECISA cast UM Support ANTES DE JOGAR ESTE CARD! >.<")
    end
end
}
Cards.LevelUp = {
    name = "Level Up    ",
    power = nil,
    cost = 0,
    tipo = "Spell",
    stamina = nil,
    description = "Your level is raised by 1.",
    effect = function(card,Player1,Player2)
    Player1.level = Player1.level+1
    print(Player1.name.."'s level was raised by 1 and is now "..Player1.level..".")
end
}
-------------------TOTEM------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Cards.MindTotem = {
    name = "Mind Totem  ",
    power = nil,
    cost = 0,
    tipo = "Totem",
    stamina = nil,
    description = "At the end of your turn, if you have exactly five cards in your hand, draw a card.",
    effect = {ateot = function(card,Player1,Player2)
        if #Player1.hand == 5 then
            Functions.draw(Player1)
            print(Player1.name.." drew a card.")
        end
    end
    }
}
Cards.BurnTotem = {
    name = "Burn Totem  ",
    power = nil,
    cost = 0,
    tipo = "Totem",
    stamina = nil,
    description = "At the end of your turn, if you have 25 or less life, your opponent loses 10 life.",
    effect = {ateot = function(card,Player1,Player2)
        if #Player1.life < 26 then
            Functions.damage(Player2,10)
            print(Player2.name.." lost 10 life.")
        end
    end
    }
}
Cards.AngelicTotem = {
    name = "Angelic Totem",
    power = nil,
    cost = 0,
    tipo = "Totem",
    stamina = nil,
    description = "At the end of your turn, if you have 107 or more life, summon an 'Angel'.",
    effect = {ateot = function(card,Player1,Player2)
        if #Player1.life > 106 then
            tempcard = {}
            Functions.copiar(Cards.Angel,tempcard)
            Functions.summon(tempcard,Player1,Player2)
            tempcard = {}
        end
    end
    }
}
Cards.GrowthTotem = {
    name = "Growth Totem",
    power = nil,
    cost = 0,
    tipo = "Totem",
    stamina = nil,
    description = "At the end of your turn, if your level is 4 or higher, draw a card and receive 1 gold.",
    effect = {ateot = function(card,Player1,Player2)
        if Player1.level > 3 then
            Functions.draw(Player1)
            Functions.getgold(Player1)
            print(Player1.name.." drew a card and receive 1 gold.")
        end
    end
    }
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
    tipo = "Unit",
    stamina = 1,
    description = "If summoned, destroy a unit your opponent controls. ULTRA: Receive 3 gold.",
    origin = Cards.Dragon,
    effect = {ifsummoned = function(card,Player1,Player2)
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
    ultra = function(card,Player1,Player2)
        Functions.getgold(Player1)
        Functions.getgold(Player1)
        Functions.getgold(Player1)
        print(Player1.name.." received 3 gold.")
    end
}
}

return Cards
