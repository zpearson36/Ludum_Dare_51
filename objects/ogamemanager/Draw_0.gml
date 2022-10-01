/// @description Insert description here
// You can write your code in this editor

for(var i = 0; i < gMap.get_width(); i++)
{
	for(var j = 0; j < gMap.get_width(); j++)
	{
		draw_rectangle(i * TILEWIDTH, j * TILEHEIGHT, (i + 1) * TILEWIDTH - 2, (j + 1) * TILEHEIGHT - 2, false)
		draw_set_color(c_black)
		draw_rectangle(i * TILEWIDTH, j * TILEHEIGHT, (i + 1) * TILEWIDTH - 2, (j + 1) * TILEHEIGHT - 2, true)
		draw_set_color(c_white)
	}
}