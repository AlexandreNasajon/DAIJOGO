local Player = require("Player")
local Cards = require("Cards")
local Decks = {}


Decks.Pool = {
----------------36 UNIT---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
    Cards.NexusKeeper,Cards.GraveBetrayer,Cards.ReplicatorOoze,Cards.CyanSphinx,Cards.MindfulKnight,Cards.GoldenKnight,Cards.CollectorLich,Cards.SpiritGuide,Cards.ArmyRecruiter,Cards.DevourerDragon,
    Cards.ElfTrickster,Cards.MercifulAngel,Cards.Gravedigger,Cards.Archaeologist,Cards.StormTitan,Cards.Stormbringer,Cards.VampireNoble,Cards.ImpulsiveDemon,Cards.RedAristocrat,Cards.BlueAristocrat,
    Cards.CoinAristocrat,Cards.LifeAristocrat,Cards.GratefulGnome,Cards.HonorableDwarf,Cards.PilgrimMage,Cards.SolitaryHealer,Cards.HelpfulGolem,Cards.BrokenDebtor,
    Cards.SolidRewarder,Cards.CavernTroll,Cards.ReturningWitch,Cards.CursedTraveler,Cards.GrowingSlime,Cards.DeathCultist,Cards.LightPaladin,Cards.BlackSerpent,
    Cards.WhiteSnake, -- limited to 1

----------------28 SUPPORT---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    Cards.BlindingFury,Cards.SuddenSickness,Cards.StormCall,Cards.SlaveDestiny,Cards.LastSacrifice,Cards.TragicFate,Cards.ReanimateDead,Cards.SafeReturn,
    Cards.BurningFlame,Cards.Cooperation,Cards.LifeDrain,Cards.DestroyUnit,Cards.CrushingBlow,Cards.Knowledge,Cards.Concentrate,Cards.UndercoverSpy,Cards.DearMemory,
    Cards.QuickSelection,Cards.ClearProject,Cards.DaringGamble,Cards.StrangeVirtue,Cards.TormentingVice,Cards.RecklessGreed,Cards.StealGold,Cards.BouncingBlow,
    Cards.PureRevival, -- limited to 1
    Cards.SoulSelling, -- banned

---------------- 5 ALLY----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    Cards.Blinker,Cards.Selector,Cards.Administrator,Cards.Librarian,Cards.StormPriest,
    Cards.CubeLord, -- bugado

---------------19 SPELL------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    Cards.Enlightenment,Cards.UnusualLuck,Cards.GracefulGrace,Cards.SupportSeeking,Cards.UnitSeeking,Cards.PastRecover,Cards.EliminateEvil,Cards.Brainstorm,Cards.Firestorm,Cards.Lifestorm,
    Cards.TheFaces,Cards.SelfGrowth,Cards.CatchingUp,Cards.FreetheMind,Cards.InspireOthes,Cards.SelfProjection,Cards.Dematerialize,
    Cards.LayWaste, -- limited to 1
    Cards.Rebirth, -- limited to 1

---------------5 TOTEM------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    Cards.MindTotem,Cards.BurnTotem,Cards.AngelicTotem,Cards.LetGoTotem,Cards.DiggerTotem

}
-- 9 HERO
Decks.Heroes = {Cards.BikerLeo,Cards.Valentina,Cards.MasterPaim,Cards.IsaFusels,Cards.Tchebello,Cards.JonhZera,Cards.MasterKaplan,Cards.BrenoItself,Cards.NasajeraHost
} --HERO: units que só pode ter uma de cada no deck

Decks.Ace = {Cards.MindControl,Cards.Imperial,Cards.Tutor
} --cada deck só pode ter um card Ace

Decks.Extra = {
} --monta um deck extra de 10 cards que podem ser jogados somente de formas específicas, jogados diretamente do deck extra

Decks.Extra.Ex = {Cards.ExDragon
} --versão Ex de cards de Unit. Pode transformar o card de Unit no field em um card Ex no deck extra

Decks.Extra.Turbo = {
} --cards turbo começam na mão dos Players. Cada Player só pode ter um card turbo no deck extra

Decks.Extra.Devorador = {
} --cards devorador são Units. Podem ser jogadas sacrificando as Unit necessárias

Decks.Extra.Conspiracoes = {
} --cada Player pode ter conspirações em jogo antes da partida começar; funcionam exatamente como traps, mas mais difícies de ativar

