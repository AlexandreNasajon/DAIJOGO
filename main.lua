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
        print("#","Name       ","Cost","Type","Power","Loyalty")
        print("--------------------------------------------------------")
        while i <= 5 do
            print(i,Decks.Draftpool[i].name,Decks.Draftpool[i].cost,Decks.Draftpool[i].tipo,Decks.Draftpool[i].power,Decks.Draftpool[i].loyalty)
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
        print("#","Name       ","Cost","Type","Power","Loyalty")
        print("--------------------------------------------------------")
        while i <= 5 do
            print(i,Decks.Draftpool[i].name,Decks.Draftpool[i].cost,Decks.Draftpool[i].tipo,Decks.Draftpool[i].power,Decks.Draftpool[i].loyalty)
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
--------------------------------------------------------------------------------

os.execute("clear")
print("      DAIJOGO: first edition")
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
print("What's player 1's name")
Player[1].name = io.read()
print("So player 1's name is "..Player[1].name.."!")
print("And what's player 2's name?")
Player[2].name = io.read()
print("So player 2's name is "..Player[2].name.."!")
print("I imagine both player read the manual, right? Right! Then good luck!")
print("-----GAME STARTOOOOO-----")
print("Select the game's mode:")
print("1 - Standard")
print("2 - Tchebo")
local opcao = tonumber(io.read())
if opcao == 2 then
    modotchebo = true
end
print("Select the game's format:")
print("1 - Standard")
print("2 - Draft")
local opcao = tonumber(io.read())
if opcao == 1 then
    print("Standard format it is!")
    print("Choose your decks!")
    local z = false
    local e = false
    while z == false do
        print(Player[1].name.." must choose a deck:")
        print("1 - Aristocrats")
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
            print("CHOOSE A DECK!")
        end
    end
    while e == false do
        print(Player[2].name.." must choose a deck:")
        print("1 - Aristocrats")
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
            print("CHOOSE A DECK!")
        end
    end
elseif opcao == 2 then
    Draft()
end
print("That's it, peize! Have fun! :3 :3 :3")

Functions.game()
