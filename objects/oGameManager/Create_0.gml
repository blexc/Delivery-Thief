#macro PIX 16
#macro WIN_W 320
#macro WIN_H 320

surface_resize(application_surface, WIN_W, WIN_H);

// global input vars
global.k_up = vk_up;
global.k_down = vk_down;
global.k_left = vk_left;
global.k_right = vk_right;
global.k_menu = ord("A");
global.k_interact = ord("C");
global.paused = false;
global.text_speed = 0.75;

draw_set_font(fnText);

// rooms
game_rooms = ds_list_create();
ds_list_add(game_rooms, rChessHouse1, r3Houses);

minigame_rooms = ds_list_create();
ds_list_add(minigame_rooms, rTicTacToe);

quarters = 1;

spawner = -1; // -1 for init_spawn, 0 for minigame, 1, 2, 3, etc. for numbered spawners
cur_enemy_instance_id = -1;
last_room = room;