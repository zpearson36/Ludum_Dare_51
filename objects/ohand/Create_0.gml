/// @description Insert description here
// You can write your code in this editor

contents = []
defaultSize = 5
available_spots = [0, 1, 2, 3, 4]
function add_card(_card)
{
	var tmpCard =instance_create_layer(x, y, layer, oCard, {card: _card, number: get_smallest(available_spots)})
	tmpCard.set_order(array_length(contents))
	tmpCard.set_hand(self)
	array_push(contents, tmpCard)
}

function remove_card(_card)
{
	var tmpCard = noone
	for(var i = 0; i < array_length(contents); i++)
	{
		if(contents[i].id == _card.id)
		{
			tmpCard = contents[i].get_card_info()
			array_push(available_spots, contents[i].number)
			instance_destroy(contents[i])
			array_delete(contents, i, 1)
		}
	}
	return tmpCard
}

function get_card_by_index(_index)
{
	return contents[_index]
}

function get_top_card()
{
	return contents[0]
}

function get_default_size()
{
	return defaultSize
}

function get_current_size()
{
	return array_length(contents)
}

function is_full()
{
	return defaultSize == array_length(contents)
}

function get_smallest(_arry)
{
	var tmp = noone
	var tmpI = 0
	for(var i = 0; i < array_length(_arry); i++)
	{
		if(tmp = noone) tmp = _arry[i]
		else if(_arry[i] < tmp){tmp = _arry[i]; tmpI = i}
	}
	array_delete(_arry, tmpI, 1)
	return tmp
}