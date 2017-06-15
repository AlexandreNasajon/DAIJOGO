local Player = require("Player")
local Cards = require("Cards")
local Decks = {}


Decks.Pool = {
----------------UNIT---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
    Cards.CascadeKeeper,Cards.GraveBetrayer,Cards.ReplicatorOoze,Cards.CyanSphinx,Cards.MindfulKnight,Cards.GoldenKnight,Cards.CollectorLich,Cards.SoulGuide,Cards.ArmyRecruiter,Cards.DevourerDragon,
    Cards.ElfTrickster,Cards.MercifulAngel,Cards.Gravedigger,Cards.Archaeologist,Cards.StormTitan,Cards.Stormbringer,Cards.VampireNoble,Cards.ImpulsiveDemon,Cards.RedAristocrat,Cards.BlueAristocrat,
    Cards.CoinAristocrat,Cards.LifeAristocrat,Cards.GratefulGnome,Cards.HonorableDwarf,Cards.PilgrimMage,Cards.BlackSerpent,Cards.WhiteSnake,Cards.SolitaryHealer,Cards.HelpfulGolem,Cards.BrokenDebtor,
    Cards.SolidRewarder,Cards.CavernTroll,


----------------SUPPORT---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    Cards.MindImpulse,Cards.BlindingFury,Cards.SuddenSickness,Cards.StormCall,Cards.RecklessGreed,Cards.SoulSelling,Cards.SlaveDestiny,Cards.LastSacrifice,Cards.TormentingVice,Cards.StrangeVirtue,
    Cards.BurningFlame,Cards.Cooperation,Cards.LifeDrain,Cards.DestroyUnit,Cards.CrushingBlow,Cards.Knowledge,Cards.Concentrate,Cards.UndercoverSpy,Cards.DearMemory,Cards.PureRevival,Cards.ReanimateDead,
    Cards.QuickSelection,Cards.ClearProject,Cards.DaringGamble,

----------------ALLY----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    Cards.Blinker,Cards.Selector,Cards.Administrator,Cards.Librarian,Cards.StormPriest,Cards.CubeLord,

---------------SPELL------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    Cards.Enlightenment,Cards.UnusualLuck,Cards.GracefulGrace,Cards.SupportSeeking,Cards.UnitSeeking,Cards.PastRecover,Cards.EliminateEvil,Cards.LayWaste,Cards.Brainstorm,Cards.Firestorm,Cards.Lifestorm,
    Cards.TheFaces,Cards.LevelUp,Cards.SelfGrowth,Cards.CatchingUp,

---------------TOTEM------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    Cards.MindTotem,Cards.BurnTotem,Cards.AngelicTotem,Cards.LetGoTotem,Cards.DiggerTotem

}

Decks.Heroes = {Cards.BikerLeo,Cards.Valentina,Cards.MasterPaim,Cards.IsaFusels,Cards.Tchebello,Cards.JonhZera,Cards.MasterKaplan,Cards.BrenoItself
} --HERO: units que só pode ter uma de cada no deck

Decks.Ace = {Cards.MindControl,Cards.Imperial,Cards.Rebirth,Cards.Tutor
} --cada deck só pode ter um card Ace

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


--ULTRA: cards podem ter uma ability Ultra. Só pode usar uma durante toda a partida


Decks.Aristocratas = {Cards.RedAristocrat,Cards.RedAristocrat,Cards.RedAristocrat,Cards.CoinAristocrat,Cards.CoinAristocrat,Cards.CoinAristocrat,Cards.DevourerDragon, -- 7 Aristocrats
    Cards.WhiteSnake,Cards.HonorableDwarf,Cards.HonorableDwarf,Cards.HonorableDwarf,Cards.GratefulGnome,Cards.GratefulGnome,Cards.GratefulGnome,Cards.SolidRewarder,Cards.SolidRewarder, -- 9 Sac fodder
    Cards.SlaveDestiny,Cards.LastSacrifice,Cards.SlaveDestiny,Cards.LastSacrifice,Cards.SlaveDestiny,Cards.LastSacrifice, -- 6 Supports
    Cards.DiggerTotem, -- 1 Totem
    Cards.Enlightenment,Cards.Enlightenment,Cards.Enlightenment,Cards.EliminateEvil,Cards.EliminateEvil, -- 5 Spells
    Cards.JonhZera, -- 1 hero
    Cards.Tutor -- Ace
}
Decks.AristocratasExtra = {Cards.ExDragon}

