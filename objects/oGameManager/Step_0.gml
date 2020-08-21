// global commands
if (keyboard_check_pressed(ord("F")) && keyboard_check(vk_control))
{
	window_set_fullscreen(!window_get_fullscreen());
}

var menu = keyboard_check_pressed(global.k_menu);
if (menu)
{
	global.paused = !global.paused;
}
