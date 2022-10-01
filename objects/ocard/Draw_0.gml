/// @description Insert description here
// You can write your code in this editor

draw_sprite(card.get_sprite(), -1, xpos, 25 + yOffset)
draw_text(xpos + 10, 35 + yOffset, card.get_name())
draw_text(xpos + 96, 35 + yOffset, card.get_value())