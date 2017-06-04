math.randomseed(os.time())
local Functions = require("Functions")
local Player = require("Player")
local Cards = require("Cards")
local Decks = require("Decks")

------------------------DRAFT--------------------------------------------------------------------------------------------
Draft =  function()
    os.execute("clear")
    while #Player[1].deck < 30 do
        print(Player[1].name.." deve montar um deck de 30 cards!")
    
        m = 1
        while m <= 5 do
            Decks.Draftpool[#Decks.Draftpool+1] = Decks.Pool[math.random(1,#Decks.Pool)]
            m = m+1
        end
    
        i = 1
        print("#","name     ","cost","type","power","Lealdade")
        print("--------------------------------------------------------")
        while i <= 5 do
            print(i,Decks.Draftpool[i].name,Decks.Draftpool[i].cost,Decks.Draftpool[i].type,Decks.Draftpool[i].power,Decks.Draftpool[i].lealdade)
            i = i+1
        end
        
        action = tonumber(io.read())
                    
        if action == nil or action<1 or action>5 then
            print("SELECIONE UM CARD VÁLIDO! >.<")
            
        else
            Player[1].deck[#Player[1].deck+1] = Decks.Draftpool[action]
            print("Você selecionou "..Decks.Draftpool[action].name.."!")
            print("Seu deck tem "..#Player[1].deck.." card(s) agora. Selecione mais "..30-#Player[1].deck.."!")
            Decks.Draftpool[1] = nil
            Decks.Draftpool[2] = nil
            Decks.Draftpool[3] = nil
            Decks.Draftpool[4] = nil
            Decks.Draftpool[5] = nil
        end
    end
    print(Player[1].name.." completou seu deck!")
    os.execute("clear")
    while #Player[2].deck < 30 do
        print(Player[2].name.." deve montar um deck de 30 cards!")
    
        m = 1
        while m <= 5 do
            Decks.Draftpool[#Decks.Draftpool+1] = Decks.Pool[math.random(1,#Decks.Pool)]
            m = m+1
        end
    
        i = 1
        print("#","name     ","cost","type","power","Lealdade")
        print("--------------------------------------------------------")
        while i <= 5 do
            print(i,Decks.Draftpool[i].name,Decks.Draftpool[i].cost,Decks.Draftpool[i].type,Decks.Draftpool[i].power,Decks.Draftpool[i].lealdade)
            i = i+1
        end
        
        action = tonumber(io.read())
                    
        if action == nil or action<1 or action>5 then
            print("SELECIONE UM CARD VÁLIDO! >.<")
            
        else
            Player[2].deck[#Player[2].deck+1] = Decks.Draftpool[action]
            print("Você selecionou "..Decks.Draftpool[action].name.."!")
            print("Seu deck tem "..#Player[2].deck.." card(s) agora. Selecione mais "..30-#Player[2].deck.."!")
            Decks.Draftpool[1] = nil
            Decks.Draftpool[2] = nil
            Decks.Draftpool[3] = nil
            Decks.Draftpool[4] = nil
            Decks.Draftpool[5] = nil
        end
    end
end
------------------------------------------------------------------------------------

os.execute("clear")
print("     DAIJOGO: primeira edição")
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
print("Qual é o name do Player 1?")
Player[1].name = io.read()
print("Então o Player 1 se chama "..Player[1].name.."!")
print("E qual o name do Player 2?")
Player[2].name = io.read()
print("Então o Player 2 se chama "..Player[2].name.."!")
print("Imagino que vocês leram o manual, certo? Certo! Então boa sorte!")
print("-----GAME STARTOOOOO-----")
print("Selecionem os modos de jogo:")
print("1 - Padrão")
print("2 - Tchebo")
local opcao = tonumber(io.read())
if opcao == 2 then
    modotchebo = true
end
print("Selecionem o formato de jogo:")
print("1 - Padrão")
print("2 - Draft")
local opcao = tonumber(io.read())
if opcao == 1 then
    print("Então vocês querem jogar o modo padrão, não é?")
    print("Escolham seus decks!")
    local z = false
    local e = false
    while z == false do
        print(Player[1].name.." deve escolher um deck:")
        print("1 - Aristocratas")
        print("2 - Storm")
        print("3 - Blink")
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 1 then
            tempcard = {}

            for k,v in pairs(Decks.Aristocratas) do
                tempcard = Functions.copiar(v,tempcard)
                Player[1].deck[#Player[1].deck+1] = tempcard
                tempcard = {}
            end
            for k,v in pairs(Decks.AristocratasExtra) do
                tempcard = Functions.copiar(v,tempcard)
                Player[1].extra[#Player[1].extra+1] = tempcard
                tempcard = {}
            end
            z = true
        elseif opcao ~= nil and opcao == 2 then
                tempcard = {}
            for k,v in pairs(Decks.Storm) do
                tempcard = Functions.copiar(v,tempcard)
                Player[1].deck[#Player[1].deck+1] = tempcard
                tempcard = {}
            end
            z = true
        elseif opcao ~= nil and opcao == 3 then
                tempcard = {}
            for k,v in pairs(Decks.Blink) do
                tempcard = Functions.copiar(v,tempcard)
                Player[1].deck[#Player[1].deck+1] = tempcard
                tempcard = {}
            end
            z = true
        else
            print("ESCOLHA UM DECK!")
        end
    end
    while e == false do
        print(Player[2].name.." deve escolher um deck:")
        print("1 - Aristocratas")
        print("2 - Storm")
        print("3 - Blink")
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao == 1 then
            tempcard = {}

            for k,v in pairs(Decks.Aristocratas) do
                tempcard = Functions.copiar(v,tempcard)
                Player[2].deck[#Player[2].deck+1] = tempcard
                tempcard = {}
            end
            for k,v in pairs(Decks.AristocratasExtra) do
                tempcard = Functions.copiar(v,tempcard)
                Player[2].extra[#Player[2].extra+1] = tempcard
                tempcard = {}
            end
            e = true
        elseif opcao ~= nil and opcao == 2 then
            tempcard = {}
            for k,v in pairs(Decks.Storm) do
                tempcard = Functions.copiar(v,tempcard)
                Player[2].deck[#Player[2].deck+1] = tempcard
                tempcard = {}
            end
            e = true
        elseif opcao ~= nil and opcao == 3 then
                tempcard = {}
            for k,v in pairs(Decks.Blink) do
                tempcard = Functions.copiar(v,tempcard)
                Player[2].deck[#Player[2].deck+1] = tempcard
                tempcard = {}
            end
            e = true
        else
            print("ESCOLHA UM DECK!")
        end
    end
elseif opcao == 2 then
    Draft()
end
print("É isso aí, peize. Divirtam-se! :3 :3 :3")

Functions.jogo()
