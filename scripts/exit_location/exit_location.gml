/// @function exit_location(change_room)
/// @description Transitions room to worldmap and initializes a worldmap_duck.
/// @param change_room that is exited through

var change_room = argument0;
global.duck_spawn_x = change_room.destination_x;
global.duck_spawn_y = change_room.destination_y;
global.duck_spawning = true;
room_goto(rm_worldmap);