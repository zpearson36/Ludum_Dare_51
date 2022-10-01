function Player() constructor
{
	deck = new Deck()
	hand = instance_create_layer(TILEWIDTH * MAPWIDTH + 25, 25, "GUI", oHand)
	xpos = 7
	ypos = 7
	sprite = sPlayer
	
	function move(_x, _y)
	{
		xpos += _x
		ypos += _y
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