Decks.Storm = {Cards.StormTitan, -- 1 wincon
    Cards.Concentrate,Cards.Concentrate,Cards.Concentrate,Cards.Brainstorm,Cards.Brainstorm,Cards.Lifestorm,Cards.Lifestorm,Cards.Lifestorm, -- 8 storm cards
    Cards.Stormbringer,Cards.Stormbringer,Cards.Stormbringer,Cards.StormCall,Cards.StormCall,Cards.StormCall,Cards.StormPriest,Cards.StormPriest,Cards.StormPriest, -- 9 Storm producers
    Cards.SolitaryHealer,Cards.SolitaryHealer,Cards.SolitaryHealer, --3 lifegain
    Cards.Cooperation,Cards.Cooperation,Cards.Cooperation, -- 3 cantrip
    Cards.BlackSerpent, -- 1 brainstorm combo
    Cards.AngelicTotem,Cards.AngelicTotem,Cards.AngelicTotem, -- 3 totems
    Cards.JohnZera, -- 1 hero
    Cards.Tutor -- Ace
}

Decks.Blink = {Cards.Blinker,Cards.Blinker,Cards.Blinker,Cards.BikerLeo, -- 4 Blinkers
    Cards.ArmyRecruiter,Cards.ImpulsiveDemon,Cards.MercifulAngel, -- 3 Units cost 2
    Cards.VampireNoble,Cards.VampireNoble,Cards.VampireNoble,Cards.SolitaryHealer,Cards.Archaeologist,Cards.Gravedigger,Cards.CavernTroll,Cards.CavernTroll,Cards.CavernTroll, -- 9 units cost 1
    Cards.BlindingFury,Cards.BlindingFury,Cards.BlindingFury,Cards.SoulSelling,Cards.SoulSelling, -- 5 Supports
    Cards.EliminateEvil,Cards.EliminateEvil,Cards.EliminateEvil,Cards.UnusualLuck,Cards.UnusualLuck,Cards.UnusualLuck, -- 6 Spells
    Cards.MasterPaim,Cards.Johnzera, -- 2 Heroes
    Cards.Imperial -- Ace
}

Decks.Reanimator = {Cards.CollectorLich,Cards.CyanSphinx,Cards.Dragon,Cards.CascadeKeeper,Cards.CascadeKeeper,Cards.CascadeKeeper, -- reanimation targets
    Cards.Project,Cards.Project,Cards.Project,Cards.Johnzera,Cards.GracefulGrace,Cards.GracefulGrace,Cards.GracefulGrace,Cards.Mage,Cards.Mage,Cards.Mage, -- fill graveyard
    Cards.Reanimate,Cards.Reanimate,Cards.Reanimate,Cards.Rebirth, -- reanimators
    Cards.Healer,Cards.Healer,Cards.Healer, -- life gain
    Cards.Recoup,Cards.Recoup, -- recursion
    Cards.Luck,Cards.Luck,Cards.Luck,Cards.Elf, -- get gold
    Cards.Spy,Cards.Spy
}

Decks.LibrarianLich = {Cards.Librarian,Cards.Librarian,Cards.Librarian, -- 3 Allies
    Cards.CollectorLich,Cards.CollectorLich,
    Cards.VampireNoble,Cards.VampireNoble,Cards.VampireNoble,Cards.ElfTrickster,Cards.ElfTrickster,Cards.ElfTrickster,Cards.HelpfulGolem,Cards.HelpfulGolem,Cards.HelpfulGolem, -- 11 Units
    Cards.EliminateEvil,Cards.EliminateEvil,Cards.EliminateEvil,Cards.UnusualLuck,Cards.UnusualLuck,Cards.UnusualLuck, -- 6 Spells
    Cards.ClearProject,Cards.ClearProject,Cards.ClearProject,Cards.CrushingBlow,Cards.CrushingBlow,Cards.CrushingBlow,Cards.TormentingVice,Cards.TormentingVice,Cards.TormentingVice, -- 9 Supports
    Cards.Tutor -- Ace
}


Decks.Architect = {
}



Decks.Draftpool = {}

Decks.Player1 = {}

Decks.Player2 = {}

return Decks
