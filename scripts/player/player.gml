function Player() constructor
{
	deck = new Deck()
	hand = instance_create_layer(0, 0, "GUI", oHand)
	xpos = 0
	ypos = 0
	sprite = sPlayer
	
	function move(_x, _y)
	{
		xpos += _x
		ypos += _y
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
	/*
	function get_card(_index)
	{
		return currentHand[_index]
	}
	
	function get_hand()
	{
		return currentHand
	}
	*/
}