/// @description point_click_sprite(sprite,frame,px,py,sx,sy,button)
/// @param sprite
/// @param frame
/// @param px
/// @param py
/// @param sx
/// @param sy
/// @param button
function point_click_sprite(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {
	var px,py,sprite,frame,sx,sy,button,r;
	sprite = argument0;
	frame = argument1;
	px = argument2;
	py = argument3;
	sx = argument4;
	sy = argument5;
	button = argument6;
	r = 0;

	if(point_in_sprite(sprite,frame,px,py,sx,sy))
	{
	if(button) r = 1;
	}

	return r;



}
