/// @description click_sprite(sprite, frame, x, y, button)
/// @param sprite
/// @param  frame
/// @param  x
/// @param  y
/// @param  button
function click_sprite(argument0, argument1, argument2, argument3, argument4) {
	var sprite, frame, xx, yy, button, r;
	sprite = argument0;
	frame = argument1;
	xx = argument2;
	yy = argument3;
	button = argument4;
	r = 0;

	if(hover_sprite(sprite,frame,xx,yy))
	{
	if(button) r = 1;
	}

	return r;



}
