/// @description Insert description here
// You can write your code in this editor

draw_sprite(card.get_sprite(), -1, xpos, y + yOffset)
draw_text(xpos + 10, y + 10 + yOffset, card.get_name())
draw_text(xpos + 96, y + 10 + yOffset, card.get_value())
draw_text(xpos + 96, y + 236 + yOffset, get_order())