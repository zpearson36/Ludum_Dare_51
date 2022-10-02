/// @description Insert description here
// You can write your code in this editor
randomize()

gMap = new Map(MAPWIDTH, MAPHEIGHT)
gMap.populate_map()
gMap.get_tile(2, 2).set_contents(global.spikes)
gMap.get_tile(2, 3).set_contents(global.spikes)
gMap.get_tile(2, 4).set_contents(global.spikes)

//gPlayer = instance_create_layer(0, 0, "Player", oPlayer)
gPlayer = new Player()

enemy_list = []

array_push(enemy_list, new Enemy())
gPlayer.deck.add_card(new Card(global.move[0][0], global.move[0][1], global.move[0][2], global.move[0][3]))
gPlayer.deck.add_card(new Card(global.move[0][0], global.move[0][1], global.move[0][2], global.move[0][3]))
gPlayer.deck.add_card(new Card(global.move[1][0], global.move[1][1], global.move[1][2], global.move[1][3]))
gPlayer.deck.add_card(new Card(global.move[1][0], global.move[1][1], global.move[1][2], global.move[1][3]))
gPlayer.deck.add_card(new Card(global.move[2][0], global.move[2][1], global.move[2][2], global.move[2][3]))
gPlayer.deck.add_card(new Card(global.move[2][0], global.move[2][1], global.move[2][2], global.move[2][3]))
gPlayer.deck.add_card(new Card(global.move[3][0], global.move[3][1], global.move[3][2], global.move[3][3]))
gPlayer.deck.add_card(new Card(global.move[3][0], global.move[3][1], global.move[3][2], global.move[3][3]))
gPlayer.deck.add_card(new Card(global.move[4][0], global.move[4][1], global.move[4][2], global.move[4][3]))
gPlayer.deck.add_card(new Card(global.move[4][0], global.move[4][1], global.move[4][2], global.move[4][3]))


gHand = instance_create_layer(TILEWIDTH * MAPWIDTH + 25, 537, "GUI", oHand)
enemyIndex = 0
enum GAMESTATE
{
	DRAW,
	SETINST,
	PLAY,
	DISCARD,
	ENEMY
}


gMap.get_tile(gPlayer.get_x(), gPlayer.get_x()).set_occupant(gPlayer)
for(var i = 0; i < array_length(enemy_list); i++)
{
	gMap.get_tile(enemy_list[i].get_x(), enemy_list[i].get_y()).set_occupant(enemy_list[i])
}
state = GAMESTATE.DRAW
selected_card = noone
run_card = true

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

function get_player()
{
	return gPlayer
}

function get_map()
{
	return gMap
}