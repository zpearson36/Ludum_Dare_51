/// @description Insert description here
// You can write your code in this editor

xpos = x + 153 * (number % 6)
ypos = y + 153 * floor(number / 6)
if(mouse_x >= xpos and mouse_x <= xpos + 128
   and mouse_y >= ypos and mouse_y <= ypos + 128) hover = true
var tmpID
if(oGameManager.get_selected_card()) tmpID = oGameManager.get_selected_card().id
else tmpID = oGameManager.get_selected_card()
if(hover or tmpID==id) yOffset = -10
else yOffset = 0