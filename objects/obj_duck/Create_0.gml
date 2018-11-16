 /// @description Initialize Variables
 
event_inherited();

// Movement Variables
x_acceleration = 0.8;
x_max_velocity = 5;
x_drag = 1.5;

y_max_velocity = 10;
jump_speed = 7;
y_gravity = 1.1;

jump_frames = 0;
jump_frames_min = 2;
jump_frames_max = 5;

jump_forgiveness_frames = 0;
jump_forgiveness_frames_max = 3;

facing_right = true;

wall_slide_on_right = true;
wall_jump_forgiveness_frames = 0;
wall_jump_forgiveness_frames_max = 5;

dash_speed = 8;
can_dash = false;
dash_x = 0;
dash_y = 0;
dash_frames = 0;
dash_frames_max = 5;
dash_delay_frames = 0;
dash_delay_frames_max = 8;

// Animation
turn_frames = 0;
turn_frames_max = 2;

land_frames = 0;
land_frames_max = 4;

is_grounded = false;
was_grounded = false;
is_wall_sliding = false;


points = 0;

// debug
//room_speed = 15;
