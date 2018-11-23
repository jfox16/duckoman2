/// @function change_room(duck, change_room)
/// @description 
/// @param 

var duck = argument0;
var change = argument1;

if room_exists(change.destination_room) {
	room_goto(change.destination_room);
	if (change.destination_x != -1)
		duck.x = change.destination_x;
	if (change.destination_y != -1)
		duck.y = change.destination_y;
}
else {
	show_debug_message("ERROR: change_room.destination_room does not exist.");
}