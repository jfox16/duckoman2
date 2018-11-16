/// @description Init Camera
my_target = noone;
my_camera = view_camera[0];
step = 0.3;

/* wiggle is how far the target can move from the center of the camera
before causing the camera to move. */
wiggle_x = 20;
wiggle_y = 15;

/* if target is more than max_distance away, camera will immediately
move to it instead of moving smoothly. */
max_distance = 300;