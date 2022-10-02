/// @description draw_button_sprite(sprite_index, image_index, hover_index, x, y, label, label_color, radio_box)
/// @param sprite_index
/// @param  image_index
/// @param  hover_index
/// @param  x
/// @param  y
/// @param base_color
/// @param hover_color
/// @param click_color
/// @param  label
/// @param  label_color
/// @param  radio_box
function draw_button_sprite() {
	var spr_index, img_index, hover_index, xx, yy, label, label_color, radio_box, c_color;
	spr_index = argument[0];
	img_index = argument[1];
	hover_index = argument[2];
	xx = argument[3];
	yy = argument[4];
	base_color = argument[5];
	hover_color = argument[6];
	click_color = argument[7]
	label = argument[8];
	label_color = argument[9];
	radio_box = argument[10];

	var spr_prev, hover, img_prev, final_img;

	spr_prev = sprite_index;
	img_prev = image_index;
	hover = 0;

	x = xx;
	y = yy;
	sprite_index = spr_index;
	image_index = img_index;


	if(instance_position(mouse_x,mouse_y,id))
	{
	hover = 1;
	}

	x = xprevious;
	y = yprevious;

	sprite_index = spr_prev;
	image_index = img_prev;

	var r = 0;

	final_img = img_index;
	
	c_color = base_color
	if(hover)
	{
		c_color = hover_color
		final_img = hover_index;
		if(mouse_check_button(mb_left)) c_color = click_color
		if(mouse_check_button_released(mb_left)) r = 1;
	}

	draw_sprite_ext(spr_index, final_img, xx, yy, 1, 1, 0, c_color, 1);

	draw_set_color(label_color);

	if(radio_box = 0)
	{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(xx+(sprite_get_width(spr_index)/2),yy+(sprite_get_height(spr_index)/2),string_hash_to_newline(label));
	}
	else
	{
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text(xx+(sprite_get_width(spr_index)*1.25), yy, string_hash_to_newline(label));
	}
	return r;
}
