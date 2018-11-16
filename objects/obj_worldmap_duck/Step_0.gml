/// @description Read Input, Move

x_velocity = global.input_x * movespeed;
y_velocity = global.input_y * movespeed;


show_debug_message("worldmap_duck position: " + string(x+x_float) + ", " + string(y+y_float));

// - Move -
// --------
event_inherited();

