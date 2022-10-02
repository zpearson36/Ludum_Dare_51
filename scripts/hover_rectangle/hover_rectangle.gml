/// @description hover_rectangle(x1,y1,x2,y2)
/// @param x1
/// @param y1
/// @param x2
/// @param y2
function hover_rectangle(argument0, argument1, argument2, argument3) {
	var x1, y1, x2, y2, r;

	x1 = argument0;
	y1 = argument1;
	x2 = argument2;
	y2 = argument3;
	r = 0;

	if(point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2))
	{
	r = 1;
	}

	return r;



}
