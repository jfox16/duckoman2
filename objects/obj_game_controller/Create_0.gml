/// @description Initialize Input & Globals

left_key0 = ord("A");
left_key1 = vk_left;
right_key0 = ord("D");
right_key1 = vk_right;
up_key0 = ord("W");
up_key1 = vk_up;
down_key0 = ord("S");
down_key1 = vk_down;

jump_key0 = ord("L");
jump_key1 = ord("Z");
jump_key2 = vk_space;
dash_key0 = ord("K");
dash_key1 = ord("X");
dash_key2 = vk_alt;

global.input_x = 0;
global.input_y = 0;
global.jump_pressed = false;
global.jump_held = false;
global.dash_pressed = false;

global.game_controller = self;

global.duck_spawning = true;
global.duck_spawn_x = 64;
global.duck_spawn_y = 175;

global.cutscene_frames = 0;

// Duck fruit powerups
global.acorn_got = false;
global.wingberry_got = false;

