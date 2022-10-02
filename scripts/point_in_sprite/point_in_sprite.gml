/// @description point_in_sprite(sprite,frame,point_x,point_y,sprite_x,sprite_y)
/// @param sprite
/// @param frame
/// @param point_x
/// @param point_y
/// @param sprite_x
/// @param sprite_y
function point_in_sprite(argument0, argument1, argument2, argument3, argument4, argument5) {
	var sprite, frame, px, py, sx, sy, sprite_prev, frame_prev, r;
	sprite = argument0;
	frame = argument1;
	px = argument2;
	py = argument3;
	sx = argument4;
	sy = argument5;
	r = 0;


	sprite_prev = sprite_index;
	frame_prev = image_index;

	sprite_index = sprite;
	image_index = frame;

	x = sx;
	y = sy;

	if(instance_position(px,py,id))
	{
	r = 1;
	}

	sprite_index = sprite_prev;
	image_index = frame_prev;

	x = xprevious;
	y = yprevious;

	return r;



}
