function Player() constructor
{
	deck = new Deck()
	hand = instance_create_layer(TILEWIDTH * MAPWIDTH + 25, 175, "GUI", oHand)
	xpos = 3
	ypos = 3
	sprite = sPlayer
	max_hp = 5
	hp = 5
	
	function get_hp()
	{
		return hp
	}
	
	function get_max_hp()
	{
		return max_hp
	}
	
	function heal_hp(_hp)
	{
		hp = min(hp + _hp, max_hp)
	}
	
	function move(_x, _y, room_transition=false)
	{
		var str = ""
		oGameManager.get_map().get_tile(xpos, ypos).set_no_occupant()
		var tmpTile = oGameManager.gMap.get_tile(xpos + _x, ypos + _y)
		if(tmpTile.get_occupant() == noone or room_transition)
		{
			switch(tmpTile.get_contents()[0])
			{
				case TILECONTENTS.WALL:{break;}
				case TILECONTENTS.SPIKES:
				{
					hp -= tmpTile.get_contents()[1]
				}
				case TILECONTENTS.NONE:
				{
					xpos += _x
					ypos += _y
					break;
				}
			}
		}
		else
		{
			
			str += "5"
			tmpTile.get_occupant().damage(1)
		}
		oGameManager.get_map().get_tile(xpos, ypos).set_occupant(self)
		print(str)
	}
	
	function get_deck()
	{
		return deck
	}
	function get_hand()
	{
		return hand
	}
	
	function is_hand_full()
	{
		return hand.is_full()
	}
	
	function draw_hand()
	{	
		while(not hand.is_full())
		{
			var card = deck.draw()
			if(not card) deck.shuffle()
			else hand.add_card(card)
		}
	}
	
	function get_hand_size()
	{
		return hand.get_current_size()
	}
	
	function get_x()
	{
		return xpos
	}
	
	function get_y()
	{
		return ypos
	}
	
	function damage(_dmg)
	{
		hp -= _dmg
	}
	
	function isPlayer()
	{
		return true
	}
}