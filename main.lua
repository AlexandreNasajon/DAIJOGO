math.randomseed(os.time())
local Funcoes = require("Funcoes")
local Jogador = require("Jogador")
local Cards = require("Cards")
local Decks = require("Decks")

os.execute("clear")
print("Qual é o nome do Jogador 1?")
Jogador[1].nome = io.read()
print("Então o Jogador 1 se chama "..Jogador[1].nome.."!")
print("E qual o nome do Jogador 2?")
Jogador[2].nome = io.read()
print("Então o Jogador 2 se chama "..Jogador[2].nome.."!")
print("Imagino que vocês leram o manual, certo? Certo! Então boa sorte!")
print("-----GAME STARTOOOOO-----")
print("Selecionem o modo de jogo:")
print("1 - Padrão")
print("2 - Draft (em manutenção :3)")
local modo = tonumber(io.read())
if modo then
    print("Então vocês querem jogar o modo padrão, não é?")
    print("Bom, não é como se vocês pudessem escolher outro HAHAHA!")
    print("Pois bem, escolham seus decks!")
    print(Jogador[1].nome.." deve escolher um deck:")
    print("1 - Aristocratas")
    print("HAAAA!")
    local opcao = tonumber(io.read())
    if opcao then
        tempcard = {}

        for k,v in pairs(Decks.Aristocratas) do
            tempcard = Funcoes.copiar(v,tempcard)
            Jogador[1].deck[#Jogador[1].deck+1] = tempcard
            tempcard = {}
        end

        for k,v in pairs(Decks.Aristocratas) do
            tempcard = Funcoes.copiar(v,tempcard)
            Jogador[2].deck[#Jogador[2].deck+1] = tempcard
            tempcard = {}
        end
        print("Os jogadores vão usar o deck Aristocratas porque é o único que eu fiz até agora --'")
    end
end
print("É isso aí, peize. Divirtam-se! :3 :3 :3")

Funcoes.jogo()
