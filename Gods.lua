local Player = require("Player")
local Functions = require("Functions")
local Gods = {}

Cards.GodoftheDead = {
    name = "God of the Dead",
    power = 20,
    cost = 0,
    tipo = "Unit",
    stamina = 1,
    description = "Can only be played if there are seven or more units in your graveyard. Ability: Summon a unit from your graveyard.",
    effect = {condition = function(card,Player1,Player2)
        local i = #Player1.graveyard
        local n = 0
        while i > 0 do
            if Player1.graveyard[i].tipo == "Unit" then
                n = n+1
            end
            i = i-1
        end
        if n > 6 then
            return true
        end
    end,
    ability = function(card,Player1,Player2)
        local h = false
        while h == false do
            print("Summon a unit from your graveyard:")
            print("0 - None")
            Functions.printzone(Player1.graveyard)
            local opcao = tonumber(io.read())
            if opcao ~= nil and opcao == 0 then
                h = true
            elseif Player1.graveyard[opcao].tipo == "Unit" then
                local card1 = Player1.graveyard[opcao]
                while opcao <= #Player1.graveyard do
                    Player1.graveyard[opcao] = Player1.graveyard[opcao+1]
                    opcao = opcao+1
                end
                Functions.summon(card1,Player1,Player2)
                h = true
            else
                print("SELECT A VALID OPTION!")
            end
        end
    end
    }
}
Cards.GodofWisdom = {
    name = "God of Wisdom",
    power = 19,
    cost = 0,
    tipo = "Unit",
    stamina = 1,
    description = "Can only be played if you have ten or more cards in hand. Ability: Play a card from your hand without paying its cost.",
    effect = {condition = function(card,Player1,Player2)
        if #Player1.hand > 9 then
                return true
        end
    end,
    ability = function(card,Player1,Player2)
    local h = false
    while h == false do
        print("Play a card from your hand without paying its cost:")
        print("0 - None")
        Functions.printzone(Player1.hand)
        local opcao = tonumber(io.read())
        if opcao == 0 then
            h = true
            break
        elseif opcao <= #Player1.hand and opcao > 0 then
            card1 = Player1.hand[opcao]
            local w = opcao
                while w <= #Player1.hand do
                    Player1.hand[w] = Player1.hand[w+1]
                    w = w+1
                end
            Functions.play(card1,Player1,Player2)
            h = true
        else
            print("SELECT A VALID OPTION!")
        end
    end
    end
    }
}
Cards.GodofNexus = {
    name = "God of Nexus",
    power = 22,
    cost = 0,
    tipo = "Unit",
    stamina = 1,
    description = "Can only be played if there are no cards in your deck. If summoned, shuffle your graveyard into your deck. Ability: Play the top card of your deck without paying its cost.",
    effect = {condition = function(card,Player1,Player2)
        if #Player1.deck == 0 then
                return true
        end
    end,
    ifsummoned = function(card,Player1,Player2)
        local i = 1
        while i <= #Player1.graveyard do
            local card1 = Player1.graveyard[i]
            Player1.graveyard[i] = Player1.graveyard[i+1]
            Player1.deck[#Player1.deck+1] = card1
            Functions.shuffle2(Player1.deck)
            i = i+1
        end
        print(Player1.name.."'s graveyard was shuffle into the deck.")
    end,
    ability = function(card,Player1,Player2)
        local card1 = Player1.deck[#Player1.deck]
        Player1.deck[#Player1.deck] = nil
        print(card1.name.." is played.")
        Functions.play(card1,Player1,Player2)
    end
    }
}
Cards.GodofWealth = {
    name = "God of Wealth",
    power = 24,
    cost = 0,
    tipo = "Unit",
    stamina = 1,
    description = "Can only be played if you have 5 or more gold. Ability: Put any number of cards from your hand on the bottom of your deck, then draw that many cards.",
    effect = {
    }
}
Cards.GodofHealth = {
    name = "God of Health",
    power = 21,
    cost = 0,
    tipo = "Unit",
    stamina = 1,
    description = "Can only be played if you have 144 life or more. .",
    effect = {
    }
}
Cards.GodofGrowth = {
    name = "God of Growth",
    power = 23,
    cost = 0,
    tipo = "Unit",
    stamina = 1,
    description = "Can only be played if your level is 7 or higher. Whenever you would receive 1 gold, draw a card instead. You may pay for card's costs by discarding cards instead of paying gold.",
    effect = {
    }
}
Cards.GodofPain = {
    name = "God of Pain",
    power = 21,
    cost = 0,
    tipo = "Unit",
    stamina = 1,
    description = "Can only be played if no player has more than 20 life.--meh ",
    effect = {
    }
}
-- Cards.GodofStorm = {
--     name = "God of Storm",
--     power = 0,
--     cost = 0,
--     tipo = "Unit",
--     stamina = 1,
--     description = "",
--     effect = {
--     }
-- }
-- Cards. = {
--     name = "",
--     power = 0,
--     cost = 0,
--     tipo = "Unit",
--     stamina = 1,
--     description = "",
--     effect = {
--     }
-- }

return Gods
