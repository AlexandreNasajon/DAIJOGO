math.randomseed(os.time())
local Funcoes = require("Funcoes")
local Jogador = require("Jogador")
local Cards = require("Cards")
local Decks = require("Decks")

os.execute("clear")
print("     CARD GAME: primeira edição")
print("           Versão 1.4.2")
print("           Game Designer")
print("         Alexandre Nasajon        ")
print("           Game Developer           ")
print("         Alexandre Nasajon        ")
print("           Game Producer           ")
print("         Alexandre Nasajon        ")
print("          Game Programmer          ")
print("         Alexandre Nasajon        ")
print("       Com a colaboração de       ")
print("               Kiki")
print("               peize")
-- print("         Leonardo Kaplan")
-- print("         Thiago Rebello")
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
    local z = false
    local e = false
    while z == false do
        print(Jogador[1].nome.." deve escolher um deck:")
        print("1 - Aristocratas")
        print("2 - Storm")
        print("3 - Blink")
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 1 then
            tempcard = {}

            for k,v in pairs(Decks.Aristocratas) do
                tempcard = Funcoes.copiar(v,tempcard)
                Jogador[1].deck[#Jogador[1].deck+1] = tempcard
                tempcard = {}
            end
            z = true
        elseif opcao ~= nil and opcao == 2 then
                tempcard = {}
            for k,v in pairs(Decks.Storm) do
                tempcard = Funcoes.copiar(v,tempcard)
                Jogador[1].deck[#Jogador[1].deck+1] = tempcard
                tempcard = {}
            end
            z = true
        elseif opcao ~= nil and opcao == 3 then
                tempcard = {}
            for k,v in pairs(Decks.Blink) do
                tempcard = Funcoes.copiar(v,tempcard)
                Jogador[1].deck[#Jogador[1].deck+1] = tempcard
                tempcard = {}
            end
            z = true
        else
            print("ESCOLHA UM DECK!")
        end
    end
    while e == false do
        print(Jogador[2].nome.." deve escolher um deck:")
        print("1 - Aristocratas")
        print("2 - Storm")
        print("3 - Blink")
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 1 then
            tempcard = {}

            for k,v in pairs(Decks.Aristocratas) do
                tempcard = Funcoes.copiar(v,tempcard)
                Jogador[2].deck[#Jogador[2].deck+1] = tempcard
                tempcard = {}
            end
            e = true
        elseif opcao ~= nil and opcao == 2 then
            tempcard = {}
            for k,v in pairs(Decks.Storm) do
                tempcard = Funcoes.copiar(v,tempcard)
                Jogador[2].deck[#Jogador[2].deck+1] = tempcard
                tempcard = {}
            end
            e = true
        elseif opcao ~= nil and opcao == 3 then
                tempcard = {}
            for k,v in pairs(Decks.Blink) do
                tempcard = Funcoes.copiar(v,tempcard)
                Jogador[2].deck[#Jogador[1].deck+1] = tempcard
                tempcard = {}
            end
            e = true
        else
            print("ESCOLHA UM DECK!")
        end
    end
end
print("É isso aí, peize. Divirtam-se! :3 :3 :3")

Funcoes.jogo()