Decks.Extra.Quests = {
} --cada Player começa com suas quests; conforme ele vai realizando as tarefas, ganha recompensas

Decks.Extra.Gods = {Cards.GodoftheDead,Cards.GodofWisdom,Cards.GodofWealth,Cards.GodofGrowth,Cards.GodofNexus
} -- precisa cumprir o requisito pra invocar

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
    Cards.GraveBetrayer,Cards.GraveBetrayer,
    Cards.Tutor -- Ace
}
Decks.AristocratasExtra = {Cards.GodoftheDead,Cards.GodofWisdom}

Decks.Storm = {Cards.StormTitan, -- 1 wincon
    Cards.Concentrate,Cards.Concentrate,Cards.Concentrate,Cards.Brainstorm,Cards.Brainstorm,Cards.Lifestorm,Cards.Lifestorm,Cards.Lifestorm, -- 8 storm cards
    Cards.Stormbringer,Cards.Stormbringer,Cards.Stormbringer,Cards.StormCall,Cards.StormCall,Cards.StormCall,Cards.StormPriest,Cards.StormPriest,Cards.StormPriest, -- 9 Storm producers
    Cards.SolitaryHealer,Cards.SolitaryHealer,Cards.SolitaryHealer, --3 lifegain
    Cards.Cooperation,Cards.Cooperation,Cards.Cooperation, -- 3 cantrip
    Cards.AngelicTotem,Cards.AngelicTotem,Cards.AngelicTotem, -- 3 totems
    Cards.JohnZera,Cards.NasajeraHost, -- 2 hero
    Cards.Tutor -- Ace
}
Decks.StormExtra = {Cards.GodoftheDead,Cards.GodofWisdom}

Decks.Blink = {Cards.Blinker,Cards.Blinker,Cards.Blinker,Cards.BikerLeo, -- 4 Blinkers
    Cards.ArmyRecruiter,Cards.ImpulsiveDemon,Cards.MercifulAngel, -- 3 Units cost 2
    Cards.VampireNoble,Cards.VampireNoble,Cards.VampireNoble,Cards.SolitaryHealer,Cards.Archaeologist,Cards.Gravedigger,Cards.CavernTroll,Cards.CavernTroll,Cards.CavernTroll, -- 9 units cost 1
    Cards.BlindingFury,Cards.BlindingFury,Cards.BlindingFury,Cards.SoulSelling,Cards.SoulSelling, -- 5 Supports
    Cards.EliminateEvil,Cards.EliminateEvil,Cards.EliminateEvil,Cards.UnusualLuck,Cards.UnusualLuck,Cards.UnusualLuck, -- 6 Spells
    Cards.MasterPaim,Cards.Johnzera, -- 2 Heroes
    Cards.Imperial -- Ace
}
Decks.BlinkExtra = {Cards.GodoftheDead,Cards.GodofWisdom}

Decks.Reanimator = {Cards.NexusKeeper,Cards.NexusKeeper,Cards.NexusKeeper,Cards.CyanSphinx,Cards.DevourerDragon,Cards.CollectorLich, -- 6 wincon
    Cards.PilgrimMage,Cards.PilgrimMage,Cards.PilgrimMage,Cards.GracefulGrace,Cards.GracefulGrace,Cards.GracefulGrace,Cards.DaringGamble,Cards.DaringGamble,Cards.DaringGamble, -- 9 fill Grave
    Cards.PureRevival,Cards.Rebirth,Cards.PastRecover,Cards.PastRecover,Cards.PastRecover,Cards.Archaeologist, -- 6 reanimate
    Cards.UnusualLuck,Cards.UnusualLuck,Cards.UnusualLuck,Cards.TormentingVice,Cards.TormentingVice,Cards.TormentingVice, -- 6 get gold
    Cards.Administrator, -- 1 topdeck manipulation
    Cards.JohnZera, -- 1 Hero
    Cards.Tutor -- Ace
}
Decks.ReanimatorExtra = {Cards.GodoftheDead,Cards.GodofWisdom}

