function Player() constructor
{
	deck = new Deck()
	hand = instance_create_layer(TILEWIDTH * MAPWIDTH + 25, 25, "GUI", oHand)
	xpos = 3
	ypos = 3
	sprite = sPlayer
	hp = 5
	
	function get_hp()
	{
		return hp
	}
	
	function move(_x, _y)
	{
		var tmpTile = oGameManager.gMap.get_tile(xpos + _x, ypos + _y)
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
}