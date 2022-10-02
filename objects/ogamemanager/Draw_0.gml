/// @description Insert description here
// You can write your code in this editor
for(var i = 0; i < gMap.get_width(); i++)
{
	for(var j = 0; j < gMap.get_width(); j++)
	{
		draw_rectangle(i * TILEWIDTH, j * TILEHEIGHT, (i + 1) * TILEWIDTH - 2, (j + 1) * TILEHEIGHT - 2, false)
		draw_set_color(c_black)
		draw_rectangle(i * TILEWIDTH, j * TILEHEIGHT, (i + 1) * TILEWIDTH - 2, (j + 1) * TILEHEIGHT - 2, true)
		draw_set_color(c_white)
		switch(gMap.get_tile(i, j).get_contents()[0])
		{
			case TILECONTENTS.WALL:   {draw_sprite(sWall, -1, i * TILEWIDTH, j * TILEHEIGHT);break;}
			case TILECONTENTS.SPIKES: {draw_sprite(sSpikes, -1, i * TILEWIDTH, j * TILEHEIGHT);break;}
			case TILECONTENTS.NONE:   {break;}
		}
	}
}

draw_text(TILEWIDTH * MAPWIDTH + 25, 25, "Health: " + string(gPlayer.get_hp()) + " / " + string(gPlayer.get_max_hp()))
draw_healthbar(TILEWIDTH * MAPWIDTH + 25, 50,TILEWIDTH * MAPWIDTH + 225, 75, (gPlayer.get_hp() / gPlayer.get_max_hp()) * 100, c_black, c_red, c_lime, 0, true, true)

for(var i = 0; i < array_length(enemy_list); i++)
{
	draw_sprite(enemy_list[i].sprite, -1, enemy_list[i].xpos * TILEWIDTH, enemy_list[i].ypos * TILEHEIGHT)
}

draw_sprite(gPlayer.sprite, -1, gPlayer.xpos * TILEWIDTH, gPlayer.ypos * TILEHEIGHT)
draw_text(TILEWIDTH * MAPWIDTH + 25, 150, "HAND:")
draw_text(TILEWIDTH * MAPWIDTH + 25, 512, "INSTRUCTIONS:")

switch state
{
	case GAMESTATE.DRAW:{break;}
	case GAMESTATE.SETINST:{break;}
	case GAMESTATE.PLAY:{break;}
	case GAMESTATE.DISCARD:{break;}
	case GAMESTATE.PAUSE:
	{
		draw_set_color(c_black)
		draw_set_alpha(.5)
		draw_rectangle(0, 0, room_width, room_height, false)
		draw_set_color(c_white)
		draw_set_alpha(1)
		break;
	}
}