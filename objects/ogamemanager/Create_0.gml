/// @description Insert description here
// You can write your code in this editor
randomize()
gDungeon = new Dungeon()
gDungeon.init()
gMap = gDungeon.get_map(3,3)
//gPlayer = instance_create_layer(0, 0, "Player", oPlayer)
gPlayer = new Player()

enemy_list = gMap.get_occupants()


//array_push(enemy_list, new Enemy())
gPlayer.deck.add_card(new Card(global.common[0][0], global.common[0][1], global.common[0][2], global.common[0][3]))
gPlayer.deck.add_card(new Card(global.common[1][0], global.common[1][1], global.common[1][2], global.common[1][3]))
gPlayer.deck.add_card(new Card(global.common[2][0], global.common[2][1], global.common[2][2], global.common[2][3]))
gPlayer.deck.add_card(new Card(global.common[3][0], global.common[3][1], global.common[3][2], global.common[3][3]))
gPlayer.deck.add_card(new Card(global.common[4][0], global.common[4][1], global.common[4][2], global.common[4][3]))

gGui = instance_create_layer(0, 0, "GUI", oGui)
gHand = instance_create_layer(TILEWIDTH * MAPWIDTH + 25, 537, "GUI", oHand)
enemyIndex = 0
enum GAMESTATE
{
	DRAW,
	SETINST,
	PLAY,
	DISCARD,
	ENEMY,
	STARTPAUSE,
	PAUSE,
	UNPAUSE,
	LOOT
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

function get_state()
{
	return state
}

//PAUSE VARIABLES
pState = undefined
alarm0 = -1
alarm1 = -1
lootCard = noone

function pause()
{
	pState = state
	alarm0 = alarm[0]
	alarm1 = alarm[1]
	alarm[0] = -1
	alarm[1] = -1
	state = GAMESTATE.PAUSE
}

function loot()
{
	pState = state
	alarm0 = alarm[0]
	alarm1 = alarm[1]
	alarm[0] = -1
	alarm[1] = -1
	lootCard = random_card()
	print(lootCard)
	state = GAMESTATE.LOOT
}

function unpause()
{
	
	lootCard = noone
	alarm[0] = alarm0
	alarm[1] = alarm1
	state = pState
}

function quit()
{
	room_goto(rMainMenu)
}

function change_room(_dir)
{
	gMap.get_tile(gPlayer.get_x(), gPlayer.get_y()).set_no_occupant();
	switch(_dir)
	{
		case "left": {gMap = gDungeon.move_left(); gPlayer.move(  (MAPWIDTH - 1), 0);break;}
		case "right":{gMap = gDungeon.move_right();gPlayer.move( -(MAPWIDTH - 1), 0);break;}
		case "up":   {gMap = gDungeon.move_up();   gPlayer.move(0,  (MAPHEIGHT - 1));break;}
		case "down" :{gMap = gDungeon.move_down(); gPlayer.move(0, -(MAPHEIGHT - 1));break;}
	}
	enemy_list = gMap.get_occupants()
	//print(enemy_list)
}

function get_loot_card()
{
	return lootCard
}