local Jogador = require("Jogador")
local Cards = require("Cards")
local Decks = {}

Decks.Aristocratas = {Cards.RedAristocrat,Cards.BlueAristocrat,Cards.GreenAristocrat,Cards.YellowAristocrat,Cards.Dragao,Cards.Mago,Cards.Mago,
    Cards.Gnome,Cards.Gnome,Cards.Gnome,Cards.Gnome,Cards.Dwarf,Cards.Dwarf,Cards.Dwarf,Cards.Dwarf,Cards.Serpente,
    Cards.Demonio,Cards.Vampiro,Cards.Golem,Cards.Coveiro,Cards.Coveiro,Cards.Recrutador,
    Cards.Pote,Cards.Impulso,Cards.Lembrar,Cards.Reviver,Cards.Reanimar,Cards.Destruir,Cards.Tutor,Cards.Investida
}

Decks.Storm = {Cards.Stormdude,Cards.Stormdude,Cards.Arqueologo,Cards.Arqueologo,Cards.Anjo,Cards.StormTitan,
    Cards.Pote,Cards.Impulso,Cards.Lembrar,Cards.Tutor,Cards.Stormear,Cards.Stormear,Cards.Stormear,Cards.AsCaras,Cards.Espiar,Cards.Blinker,
    Cards.Firestorm,Cards.Brainstorm,Cards.Selecionar,Cards.Lifestorm,Cards.AsCaras,Cards.Cooperar,Cards.AsCaras,Cards.Drenar,Cards.Drenar,Cards.Ganancia,Cards.Ganancia,Cards.Ganancia,Cards.VenderAlma,Cards.VenderAlma
}

Decks.Blink = {Cards.Blinker,Cards.Blinker,Cards.Blinker,Cards.Anjo,Cards.Anjo,Cards.Arqueologo,Cards.Arqueologo,Cards.StormTitan,Cards.Stormdude,Cards.Stormdude,Cards.Stormdude,Cards.Vampiro,Cards.Demonio,
    Cards.Lifestorm,Cards.Lifestorm,Cards.Lifestorm,Cards.VenderAlma,Cards.VenderAlma,Cards.VenderAlma,Cards.Tutor,Cards.Lembrar,Cards.Impulso,Cards.Impulso,Cards.Impulso,Cards.AsCaras,Cards.Pote,Cards.Selecionar,
    Cards.Recrutador,Cards.Elfo,Cards.Elfo
}

Decks.Filtro = {}

Decks.Jogador1 = {}

Decks.Jogador2 = {}

return Decks
