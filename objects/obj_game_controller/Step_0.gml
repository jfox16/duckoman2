/// @description Read Input

// - Read Input -
// ---------------
/* Input is read to input_x and input_y.
input_x: -1 is left, 0 is none, 1 is right
input_y: -1 is up, 0 is none, 1 is down */

var input_x = 0;
var input_y = 0;

if (keyboard_check(left_key0) || keyboard_check(left_key1)) {
	input_x--;
}
if (keyboard_check(right_key0) || keyboard_check(right_key1)) {
	input_x++;
}
if (keyboard_check(up_key0) || keyboard_check(up_key1)) {
	input_y--;
}
if (keyboard_check(down_key0) || keyboard_check(down_key1)) {
	input_y++;
}

if (global.cutscene_frames > 0) {
	global.cutscene_frames--;
}
else {
	global.input_x = input_x;
	global.input_y = input_y;
	global.jump_pressed = ( keyboard_check_pressed(jump_key0) 
	|| keyboard_check_pressed(jump_key1) || keyboard_check_pressed(jump_key2) );
	global.jump_held = ( keyboard_check(jump_key0) || keyboard_check(jump_key1) 
	|| keyboard_check(jump_key2) );
	global.dash_pressed = ( keyboard_check_pressed(dash_key0)
	|| keyboard_check_pressed(dash_key1) || keyboard_check_pressed(dash_key2) );
}

