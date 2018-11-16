/// @description

if (global.input_x == 0 && global.input_y == 0) {
	sprite_set_speed(sprite_index, 4, spritespeed_framespersecond);
}
else {
	sprite_set_speed(sprite_index, 10, spritespeed_framespersecond);

	if (global.input_x < 0)
		sprite_index = spr_worldmap_duck_left;
	else if (global.input_x > 0)
		sprite_index = spr_worldmap_duck_right;
	
	if (global.input_y < 0)
		sprite_index = spr_worldmap_duck_up;
	else if (global.input_y > 0)
		sprite_index = spr_worldmap_duck_down;
}
