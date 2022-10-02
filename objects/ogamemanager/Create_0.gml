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
var tmpCd
repeat(10)
{
	tmpCd = array_choose(global.move)
	gPlayer.deck.add_card(new Card(tmpCd[0], tmpCd[1], tmpCd[2], tmpCd[3]))
}

gHand = instance_create_layer(TILEWIDTH * MAPWIDTH + 25, 537, "GUI", oHand)

enum GAMESTATE
{
	DRAW,
	SETINST,
	PLAY,
	DISCARD
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