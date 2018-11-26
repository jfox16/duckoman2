/// @description Go to room if jump pressed
show_location_name(other);

if (global.jump_pressed || global.dash_pressed) {
	enter_location(other);
}