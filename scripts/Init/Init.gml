function InitGlobalsMacros()
{
	#macro PIX 16
	RES_W = 240;
	RES_H = 160;
	#macro FRAME_RATE 60
	#macro view view_camera[0]
	
	global.k_up = vk_up;
	global.k_down = vk_down;
	global.k_left = vk_left;
	global.k_right = vk_right;
	global.k_menu = ord("A");
	global.k_interact = ord("C");

	global.quest_complete = false;
	global.paused = false;
	global.text_speed = 0.75;
	
	global.monitor_w = 1920; // set resolution window width manually
	global.monitor_h = 1080;
}

// at least as perfect as it'll get
function InitPixelPerfect()
{
	surface_resize(application_surface, RES_W*scale, RES_H*scale);
	window_set_size(RES_W*scale, RES_H*scale);
	display_set_gui_size(RES_W, RES_H);
}

// find the largest scale possible that will fit on the supposed monitor dimensions
function FindMaxScale()
{
	var i=1;
	while (global.monitor_w >= RES_W*i && global.monitor_h >= RES_H*i)
	{
		i++;
	}
	i--;
		
	return i;
}

