local Jogador = require("Jogador")
local Funcoes = {}

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
------------COPIAR---------
Funcoes.copiar = function(card,b)
    for k,v in pairs(card) do
        b[k] = v
    end
    return b
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
------------DRAW----------------
Funcoes.draw = function(j)
    j.mao[#j.mao+1] = j.deck[#j.deck]
    j.deck[#j.deck] = nil
end

----------RECEBER OURO-------------
Funcoes.getgold = function(Jogador)
    Jogador.ouro = Jogador.ouro+1
end

---------RECEBER STAMINA------------
Funcoes.getstamina = function(card)
    card.stamina = card.stamina +1
end
--------DISCARD--------------
Funcoes.discard = function(Jogador1)
    local h = false
    while h == false do
        print("Descarte um card:")
        Funcoes.printzona(Jogador1.mao)
        local opcao = tonumber(io.read())
        if opcao ~= nil and opcao <= #Jogador1.mao and opcao > 0 then
            Jogador1.cemiterio[#Jogador1.cemiterio+1] = Jogador1.mao[opcao]
            while opcao <= #Jogador[t].mao do
                Jogador[t].mao[opcao] = Jogador[t].mao[opcao+1]
                opcao = opcao+1
            end
            h = true
        else
            print("VOCÊ DEVE DESCARTAR UM CARD!")
        end
    end
    if Jogador1.cemiterio[#Jogador1.cemiterio].efeito.ifdiscarded then
        Jogador1.cemiterio[#Jogador1.cemiterio].efeito.ifdiscarded(Jogador1,Jogador2)
    end
end
------------PRINT ZONA----------
Funcoes.printzona = function(zona)

    local i = 1
    print("#","Nome     ","Custo","Tipo","Poder","Lealdade")
    while i <= #zona do
        print(i,zona[i].nome,zona[i].custo,zona[i].tipo,zona[i].poder,zona[i].lealdade)
        i = i+1
    end    
end
----------- PRINT CARD---------
Funcoes.printcard = function(card)
    print("Nome: "..card.nome)
    print("Custo: "..card.custo)
    print("Tipo: "..card.tipo)
    if card.poder then
        print("Poder: "..card.poder)
    end
    print("Descrição: "..card.descricao)
    if card.lealdade then
        print("Lealdade: "..card.lealdade)
    end
end
-----------DESTRUIR------------
Funcoes.destruir = function(card,Jogador,oponente)
    Jogador.cemiterio[#Jogador.cemiterio+1] = card
    if card.tipo == "Unidade" then
        local j = Funcoes.find(Jogador.campo,card)
        while j <= #Jogador.campo do
        Jogador.campo[j] = Jogador.campo[j+1]
        j = j+1
        end
    elseif card.tipo == "Aliado" then
        local j = Funcoes.find(Jogador.sala,card)
        while j <= #Jogador.sala do
        Jogador.sala[j] = Jogador.sala[j+1]
        j = j+1
        end
    end
    print(card.nome.." foi destruído.")
    if card.efeito then
        if card.efeito.ifdies then
            card.efeito.ifdies(Jogador,oponente)
        else
        end
    end
end
------------EXILAR--------------
Funcoes.exilar = function(card,Jogador,oponente)
    Jogador.exilio[#Jogador.exilio+1] = card
    local j = Funcoes.find(Jogador.campo,card)
    while j <= #Jogador.campo do
        Jogador.campo[j] = Jogador.campo[j+1]
        j = j+1
    end
    print(card.nome.." foi exilado.")
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
        Jogador1.lastsupport = card
    end
end

----------- INVOCAR------------nao testada
Funcoes.invocar = function(card,Jogador1,Jogador2)
    if card.tipo == "Unidade" then
        Jogador1.campo[#Jogador1.campo+1] = card
        print(card.nome.." foi invocado.")
        if card.efeito.ifsummoned then
            card.efeito.ifsummoned(Jogador1,Jogador2)
        end
    end
end
-----------REQUISITAR--------------
Funcoes.requisitar = function(card,Jogador1,Jogador2)
    if card.tipo == "Aliado" then
        Jogador1.sala[#Jogador1.sala+1] = card
        print(card.nome.." foi requisitado.")
        if card.efeito.ifrequisitado then
            card.efeito.ifrequisitado(Jogador1,Jogador2)
        end
    end
end

----------JOGAR-----------nao testada
Funcoes.jogar = function(card,Jogador1,Jogador2)
    if card.tipo == "Unidade" then
        Funcoes.invocar(card,Jogador1,Jogador2)
    elseif card.tipo == "Suporte" then
        Funcoes.conjurar(card,Jogador1,Jogador2)
    elseif card.tipo == "Aliado" then
        Funcoes.requisitar(card,Jogador1,Jogador2)
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
----------STORM-------------rajada
Funcoes.storm = function(Jogador1,quantidade)
    Jogador1.storm = Jogador1.storm+quantidade
    print(Jogador1.nome.." aumentou seu storm em "..quantidade..".")
end
---------HABILIDADE-----------
Funcoes.habilidade = function(card)
    if card.stamina > 0 then
        card.stamina = card.stamina-1
        card.efeito()
    else 
        print("ESTA UNIDADE NÃO TEM MAIS ENERGIA!")
    end
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
            local i = #Jogador2.campo
            while i > 0 do
                Jogador2.campo[i].stamina = 1
                i = i-1
            end
            local h = #Jogador2.sala
            while h > 0 do
                Jogador2.sala[h].stamina = 1
                h = h-1
            end
end
------------TURNO---------------
Funcoes.turno = function(t)

    while t == 1 or t == 2 do
        
        print("É o turno do jogador "..Jogador[t].nome.."!")
        print("Vida: "..Jogador[t].vida,"Ouro: "..Jogador[t].ouro,"Storm: "..Jogador[t].storm)
        print("1 - Mão")
        print("2 - Campo")
        print("3 - Sala")
        print("4 - Cemitério")
        print("5 - Fim do turno")
        
        local option = tonumber(io.read())
----------SUA MÃO---------------------------------------------
        while option == 1 do
            print("Sua mão é:")
            print("0 - Retornar")
            Funcoes.printzona(Jogador[t].mao)
            
            local opt = tonumber(io.read())
            
            if opt == nil then
                print("SELECIONE UMA OPÇÃO VÁLIDA!")
                break
            elseif opt == 0 then
                    break
            elseif opt <= #Jogador[t].mao and opt > 0 then
                while opt <= #Jogador[t].mao and opt > 0 do
                    local card = Jogador[t].mao[opt]
                    Funcoes.printcard(card)
                    print("0 - Retornar")
                    print("1 - Jogar")
                    
                    opcao = tonumber(io.read())
                    
                    if opcao == nil then
                        print("SELECIONE UMA OPÇÃO VÁLIDA!")
                    
                    elseif opcao == 0 then
                        opt = 0
                        break
                        
                    elseif opcao == 1 and Jogador[t].ouro >= Jogador[t].mao[opt].custo then
                        Jogador[t].ouro = Jogador[t].ouro - Jogador[t].mao[opt].custo
                        Funcoes.jogar(Jogador[t].mao[opt],Jogador[t],Jogador[y])
                            while opt <= #Jogador[t].mao do
                                Jogador[t].mao[opt] = Jogador[t].mao[opt+1]
                                opt = opt+1
                            end
                            
                    elseif opcao == 1 and Jogador[t].ouro < Jogador[t].mao[opt].custo then
                        print("VOCÊ NÃO TEM OURO SUFICIENTE! >:x")
                    else
                        print("SELECIONE UMA OPÇÃO VÁLIDA!")
                    end
                end
            else
                print("SELECIONE UMA OPÇÃO VÁLIDA!")
            end
        end
------------------CAMPOS-------------------
        while option == 2 do
            print("Selecione o campo:")
            print("0 - Retornar")
            print("1 - Seu campo")
            print("2 - Campo do oponente")
                    
            local num = tonumber(io.read())
            
            if num == nil then
                print("ESSA NÃO É UMA OPÇÃO VÁLIDA!")
                break
            elseif num == 0 then
                break
            end
                
            while num == 1 do
                print("Seu campo:")
                print("0 - Retornar")
                Funcoes.printzona(Jogador[t].campo)
                local opcao = tonumber(io.read())
                if opcao == nil then
                    print("ESSA NÃO É UMA OPÇÃO VÁLIDA!")
                    break
                elseif opcao == 0 then
                    break
                elseif opcao <= #Jogador[t].campo then
                    local card = Jogador[t].campo[opcao]
                    Funcoes.printcard(card)
                    print("0 - Retornar")
                    print("1 - Atacar")
                    if card.efeito.habilidade then
                        print("2 - Ativar habilidade")
                    end
                    local decisao = tonumber(io.read())
                    if decisao == nil then
                        print("ESSA NÃO É UMA OPÇÃO VÁLIDA!")
                        break
                    elseif decisao == 0 then
                        break
-----------------------------ATAQUE---------------------------------------------------------------------
                    elseif decisao == 1 then
                        while decisao == 1 do
                            local atacante = card
                            print("Selecione o alvo:")
                            print("0 - Retornar")
                            print("1 - Oponente")
                            if #Jogador[y].campo > 0 then
                                print("2 - Unidades")
                            end
                                    
                            local alvo = tonumber(io.read())
                            
                            if alvo == nil then
                                print("ESSA NÃO É UMA OPÇÃO VÁLIDA!")
                                decisao = 0
                                break
                            elseif alvo == 0 then
                                decisao = 0
                                break
                                    
                            elseif alvo == 1 then
                                if atacante.stamina > 0 then
                                    Jogador[y].vida = Jogador[y].vida - atacante.poder
                                    print("A vida do jogador "..Jogador[y].nome.." é agora "..Jogador[y].vida..".")
                                    atacante.stamina = atacante.stamina - 1
                                    decisao = 0
                                    break
                                else
                                    print("ESTA UNIDADE NÃO TEM MAIS ENERGIA PARA ATACAR! :'(")
                                    decisao = 0
                                    break
                                end
                            end
                                    
                            while alvo == 2 and #Jogador[y].campo > 0 do
                                print("Selecione o alvo:")
                                print("0 - Retornar")
                                Funcoes.printzona(Jogador[y].campo)
                                
                                local num2 = tonumber(io.read())
                                        
                                if num2 == nil then
                                    print("ESSA NÃO É UMA OPÇÃO VÁLIDA!")
                                    decisao = 0
                                    break
                                elseif num2 == 0 then
                                    decisao = 0
                                    break
                                        
                                elseif num2 <= #Jogador[y].campo then
                                    local defensor = Jogador[y].campo[num2]
                                    Funcoes.combate(atacante,defensor,Jogador[t],Jogador[y])
                                    decisao = 0
                                    break
                                else
                                    print("ESSA NÃO É UMA OPÇÃO VÁLIDA!")
                                    decisao = 0
                                    break
                                end
                            end
                                    
                            if alvo ~= nil and alvo ~= 0 and alvo ~= 1 and alvo ~= 2 then
                                    print("ESSA NÃO É UMA OPÇÃO VÁLIDA!")
                                    break
                            end
                            decisao = 0
                        end
-------------------------------HABILIDADE------------------------------------------------------------------------------------------
                    elseif decisao == 2 and card.efeito.habilidade and card.stamina > 0 then
                        card.efeito.habilidade(Jogador[t],Jogador[y])
                        card.stamina = card.stamina-1
                        break
                    elseif decisao == 2 and card.efeito.habilidade and card.stamina < 1 then
                        print("ESTA UNIDADE NÃO TEM MAIS ENERGIA!")
                        break
                    else
                        print("ESSA NÃO É UMA OPÇÃO VÁLIDA!")
                        break
                    end
                else
                    print("ESSA NÃO É UMA OPÇÃO VÁLIDA!")
                    break
                end
            end
                
            while num == 2 do
                print("Campo do oponente:")
                print("0 - Retornar")
                Funcoes.printzona(Jogador[y].campo)
                local opcao = tonumber(io.read())
                if opcao == nil then
                    print("ESSA NÃO É UMA OPÇÃO VÁLIDA!")
                    break
                elseif opcao == 0 then
                    break
                elseif opcao <= #Jogador[y].campo then
                    Funcoes.printcard(Jogador[y].campo[opcao])
                    print("Qualquer comando - Retornar")
                    local option = tonumber(io.read())
                    if option then
                        break
                    end
                end
            end

            if num ~= nil and num ~= 0 and num ~= 1 and num ~= 2 then
                print("ESSA NÃO É UMA OPÇÃO VÁLIDA!")
                break
            end
        end
        
        while option == 3 do
            print("Sua sala:")
            print("0 - Retornar")
            Funcoes.printzona(Jogador[t].sala)
            local opcao = tonumber(io.read())
            if opcao == nil then
                print("ESSA NÃO É UMA OPÇÃO VÁLIDA!")
                    break
            elseif opcao == 0 then
                    break
            elseif opcao <= #Jogador[t].sala then
                local card = Jogador[t].sala[opcao]
                Funcoes.printcard(card)
                print("0 - Retornar")
                if card.stamina > 0 then
                    print("1 - Ativar habilidade")
                end
                local decisao = tonumber(io.read())
                if decisao == nil then
                    print("ESSA NÃO É UMA OPÇÃO VÁLIDA!")
                    break
                elseif decisao == 0 then
                    break
                elseif decisao == 1 and card.stamina > 0 then
                    card.efeito.habilidade(Jogador[t],Jogador[y])
                    card.lealdade = card.lealdade-1
                    card.stamina = card.stamina-1
                    if card.lealdade < 1 then
                        Funcoes.destruir(card,Jogador[t],Jogador[y])
                    end
                else
                    print("SELECIONE UMA OPÇÃO VÁLIDA!")
                end
            else
                print("SELECIONE UMA OPÇÃO VÁLIDA!")
            end
        end
        
        while option == 4 do
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
        
        if option == 5 then
            Funcoes.fimdoturno(Jogador[t],Jogador[y])
            break
            
        elseif option ~= 1 and option ~= 2 and option ~= 3 and option~= 4 and option ~= 5 then
            print("Selecione uma opção válida!")
        end
    end
end
        
------------JOGO----------------
Funcoes.jogo = function()

    Funcoes.shuffle2(Jogador[1].deck)
    Funcoes.shuffle2(Jogador[2].deck)
    Funcoes.draw(Jogador[1])
    Funcoes.draw(Jogador[1])
    Funcoes.draw(Jogador[1])
    Funcoes.draw(Jogador[1])
    Funcoes.draw(Jogador[1])
    Funcoes.draw(Jogador[2])
    Funcoes.draw(Jogador[2])
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
