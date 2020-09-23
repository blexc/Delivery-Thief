#macro RES_W 240
#macro RES_H 160

window_set_size(480*2, 320*2);
alarm[0] = 1;
w = display_get_gui_width();
h = display_get_gui_height();

global.k_up = vk_up;
global.k_down = vk_down;
global.k_left = vk_left;
global.k_right = vk_right;
global.k_interact = ord("C");

game_over = false;
game_start = false;
did_win = false;
msg = "";
draw_set_font(fnTMAS);

enum FADE
{
	IN,
	OUT, 
	OFF
}

screen_transition = FADE.OFF;
percent = 0;

time_limit = room_speed * 10;
time_left = time_limit;

// spawn the mark
mark_id = instance_find(oTMASMark, irandom_range(0, instance_number(oTMASMark)-1));



	