local Jogador = require("Jogador")
local Cards = require("Cards")
local Decks = {}

Decks.Aristocratas = {Cards.RedAristocrat,Cards.BlueAristocrat,Cards.BlueAristocrat,Cards.GreenAristocrat,Cards.YellowAristocrat,
    Cards.Gnome,Cards.Gnome,Cards.Gnome,Cards.Gnome,Cards.Dwarf,Cards.Dwarf,Cards.Dwarf,Cards.Dwarf,
    Cards.Demonio,Cards.Vampiro,Cards.Golem,Cards.Coveiro,Cards.Coveiro,Cards.Coveiro,
    Cards.Pote,Cards.Impulso,Cards.Lembrar,Cards.Reviver,Cards.Destruir,Cards.Destruir,Cards.Investida}

Decks.Storm = {}

return Decks
