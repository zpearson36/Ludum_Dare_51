/// @description Insert description here
// You can write your code in this editor

if(keyboard_check_pressed(ord("W"))) y -= TILEHEIGHT
if(keyboard_check_pressed(ord("S"))) y += TILEHEIGHT 
if(keyboard_check_pressed(ord("A"))) x -= TILEWIDTH
if(keyboard_check_pressed(ord("D"))) x += TILEWIDTH
if(keyboard_check_pressed(vk_space))
{
	show_debug_message(deck.draw())
}