Decks.LibrarianLich = {Cards.Librarian,Cards.Librarian,Cards.Librarian, -- 3 Allies
    Cards.WhiteSnake, -- 1 snake
    Cards.CollectorLich,Cards.CollectorLich,Cards.CollectorLich, -- 3 lichs
    Cards.CyanSphinx, -- 1 ultra unit
    Cards.VampireNoble,Cards.VampireNoble,Cards.VampireNoble,Cards.ReturningWitch, -- 4 other Units
    Cards.Tchebello, -- 1 hero
    Cards.EliminateEvil,Cards.EliminateEvil,Cards.EliminateEvil,Cards.UnusualLuck,Cards.UnusualLuck,Cards.UnusualLuck,Cards.Rebirth, -- 7 Spells
    Cards.ClearProject,Cards.ClearProject,Cards.ClearProject,Cards.CrushingBlow,Cards.CrushingBlow,Cards.CrushingBlow,Cards.TormentingVice,Cards.TormentingVice,Cards.TormentingVice, -- 9 Supports
    Cards.Tutor -- Ace
}
Decks.LibrarianLichExtra = {Cards.GodoftheDead,Cards.GodofWisdom}

Decks.Burn = {Cards.BurningFlame,Cards.BurningFlame,Cards.BurningFlame,Cards.LifeDrain,Cards.LifeDrain,Cards.LifeDrain,Cards.BurnTotem,Cards.BurnTotem,Cards.BurnTotem, -- 9 burn
    Cards.Cooperation,Cards.Cooperation,Cards.Cooperation,Cards.QuickSelection,Cards.QuickSelection,Cards.QuickSelection,Cards.UndercoverSpy, -- 9 cantrips
    Cards.Archaeologist,Cards.Archaeologist,Cards.Archaeologist, -- 3 burn recursion
    Cards.VampireNoble,Cards.VampireNoble,Cards.VampireNoble, -- 3 vampires
    Cards.CatchingUp,Cards.CatchingUp,Cards.CatchingUp,Cards.MindImpulse, -- 4 card draw
    Cards.IsaFusels, -- 1 hero
    Cards.Tutor -- Ace
}
Decks.BurnExtra = {Cards.GodoftheDead,Cards.GodofWisdom}

Decks.PaimOoze = {Cards.BouncingBlow,Cards.BouncingBlow,Cards.BouncingBlow, -- 3 bounces
    Cards.WhiteSnake, -- 1 WhiteSnake
    Cards.RecklessGreed,Cards.RecklessGreed,Cards.RecklessGreed, -- 3 getgold
    Cards.LayWaste,Cards.Enlightenment,Cards.Enlightenment,Cards.Enlightenment,Cards.UnusualLuck,Cards.Rebirth,Cards.UnusualLuck, -- 6 Spells
    Cards.GrowingSlime,Cards.GrowingSlime,Cards.GrowingSlime,Cards.CursedTraveler,Cards.CursedTraveler,Cards.CursedTraveler,Cards.ReplicatorOoze,Cards.ReplicatorOoze,Cards.ReplicatorOoze,
    Cards.ReturningWitch, -- 10 units
    Cards.TragicFate,Cards.TragicFate,Cards.TragicFate, -- 3 removal
    Cards.MasterPaim,Cards.JonhZera, -- 2 heroes
    Cards.Tutor -- Ace
    
}
Decks.PaimOozeExtra = {Cards.GodoftheDead,Cards.GodofWisdom}

Decks.LevelUp = {Cards.Dematerialize,Cards.Dematerialize,Cards.Dematerialize,Cards.SelfGrowth,Cards.SelfGrowth,Cards.SelfGrowth,Cards.FreetheMind,Cards.FreetheMind,Cards.FreetheMind, -- 9 spells
    Cards.LetGoTotem,Cards.LetGoTotem,Cards.LetGoTotem, -- 3 totems
    Cards.ReplicatorOoze,Cards.ReplicatorOoze,Cards.ReplicatorOoze,Cards.GrowingSlime,Cards.GrowingSlime,Cards.GrowingSlime, -- 6 units
    Cards.TormentingVice,Cards.TormentingVice,Cards.TormentingVice, -- 3 getgold
    Cards.ReanimateDead,Cards.ReanimateDead,Cards.ReanimateDead, -- 3 reanimate
    Cards.BlindingFury,Cards.BlindingFury,Cards.BlindingFury, -- 3 buffs
    Cards.MasterKaplan,Cards.MasterPaim, -- 2 hero
    Cards.Imperial -- Ace
    
}
Decks.LevelUpExtra = {Cards.GodoftheDead,Cards.GodofWisdom,Cards.GodofNexus}

Decks.Draftpool = {}

Decks.Player1 = {}

Decks.Player2 = {}

return Decks
