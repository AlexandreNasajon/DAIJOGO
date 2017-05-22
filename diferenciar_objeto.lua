-------------INVOCAR--------------
Funcoes.invocar = function(card,Jogador1,Jogador2)
  Jogador1.campo[#Jogador1.campo+1] = card
  card.self = #Jogador1.campo
end
------------DESTRUIR-------------------
Funcoes.destruir = function(card,Jogador1,Jogador2)
  Jogador1.cemiterio[#Jogador1.cemiterio+1] = card
  Jogador1.campo.card = nil
  card.self = #Jogador1.cemiterio
end
