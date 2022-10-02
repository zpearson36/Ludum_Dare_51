/// @description Insert description here
// You can write your code in this editor

switch oGameManager.get_state()
{
	case GAMESTATE.DRAW:{break;}
	case GAMESTATE.SETINST:{}
	case GAMESTATE.PLAY:{}
	case GAMESTATE.DISCARD:{}
	case GAMESTATE.ENEMY:
	{
		if(draw_button_sprite(spr_button, 1, 1, TILEWIDTH * MAPWIDTH + 600, 25, c_blue, c_aqua, c_white, "MENU", c_white, false))
		{
			oGameManager.pause()
		}
		break;
	}
	case GAMESTATE.PAUSE:
	{
		draw_button_sprite(spr_button, 1, 1, TILEWIDTH * MAPWIDTH + 600, 25, c_blue, c_blue, c_blue, "MENU", c_white, false)
		draw_set_color(c_black)
		draw_set_alpha(.5)
		draw_rectangle(0, 0, room_width, room_height, false)
		draw_set_color(c_white)
		draw_set_alpha(1)
		
		//pause menu
		if(draw_button_sprite(spr_button, 1, 1, room_width / 2 - (sprite_get_width(spr_button) / 2), 300, c_blue, c_aqua, c_white, "CONTINUE", c_white, false))
		{
			oGameManager.unpause()
		}
		if(draw_button_sprite(spr_button, 1, 1, room_width / 2 - (sprite_get_width(spr_button) / 2), 400, c_blue, c_aqua, c_white, "QUIT", c_white, false))
		{
			oGameManager.quit()
		}
		
		break;
	}
}

