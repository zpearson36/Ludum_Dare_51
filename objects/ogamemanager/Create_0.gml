/// @description Insert description here
// You can write your code in this editor
randomize()

gMap = new Map(MAPWIDTH, MAPHEIGHT)
gMap.populate_map()

//gPlayer = instance_create_layer(0, 0, "Player", oPlayer)
gPlayer = new Player()
gPlayer.deck.add_card(new Card(global.move[0], global.move[1], global.move[2], global.move[3]))
gPlayer.deck.add_card(new Card(global.move[0], global.move[1], global.move[2], global.move[3]))
gPlayer.deck.add_card(new Card(global.move[0], global.move[1], global.move[2], global.move[3]))
gPlayer.deck.add_card(new Card(global.move[0], global.move[1], global.move[2], global.move[3]))
gPlayer.deck.add_card(new Card(global.move[0], global.move[1], global.move[2], global.move[3]))

enum GAMESTATE
{
	DRAW,
	SETINST,
	PLAY,
	DISCARD
}

state = GAMESTATE.DRAW