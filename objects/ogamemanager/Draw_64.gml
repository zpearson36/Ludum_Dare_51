/// @description Insert description here
// You can write your code in this editor

switch state
{
	case GAMESTATE.DRAW:{break;}
	case GAMESTATE.SETINST:
	{
		draw_set_font(fCountDown)
		draw_set_color(c_black)
		draw_text(50, 50, alarm[0] / 60)
		draw_set_color(c_white)
		draw_set_font(fNormal)
		break;
	}
	case GAMESTATE.PLAY:{break;}
	case GAMESTATE.DISCARD:{break;}
	case GAMESTATE.PAUSE:{break;}
}