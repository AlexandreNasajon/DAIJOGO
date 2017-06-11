local Player = require("Player")
local Cards = require("Cards")
local Decks = {}


Decks.Pool = {
----------------UnitS---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
    Cards.SoulGuide,Cards.Elfo,Cards.Gnome,Cards.Dwarf,Cards.Troll,Cards.Anjo,Cards.Demonio,Cards.RedAristocrat,Cards.BlueAristocrat,Cards.GreenAristocrat,Cards.YellowAristocrat,Cards.Mago,Cards.Dragao,
    Cards.Serpente,Cards.Vampiro,Cards.Golem,Cards.Coveiro,Cards.Arqueologo,Cards.StormTitan,Cards.Healer,Cards.Recrutador,Cards.Stormbringer,Cards.MindKnight,Cards.GoldKnight,Cards.Lich,Cards.Devedor,
    
----------------SupportS---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    Cards.Impulso,Cards.Furia,Cards.Investida,Cards.Stormear,Cards.Greed,Cards.SellSoul,Cards.Burn,Cards.Cooperar,Cards.Drenar,Cards.destroy,Cards.Pote,Cards.AsCaras,Cards.Brainstorm,Cards.Firestorm,
    Cards.Lifestorm,Cards.Concentrar,Cards.Espiar,Cards.Lembrar,Cards.Reviver,Cards.Reanimar,Cards.Tutor,Cards.Selecionar,Cards.Projetar,Cards.Esmagar,Cards.Adoecer,Cards.Sacrificio,Cards.Escravidao,
            
----------------AllyS----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    Cards.Blinker,Cards.Seletor,Cards.Administrador,Cards.StormPriest
}

Decks.Ace = {
} --cada deck só pode ter um card Ace

Decks.Spell = {Cards.Providencia,Cards.Sorte,Cards.Suportar,Cards.Recrutar,Cards.Renascer,Cards.Recuperar,Cards.Eliminar
} --só pode usar uma magia por turn

Decks.Extra = {
} --monta um deck extra de 10 cards que podem ser jogados somente de formas específicas, jogados diretamente do deck extra

Decks.Extra.Ex = {Cards.ExDragon
} --versão Ex de cards de Unit. Pode transformar o card de Unit no field em um card Ex no deck extra

Decks.Extra.Turbo = {
} --cards turbo começam na mão dos Playeres. Cada Player só pode ter um card turbo no deck extra

Decks.Extra.Devorador = {
} --cards devorador são Units. Podem ser jogadas sacrificando as Unit necessárias

Decks.Extra.Conspiracoes = {
} --cada Player pode ter conspirações em jogo antes da partida começar; funcionam exatamente como traps, mas mais difícies de ativar

Decks.Extra.Quests = {
} --cada Player começa com suas quests; conforme ele vai realizando as tarefas, ganha recompensas

Decks.Items = {
} --cada Unit pode ter um item equipado

Decks.Tecnica = {
} --cada Player pode ter técnicas

Decks.Fases = {
} --coloca uma regra nova no jogo, tipo encantamento global ou field spell

Decks.Traps = {
} --cards traps são jogados sem o oponente saber. Tem condição pra ativar e ativam sozinhas

Decks.Totems = {
} --ateot, if cond then effect

--ULTRA: cards podem ter uma ability Ultra. Só pode usar uma durante toda a partida

Decks.Heroes = {
} --HERO: units que só pode ter uma no deck

Decks.Aristocratas = {Cards.BlueAristocrat,Cards.BlueAristocrat,Cards.BlueAristocrat,Cards.YellowAristocrat,Cards.YellowAristocrat,Cards.YellowAristocrat,Cards.Dragon, -- Aristocrats
    Cards.Gnome,Cards.Gnome,Cards.Gnome,Cards.Dwarf,Cards.Dwarf,Cards.Dwarf,Cards.Rewarder,Cards.Rewarder,Cards.Rewarder, --Sac fodder
    Cards.Enlighten,Cards.Enlighten,Cards.Enlighten,Cards.Luck,Cards.Luck,Cards.Luck, -- Spells
    Cards.DiggerTotem,Cards.DiggerTotem,Cards.DiggerTotem, --Totems
    Cards.Slavery,Cards.Slavery,Cards.Sacrifice,Cards.Sacrifice,Cards.Sacrifice -- Supports
}
Decks.AristocratasExtra = {Cards.ExDragon}

Decks.Storm = {Cards.StormTitan, -- wincon
    Cards.Concentrate,Cards.Concentrate,Cards.Concentrate,Cards.Brainstorm,Cards.Brainstorm,Cards.Firestorm,Cards.Firestorm,Cards.Lifestorm,Cards.Lifestorm, --storm cards
    Cards.Stormbringer,Cards.Stormbringer,Cards.Stormbringer,Cards.StormCall,Cards.StormCall,Cards.StormCall,Cards.StormPriest,Cards.StormPriest,Cards.StormPriest, --Storm producers
    Cards.Impulse,Cards.Impulse,Cards.Impulse, --card draw
    Cards.SellSoul,Cards.SellSoul,Cards.SellSoul, -- get gold
    Cards.Cooperate,Cards.Cooperate,Cards.Cooperate, -- filler
    Cards.Johnzera, -- recursion
    Cards.Isa --life gain
    
}

Decks.Blink = {Cards.Blinker,Cards.Blinker,Cards.Blinker,Cards.BikerLeo, -- blinkers
    Cards.Recruiter,Cards.Demon, -- units cost 2
    Cards.Vampire,Cards.Vampire,Cards.Vampire,Cards.Healer,Cards.Archaeologist,Cards.Gravedigger,Cards.Debtor,Cards.Debtor,Cards.Debtor, -- units cost 1
    Cards.Fury,Cards.Tutor,Cards.SellSoul,Cards.Destroy, -- Supports
    Cards.Enlighten,Cards.Enlighten,Cards.Enlighten,Cards.ToRecruit,Cards.ToRecruit,Cards.ToRecruit, -- Spells
    Cards.Val,Cards.Isa,Cards.Paim,Cards.Breno,Cards.Johnzera -- Heroes
    
}

Decks.Reanimate = {
}

Decks.Architect = {
}



Decks.Draftpool = {}

Decks.Player1 = {}

Decks.Player2 = {}

return Decks
