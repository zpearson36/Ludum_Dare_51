/// @description draw_label(x1,y1,x2,y2,label)
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param label
function draw_label() {
	var x1,y1,x2,y2,label;
	x1 = argument[0];
	y1 = argument[1];
	x2 = argument[2];
	y2 = argument[3];
	label = argument[4];

	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(mean(x1,x2),mean(y1,y2),string_hash_to_newline(label));



}
