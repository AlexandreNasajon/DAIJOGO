local Player = require("Player")
local Functions = require("Functions")
local Allies = {}

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
                print("YOU MUST ADD A CARD TO THE TOP OF YOUR DECK!")
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

return Allies
