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

//print(gMap.get_tile(floor(mouse_x / TILEWIDTH), floor(mouse_y / TILEHEIGHT)).get_occupant())

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
					if(gPlayer.get_x() + _x < 0)               {gMap = gDungeon.move_left(); gPlayer.move((MAPWIDTH - 1), 0)}
					else if(gPlayer.get_x() + _x >= MAPWIDTH)  {gMap = gDungeon.move_right();gPlayer.move(-(MAPWIDTH - 1), 0)}
					else if(gPlayer.get_y() + _y < 0)          {gMap = gDungeon.move_up();   gPlayer.move(0, MAPHEIGHT - 1)}
					else if(gPlayer.get_y() + _y >= MAPHEIGHT) {gMap = gDungeon.move_down(); gPlayer.move(0, -(MAPHEIGHT - 1))}
					else gPlayer.move(_x, _y)
					break;
				}
				case CARDTYPES.ITEM:
				{
					gPlayer.heal_hp(tmpCard.get_card_info().get_value())
					break;
				}
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
		enemyIndex = 0
		state = GAMESTATE.ENEMY
		break;
	}
	case GAMESTATE.ENEMY:
	{
		if(array_length(enemy_list) > 0)
		{
			if(run_card)
			{
				enemy_list[enemyIndex].move()
				run_card = false
				alarm[1] = 30
			}
			if(enemy_list[enemyIndex].get_ap() == 0)
			{
				enemy_list[enemyIndex].reset_ap()
				enemyIndex += 1
			}
		}
		if(enemyIndex == array_length(enemy_list))state = GAMESTATE.DRAW
		break;
	}
	case GAMESTATE.PAUSE:{break;}
}