/// @description slider_rectangle(value,px,py,x1,y1,x2,y2,button)
/// @param value
/// @param px
/// @param py
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param button
function slider_rectangle() {
	var value,px,py,x1,y1,x2,y2,button;
	value = argument[0];
	px = argument[1];
	py = argument[2];
	x1 = argument[3];
	y1 = argument[4];
	x2 = argument[5];
	y2 = argument[6];
	button = argument[7];
	if(button && point_in_rectangle(px,py,x1,y1,x2,y2))
	{
	value = (px - x1)/(x2 - x1);
	}

	return value;



}
