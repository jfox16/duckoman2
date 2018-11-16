/// @function enter_location(location)
/// @description Transitions room to location from worldmap.
/// @param {real} instance_id of the location.

var location = argument0;
if (location.destination_room != noone) {
	global.duck_spawn_x = location.destination_x;
	global.duck_spawn_y = location.destination_y;
	global.duck_spawning = true;
	room_goto(location.destination_room);
	reset_input();
	global.input_x = location.cutscene_input_x;
	global.cutscene_frames = location.cutscene_frames;
}