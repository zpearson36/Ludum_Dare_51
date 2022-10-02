/// @description Insert description here
// You can write your code in this editor
var offset = 2
draw_text_color(x-offset, y, txt, c_black, c_black, c_black, c_black, 1)
draw_text_color(x+offset, y, txt, c_black, c_black, c_black, c_black, 1)
draw_text_color(x, y+offset, txt, c_black, c_black, c_black, c_black, 1)
draw_text_color(x, y-offset, txt, c_black, c_black, c_black, c_black, 1)
draw_text_color(x,y,txt, col, col, col, col, 1)

//draw_text( 150, y, txt+ ": " + string(x) + ", " + string(y))