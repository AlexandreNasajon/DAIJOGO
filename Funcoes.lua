local Jogador = require("Jogador")
local Funcoes = {}


Funcoes.mudarzona = function(card,destino)

    if card.zona == deck then
        
    elseif card.zona == mao then
    
    elseif card.zona == campo then
    
    elseif card.zona == cemiterio then
    
    end

end
-------------CONDIÇÕES----------------
    --------IF SUMMONED-------------        
    Funcoes.ifsummoned = function(card,Jogador1,Jogador2)
        if Jogador1.campo.card then
            return true
        else
            return false
        end
    end
    --------IF DIES-----------------
    Funcoes.ifdies = function(card,Jogador1,Jogador2)
        if Jogador1.cemiterio.card then
            return true
        else
            return false
        end
    end
-----------SHUFFLE DECK----------------NAO FUNCIONA
Funcoes.shuffle  = function(Jogador1)
    local deckfim = {}
    local i = 1
    while i < #Jogador1.deck do
        card = math.random(1,#Jogador1.deck)
        deckfim.i = Jogador1.deck.card
        Jogador1.deck.card = nil
        i = i+1
    end
    Jogador1.deck = deckfim
    return Jogador1.deck
end

--------outro shuffle---------FUNCIONA
Funcoes.shuffle2 = function(a)
	local c = #a
	for i = 1, c do
		local ndx0 = math.random( 1, c )
		a[ ndx0 ], a[ i ] = a[ i ], a[ ndx0 ]
	end
	return a
end
------------DIFERENCIAR---------
Funcoes.dif = function(card)
    local b = {}
    for k,v in pairs(card) do
        b[k] = v
        return b
    end
end
-----------FIND-------------
Funcoes.find = function(a,n)
    local i = 1
    while i <= #a do
        if a[i] == n then
            return i
        else
            i = i+1
        end
    end
end
----------FIND2--------------
Funcoes.find2 = function(a,n)
    for k,v in pairs(a) do
        if v == n then
        return k
        end
    end
end
------------DRAW----------------nao tá diferenciando 
Funcoes.draw = function(Jogador1)
    Jogador1.mao[#Jogador1.mao+1] = Jogador1.deck[#Jogador1.deck]
    Jogador1.deck[#Jogador1.deck] = nil
end

----------RECEBER OURO-------------
Funcoes.getgold = function(Jogador)
    Jogador.ouro = Jogador.ouro+1
end

---------RECEBER STAMINA------------
Funcoes.getstamina = function(card)

    card.stamina = card.stamina +1
end

------------PRINT ZONA----------
Funcoes.printzona = function(zona)

    local i = 1
    print("#","Nome","Custo","Tipo","Poder")
    while i <= #zona do
        print(i,zona[i].nome,zona[i].custo,zona[i].tipo,zona[i].poder)
        i = i+1
    end    
end

-----------DESTRUIR------------NAO TÁ DESTRUINDO
Funcoes.destruir = function(card,Jogador,oponente)
    Jogador.cemiterio[#Jogador.cemiterio+1] = card
    Jogador.campo[Funcoes.find(Jogador.campo,card)] = nil
    local j = 1
    while j <= #Jogador.campo do
        Jogador.campo[j] = Jogador.campo[j+1]
        j = j+1
    end
    print(card.nome.." foi destruído.")
    if card.efeito then
        if card.efeito == true then
        card.efeito(Jogador,oponente)
        else
        end
    end
end

-----------COMBATE-------------testar mais
Funcoes.combate = function(atacante,defensor,Jogador1,Jogador2)

    if atacante.poder > defensor.poder then
        Funcoes.destruir(defensor,Jogador2,Jogador1)
    elseif atacante.poder == defensor.poder then
        Funcoes.destruir(defensor,Jogador2,Jogador1)
        Funcoes.destruir(atacante,Jogador1,Jogador2)
    elseif atacante.poder < defensor.poder then
        Funcoes.destruir(atacante,Jogador1,Jogador2)
    end
end

-----------CONJURAR--------não testada
Funcoes.conjurar = function(card,Jogador1,Jogador2)
    if card.tipo == "Suporte" then
        card.efeito(Jogador1,Jogador2)
        Jogador1.cemiterio[#Jogador1.cemiterio+1] = card
    end
end

----------- INVOCAR------------nao testada
Funcoes.invocar = function(card,Jogador1,Jogador2)
    if card.tipo == "Unidade" then
        Jogador1.campo[#Jogador1.campo+1] = card
        card.zona = Jogador1.campo
        print(card.nome.." foi invocado.")
        if card.efeito then
            card.efeito(Jogador1,Jogador2)
        end
    end
end

----------JOGAR-----------nao testada
Funcoes.jogar = function(card,Jogador,Jogador2)
        
    if card.custo <= Jogador1.ouro then
        Jogador1.ouro = Jogador1.ouro - card.custo
        if card.tipo == "Unidade" then
            Funcoes.invocar(card,Jogador1)
        elseif card.tipo == "Suporte" then
            Funcoes.conjurar(card,Jogador1)
        end
    elseif card.custo > Jogador1.ouro then
        print("Você não tem ouro suficiente!")
    end
end

-----------DANO----------nao testada
Funcoes.dano = function(alvo,quantidade)
    alvo.vida = alvo.vida - quantidade
end
-----------GET LIFE--------nao testada
Funcoes.getlife = function(alvo,quantidade)
    alvo.vida = alvo.vida + quantidade
end
----------STORM-------------
Funcoes.storm = function(Jogador1,quantidade)
    Jogador1.storm = Jogador1.storm+quantidade
    print(Jogador1.nome.." aumentou seu storm em "..quantidade..".")
end
-----------FIM DO TURNO------------nao testada
Funcoes.fimdoturno = function(Jogador1,Jogador2)
            print("Fim do turno de "..Jogador1.nome..".")
            Jogador1.storm = 0
            if #Jogador2.deck > 0 then
                Funcoes.draw(Jogador2)
                print(Jogador2.nome.." compra um card.")
            else
                print(Jogador2.nome.." não tem mais cards no deck.")
            end
            Funcoes.getgold(Jogador2)
            print("Jogador "..Jogador2.nome.." recebe 1 de ouro.")
            i = #Jogador2.campo
            while i > 0 do
                Jogador2.campo[i].stamina = 1
                i = i-1
            end
end
------------TURNO---------------
Funcoes.turno = function(t)

    while t == 1 or t == 2 do
        
        print("É o turno do jogador "..Jogador[t].nome.."!")
        print("Vida: "..Jogador[t].vida,"Ouro: "..Jogador[t].ouro,"Storm: "..Jogador[t].storm)
        print("1 - Jogar um card")
        print("2 - Atacar com uma unidade")
        print("3 - Ver cemitério")
        print("4 - Fim do turno")
        
        local option = tonumber(io.read())
        
        while option == 1 do
            print("Sua mão é:")
            print("0 - Retornar")
            Funcoes.printzona(Jogador[t].mao)
            
            local opt = tonumber(io.read())
            
            if opt == nil then
                print("SELECIONE UMA OPÇÃO VÁLIDA!")
                break
            end

            local valid = opt <= #Jogador[t].mao and opt > 0
            
            local card = Jogador[t].mao[opt]
            
            if valid and card.custo <= Jogador[t].ouro then
                Jogador[t].ouro = Jogador[t].ouro - card.custo
                
                if Jogador[t].mao[opt].tipo == "Unidade" then
                    Funcoes.invocar(card,Jogador[t],Jogador[y])
            
                elseif Jogador[t].mao[opt].tipo == "Suporte" then
                    Funcoes.conjurar(card,Jogador[t],Jogador[y])
                end
                
                while opt <= #Jogador[t].mao do
                            Jogador[t].mao[opt] = Jogador[t].mao[opt+1]
                            opt = opt+1
                end
                
            elseif valid and Jogador[t].mao[opt].custo > Jogador[t].ouro then
                print("Você não tem ouro suficiente!")
                    
            elseif opt == 0 then
                    break
            else 
                print("SELECIONE UM CARD VÁLIDO! :'(")        
            end
        end
            
        while option == 2 do
            print("Selecione o atacante:")
            print("0 - Retornar")
            Funcoes.printzona(Jogador[t].campo)
                    
            local num = tonumber(io.read())
            if num ~= nil and num ~= 0 and num <= #Jogador[t].campo and Jogador[t].campo[num].stamina > 0 then
                while num ~= nil and num ~= 0 and num <= #Jogador[t].campo and Jogador[t].campo[num].stamina > 0 do
                    
                    local atacante = Jogador[t].campo[num]
                    
                    print("Selecione o alvo:")
                    print("0 - Retornar")
                    print("1 - Oponente")
                    if #Jogador[y].campo > 0 then
                    print("2 - Unidades")
                    end
                            
                    local alvo = tonumber(io.read())
                            
                    if alvo == 0 then
                        break
                            
                    elseif alvo == 1 then
                        Jogador[y].vida = Jogador[y].vida - atacante.poder
                        print("A vida do jogador "..Jogador[y].nome.." é agora "..Jogador[y].vida..".")
                        atacante.stamina = atacante.stamina - 1
                        break
                    end
                            
                    while alvo == 2 and #Jogador[y].campo > 0 do
                        print("Selecione o alvo:")
                        print("0 - Retornar")
                        Funcoes.printzona(Jogador[y].campo)
                        
                        local num2 = tonumber(io.read())
                                
                            if num2 == 0 then
                                break
                                
                            elseif num2 <= #Jogador[y].campo then
                                local defensor = Jogador[y].campo[num2]
                                Funcoes.combate(atacante,defensor,Jogador[t],Jogador[y])
                                break --PRECISO DE SUPER BREAK
                            else
                                print("SELECIONE UM ALVO VÁLIDO! --'")
                            end
                    end
                            
                    if alvo ~= 0 and alvo ~= 1 and alvo ~= 2 then
                            print("SELECIONE UM ALVO VÁLIDO! >.<")
                    end
                end
                    
            elseif num == 0 then
                    break
            elseif num ~= nil and num > #Jogador[t].campo then
                print("SELECIONE O ATACANTE! ò.ó")
            elseif num ~= nil and Jogador[t].campo[num].stamina <= 0 then
                print("ESTA UNIDADE NÃO TEM MAIS ENERGIA PARA ATACAR! :'(")
            else
                print("SELECIONE O ATACANTE! ò.ó")
            end
        end
        
        while option == 3 do
            print("Seu cemitério é:")
            print("0 - Retornar")
            Funcoes.printzona(Jogador[t].cemiterio)
            
            local opti = tonumber(io.read())
            
            if opti == 0 then 
                break
            else
                print("Você não pode fazer nada por eles :'(")
            end
        end
        
        if option == 4 then
            Funcoes.fimdoturno(Jogador[t],Jogador[y])
            break
            
        elseif option ~= 1 and option ~= 2 and option ~= 3 and option~= 4 then
            print("Selecione uma opção válida!")
        end
    end
end
        
------------JOGO----------------
Funcoes.jogo = function()
    os.execute("clear")
    print("Qual é o nome do Jogador 1?")
    Jogador[1].nome = io.read()
    print("Então o Jogador 1 se chama "..Jogador[1].nome.."!")
    print("E qual o nome do Jogador 2?")
    Jogador[2].nome = io.read()
    print("Então o Jogador 2 se chama "..Jogador[2].nome.."!")
    print("Imagino que vocês leram o manual, certo? Certo! Então boa sorte!")
    Funcoes.shuffle2(Jogador[1].deck)
    Funcoes.shuffle2(Jogador[2].deck)
    Funcoes.draw(Jogador[1])
    Funcoes.draw(Jogador[1])
    Funcoes.draw(Jogador[1])
    Funcoes.draw(Jogador[2])
    Funcoes.draw(Jogador[2])
    Funcoes.draw(Jogador[2])
    Funcoes.getgold(Jogador[1])
    
    while Jogador[1].vida > 0 and Jogador[2].vida > 0 do
        t = 1  y = 2
        Funcoes.turno(t)
        if Jogador[1].vida <1 then
            print(Jogador[2].nome.." venceu o jogo!")
            break
        elseif Jogador[2].vida <1 then
            print(Jogador[1].nome.." venceu o jogo!")
            break
        end
        t = 2  y = 1
        Funcoes.turno(t)
        if Jogador[1].vida <1 then
            print(Jogador[2].nome.." venceu o jogo!")
            break
        elseif Jogador[2].vida <1 then
            print(Jogador[1].nome.." venceu o jogo!")
        end
    end
end

return Funcoes
