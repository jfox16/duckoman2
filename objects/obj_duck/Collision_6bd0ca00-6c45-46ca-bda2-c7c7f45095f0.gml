/// @description Change Room

if position_meeting(x,y,other) && room_exists(other.destination_room) {
	if (other.destination_room == rm_worldmap) {
		exit_location(other);
	}
	else {
		// not implemented
	}
}
else if !room_exists(other.destination_room)
	show_debug_message("Room incorrectly set");
