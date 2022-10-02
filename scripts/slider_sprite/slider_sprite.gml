/// @description slider_sprite(value, px, py, bar_sprite, slider_sprite, x, y, button)
/// @param value
/// @param  px
/// @param  py
/// @param  bar_sprite
/// @param  slider_sprite
/// @param  x
/// @param  y
/// @param  button
function slider_sprite() {
	var value, px, py, bar_sprite, s_sprite, xx, yy, button;
	value = argument[0];
	px = argument[1];
	py = argument[2];
	bar_sprite = argument[3];
	s_sprite = argument[4];
	xx = argument[5];
	yy = argument[6];
	button = argument[7];

	var width = sprite_get_width(bar_sprite)-sprite_get_width(s_sprite);

	if(point_in_sprite(bar_sprite,0,px,py,xx,yy))
	{
	if(button)
	{
	value = (px-xx-(sprite_get_width(s_sprite)/2))/width;
	}
	}

	value = clamp(value,0,1);



	draw_sprite(bar_sprite, 0, xx, yy);

	draw_sprite_part(bar_sprite, 1, 0, 0, (width*value)+(sprite_get_width(spr_slider)/2), sprite_get_height(bar_sprite), xx, yy);

	draw_sprite(s_sprite, 0, xx+(width*value), yy);

	return value;



}
