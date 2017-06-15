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
Cards.CascadeKeeper = {
    name = "Cascade Keeper",
    power = 16,
    cost = 3,
    tipo = "Unit",
    stamina = 1,
    description = "If summoned for the first time, exile the top card of your deck; Play it without paying its cost.",
    z = 1,
    effect = {ifsummoned = function(card,Player1,Player2)
        if card.z == 1 and #Player1.deck > 1 then
            local card1 = Player1.deck[#Player1.deck]
            Player1.exile[#Player1.exile+1] = card1
            Player1.deck[#Player1.deck] = nil
            print(card1.name.." was exiled.")
            
            Functions.play(card1,Player1,Player2)
            
            card.z = 0
        end
    end
}
}
Cards.GraveBetrayer = {
    name = "Grave Betrayer",
    power = 6,
    cost = 1,
    tipo = "Unit",
    stamina = 1,
    description = "If destroyed, it is summoned on your opponent's field with its power raised by 2.",
    effect = {ifdies = function(card,Player1,Player2)
        card.power = card.power+2
        Functions.summon(card,Player2,Player1)
        print("Grave Betrayer was summoned on your opponent's field with its power raised by 2.")
    end
}
}
Cards.ReplicatorOoze = {
    name = "Replicator Ooze",
    power = 8,
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
Cards.CyanSphinx = {
    name = "Cyan Sphinx",
    power = 16,
    cost = 3,
    tipo = "Unit",
    stamina = 1,
    description = "Ability: Gain 3 life for each card in your hand. ULTRA: draw three cards.",
    effect = {ability = function(card,Player1,Player2)
        local x = #Player1.hand
        Functions.getlife(Player1,3*x)
        print(Player1.name.." gained "..3*x.." life.")
    end,
    ultra = function(card,Player1,Player2)
        Functions.draw(Player1)
        Functions.draw(Player1)
        Functions.draw(Player1)
    print(Player1.name.." drew three cards.")
end
}
}
Cards.MindfulKnight = {
    name = "Mindful Knight",
    power = 14,
    cost = 2,
    tipo = "Unit",
    stamina = 1,
    description = "If this destroys a unit, draw a card.",
    effect = {ifdestroys = function(card,Player1,Player2,victim)
        Functions.draw(Player1)
        print(Player1.name.." drew a card.")
    end
}
}
Cards.GoldenKnight = {
    name = "Golden Knight",
    power = 14,
    cost = 2,
    tipo = "Unit",
    stamina = 1,
    description = "If this destroys a unit, receive 1 gold.",
    effect = {ifdestroys = function(card,Player1,Player2,victim)
        Functions.getgold(Player1)
        print(Player1.name.." received 1 gold.")
    end
}
}
Cards.CollectorLich = {
    name = "Collector Lich",
    power = 18,
    cost = 3,
    tipo = "Unit",
    stamina = 1,
    description = "If this destroys a unit, summon that unit.",
    effect = {ifdestroys = function(card,Player1,Player2,victim)
        local j = Functions.find(Player2.graveyard,victim)
        while j <= #Player2.graveyard do
            Player2.graveyard[j] = Player2.graveyard[j+1]
            j = j+1
        end
        Functions.summon(victim,Player1,Player2)
end
}
}
Cards.SoulGuide = {
    name = "Soul Guide    ",
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
Cards.ArmyRecruiter = {
    name = "Army Recruiter",
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
Cards.DevourerDragon = {
    name = "Devourer Dragon",
    power = 20,
    cost = 3,
    tipo = "Unit",
    stamina = 1,
    description = "If summoned, destroy a unit you control. ULTRA: receive 3 gold.",
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
            print(Player1.name.." received 3 gold.")
        end
}
}
Cards.ElfTrickster = {
    name = "Elf Trickster",
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
Cards.MercifulAngel = {
    name = "Merciful Angel",
    power = 14,
    cost = 2,
    tipo = "Unit",
    stamina = 1,
    description = "If summoned, shuffle seven 'Angelic Patch' cards into your deck.",
    effect = {ifsummoned = function(card,Player1,Player2)
        tempcard = {}
        tempcard = Functions.copiar(Cards.AngelicPatch,tempcard)
        Player1.deck[#Player1.deck+1] = tempcard
        Player1.deck[#Player1.deck+1] = tempcard
        Player1.deck[#Player1.deck+1] = tempcard
        Player1.deck[#Player1.deck+1] = tempcard
        Player1.deck[#Player1.deck+1] = tempcard
        Player1.deck[#Player1.deck+1] = tempcard
        Player1.deck[#Player1.deck+1] = tempcard
        tempcard = {}
        Functions.shuffle2(Player1.deck)
        print("Seven 'Angelic Patch' cards were shuffle into "..Player1.name.." deck.")
    end
}
}
Cards.Gravedigger = {
    name = "Gravedigger",
    power = 9,
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
    name = "Archaeologist ",
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
    name = "Stormbringer",
    power = 12,
    cost = 1,
    tipo = "Unit",
    stamina = 1,
    description = "Ability: Storm +3.",
    effect = {ability = function(card,Player1,Player2)
        Functions.storm(Player1,3)
    end
}
}
Cards.VampireNoble = {
    name = "Vampire Noble",
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
Cards.ImpulsiveDemon = {
    name = "Impulsive Demon",
    power = 15,
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
    name = "Red Aristocrat",
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
    name = "Blue Aristocrat",
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
Cards.CoinAristocrat = {
    name = "Coin Aristocrat",
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
Cards.LifeAristocrat = {
    name = "Life Aristocrat",
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
Cards.GratefulGnome = {
    name = "Grateful Gnome",
    power = 5,
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
Cards.HonorableDwarf = {
    name = "Honorable Dwarf",
    power = 6,
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
Cards.PilgrimMage = {
    name = "Pilgrim Mage",
    power = 7,
    cost = 1,
    tipo = "Unit",
    stamina = 1,
    description = "Ability: draw two cards then discard two cards.",
    effect = {ability = function(card,Player1,Player2)
        Functions.draw(Player1)
        Functions.draw(Player1)
        print(Player1.name.." drew two cards.")
        Functions.discard(Player1,Player2)
        Functions.discard(Player1,Player2)
        print(Player1.name.." discarded two cards.")
    end
}
}
Cards.BlackSerpent = {
    name = "Black Serpent",
    power = 3,
    cost = 1,
    tipo = "Unit",
    stamina = 1,
    description = "If you discard this card from your hand, you may pay 7 life to add it to your hand.",
    effect = {ifdiscarded = function(card,Player1,Player2)
        print("Pay 7 life to add Black Serpent to your hand?")
        print("1 - Yes")
        print("2 - No")
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 1 then
            local j = Functions.find2(Player1.graveyard,card)
            while j <= #Player1.graveyard do
                Player1.graveyard[j] = Player1.graveyard[j+1]
                j = j+1
            end
            Player1.hand[#Player1.hand+1] = card
            Functions.damage(Player1,7)
            print(Player1.name.." lost 7 life and Black Serpent was added to that player's hand.")
        else
            print("Serpent was not added to your hand.")
        end
    end
}
}
Cards.WhiteSnake = {
    name = "White Snake",
    power = 3,
    cost = 1,
    tipo = "Unit",
    stamina = 1,
    description = "At end of turn, if this is in your graveyard, you may pay 7 life to add it to hand.",
    effect = {ateot = function(card,Player1,Player2)
        local j = Functions.find2(Player1.graveyard,card)
        if j ~= nil then
            print("Pay 7 life to add White Snake to your hand?")
            print("1 - Yes")
            print("2 - No")
            local opcao = tonumber(io.read())
            if opcao ~= nil and opcao == 1 then
                while j <= #Player1.graveyard do
                    Player1.graveyard[j] = Player1.graveyard[j+1]
                    j = j+1
                end
                Player1.hand[#Player1.hand+1] = card
                Functions.damage(Player1,7)
                print(Player1.name.." lost 7 life and White Snake was added to that player's hand.")
            else
                print("Snake was not added to your hand.")
            end
        end
    end
}
}
Cards.SolitaryHealer = {
    name = "Solitary Healer",
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
Cards.HelpfulGolem = {
    name = "Helpful Golem",
    power = 12,
    cost = 1,
    tipo = "Unit",
    stamina = 1,
    description = "If summoned and you have less than 100 life, gain 12 life. If destroyed and you have three or less cards in your hand, draw a card.",
effect = {ifsummoned = function(card,Player1,Player2)
        if Player1.life < 100 then
            Functions.getlife(Player1,12)
            print(Player1.name.." gained 12 life.")
        end
    end,
    ifdies = function(card,Player1,Player2)
    if #Player1.hand < 4 then
        Functions.draw(Player1)
        print(Player1.name.." drew a card.")
    end
    end
}
}
Cards.BrokenDebtor = {
    name = "Broken Debtor",
    power = 11,
    cost = 1,
    tipo = "Unit",
    stamina = 1,
    description = "If summoned, draw a card and gain 10 life. If destroyed, discard a card and you lose 20 life.",
    effect = {ifsummoned = function(card,Player1,Player2)
        Functions.draw(Player1)
        Functions.getlife(Player1,10)
        print(Player1.name.." drew a card and gained 10 life.")
    end,
    ifdies = function(card,Player1,Player2)
    if #Player1.hand > 0 then
        Functions.discard(Player1,Player2)
        print(Player1.name.." discarded a card.")
    end
    Functions.damage(Player1,20)
    print(Player1.name.." lost 20 life.")
end
}
}
Cards.SolidRewarder = {
    name = "Solid Rewarder",
    power = 11,
    cost = 1,
    tipo = "Unit",
    stamina = 1,
    description = "If summoned, discard a card and you lose 10 life. If destroyed, draw a card and you gain 20 life.",
    effect = {ifsummoned = function(card,Player1,Player2)
        if #Player1.hand > 0 then
            Functions.discard(Player1,Player2)
            print(Player1.name.." discarded a card.")
        end
        Functions.damage(Player1,10)
        print(Player1.name.." lost 10 life.")
    end,
    ifdies = function(card,Player1,Player2)
        Functions.draw(Player1)
        Functions.getlife(Player1,20)
        print(Player1.name.." drew a card and gained 20 life.")
end
}
}
Cards.CavernTroll = {
    name = "Cavern Troll",
    power = 8,
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
Cards.MindImpulse = {
    name = "Mind Impulse",
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
Cards.BlindingFury = {
    name = "Blinding Fury",
    power = nil,
    cost = 0,
    tipo = "Support",
    stamina = nil,
    description = "A unit you control gains 3 power.",
effect = function(card,Player1,Player2)
    print("Select a unit:")
    print("0 - None")
    Functions.printzone(Player1.field)
    local opcao = tonumber(io.read())
    if opcao ~= nil and opcao == 0 then
        h = true
    elseif opcao <= #Player1.field and opcao > 0 then
        local card = Player1.field[opcao]
        card.power = card.power+3
        print(card.name.." gained 3 power.")
    else
        print("SELECT A VALID OPTION!")
    end
end
}
Cards.SuddenSickness = {
    name = "Sudden Sickness",
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
Cards.StormCall = {
    name = "Storm Call",
    power = nil,
    cost = 0,
    tipo = "Support",
    stamina = nil,
    description = "Storm +3.",
effect = function(card,Player1,Player2)
    Functions.storm(Player1,3)
end
}
Cards.AngelicPatch = {
    name = "Angelic Patch",
    power = nil,
    cost = 0,
    tipo = "Support",
    stamina = nil,
    description = "Storm +1; draw a card and gain 7 life.",
effect = function(card,Player1,Player2)
    Functions.storm(Player1,1)
    Functions.draw(Player1)
    Functions.getlife(Player1,7)
    print(Player1.name.." drew a card and gained 7 life.")
end
}
Cards.RecklessGreed = {
    name = "Reckless Greed",
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
Cards.SoulSelling = {
    name = "Soul Selling",
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
Cards.SlaveDestiny = {
    name = "Slave Destiny",
    power = nil,
    cost = 0,
    tipo = "Support",
    stamina = nil,
    description = "Destroy a unit you control. If you do, receive 2 gold.",
effect = function(card,Player1,Player2)
    local h = false
    while h == false do
        print("Destroy a unit you control:")
        print("0 - None")
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
            print("SELECT A VALID OPTION!")
        end
        if h == true and g == true then
            Functions.getgold(Player1)
            Functions.getgold(Player1)
            print(Player1.name.." received 2 gold.")
        end
    end
end
}
Cards.LastSacrifice = {
    name = "Last Sacrifice",
    power = nil,
    cost = 0,
    tipo = "Support",
    stamina = nil,
    description = "Destroy a unit you control. If you do, draw two cards.",
effect = function(card,Player1,Player2)
    local h = false
    while h == false do
        print("Destroy a unit you control:")
        print("0 - None")
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
            print("SELECT A VALID OPTION!")
        end
        if h == true and g == true then
            Functions.draw(Player1)
            Functions.draw(Player1)
            print(Player1.name.." drew two cards.")
        end
    end
end
}
Cards.TormentingVice = {
    name = "Tormenting Vice",
    power = nil,
    cost = 0,
    tipo = "Support",
    stamina = nil,
    description = "Discard a card. If you do, receive 2 gold.",
effect = function(card,Player1,Player2)
    Functions.discard(Player1,Player2)
    Functions.getgold(Player1)
    Functions.getgold(Player1)
    print(Player1.name.." received 2 gold.")
end
}
Cards.StrangeVirtue = {
    name = "Strange Virtue",
    power = nil,
    cost = 0,
    tipo = "Support",
    stamina = nil,
    description = "Discard a card. If you do, draw two cards.",
effect = function(card,Player1,Player2)
    Functions.discard(Player1,Player2)
    Functions.draw(Player1)
    Functions.draw(Player1)
    print(Player1.name.." drew two cards.")
end
}
Cards.BurningFlame = {
    name = "Burning Flame",
    power = nil,
    cost = 0,
    tipo = "Support",
    stamina = nil,
    description = "Storm +1; Deal 15 damage to your opponent.",
effect = function(card,Player1,Player2)
    Functions.storm(Player1,1)
    Functions.damage(Player2,15)
    print(Player2.name.." lost 15 life.")
end
}
Cards.Cooperation = {
    name = "Cooperation",
    power = nil,
    cost = 0,
    tipo = "Support",
    stamina = nil,
    description = "Storm +1; Each player draws a card.",
effect = function(card,Player1,Player2)
    Functions.storm(Player1,1)
    Functions.draw(Player1)
    Functions.draw(Player2)
    print("Each player drew a card.")
end
}
Cards.LifeDrain = {
    name = "Life Drain",
    power = nil,
    cost = 0,
    tipo = "Support",
    stamina = nil,
    description = "Storm +1; Drain 10 life from your opponent.",
effect = function(card,Player1,Player2)
    Functions.storm(Player1,1)
    Functions.getlife(Player1,10)
    Functions.damage(Player2,10)
    print(Player1.name.." drained 10 life from "..Player2.name..".")
end
}
Cards.DestroyUnit = {
    name = "Destroy Unit",
    power = nil,
    cost = 1,
    tipo = "Support",
    stamina = nil,
    description = "Destroy an enemy unit.",
effect = function(card,Player1,Player2)
    h = false
    while h == false do
        print("Destroy an enemy unit:")
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
end
}
Cards.CrushingBlow = {
    name = "Crushing Blow",
    power = nil,
    cost = 0,
    tipo = "Support",
    stamina = nil,
    description = "Destroy an enemy unit with power 10 or less.",
effect = function(card,Player1,Player2)
    h = false
    while h == false do
        print("Destroy an enemy unit with power 10 or less:")
        print("0 - None")
        Functions.printzone(Player2.field)
        opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 0 then
            h = true
        elseif opcao ~= nil and opcao <= #Player2.field and opcao > 0 and Player2.field[opcao].power < 11 then
            Functions.destroy(Player2.field[opcao],Player1,Player2,Player1)
            h = true
        elseif opcao ~= nil and opcao <= #Player2.field and opcao > 0 and Player2.field[opcao].power > 10 then
            print("THAT UNIT HAS POWER GREATER THAN 10!")
            h = true
        else
            print("SELECT A VALID OPTION!")
        end
    end
end
}
Cards.Knowledge = {
    name = "Knowledge  ",
    power = nil,
    cost = 1,
    tipo = "Support",
    stamina = nil,
    description = "Draw two cards.",
effect = function(card,Player1,Player2)
    Functions.draw(Player1)
    Functions.draw(Player1)
    print(Player1.name.." drew two cards.")
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
Cards.UndercoverSpy = {
    name = "Undercover Spy",
    power = nil,
    cost = 0,
    tipo = "Support",
    stamina = nil,
    description = "Draw a card, then look at your opponent's hand. You lose 10 life",
effect = function(card,Player1,Player2)
    Functions.draw(Player1)
    print(Player1.name.." drew a card.")
    print(Player2.name.."'s hand is:" )
    Functions.printzone(Player2.hand)
    print("Press any key to return.")
    input = tonumber(io.read())
    Functions.damage(Player1,10)
    print(Player1.name.." lost 10 life.")
    if input then 
    end
end
}
Cards.DearMemory = {
    name = "Dear Memory",
    power = nil,
    cost = 1,
    tipo = "Support",
    stamina = nil,
    zone = deck,
    description = "Add a card from your graveyard to your hand.",
effect = function(card,Player1,Player2)
    local h = false
    while h == false do
        print("Add a card from your graveyard to your hand:")
        print("0 - None")
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
            print("SELECT A VALID OPTION!")
        end
    end
end
}
Cards.PureRevival = {
    name = "Pure Revival",
    power = nil,
    cost = 2,
    tipo = "Support",
    stamina = nil,
    zone = deck,
    description = "Summon a unit from your graveyard.",
effect = function(card,Player1,Player2)
    local h = false
    while h == false do
        print("Summon a unit from your graveyard:")
        print("0 - None")
        Functions.printzone(Player1.graveyard)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 0 then
            h = true
        elseif Player1.graveyard[opcao].tipo == "Unit" then
            local card = Player1.graveyard[opcao]
            while opcao <= #Player1.graveyard do
                Player1.graveyard[opcao] = Player1.graveyard[opcao+1]
                opcao = opcao+1
            end
            Functions.summon(card,Player1,Player2)
            h = true
        else
            print("SELECT A VALID OPTION!")
        end
    end
end
}
Cards.ReanimateDead = {
    name = "Reanimate Dead",
    power = nil,
    cost = 1,
    tipo = "Support",
    stamina = nil,
    zone = deck,
    description = "Summon a unit from your graveyard. You lose 20 life.",
effect = function(card,Player1,Player2)
    local h = false
    while h == false do
        print("Summon a unit from your graveyard:")
        print("0 - None")
        Functions.printzone(Player1.graveyard)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 0 then
            h = true
        elseif opcao ~= nil and Player1.graveyard[opcao].tipo == "Unit" then
            local card = Player1.graveyard[opcao]
            while opcao <= #Player1.graveyard do
                Player1.graveyard[opcao] = Player1.graveyard[opcao+1]
                opcao = opcao+1
            end
            Functions.summon(card,Player1,Player2)
            h = true
        else
            print("SELECT A VALID OPTION!")
        end
    end
    Functions.damage(Player1,20)
    print(Player1.name.." lost 20 life.")
end
}
Cards.QuickSelection = {
    name = "Quick Selection",
    power = nil,
    cost = 0,
    tipo = "Support",
    stamina = nil,
    description = "Look at the top two cards of your deck, add one to your hand and the other to your graveyard. You lose 12 life.",
    effect = function(card,Player1,Player2)
    if #Player1.deck > 0 then
            local h = false
            local topo = {Player1.deck[#Player1.deck],Player1.deck[#Player1.deck-1]}
            Player1.deck[#Player1.deck] = nil
            Player1.deck[#Player1.deck] = nil
            while h == false do
                print("Add a card to your hand:")
                Functions.printzone(topo)
                local opcao = tonumber(io.read())
                if opcao ~= nil and opcao <= #topo and opcao > 0 then
                    Player1.hand[#Player1.hand+1] = topo[opcao]
                    if opcao == 1 then
                        Player1.graveyard[#Player1.graveyard+1] = topo[2]
                        topo = {}
                    elseif opcao == 2 then
                        Player1.graveyard[#Player1.graveyard+1] = topo[1]
                        topo = {}
                    end
                    Functions.damage(Player1,12)
                    print(Player1.name.." lost 12 life.")
                    h = true
                else
                    print("SELECT A VALID OPTION!")
                end
            end
    else
        print("YOU HAVE NO CARDS IN YOUR DECK!")
    end
end
}
Cards.ClearProject = {
    name = "Clear Project",
    power = nil,
    cost = 0,
    tipo = "Support",
    stamina = nil,
    description = "Add the top five cards of your deck to your graveyard, then shuffle up to five cards from your graveyard into your deck.",
    effect = function(card,Player1,Player2)
        Player1.graveyard[#Player1.graveyard+1] = Player1.deck[#Player1.deck]
        Player1.deck[#Player1.deck] = nil
        Player1.graveyard[#Player1.graveyard+1] = Player1.deck[#Player1.deck]
        Player1.deck[#Player1.deck] = nil
        Player1.graveyard[#Player1.graveyard+1] = Player1.deck[#Player1.deck]
        Player1.deck[#Player1.deck] = nil
        Player1.graveyard[#Player1.graveyard+1] = Player1.deck[#Player1.deck]
        Player1.deck[#Player1.deck] = nil
        Player1.graveyard[#Player1.graveyard+1] = Player1.deck[#Player1.deck]
        Player1.deck[#Player1.deck] = nil
        local h = 5
        while h > 0 do
            print("You may shuffle up to "..h.." cards into your deck.")
            print("Select a card:")
            print("0 - None")
            Functions.printzone(Player1.graveyard)
            local opcao = tonumber(io.read())
            if opcao ~= nil and opcao == 0 then
                h = h-1
            elseif opcao ~= nil and opcao <= #Player1.graveyard and opcao > 0 then
                local card = Player1.graveyard[opcao]
                Player1.deck[#Player1.deck+1] = card
                print(card.name.." was selected.")
                local j = Functions.find(Player1.graveyard,card)
                while j <= #Player1.graveyard do
                    Player1.graveyard[j] = Player1.graveyard[j+1]
                    j = j+1
                end
                h = h-1
            else
                print("SELECT A VALID OPTION!")
            end
        end
        Functions.shuffle2(Player1.deck)
        print(Player1.name.."'s deck was shuffled.")
    end
}
Cards.DaringGamble = {
    name = "Daring Gamble",
    power = nil,
    cost = 0,
    tipo = "Support",
    stamina = nil,
    description = "Discard your hand, then draw the same number of cards discarded this way.",
effect = function(card,Player1,Player2)
    local n = #Player1.hand
    while #Player1.hand > 0 do
        Functions.discard(Player1,Player2)
    end
    while n > 0 do
        Functions.draw(Player1)
        n = n-1
    end
    print(Player1.name.." drew "..n.." cards.")
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
    description = "Ability: Exile a unit you control, then summon it.",
    effect = {ability = function(card,Player1,Player2)
        local h = false
        while h == false do
            print("Exile a unit:")
            print("0 - None")
            Functions.printzone(Player1.field)
            local opcao = tonumber(io.read())
            if opcao ~= nil and opcao == 0 then
                h = true
            elseif opcao ~= nil and opcao <= #Player1.field and opcao > 0 then
                card = Player1.field[opcao]
                Functions.exile(Player1.field[opcao],Player1,Player2)
                Functions.summon(card,Player1,Player2)
                h = true
            else
                print("SELECT A VALID OPTION!")
            end
        end
    end
}
}
Cards.Selector = {
    name = "Selector   ",
    power = nil,
    cost = 1,
    tipo = "Ally",
    stamina = 1,
    loyalty = 3,
    description = "Ability: Look at the top two cards of your deck, add one to your hand and the other to your graveyard.",
    effect = {ability = function(card,Player1,Player2)
    if #Player1.deck > 0 then
            local h = false
            local topo = {Player1.deck[#Player1.deck],Player1.deck[#Player1.deck-1]}
            Player1.deck[#Player1.deck] = nil
            Player1.deck[#Player1.deck] = nil
            while h == false do
                print("Add a card to your hand:")
                Functions.printzone(topo)
                local opcao = tonumber(io.read())
                if opcao ~= nil and opcao <= #topo and opcao > 0 then
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
                    print("SELECT A VALID OPTION!")
                end
            end
    else
        print("YOU HAVE NO CARDS IN YOUR DECK!")
    end
end
    }
}
Cards.Administrator = {
    name = "Administrator",
    power = nil,
    cost = 0,
    tipo = "Ally",
    stamina = 1,
    loyalty = 5,
    description = "Ability: Draw two cards then add two cards from your hand to the top of your deck.",
    effect = {ability = function(card,Player1,Player2)
    Functions.draw(Player1)
    Functions.draw(Player1)
    print(Player1.name.." drew two cards.")
        local h = 2
        while h > 0 do
            print("Add a card from your hand to the top of your deck:")
            Functions.printzone(Player1.hand)
            local opcao = tonumber(io.read())
            if opcao ~= nil and opcao <= #Player1.hand and opcao > 0 then
                Player1.deck[#Player1.deck+1] = Player1.hand[opcao]
                while opcao <= #Player[t].hand do
                    Player[t].hand[opcao] = Player[t].hand[opcao+1]
                    opcao = opcao+1
                end
                h = h-1
            else
                print("YOU MUST DISCARD A CARD!")
            end
        end
        print("You added two cards to the top of your deck.")
    end
}
}
Cards.Librarian = {
    name = "Librarian",
    power = nil,
    cost = 0,
    tipo = "Ally",
    stamina = 1,
    loyalty = 4,
    description = "Ability: If you have less than two cards in your hand, draw until you have two.",
    effect = {ability = function(card,Player1,Player2)
    while #Player1.hand < 2 do
        Functions.draw(Player1)
        print(Player1.name.." drew a card.")
    end
    end
}    
}
Cards.StormPriest = {
    name = "Storm Priest",
    power = nil,
    cost = 0,
    tipo = "Ally",
    stamina = 1,
    loyalty = 8,
    description = "Ability: Storm +2.",
    effect = {ability = function(card,Player1,Player2)
        Functions.storm(Player1,2)
    end
}    
}
Cards.CubeLord = {
    name = "Cube Lord",
    power = nil,
    cost = 0,
    tipo = "Ally",
    stamina = 1,
    loyalty = 12,
    cube = {},
    description = "Ability: Choose one - Add the top card of your deck to the Cube; or add a card from the Cube to your hand then add a card from your hand to the Cube.",
    effect = {ability = function(card,Player1,Player2)
        local h = false
        while h == false do
            print("Choose one:")
            print("0 - None")
            print("1 - Add the top card of your deck to the Cube")
            print("2 - Switch a card from your hand with one from the Cube")
            local opcao = tonumber(io.read())
            if opcao == 0 then
                h = true
            elseif opcao == 1 then
                card.cube[#card.cube+1] = Player1.deck[#Player1.deck]
                Player1.deck[#Player1.deck] = nil
                h = true
            elseif opcao == 2 then
                local c = false
                while c == false do
                    print("Add a card from the Cube to your hand:")
                    Functions.printzone(card.cube)
                    local option = tonumber(io.read())
                    if option <= #card.cube then
                        Player1.hand[#Player1.hand+1] = card.cube[option]
                        while option <= #card.cube do
                            card.cube[option] = card.cube[option+1]
                            option = option+1
                        end
                        c = true
                    else
                        print("SELECT A VALID OPTION! :X")
                    end
                    
                    local g = false
                    while g == false do
                        print("Add a card from your hand to the Cube:")
                        Functions.printzone(Player1.hand)
                        local option = tonumber(io.read())
                        if option <= #Player1.hand and option > 0 then
                            card.cube[#card.cube+1] = Player1.hand[option]
                            while option <= #Player1.hand do
                                Player1.hand[option] = Player1.hand[option+1]
                                option = option+1
                            end
                            g = true
                            h = true
                        else
                            print("SELECT A VALID OPTION! >.<")
                        end
                    end
                end
            else
                print("SELECT A VALID OPTION!")
            end
        end
    end
    }
}
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
Cards.Enlightenment = {
    name = "Enlightenment",
    power = nil,
    cost = 0,
    tipo = "Spell",
    stamina = nil,
    description = "Draw two cards.",
effect = function(card,Player1,Player2)
    Functions.draw(Player1)
    Functions.draw(Player1)
    print(Player1.name.." drew two cards.")
end
}
Cards.UnusualLuck = {
    name = "Unusual Luck",
    power = nil,
    cost = 0,
    tipo = "Spell",
    stamina = nil,
    description = "Receive 2 gold.",
effect = function(card,Player1,Player2)
    Functions.getgold(Player1)
    Functions.getgold(Player1)
    print(Player1.name.." received 2 gold.")
end
}
Cards.GracefulGrace = {
    name = "Graceful Grace",
    power = nil,
    cost = 0,
    tipo = "Spell",
    stamina = nil,
    description = "Draw three cards then discard two cards.",
effect = function(card,Player1,Player2)
    Functions.draw(Player1)
    Functions.draw(Player1)
    Functions.draw(Player1)
    print(Player1.name.." drew three cards.")
    Functions.discard(Player1,Player2)
    Functions.discard(Player1,Player2)
    print(Player1.name.." discarded two cards.")
    
end
}
Cards.SupportSeeking = {
    name = "Support Seeking",
    power = nil,
    cost = 0,
    tipo = "Spell",
    stamina = nil,
    description = "Search your deck for a support and add it to your hand, then your deck is shuffled.",
effect = function(card,Player1,Player2)
    local h = false
    while h == false do
        print("Add a support to your hand:")
        print("0 - None")
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
            print("SELECT A VALID OPTION!")
        end
    end
    Functions.shuffle2(Player1.deck)
end
}
Cards.UnitSeeking = {
    name = "Unit Seeking",
    power = nil,
    cost = 0,
    tipo = "Spell",
    stamina = nil,
    description = "Search your deck for a unit and add it to your hand, then your deck is shuffled.",
effect = function(card,Player1,Player2)
    local h = false
    while h == false do
        print("Add a unit to your hand:")
        print("0 - None")
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
            print("SELECT A VALID OPTION!")
        end
    end
    Functions.shuffle2(Player1.deck)
end
}
Cards.PastRecover = {
    name = "Past Recover",
    power = nil,
    cost = 0,
    tipo = "Spell",
    stamina = nil,
    zone = deck,
    description = "Add a card from your graveyard to your hand.",
effect = function(card,Player1,Player2)
    local h = false
    while h == false do
        print("Add a card to your hand:")
        print("0 - None")
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
            print("SELECT A VALID OPTION!")
        end
    end
end
}
Cards.EliminateEvil = {
    name = "Eliminate Evil",
    power = nil,
    cost = 0,
    tipo = "Spell",
    stamina = nil,
    description = "Destroy an enemy unit.",
effect = function(card,Player1,Player2)
    h = false
    while h == false do
        print("Destroy an enemy unit:")
        print("0 - None")
        Functions.printzone(Player2.field)
        opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 0 then
            h = true
        elseif opcao ~= nil and opcao <= #Player2.field and opcao > 0 then
            Functions.destroy(Player2.field[opcao],Player1,Player2,Player1)
            h = true
        else
            print("SELECT A VALID OPTION!")
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
    local i = Player1.storm
    while i > 0 do
        Functions.draw(Player1)
        i = i-1
    end
    Functions.discard(Player1,Player2)
    Functions.discard(Player1,Player2)
    Functions.discard(Player1,Player2)
    Functions.discard(Player1,Player2)
    print(Player1.name.." drew "..Player1.storm.." cards.")
end    
}
Cards.Firestorm = {
    name = "Firestorm ",
    power = nil,
    cost = 0,
    tipo = "Spell",
    stamina = nil,
    description = "Deal 5X damage to your opponent; X = storm.",
effect = function(card,Player1,Player2)
    Functions.damage(Player2,5*Player1.storm)
    print(Player2.name.." lost "..5*Player1.storm.." life.")
end
}
Cards.Lifestorm = {
    name = "Lifestorm ",
    power = nil,
    cost = 0,
    tipo = "Spell",
    stamina = nil,
    description = "Gain 5X life; X = storm.",
effect = function(card,Player1,Player2)
    Functions.getlife(Player1,5*Player1.storm)
    print(Player1.name.." gained "..5*Player1.storm.." life.")
end
}
Cards.TheFaces = {
    name = "The Faces   ",
    power = nil,
    cost = 0,
    tipo = "Spell",
    stamina = nil,
    description = "Copy the effect of the last support you cast.",
effect = function(card,Player1,Player2)
    if Player1.lastsupport.effect ~= nil and Player1.lastsupport ~= {} and Player1.lastsupport.name ~= "The Faces   " then
        Player1.lastsupport.effect(Player1,Player2)
    else
        print("YOU MUST CAST A SUPPORT BEFORE PLAYING THIS CARD! >.<")
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
Cards.SelfGrowth = {
    name = "Self Growth",
    power = nil,
    cost = 0,
    tipo = "Spell",
    stamina = nil,
    description = "Draw cards equal to your level.",
    effect = function(card,Player1,Player2)
    local i = Player1.level
    while i > 0 do
        Functions.draw(Player1)
        i = i-1
    end
    print(Player1.name.." drew "..Player1.level.." cards.")
end
}
Cards.CatchingUp = {
    name = "Catching Up",
    power = nil,
    cost = 0,
    tipo = "Spell",
    stamina = nil,
    description = "Each player draws cards until that player has five cards in hand.",
effect = function(card,Player1,Player2)
    while #Player1.hand < 5 do
        Functions.draw(Player1)
    end
    while #Player2.hand < 5 do
        Functions.draw(Player2)
    end
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
    description = "At end of turn, if you have exactly five cards in your hand, draw a card.",
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
    description = "At end of turn, if you have 50 or less life, your opponent loses 15 life, otherwise you lose 15 life.",
    effect = {ateot = function(card,Player1,Player2)
        if #Player1.life < 51 then
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
    description = "At end of turn, if you have 107 or more life, summon a 'Merciful Angel'.",
    effect = {ateot = function(card,Player1,Player2)
        if Player1.life > 106 then
            tempcard = {}
            Functions.copiar(Cards.MercifulAngel,tempcard)
            Functions.summon(tempcard,Player1,Player2)
            tempcard = {}
        end
    end
    }
}
Cards.LetGoTotem = {
    name = "Let Go Totem",
    power = nil,
    cost = 0,
    tipo = "Totem",
    stamina = nil,
    description = "At end of turn, lose all your gold. If you lost 1 or more gold this way, your level is raised by one.",
    effect = {ateot = function(card,Player1,Player2)
        if Player1.gold > 0 then
            print(Player1.name.." lost "..Player1.gold.." gold and raised it's level by one.")
            Player1.gold = 0
            Player1.level = Player1.level+1
        else
            print(Player1.name.." lost "..Player1.gold.." gold.")
            Player1.gold = 0
        end
    end
    }
}
Cards.DiggerTotem = {
    name = "Digger Totem",
    power = nil,
    cost = 0,
    tipo = "Totem",
    stamina = nil,
    description = "At end of turn, if there are seven or more cards in your graveyard, add a unit from your graveyard to your hand.",
    effect = {ateot = function(card,Player1,Player2)
        if #Player1.graveyard > 6 then
            local h = false
            while h == false do
                print("Select a unit from your graveyard:")
                print("0 - None")
                Functions.printzone(Player1.graveyard)
                local opcao = tonumber(io.read())
                if opcao ~= nil and opcao == 0 then
                    h = true
                elseif opcao ~= nil and Player1.graveyard[opcao].tipo == "Unit" then
                    local card = Player1.graveyard[opcao]
                    Player1.hand[#Player1.hand+1] = card
                    print(card.name.." was added to your hand.")
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
    end
    }
}
-------------------HERO------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Cards.BikerLeo = {
    name = "Biker Leo",
    power = 7,
    cost = 1,
    tipo = "Unit",
    stamina = 1,
    description = "If summoned, exile another unit you control, then summon it. At end of turn, add this to your hand.",
    effect = {ifsummoned = function(card,Player1,Player2)
        local h = false
        while h == false do
            print("Exile a unit:")
            print("0 - None")
            Functions.printzone(Player1.field)
            local opcao = tonumber(io.read())
            if opcao ~= nil and opcao == 0 then
                h = true
            elseif opcao ~= nil and opcao <= #Player1.field and opcao > 0 and Player1.field[opcao].name ~= "Biker Leo   " then
                Functions.exile(Player1.field[opcao],Player1,Player2)
                Functions.summon(card,Player1,Player2)
                h = true
            else
                print("SELECT A VALID OPTION!")
            end
        end
    end,
    ateot = function(card,Player1,Player2)
        local j = Functions.find(Player1.field,card)
        while j <= #Player1.field do
            Player1.field[j] = Player1.field[j+1]
            j = j+1
        end
        Player1.hand[#Player1.hand+1] = card
        print(card.name.." was added to "..Player1.name.."'s hand.")
    end
    }
}
Cards.Valentina = {
    name = "Valentina",
    power = 9,
    cost = 1,
    tipo = "Unit",
    stamina = 1,
    description = "If summoned, an enemy unit loses 4 power. At end of turn, add this to your hand.",
    effect = {ifsummoned = function(card,Player1,Player2)
    local h = false
        while h == false do
            print("An enemy unit loses 4 power:")
            print("0 - None")
            Functions.printzone(Player2.field)
            local opcao = tonumber(io.read())
            if opcao ~= nil and opcao == 0 then
                h = true
            elseif opcao <= #Player2.field and opcao > 0 then
                local enemy = Player2.field[opcao]
                enemy.power = enemy.power-4
                print(enemy.name.." lost 4 power.")
                h = true
            else
                print("SELECT A VALID OPTION!")
            end
        end
        end,
        ateot = function(card,Player1,Player2)
        local j = Functions.find(Player1.field,card)
        while j <= #Player1.field do
            Player1.field[j] = Player1.field[j+1]
            j = j+1
        end
        Player1.hand[#Player1.hand+1] = card
        print(card.name.." was added to "..Player1.name.."'s hand.")
    end
}
}
Cards.MasterPaim = {
    name = "Master Paim",
    power = 8,
    cost = 1,
    tipo = "Unit",
    stamina = 1,
    description = "If summoned, all your units gain 2 power. At end of turn, add this to your hand.",
    effect = {ifsummoned = function(card,Player1,Player2)
        local i = 1
        while i <= #Player1.field do
            Player1.field[i].power = Player1.field[i].power+2
            i = i+1
        end
        print("All your units gained 2 power.")
    end,
            ateot = function(card,Player1,Player2)
        local j = Functions.find(Player1.field,card)
        while j <= #Player1.field do
            Player1.field[j] = Player1.field[j+1]
            j = j+1
        end
        Player1.hand[#Player1.hand+1] = card
        print(card.name.." was added to "..Player1.name.."'s hand.")
    end
}
}
Cards.IsaFusels = {
    name = "Isa Fusels",
    power = 7,
    cost = 1,
    tipo = "Unit",
    stamina = 1,
    description = "If summoned, drain 10 life from your opponent. At end of turn, add this to your hand.",
    effect = {ifsummoned = function(card,Player1,Player2)
    Functions.getlife(Player1,10)
    Functions.damage(Player2,10)
    print(Player1.name.." drained 10 life from "..Player2.name..".")
    end,
            ateot = function(card,Player1,Player2)
        local j = Functions.find(Player1.field,card)
        while j <= #Player1.field do
            Player1.field[j] = Player1.field[j+1]
            j = j+1
        end
        Player1.hand[#Player1.hand+1] = card
        print(card.name.." was added to "..Player1.name.."'s hand.")
    end
}
}
Cards.Pougy = {
    name = "Pougy       ",
    power = 12,
    cost = 1,
    tipo = "Unit",
    stamina = 1,
    description = "Ability: Each player chooses a unit. Switch control of those units. At end of turn, add this to your hand.",
    effect = {ability = function(card,Player1,Player2)
        h = false
        g = false
        while h == false do
            print(Player1.name.." selects a unit to switch:")
            Functions.printzone(Player1.field)
            local opcao = tonumber(io.read())
            if opcao <= #Player1.field then
                tempcard = {}
                c1 = Functions.copiar(Player1.field[opcao],tempcard)
                h = true
            else
                print("SELECT A VALID OPTION!")
            end
        end
        while g == false do
            print(Player2.name.." selects a unit to switch:")
            Functions.printzone(Player2.field)
            local opcao2 = tonumber(io.read())
            if opcao2 <= #Player2.field then
                tempcard = {}
                card2 = Player2.field[opcao2]
                c2 = Functions.copiar(card2,tempcard)
                g = true
            else
                print("SELECT A VALID OPTION!")
            end
        end
         Player1.field[opcao] = c2

         Player2.field[opcao2] = c1

        print(c1.name.." and "..c2.name.." switched controls!")
    end,
            ateot = function(card,Player1,Player2)
        local j = Functions.find(Player1.field,card)
        while j <= #Player1.field do
            Player1.field[j] = Player1.field[j+1]
            j = j+1
        end
        Player1.hand[#Player1.hand+1] = card
        print(card.name.." was added to "..Player1.name.."'s hand.")
    end
}
}
Cards.Nasa = {
    name = "Nasa        ",
    power = 9,
    cost = 1,
    tipo = "Unit",
    stamina = 1,
    description = "If summoned, draw three cards then add three cards from your hand to the bottom of your deck. At end of turn, add this to your hand.",
    effect = {a = function(card,Player1,Player2)
        
        
        
            ateot = function(card,Player1,Player2)
        local j = Functions.find(Player1.field,card)
        while j <= #Player1.field do
            Player1.field[j] = Player1.field[j+1]
            j = j+1
        end
        Player1.hand[#Player1.hand+1] = card
        print(card.name.." was added to "..Player1.name.."'s hand.")
    end
end
}
}
Cards.Tchebello = {
    name = "Tchebello",
    power = 15,
    cost = 2,
    tipo = "Unit",
    stamina = 1,
    description = "If this destroys a unit, receive an amount of gold equal to that unit's cost. At end of turn, add this to your hand.",
    effect = {ifdestroys = function(card,Player1,Player2,victim)
        Player1.gold = Player1.gold+victim.cost
        print(Player1.name.." received "..victim.cost.." gold.")
    end,
            ateot = function(card,Player1,Player2)
        local j = Functions.find(Player1.field,card)
        while j <= #Player1.field do
            Player1.field[j] = Player1.field[j+1]
            j = j+1
        end
        Player1.hand[#Player1.hand+1] = card
        print(card.name.." was added to "..Player1.name.."'s hand.")
    end
}
}
Cards.JonhZera = {
    name = "John Zera",
    power = 15,
    cost = 1,
    tipo = "Unit",
    stamina = 1,
    description = "If summoned, add the top four cards of your deck to your graveyard, then shuffle up to four cards from your graveyard into your deck. At end of turn, add this to your hand.",
    effect = {ifsummoned = function(card,Player1,Player2)
        Player1.graveyard[#Player1.graveyard+1] = Player1.deck[#Player1.deck]
        Player1.deck[#Player1.deck] = nil
        Player1.graveyard[#Player1.graveyard+1] = Player1.deck[#Player1.deck]
        Player1.deck[#Player1.deck] = nil
        Player1.graveyard[#Player1.graveyard+1] = Player1.deck[#Player1.deck]
        Player1.deck[#Player1.deck] = nil
        Player1.graveyard[#Player1.graveyard+1] = Player1.deck[#Player1.deck]
        Player1.deck[#Player1.deck] = nil
        local h = 4
        while h > 0 do
            print("You may shuffle up to "..h.." cards into your deck.")
            print("Select a card:")
            print("0 - None")
            Functions.printzone(Player1.graveyard)
            local opcao = tonumber(io.read())
            if opcao ~= nil and opcao == 0 then
                h = h-1
            elseif opcao ~= nil and opcao <= #Player1.graveyard and opcao > 0 then
                local card = Player1.graveyard[opcao]
                Player1.deck[#Player1.deck+1] = card
                print(card.name.." was selected.")
                local j = Functions.find(Player1.graveyard,card)
                while j <= #Player1.graveyard do
                    Player1.graveyard[j] = Player1.graveyard[j+1]
                    j = j+1
                end
                h = h-1
            else
                print("SELECT A VALID OPTION!")
            end
        end
        Functions.shuffle2(Player1.deck)
        print(Player1.name.."'s deck was shuffled.")
    end,
            ateot = function(card,Player1,Player2)
        local j = Functions.find(Player1.field,card)
        while j <= #Player1.field do
            Player1.field[j] = Player1.field[j+1]
            j = j+1
        end
        Player1.hand[#Player1.hand+1] = card
        print(card.name.." was added to "..Player1.name.."'s hand.")
    end
}
}
Cards.MasterKaplan = {
    name = "Master Kaplan",
    power = 11,
    cost = 1,
    tipo = "Unit",
    stamina = 1,
    description = "Ability: If you control two or less units, your level is raised by 1, otherwise draw a card. At end of turn, add this to your hand.",
    effect = {ability = function(card,Player1,Player2)
    if #Player1.field < 3 then
        Player1.level = Player1.level+1
        print(Player1.name.."'s level was raised by 1 and is now "..Player1.level..".")
    else
        Functions.draw(Player1)
        print(Player1.name.." drew a card.")
    end
    end,
            ateot = function(card,Player1,Player2)
        local j = Functions.find(Player1.field,card)
        while j <= #Player1.field do
            Player1.field[j] = Player1.field[j+1]
            j = j+1
        end
        Player1.hand[#Player1.hand+1] = card
        print(card.name.." was added to "..Player1.name.."'s hand.")
    end
}
}
Cards.BrenoItself = {
    name = "Breno, Itself",
    power = 4,
    cost = 1,
    tipo = "Unit",
    stamina = 1,
    description = "If summoned and you control two or more units, draw a card, otherwise this gains 3 power. At end of turn, add this to your hand.",
    effect = {ifsummoned = function(card,Player1,Player2)
        if #Player1.field > 1 then
            Functions.draw(Player1)
            print(Player1.name.." drew a card.")
        else
            card.power = card.power+3
            print(card.name.." gained 3 power.")
        end
    end,
            ateot = function(card,Player1,Player2)
        local j = Functions.find(Player1.field,card)
        while j <= #Player1.field do
            Player1.field[j] = Player1.field[j+1]
            j = j+1
        end
        Player1.hand[#Player1.hand+1] = card
        print(card.name.." was added to "..Player1.name.."'s hand.")
    end
}
}
-------------------ACE------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Cards.MindControl = {
    name = "Mind Control",
    power = nil,
    cost = 0,
    tipo = "Spell",
    stamina = nil,
    description = "Gain control of an enemy unit.",
    effect = function(card,Player1,Player2)
    
    
    
    
    
end
}
Cards.Imperial = {
    name = "Imperial    ",
    power = nil,
    cost = 0,
    tipo = "Spell",
    stamina = nil,
    description = "Draw a card for each unit you control.",
    effect = function(card,Player1,Player2)
    local i = #Player1.field
    while i > 0 do
        Functions.draw(Player1)
        print(Player1.name.." drew a card.")
        i = i-1
    end
end
}
Cards.Rebirth = {
    name = "Rebirth    ",
    power = nil,
    cost = 0,
    tipo = "Spell",
    stamina = nil,
    zone = deck,
    description = "Summon a unit from your graveyard.",
effect = function(card,Player1,Player2)
    local h = false
    while h == false do
        print("Summon a unit from your graveyard:")
        print("0 - None")
        Functions.printzone(Player1.graveyard)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 0 then
            h = true
        elseif Player1.graveyard[opcao].tipo == "Unit" then
            local card = Player1.graveyard[opcao]
            while opcao <= #Player1.graveyard do
                Player1.graveyard[opcao] = Player1.graveyard[opcao+1]
                opcao = opcao+1
            end
            Functions.summon(card,Player1,Player2)
            h = true
        else
            print("SELECT A VALID OPTION!")
        end
    end
end
}
Cards.Tutor = {
    name = "Tutor     ",
    power = nil,
    cost = 0,
    tipo = "Spell",
    stamina = nil,
    description = "Search your deck for a card and add it to your hand, then your deck is shuffled.",
    effect = function(card,Player1,Player2)
    local h = false
        while h == false do
            print("Add a card to your hand:")
            print("0 - None")
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
                print("SELECT A VALID OPTION!")
            end
        end
        Functions.shuffle2(Player1.deck)
    end
}
Cards.FireLord = {
    name = "Fire Lord  ",
    power = 30,
    cost = 7,
    tipo = "Unit",
    stamina = 1,
    description = "",
    effect = {
    }
}
Cards.IceLord = {
    name = "Ice Lord   ",
    power = 30,
    cost = 7,
    tipo = "Unit",
    stamina = 1,
    description = "",
    effect = {
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
