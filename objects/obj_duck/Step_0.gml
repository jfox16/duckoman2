/// @description Move based on input

/* Duck's Step function sets his x_velocity and y_velocity based on input,
which will be used for movement in the parent obj_unit step function.*/

// Check if player is grounded.
was_grounded = is_grounded; //set was_grounded before changing is_grounded
is_grounded = place_meeting(x, y+1, obj_solid);

// Refresh jump and dash
if (is_grounded) {
	jump_forgiveness_frames = jump_forgiveness_frames_max;
	can_dash = true;
}

is_crouching = global.input_y > 0;

// Check if player is wall sliding, and direction of wall slide
was_wall_sliding = is_wall_sliding;
is_wall_sliding = false;
// Check wall slide on left
if ( 
	global.input_x < 0 
	&& x_velocity <= 0
	&& place_meeting(x-5, y, obj_wall) 
) {
	is_wall_sliding = true;
	wall_slide_on_right = false;
}
// Check wall slide on right
else if ( 
	global.input_x > 0 
	&& x_velocity >= 0
	&& place_meeting(x+5, y, obj_wall) 
) {
	is_wall_sliding = true;
	wall_slide_on_right = true;
}


// - Determine X Movement -
// ------------------------
/* X movement is based on x input. */

// if no x input
if ( global.input_x == 0 ) {
	if ( abs(x_velocity) <= x_max_velocity ) {
		x_velocity = 0;
	}
}
else {
	// left pressed
	if ( global.input_x == -1 ) {
		// if facing opposite direction
		if (facing_right) {
			if (is_grounded) x_velocity = 0;
			facing_right = false;
			turn_frames = turn_frames_max;
		}
		if (x_velocity >= -x_max_velocity) {
			var new_x_velocity = x_velocity - x_acceleration;
			x_velocity = max(new_x_velocity, -x_max_velocity);
		}
	}
	// right pressed
	else {
		// if facing opposite direction
		if (!facing_right) {
			if (is_grounded) x_velocity = 0;
			facing_right = true;
			turn_frames = turn_frames_max;
		}
		if (x_velocity <= x_max_velocity) {
			var new_x_velocity = x_velocity + x_acceleration;
			x_velocity = min(new_x_velocity, x_max_velocity);
		}
	}
}

if (is_crouching && is_grounded) x_velocity *= 0.5;

// apply drag
if (is_grounded) {
	if (x_velocity > x_max_velocity)
		x_velocity = max(x_velocity-x_drag, 0);
	else if (x_velocity < -x_max_velocity)
		x_velocity = min(x_velocity+x_drag, 0);
}

// - Determine Y movement - 
// ------------------------
/* Y movement is based on whether or not duck is jumping and 
whether or not duck is wall sliding. A jump can be lengthened 
by holding the jump button. */

// Check Jump
if (jump_forgiveness_frames > 0) {
	jump_forgiveness_frames--;
	if (global.jump_pressed) {
		y_velocity = -jump_speed;
		if (!is_crouching) jump_frames = jump_frames_max;
		else jump_frames = 1;
		jump_forgiveness_frames = 0;
		audio_play_sound(snd_jump, 1, false);
	}
}

// Check Jump held
if (global.jump_held && jump_frames > 0) {
	if ( place_meeting(x, y-1, obj_solid) ) {
		y_velocity = 0;
		jump_frames = 0;
	}
	else {
		y_velocity = -jump_speed;
		jump_frames--;
	}
}
else {
	// apply gravity
	jump_frames = 0;
	if (y_velocity < y_max_velocity) {
		y_velocity = min(y_velocity+y_gravity, y_max_velocity);
	}
}

// Check Wall Jump
if (is_wall_sliding) {
	wall_jump_forgiveness_frames = wall_jump_forgiveness_frames_max;
	y_velocity = min(y_velocity, 2*y_gravity);
}
if ( !is_grounded && wall_jump_forgiveness_frames > 0 ) {
	if (global.jump_pressed) {
		if (wall_slide_on_right) {
			x_velocity = -wall_jump_x_velocity;
			y_velocity = -wall_jump_y_velocity;
		}
		else {
			x_velocity = wall_jump_x_velocity;
			y_velocity = -wall_jump_y_velocity;
		}
		wall_jump_forgiveness_frames = 0;
		audio_play_sound(snd_jump, 1, false);
	}
	else wall_jump_forgiveness_frames--;
}

// - Dash -
// --------
/* Duck can perform a dash by pressing the dash button, causing him
to move in the input direction. The directional movement is stored in dash_x
and dash_y, and this movement will override other movement until the 
dash is over. Dashes have a short delay before they can be used again, and
can only be used once in midair. */

if ( 
	( (global.acorn_got && is_grounded) || global.wingberry_got )
	&& global.dash_pressed 
	&& can_dash 
	&& dash_delay_frames == 0
) {
	var dashburst = instance_create_depth(x, y, depth+1, obj_dashburst);
	
	// horizontal dash
	if (is_grounded || global.input_y == 0) {
		dash_x = (facing_right) ? dash_speed : -dash_speed;
		dash_y = 0;
		dashburst.y -= 8;
		if (dash_x < 0) dashburst.image_xscale = -1;
	}
	// vertical dash
	else if (global.input_x == 0) {
		dash_x = 0;
		dash_y = global.input_y * dash_speed;
		if (dash_y < 0) dashburst.image_angle = 90;
		else dashburst.image_angle = -90;
	}
	// diagonal dash
	else {
		dash_x = global.input_x * dash_speed * 0.8;
		dash_y = global.input_y * dash_speed * 0.8;
		var db_angle = 0;
		if (dash_x > 0) db_angle = 45;
		else db_angle = 135;
		if (dash_y > 0) db_angle *= -1;
		dashburst.image_angle = db_angle;
	}
	
	// downward dashes are faster
	if (dash_y > 0) {
		dash_x *= 1.4;
		dash_y *= 1.4;
	}
	can_dash = false;
	dash_frames = dash_frames_max;
	dash_delay_frames = dash_delay_frames_max;
	
	if (dash_x == 0) x_velocity = 0;
	if (dash_y == 0) y_velocity = 0;
	
	audio_play_sound(snd_dash, 2, false);
}
if (dash_frames > 0) {
	if (dash_x != 0) x_velocity = dash_x;
	if (dash_y != 0 || y_velocity > 0) y_velocity = dash_y;
	dash_frames--;
}
if (dash_delay_frames > 0) dash_delay_frames--;

//show_debug_message("duck position: " + string(x+x_float) + ", " + string(y+y_float));
//show_debug_message("velocity: " + string(x_velocity) + ", " + string(y_velocity));

if (place_meeting(x,y,obj_solid)) show_debug_message("DUCK IS STUCK");

// - Move -
// --------
event_inherited();







