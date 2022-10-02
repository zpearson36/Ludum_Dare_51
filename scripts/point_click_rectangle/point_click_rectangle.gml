/// @description point_click_rectangle(px,py,x1,y1,x2,y2,button)
/// @param px
/// @param py
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param button
function point_click_rectangle(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {
	var px,py,x1,y1,x2,y2,button,r;
	px = argument0;
	py = argument1;
	x1 = argument2;
	y1 = argument3;
	x2 = argument4;
	y2 = argument5;
	button = argument6;
	r = 0;

	if(point_in_rectangle(px,py,x1,y1,x2,y2))
	{
	if(button) r = 1;
	}

	return r;



}
