/// @description click_rectangle(x1,y1,x2,y2,button)
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param button
function click_rectangle(argument0, argument1, argument2, argument3, argument4) {
	var x1,y1,x2,y2,button,r;

	x1 = argument0;
	y1 = argument1;
	x2 = argument2;
	y2 = argument3;
	button = argument4;
	r = 0;

	if(hover_rectangle(x1,y1,x2,y2))
	{
	if(button)
	{
	r = 1;
	}
	}

	return r;



}
