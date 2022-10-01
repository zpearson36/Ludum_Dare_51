if(keyboard_check_pressed(ord("W"))) gPlayer.ypos -= 1
if(keyboard_check_pressed(ord("S"))) gPlayer.ypos += 1
if(keyboard_check_pressed(ord("A"))) gPlayer.xpos -= 1
if(keyboard_check_pressed(ord("D"))) gPlayer.xpos += 1
if(keyboard_check_pressed(vk_space))
{
	var card = gPlayer.deck.draw()
	if(card) gPlayer.deck.discard(card)
	show_debug_message(gPlayer.deck.library)
	show_debug_message(gPlayer.deck.discarded)
}
if(keyboard_check_pressed(vk_tab))
{
	gPlayer.deck.shuffle()
	show_debug_message(gPlayer.deck.library)
	show_debug_message(gPlayer.deck.discarded)
}


switch state
{
	case GAMESTATE.DRAW:
	{
		gPlayer.draw_hand()
		state = GAMESTATE.SETINST
		break;
	}
	case GAMESTATE.SETINST:
	{
		if(selected_card)
		{
			if(selected_card.get_hand().id == gHand.id)
			{
				gPlayer.get_hand().add_card(gHand.remove_card(selected_card))
			}
			else
			{
				gHand.add_card(gPlayer.get_hand().remove_card(selected_card))
			}
			selected_card = noone
		}
		break;
	}
	case GAMESTATE.PLAY:{break;}
	case GAMESTATE.DISCARD:{break;}
}
//show_debug_message(inst_array)