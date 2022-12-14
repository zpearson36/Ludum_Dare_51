enum CARDTYPES
{
	MOVEMENT,
	SPELL,
	ITEM,
	EQUIPMENT
}

function Card(_name, _type, _value, _sprite) constructor
{
	name   = _name
	type   = _type
	value  = _value
	sprite = _sprite
	
	function to_string()
	{
		return name + ": " + string(value)
	}
	
	function get_name()
	{
		return name
	}
	
	function get_value()
	{
		return value
	}
	
	function get_sprite()
	{
		return sprite
	}
	
	function get_type()
	{
		return type
	}
}

global.common = [
	["Move", CARDTYPES.MOVEMENT, ["W"], sMoveUp],
	["Move", CARDTYPES.MOVEMENT, ["S"], sMoveDown],
	["Move", CARDTYPES.MOVEMENT, ["A"], sMoveLeft],
	["Move", CARDTYPES.MOVEMENT, ["D"], sMoveRight],
	["Potion", CARDTYPES.ITEM, 1, sPotion],
]

global.uncommon = [
	["Move", CARDTYPES.MOVEMENT, ["W", "W"], sMoveUp],
	["Move", CARDTYPES.MOVEMENT, ["S", "S"], sMoveDown],
	["Move", CARDTYPES.MOVEMENT, ["A", "A"], sMoveLeft],
	["Move", CARDTYPES.MOVEMENT, ["D", "D"], sMoveRight],
	["Potion", CARDTYPES.ITEM, 2, sPotion],
]

global.rare = [
	["Move", CARDTYPES.MOVEMENT, ["W", "W", "W"], sMoveUp],
	["Move", CARDTYPES.MOVEMENT, ["S", "S", "S"], sMoveDown],
	["Move", CARDTYPES.MOVEMENT, ["A", "A", "A"], sMoveLeft],
	["Move", CARDTYPES.MOVEMENT, ["D", "D", "D"], sMoveRight],
	["Potion", CARDTYPES.ITEM, 3, sPotion],
]

function random_card()
{
	return array_choose(global.common)
}

function Deck() constructor
{
	library = []
	discarded = []
	
	function add_card(card)
	{
		array_push(library, card)
	}
	
	function draw()
	{
		if(array_length(library) == 0) return noone
		var cardIndex = irandom(array_length(library)-1)
		var card = library[cardIndex]
		array_delete(library, cardIndex, 1)
		return card
	}
	
	function discard(card)
	{
		array_push(discarded, card)
	}
	
	function shuffle()
	{
		for(var i = 0; i < array_length(discarded); i++)
		{
			array_push(library, discarded[i])
		}
		discarded = []
	}
}

