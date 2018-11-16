/// @description Move

// Determine integer X movement
move_x = (x_velocity > 0) ? floor(x_velocity) : ceil(x_velocity);
// Determine float X movement
x_float += x_velocity % 1;
if (x_velocity > 0) {
	if (x_float >= 1) {
		move_x += 1;
		x_float -= 1;
	}
}
else if (x_velocity < 0) {
	if (x_float <= -1) {
		move_x -= 1;
		x_float += 1;
	}
}
// Determine integer Y movement
move_y = (y_velocity > 0) ? floor(y_velocity) : ceil(y_velocity);
// Determine float X movement
y_float += y_velocity % 1;
if (y_velocity > 0) {
	if (y_float >= 1) {
		move_y += 1;
		y_float -= 1;
	}
}
else if (y_velocity < 0) {
	if (y_float <= -1) {
		move_y -= 1;
		y_float += 1;
	}
}

// Move X and Y distances or until a wall is met.
for (i=0; i<abs(move_x); i++) {
	if (place_meeting(x+sign(move_x), y, obj_solid)) {
		x_velocity = 0;
		x_float = 0;
		break;
	}
	else x += sign(move_x);
}
for (i=0; i<abs(move_y); i++) {
	if (place_meeting(x, y+sign(move_y), obj_solid)) {
		y_velocity = 0;
		y_float = 0;
		break;
	}
	else y += sign(move_y);
}