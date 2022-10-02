/// @description hover_sprite(sprite, frame, x, y)
/// @param sprite
/// @param  frame
/// @param  x
/// @param  y
function hover_sprite(argument0, argument1, argument2, argument3) {
	var sprite, frame, xx, yy, r;
	sprite = argument0;
	frame = argument1;
	xx = argument2;
	yy = argument3;
	r = 0;

	if(point_in_sprite(sprite,frame,mouse_x,mouse_y,xx,yy))
	{
	r = 1;
	}

	return r;



}
