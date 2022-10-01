/// @description Insert description here
// You can write your code in this editor

if(keyboard_check_pressed(ord("W"))) y -= TILEHEIGHT
if(keyboard_check_pressed(ord("S"))) y += TILEHEIGHT 
if(keyboard_check_pressed(ord("A"))) x -= TILEWIDTH
if(keyboard_check_pressed(ord("D"))) x += TILEWIDTH
if(keyboard_check_pressed(vk_space))
{
	var card = deck.draw()
	if(card) deck.discard(card)
	show_debug_message(deck.library)
	show_debug_message(deck.discarded)
}
if(keyboard_check_pressed(vk_tab))
{
	deck.shuffle()
	show_debug_message(deck.library)
	show_debug_message(deck.discarded)
}