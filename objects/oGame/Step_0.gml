/// @description special commands

if (keyboard_check(vk_lcontrol) && keyboard_check_pressed(ord("F")))
{
	window_set_fullscreen(!window_get_fullscreen());
}

if (keyboard_check(vk_escape))
{
	game_end();
}
