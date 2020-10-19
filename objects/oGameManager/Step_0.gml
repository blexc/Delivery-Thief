

// debug operations...
var enter = keyboard_check_pressed(vk_enter);


if (enter) game_restart();

if (keyboard_check_pressed(ord("F")) && keyboard_check(vk_control))
	window_set_fullscreen(!window_get_fullscreen());

