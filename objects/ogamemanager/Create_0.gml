/// @description Insert description here
// You can write your code in this editor
randomize()

gMap = new Map(MAPWIDTH, MAPHEIGHT)
gMap.populate_map()

//gPlayer = instance_create_layer(0, 0, "Player", oPlayer)
gPlayer = new Player()
gPlayer.deck.add_card(new Card(global.move[0]+string(1), global.move[1], global.move[2], global.move[3]))
gPlayer.deck.add_card(new Card(global.move[0]+string(2), global.move[1], global.move[2], global.move[3]))
gPlayer.deck.add_card(new Card(global.move[0]+string(3), global.move[1], global.move[2], global.move[3]))
gPlayer.deck.add_card(new Card(global.move[0]+string(4), global.move[1], global.move[2], global.move[3]))
gPlayer.deck.add_card(new Card(global.move[0]+string(5), global.move[1], global.move[2], global.move[3]))

gHand = instance_create_layer(TILEWIDTH * MAPWIDTH + 25, 525, "GUI", oHand)

enum GAMESTATE
{
	DRAW,
	SETINST,
	PLAY,
	DISCARD
}

state = GAMESTATE.DRAW
selected_card = noone

function set_selected_card(_card)
{
	selected_card = _card
}

function get_selected_card()
{
	return selected_card
}

function add_card_to_gHand(_card)
{
	gHand.add_card(_card)
}