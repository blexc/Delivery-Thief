#macro PIX 16
#macro WIN_W 640
#macro WIN_H 640

display_set_gui_size(WIN_W, WIN_H);

global.k_up = vk_up;
global.k_down = vk_down;
global.k_left = vk_left;
global.k_right = vk_right;
global.k_menu = ord("A");
global.k_interact = ord("C");
global.k_dash = ord("X");

global.paused = false;

money = 2500;
cur_enemy_instance_id = -1; // only set while in minigame