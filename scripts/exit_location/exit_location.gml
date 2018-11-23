/// @function exit_location(duck, exit_location)
/// @description Transitions room to worldmap and initializes a worldmap_duck.
/// @param change_room that is exited through

var duck = argument0;
var location = argument1;
global.duck_spawn_x = location.destination_x;
global.duck_spawn_y = location.destination_y;
global.duck_spawning = true;
duck.persistent = false;
room_goto(rm_worldmap);