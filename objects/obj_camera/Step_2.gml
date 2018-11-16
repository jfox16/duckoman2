/// @description Follow target

if (my_target != noone) {
	var cam_x = camera_get_view_x(my_camera);
	var cam_y = camera_get_view_y(my_camera);
	var cam_width = camera_get_view_width(my_camera)
	var cam_height = camera_get_view_height(my_camera);
	var cam_center_x = cam_x + cam_width/2;
	var cam_center_y = cam_y + cam_height/2;
	var dest_x = cam_center_x;
	var dest_y = cam_center_y;
	
	// move x if target is outside of wiggle room
	if (my_target.x < cam_center_x-wiggle_x) {
		dest_x = my_target.x + wiggle_x;
	}
	else if (my_target.x > cam_center_x+wiggle_x) {
		dest_x = my_target.x - wiggle_x;
	}
	// move y if target is outside of wiggle room
	if (my_target.y < cam_center_y-wiggle_y) {
		dest_y = my_target.y + wiggle_y;
	}
	else if (my_target.y > cam_center_y+wiggle_y) {
		dest_y = my_target.y - wiggle_y;
	}
	
	if  ( abs(dest_x - cam_center_x) > max_distance
	|| abs(dest_y - cam_center_y) > max_distance ) {
		// immediately center on target
		cam_x = clamp(dest_x - cam_width/2, 0, room_width-cam_width);
		cam_y = clamp(dest_y - cam_height/2, 0, room_height-cam_height);
	}
	else {
		// lerp camera toward target         
		var lerp_x = lerp(cam_center_x, dest_x, step);
		var lerp_y = lerp(cam_center_y, dest_y, step);          
		var cam_x = clamp(lerp_x-cam_width/2, 0, room_width-cam_width);
		var cam_y = clamp(lerp_y-cam_height/2, 0, room_height-cam_height);
	}
	camera_set_view_pos(my_camera, round(cam_x), round(cam_y));
}