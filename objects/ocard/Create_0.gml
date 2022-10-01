/// @description Insert description here
// You can write your code in this editor
xpos = 0
ypos = 0
yOffset = 0
hover = false
order = -1
hand = noone
function set_order(_val)
{
	order = _val
}

function get_order()
{
    return order
}

function clear_order()
{
	order = -1
}

function get_card_info()
{
	return card
}

function set_hand(_hand)
{
	hand = _hand
}
function get_hand()
{
    return hand
}