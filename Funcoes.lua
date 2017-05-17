local Jogador = require("Jogador")
local Cards = require("Cards")
local Funcoes = {}


----------COMPRAR CARTA--------------
Funcoes.draw = function(Jogador) -- player
   
    Jogador.mao[#Jogador.mao+1] = Jogador.deck[math.random(1,#Jogador.deck)]
    
end

----------RECEBER OURO-------------
Funcoes.getgold = function(Jogador)
   
    Jogador.ouro = Jogador.ouro+1
    
end

------------PRINT ZONA----------
Funcoes.printzona = function(zona)

    i = 1
    print("#","Nome","Custo","Tipo","Poder")
    while i <= #zona do
        print(i,zona[i].nome,zona[i].custo,zona[i].tipo,zona[i].poder)
        i = i+1
    end    
end

------------TURNO---------------
Funcoes.turno = function(t)

    while t == 1 or t == 2 do
       
        print("É o turno do jogador "..Jogador[t].nome.."!")
        print("Vida: "..Jogador[t].vida,"Ouro: "..Jogador[t].ouro)
        print("1 - Jogar um card")
        print("2 - Atacar com uma unidade")
        print("3 - Fim do turno")
        option = tonumber(io.read())
        if option == 1 then
            print("Sua mão é:")
            print("0 - Retornar")
            Funcoes.printzona(Jogador[t].mao)
            
            opt = tonumber(io.read())

            valid = opt <= #Jogador[t].mao and opt > 0
            
            if valid and Jogador[t].mao[opt].custo <= Jogador[t].ouro then
                Jogador[t].ouro = Jogador[t].ouro - Jogador[t].mao[opt].custo
                
                if Jogador[t].mao[opt].tipo == "Unidade" then
                    Jogador[t].campo[#Jogador[t].campo+1] = Jogador[t].mao[opt]
                    Jogador[t].mao[opt] = nil
                    print("Seu campo agora é:")
                    Funcoes.printzona(Jogador[t].campo)
            
                        while opt <= #Jogador[t].mao do
                            Jogador[t].mao[opt] = Jogador[t].mao[opt+1]
                            opt = opt+1
                        end

                end
                
            elseif valid and Jogador[t].mao[opt].custo > Jogador[t].ouro then
                print("Você não tem ouro suficiente!")
                    
            elseif opt == 0 then
                    
            else 
                print("Selecione um card válido!")        
            end
        end
            
        while option == 2 do
            print("Selecione o atacante:")
                    Funcoes.printzona(Jogador[t].campo)
                    
                    num = tonumber(io.read())
                    
                    atacante = Jogador[t].campo.num

                    if num <= #Jogador[t].campo then
                        
                        print("Selecione o alvo:")
                        print("0 - Retornar")
                        print("1 - Oponente")
                        if #Jogador[y].campo > 0 then
                        print("2 - Unidades")
                        end
                        
                        alvo = tonumber(io.read())
                        
                        if alvo == 0 then
                            break
                        
                        elseif alvo == 1 then
                        Jogador[y].vida = Jogador[y].vida - atacante.poder
                        print("A vida do jogador"..Jogador[y].nome.." é agora: "..Jogador[y].vida..".")
                        
                        elseif alvo == 2 and #Jogador[y].campo > 0 then
                            print("Selecione o alvo:")
                            print("0 - Retornar")
                            Funcoes.printzona(Jogador[y].campo)
                            
                            num2 = tonumber(io.read())
                            
                            defensor = Jogador[y].campo.num2
                            
                            if num2 <= #Jogador[y].campo then
                                if atacante.poder > defensor.poder then
                                    Jogador[y].cemiterio[#Jogador[y].cemiterio+1] = defensor
                                    Jogador[y].campo.num2 = nil
                                    print(defensor.nome.." foi destruído.")
                                elseif atacante.poder == defensor.poder then
                                    Jogador[y].cemiterio[#Jogador[y].cemiterio+1] = defensor
                                    Jogador[y].campo.num2 = nil
                                    Jogador[t].cemiterio[#Jogador[t].cemiterio+1] = atacante
                                    Jogador[t].campo.num = nil
                                    print(atacante.nome.." e "..defensor.nome.."foram destruídos.")
                                elseif atacante.poder < defensor.poder then
                                    Jogador[t].cemiterio[#Jogador[t].cemiterio+1] = defensor
                                    Jogador[t].campo.num = nil
                                    print(atacante.nome.." foi destruído.")
                                end
                                
                            else
                                print("Selecione o defensor!")
                            end
                        
                        else
                            print("Selecione o alvo!")
                        end
                        
                    else
                        print("Selecione o atacante!")
                    end
        end
            
        if option == 3 then
            print("Fim do turno.")
            Funcoes.draw(Jogador[y])
            print("Jogador "..Jogador[y].nome.." compra um card.")
            Funcoes.getgold(Jogador[y])
            print("Jogador "..Jogador[y].nome.." recebe 1 ouro.")
            break
        else
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
        t = 2  y = 1
        Funcoes.turno(t)
    end
    
    if Jogador[1].vida <1 then
        print(Jogador[2].nome.." venceu o jogo!")
    
    elseif Jogador[2].vida <1 then
        print(Jogador[1].nome.." venceu o jogo!")
    end
    
end

return Funcoes
