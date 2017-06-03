local Jogador = require("Jogador")
local Cards = require("Cards")
local Decks = {}


Decks.Pool = {
----------------UNIDADES---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
    Cards.AlmaGuia,Cards.Elfo,Cards.Gnome,Cards.Dwarf,Cards.Troll,Cards.Anjo,Cards.Demonio,Cards.RedAristocrat,Cards.BlueAristocrat,Cards.GreenAristocrat,Cards.YellowAristocrat,Cards.Mago,Cards.Dragao,
    Cards.Serpente,Cards.Vampiro,Cards.Golem,Cards.Coveiro,Cards.Arqueologo,Cards.StormTitan,Cards.Healer,Cards.Recrutador,Cards.Stormdude,Cards.MindKnight,Cards.GoldKnight,Cards.Lich,Cards.Devedor,
    
----------------SUPORTES---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    Cards.Impulso,Cards.Furia,Cards.Investida,Cards.Stormear,Cards.Ganancia,Cards.VenderAlma,Cards.Burn,Cards.Cooperar,Cards.Drenar,Cards.Destruir,Cards.Pote,Cards.AsCaras,Cards.Brainstorm,Cards.Firestorm,
    Cards.Lifestorm,Cards.Concentrar,Cards.Espiar,Cards.Lembrar,Cards.Reviver,Cards.Reanimar,Cards.Tutor,Cards.Selecionar,Cards.Projetar,Cards.Esmagar,Cards.Adoecer,Cards.Sacrificio,Cards.Escravidao,
            
----------------ALIADOS----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    Cards.Blinker,Cards.Seletor,Cards.Administrador
}

Decks.Ace = {
} --cada deck só pode ter um card Ace
Decks.Magia = {
} --só pode usar uma magia por turno
Decks.Extra = {
} --monta um deck extra de 10 cards que podem ser jogados somente de formas específicas, jogados diretamente do deck extra
Decks.Extra.Ex = {
} --versão Ex de cards de unidade. Pode transformar o card de unidade no campo em um card Ex no deck extra
Decks.Extra.Ultra = {
} --cards podem ter uma habilidade Ultra. Só pode usar uma durante toda a partida
Decks.Extra.Turbo = {
} --cards turbo começam na mão dos jogadores. Cada jogador só pode ter um card turbo no deck extra
Decks.Extra.Devorador = {
} --cards devorador são unidades. Podem ser jogadas sacrificando as unidade necessárias
Decks.Extra.Conspiracoes = {
} --cada jogador pode ter conspirações em jogo antes da partida começar; funcionam exatamente como traps, mas mais difícies de ativar
Decks.Extra.Quests = {
} --cada jogador começa com suas quests; conforme ele vai realizando as tarefas, ganha recompensas
Decks.Items = {
} --cada unidade pode ter um item equipado
Decks.Tecnica = {
} --cada jogador pode ter técnicas
Decks.Fases = {
} --coloca uma regra nova no jogo, tipo encantamento global ou field spell
Decks.Traps = {
} --cards traps são jogados sem o oponente saber. Tem condição pra ativar e ativam sozinhas

Decks.Aristocratas = {Cards.RedAristocrat,Cards.BlueAristocrat,Cards.GreenAristocrat,Cards.YellowAristocrat,Cards.Traidor,Cards.Mago,Cards.Mago,
    Cards.Gnome,Cards.Gnome,Cards.Gnome,Cards.AlmaGuia,Cards.AlmaGuia,Cards.Dwarf,Cards.Dwarf,Cards.Dwarf,Cards.Serpente,
    Cards.Demonio,Cards.Vampiro,Cards.Golem,Cards.Coveiro,Cards.Coveiro,Cards.Adoecer,
    Cards.Pote,Cards.Impulso,Cards.Lembrar,Cards.Esmagar,Cards.Reanimar,Cards.Destruir,Cards.Tutor,Cards.Sacrificio,Cards.Sacrificio,Cards.Sacrificio,Cards.Escravidao,Cards.Escravidao
}

Decks.Storm = {Cards.Stormdude,Cards.Stormdude,Cards.Arqueologo,Cards.Arqueologo,Cards.Anjo,Cards.StormTitan,
    Cards.Pote,Cards.Impulso,Cards.Lembrar,Cards.Tutor,Cards.Stormear,Cards.Stormear,Cards.Stormear,Cards.AsCaras,Cards.Espiar,Cards.Blinker,
    Cards.Firestorm,Cards.Brainstorm,Cards.Selecionar,Cards.Lifestorm,Cards.Seletor,Cards.Cooperar,Cards.Administrador,Cards.MindKnight,Cards.MindKnight,Cards.Ganancia,Cards.Ganancia,Cards.VenderAlma,
    Cards.VenderAlma,Cards.Concentrar,Cards.Concentrar,Cards.Concentrar
}

Decks.Blink = {Cards.Blinker,Cards.Blinker,Cards.Blinker,Cards.Anjo,Cards.Anjo,Cards.Arqueologo,Cards.Arqueologo,Cards.StormTitan,Cards.Healer,Cards.Healer,Cards.Troll,Cards.Vampiro,Cards.Demonio,
    Cards.Coveiro,Cards.Vampiro,Cards.Troll,Cards.VenderAlma,Cards.VenderAlma,Cards.VenderAlma,Cards.Tutor,Cards.Lembrar,Cards.Recrutador,Cards.Healer,Cards.Elfo,Cards.AsCaras,Cards.Pote,Cards.Selecionar,
    Cards.Recrutador,Cards.Elfo,Cards.Elfo
}

Decks.Reanimar = {Cards.Reviver,Cards.Reviver,Cards.Reviver,Cards.Reanimar,Cards.Reanimar,Cards.Reanimar,Cards.Dragao,Cards.Dragao,Cards.Dragao,Cards.Mago,Cards.Mago,Cards.Mago,Cards.Serpente,Cards.Serpente,Cards.Serpente,
    Cards.Administrador,Cards.Administrador,Cards.StormTitan,Cards.Ganancia,Cards.Ganancia,Cards.Ganancia,Cards.Lich,Cards.Lich,Cards.Lich,Cards.Troll,Cards.Troll,Cards.Healer,Cards.Healer,Cards.Healer,
    Cards.Troll
}

Decks.Circulo = {}

Decks.Draftpool = {}

Decks.Jogador1 = {}

Decks.Jogador2 = {}

return Decks
