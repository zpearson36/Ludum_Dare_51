function Player() constructor
{
	deck = new Deck()
	currentHand = []
	xpos = 0
	ypos = 0
	sprite = sPlayer
	
	function move(_x, _y)
	{
		xpos += _x
		ypos += _y
	}
	
	function draw_hand(_handSize)
	{
		if(_handSize > array_length(deck)) deck.shuffle()
		if(_handSize > array_length(deck)) _handSize = array_length(deck)
		for(var i = 0; i < _handSize; i++)
		{
			array_push(currentHand, deck.Draw())
		}
	}
}