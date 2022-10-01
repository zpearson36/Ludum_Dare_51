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
	state = GAMESTATE.PLAY
	/*gPlayer.deck.shuffle()
	show_debug_message(gPlayer.deck.library)
	show_debug_message(gPlayer.deck.discarded)*/
}

var start = 0
switch state
{
	case GAMESTATE.DRAW:
	{
		gPlayer.draw_hand()
		state = GAMESTATE.SETINST
		start = current_time
		alarm[0] = 600
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
	case GAMESTATE.PLAY:
	{
		if(run_card and gHand.get_current_size())
		{
			var tmpCard = noone
			for(var i = 0; i < gHand.get_current_size(); i++)
			{
				if(tmpCard == noone) tmpCard = gHand.get_card_by_index(i)
				else
				{
					if(gHand.get_card_by_index(i).get_order() > tmpCard) tmpCard = gHand.get_card_by_index(i)
				}
			}
			switch(tmpCard.get_card_info().get_type())
			{
				case CARDTYPES.MOVEMENT:
				{
					var _x = 0
					var _y = 0
					for(var i = 0; i < array_length(tmpCard.get_card_info().get_value()); i++)
					{
						switch(tmpCard.get_card_info().get_value()[i])
						{
							case "A": {_x -= 1; break;}
							case "S": {_y += 1; break;}
							case "W": {_y -= 1; break;}
							case "D": {_x += 1; break;}
						}
					}
					gPlayer.move(_x, _y)
					break;
				}
				case CARDTYPES.ATTACK:{break;}
				case CARDTYPES.SPELL:{break;}
			}
			gPlayer.get_deck().discard(gHand.remove_card(tmpCard))
			run_card = false
			alarm[1] = 30
		}
		if(not gHand.get_current_size()) state = GAMESTATE.DISCARD
		break;
	}
	case GAMESTATE.DISCARD:
	{
		while(gPlayer.get_hand().get_current_size())
		{
			gPlayer.get_deck().discard(gPlayer.get_hand().remove_card(gPlayer.get_hand().get_top_card()))
		}
		
		state = GAMESTATE.DRAW
		break;
	}
}
