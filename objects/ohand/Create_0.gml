/// @description Insert description here
// You can write your code in this editor

contents = []
defaultSize = 5

function add_card(_card)
{
	array_push(contents, instance_create_layer(x, y, layer, oCard, {card: _card, number: array_length(contents)}))
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