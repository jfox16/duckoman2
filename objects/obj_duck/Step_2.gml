/// @description Animate and play looping sound

// - Animate -
// -----------

if (is_grounded) {
	if (!was_grounded) {
		land_frames = land_frames_max;
		audio_play_sound(snd_land, 0, false);
	}
		
	if (land_frames > 0) {
		sprite_index = spr_duck_land;
		land_frames--;
	}
	else if (dash_frames > 0) {
		sprite_index = spr_duck_land;
	}
	else if (turn_frames > 0) {
		sprite_index = spr_duck_turn;
		turn_frames--;
	}
	else if (global.input_x !=0) sprite_index = spr_duck_run;
	else sprite_index = spr_duck_stand;
}
else if (is_wall_sliding && y_velocity > 0) {
	turn_frames = 0;
	sprite_index = spr_duck_wall_slide;
}
else{
	turn_frames = 0;
	if (y_velocity < -2) sprite_index = spr_duck_jump_up;
	else if (y_velocity > 2) sprite_index = spr_duck_jump_down;
	else sprite_index = spr_duck_jump;
}

if (turn_frames == 0) 
	image_xscale = (facing_right) ? 1 : -1;
	
// - Sounds -
// ----------

if (is_wall_sliding && y_velocity > 0) {
	if (slide_sound == noone)
		slide_sound = audio_play_sound(snd_slide, 0, true);
}
else {
	audio_pause_sound(snd_slide);
	slide_sound = noone;
}