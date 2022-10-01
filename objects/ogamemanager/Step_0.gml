/// @description Insert description here
// You can write your code in this editor

if(keyboard_check_pressed(ord("W"))) gPlayer.ypos -= 1
if(keyboard_check_pressed(ord("S"))) gPlayer.ypos += 1
if(keyboard_check_pressed(ord("A"))) gPlayer.xpos -= 1
if(keyboard_check_pressed(ord("D"))) gPlayer.xpos += 1
if(keyboard_check_pressed(vk_space))
{
	var card = gPlayer.deck.draw()
	if(card) gPlayer.deck.discard(card)
	show_debug_message(gPlayer.deck.library)
	show_debug_message(gPlayer.deck.discarded)
}
if(keyboard_check_pressed(vk_tab))
{
	gPlayer.deck.shuffle()
	show_debug_message(gPlayer.deck.library)
	show_debug_message(gPlayer.deck.discarded)
}