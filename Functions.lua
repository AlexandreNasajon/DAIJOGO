# Importing the library
from ast import Return
import pygame
import cards
# Initializing Pygame
pygame.init()
# Initializing Font
pygame.font.init()
big_font = pygame.font.Font(None, 36)
medium_font = pygame.font.Font(None, 26)
small_font = pygame.font.Font(None, 14)
# Initializing surface
surface = pygame.display.set_mode((1200,600))

class Player():
    def __init__(self):
        self.points = 0
        self.name = ''
        self.hand = [ 6 , [] , [[200,460],[300,460],[400,460],[500,460],[600,460],[700,460]] ] # X = 200 até 700 / Y = 460 / 
        self.field = [ 8 , [] , [[200,320],[300,320],[400,320],[500,320],[600,320],[700,320],[800,320],[900,320]] ] # X = 200 até 800/  Y = 320 / 
        self.trash = []
        self.opponent_hand = [ 6 , [] ,  [[200,20],[300,20],[400,20],[500,20],[600,20],[700,20]] ] # X = 200 até 700 / Y= 20 / 
        self.opponent_field = [ 8 , [] , [[200,160],[300,160],[400,160],[500,160],[600,160],[700,160],[800,160],[900,160]] ] # X = 200 até 800 / Y = 160 / 
        self.opponent_trash = []

def isInside(mouse_pos , object):
    x, y = mouse_pos
    return object.x <= x <= (object.x + object.w) and object.y <= y <= (object.y + object.h)

def move(what, origin, destiny):
    if len(destiny[1]) < destiny[0]: # se houver espaço no destino
        destiny[1].append(what) # coloca a carta no destino
        j = destiny[1].index(what) # pega o index da carta no destino
        what.x = destiny[2][j][0] # muda x da carta pro x do slot do destino
        what.y = destiny[2][j][1] # muda y da carta pro y do slot do destino
        i = origin[1].index(what) # pega index da carta na origem
        origin[1].pop(i) # remove carta da origem
        origin[1].insert(i, origin[1][-1] ) # move última carta pra posição original do what
    else:
        print("can't move")

#create function for drawing text
def draw_text(text, font, text_col, x, y):
	img = font.render(text, True, text_col)
	surface.blit(img, (x, y))

# recebe uma carta e desenha
def drawCard(card):
    pygame.draw.rect(surface, (5,102,8), pygame.Rect(card.x, card.y, card.h, card.w)) # dimensions
    pygame.draw.rect(surface, (5,200,8), pygame.Rect(card.x+5, card.y+25, 85, 70)) # art box
    draw_text(str(card.name), medium_font, (255,255,255), card.x+20, card.y+5)
    draw_text(str(card.environment), medium_font, (255,255,255), card.x+10, card.y+110)
    draw_text(str(card.points), medium_font, (255,255,255), card.x+5, card.y+5)
    draw_text(str(card.text), small_font, (255,255,255), card.x+20, card.y+100)

# desenha uma carta com a face para baixo
def drawHiddenCard( x , y):
    pygame.draw.rect(surface, (5,102,8), pygame.Rect(x, y, 95, 132)) # dimensions

# desenha o lixo    
def drawTrash(x,y):
    pygame.draw.rect(surface, (5,102,8), pygame.Rect(x, y, 95, 132)) # dimensions
    draw_text("TRASH", big_font, (255,255,255), x+5, y+10)

# desenha o deck
def drawDeck():
    pygame.draw.rect(surface, (5,102,8), pygame.Rect(1000, 250, 95, 132)) # dimensions
    draw_text("DECK", big_font, (255,255,255), 1010, 260)
    draw_text("Draw 2 cards", small_font, (255,255,255), 1005, 350)

def drawHand(player):
    for i in range(len(player.hand[1])):
        drawCard(player.hand[1][i])

def drawField(player):
    for i in range(len(player.field[1])):
        drawCard(player.field[1][i])

def drawOpponentField(opponent):
    for i in range(len(opponent.field[1])):
        drawCard(opponent.field[1][i])

def drawBoard(player,opponent):
    surface.fill((0,0,0))
    draw_text(player.name+" points: "+str(player.points), medium_font, (255,255,255), 50, 450)
    draw_text(opponent.name+" points: "+str(opponent.points), medium_font, (255,255,255), 50, 150)
    draw_text("VEGANO GAME", big_font, (255,255,255), 10, 10)
    drawDeck()
    drawTrash(1000,450) # LIXO DO JOGADOR
    drawTrash(1000,50) # LIXO DO OPONENTE
    drawField(player)
    drawOpponentField(opponent)
    drawHand(player)
    for i in range(len(opponent.hand[1])): # MÃO DO OPONENTE
        drawHiddenCard(200+(i*100) , 20)

def checkWin(player):
    if player.points >= 7:
        return True

def endScreen(player):
    board_font = pygame.font.Font(None, 36)
    title = board_font.render(player.name+" VENCEU!!!", True, (255,255,255))
    surface.blit(title, (500,10))
    winner = True
    return winner

def action(player): # TO DO
    while True:
        for event in pygame.event.get():    
            if event.type == pygame.MOUSEBUTTONDOWN:
                for card in player.hand[1]:
                    if isInside(event.pos , card):
                        print('oi')
                        move(card , player.hand , player.field)
                        
        pygame.display.flip()

def turn(player,opponent):
    drawBoard(player,opponent)
    if checkWin(player):
        endScreen(player)
        return
    if action(player):
        return

def game(player,opponent):
    player_turn = True
    while True:
        if player_turn == True:
            turn(player,opponent)
            player_turn = False
        else:
            turn(opponent,player)
            player_turn = True

        pygame.display.flip()

def newDeck():
    deck = [10,[]]
    for i in range(5):
        deck[1].append( cards.Rat() )
    for i in range(5):
        deck[1].append( cards.Fish() )
    return deck

deck = newDeck()
nasa = Player()
ele = Player()
nasa.name = 'Nasa'
ele.name = 'Ele'

move(deck[1][0] , deck , nasa.hand)
move(deck[1][0] , deck , nasa.hand)
move(deck[1][0] , deck , nasa.hand)
move(deck[1][0] , deck , nasa.hand)
move(nasa.hand[1][0] , nasa.hand , nasa.field)
game(nasa , ele)
