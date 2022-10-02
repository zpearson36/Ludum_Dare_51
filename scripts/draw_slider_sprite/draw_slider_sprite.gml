/// @description draw_slider_sprite(value, bar_sprite, slider_sprite, x, y)
/// @param value
/// @param  bar_sprite
/// @param  slider_sprite
/// @param  x
/// @param  y
function draw_slider_sprite() {
	var value, bar_sprite, s_sprite, xx, yy;
	value = argument[0];
	bar_sprite = argument[1];
	s_sprite = argument[2];
	xx = argument[3];
	yy = argument[4];
	var width = sprite_get_width(bar_sprite)-sprite_get_width(s_sprite);

	var spr_prev = sprite_index;

	sprite_index = bar_sprite;

	x = xx;

	y = yy; 

	if(position_meeting(mouse_x,mouse_y,id))
	{
	if(mouse_check_button(mb_left))
	{
	value = (mouse_x-xx-(sprite_get_width(s_sprite)/2))/width;
	}
	}

	value = clamp(value,0,1);

	sprite_index = spr_prev;

	x = xprevious;

	y = yprevious;

	draw_sprite(bar_sprite, 0, xx, yy);

	draw_sprite_part(bar_sprite, 1, 0, 0, (width*value)+(sprite_get_width(spr_slider)/2), sprite_get_height(bar_sprite), xx, yy);

	draw_sprite(s_sprite, 0, xx+(width*value), yy);

	return value;



}
