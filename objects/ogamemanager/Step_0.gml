if(keyboard_check_pressed(ord("W"))) gPlayer.move(0, -1)
if(keyboard_check_pressed(ord("S"))) gPlayer.move(0, 1)
if(keyboard_check_pressed(ord("A"))) gPlayer.move(-1, 0)
if(keyboard_check_pressed(ord("D"))) gPlayer.move(1, 0)
if(keyboard_check_pressed(vk_space))
{
	print(gMap.get_tile(floor(mouse_x / TILEWIDTH),floor(mouse_y / TILEHEIGHT)).get_occupant())
}
if(keyboard_check_pressed(vk_tab))
{
	state = GAMESTATE.PLAY
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
					     if(gPlayer.get_x() + _x < 0)          {change_room("left")}
					else if(gPlayer.get_x() + _x >= MAPWIDTH)  {change_room("right")}
					else if(gPlayer.get_y() + _y < 0)          {change_room("up")}
					else if(gPlayer.get_y() + _y >= MAPHEIGHT) {change_room("down")}
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
				if(array_length(enemy_list[enemyIndex].get_path()) == 0) enemy_list[enemyIndex].set_path(pathfinding(enemy_list[enemyIndex], gPlayer))
				if(array_length(enemy_list[enemyIndex].get_path()) != 0) enemy_list[enemyIndex].move()
				//else enemy_list[enemyIndex].current_ap = 0
				run_card = false
				alarm[1] = 30
			}
			if(enemy_list[enemyIndex].get_ap() == 0)
			{
				enemy_list[enemyIndex].reset_ap()
				enemy_list[enemyIndex].reset_path()
				enemyIndex += 1
			}
		}
		if(enemyIndex == array_length(enemy_list))state = GAMESTATE.DRAW
		break;
	}
	case GAMESTATE.PAUSE:{break;}
}