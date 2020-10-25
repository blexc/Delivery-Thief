
// debug operations...
if (keyboard_check_pressed(vk_enter)) game_restart();
if (keyboard_check_pressed(ord("Z")))
{
	scale = scale+1
	if (scale > FindMaxScale()) scale = 1;
	window_set_size(RES_W*scale, RES_H*scale);
	alarm[1] = 1;
}

// fullscreen
if (keyboard_check_pressed(ord("F")) && keyboard_check(vk_control))
{
	window_set_fullscreen(!window_get_fullscreen());
}
	

