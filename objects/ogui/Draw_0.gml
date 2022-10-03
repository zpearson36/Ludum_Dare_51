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
	
	case GAMESTATE.LOOT:
	{
		draw_button_sprite(spr_button, 1, 1, TILEWIDTH * MAPWIDTH + 600, 25, c_blue, c_blue, c_blue, "MENU", c_white, false)
		draw_set_color(c_black)
		draw_set_alpha(.5)
		draw_rectangle(0, 0, room_width, room_height, false)
		draw_set_color(c_white)
		draw_set_alpha(1)
		
		draw_sprite(oGameManager.get_loot_card()[3],
		-1,
		(room_width / 2) - (sprite_get_width(oGameManager.get_loot_card()[3]) / 2),
		300)
		
		//loot menu
		if(draw_button_sprite(spr_button, 1, 1, 500, 500, c_blue, c_aqua, c_white, "KEEP", c_white, false))
		{
			var tmpC = oGameManager.get_loot_card()
			oGameManager.get_player().get_deck().add_card(new Card(tmpC[0],tmpC[1],tmpC[2],tmpC[3]))
			oGameManager.get_map().get_tile(oGameManager.get_player().get_x(), oGameManager.get_player().get_y()).set_no_contents()
			oGameManager.unpause()
		}
		if(draw_button_sprite(spr_button, 1, 1, 1000, 500, c_blue, c_aqua, c_white, "THROW AWAY", c_white, false))
		{
			oGameManager.get_map().get_tile(oGameManager.get_player().get_x(), oGameManager.get_player().get_y()).set_no_contents()
			oGameManager.unpause()
		}
	}
}

