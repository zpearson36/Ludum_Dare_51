/// @description Insert description here
// You can write your code in this editor

xpos = TILEWIDTH * MAPWIDTH + 25 + 153 * number
if(mouse_x >= xpos and mouse_x <= xpos + 128
   and mouse_y >= 25 and mouse_y <= 309) hover = true

if(hover) yOffset = -10
else yOffset = 0