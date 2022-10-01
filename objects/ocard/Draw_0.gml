/// @description Insert description here
// You can write your code in this editor

draw_sprite(card.get_sprite(), -1, xpos, ypos + yOffset)
draw_text(xpos + 10, ypos + 10 + yOffset, card.get_name())
draw_text(xpos + 60, ypos + 10 + yOffset, card.get_value())
draw_text(xpos + 96, ypos + 100 + yOffset, get_order())