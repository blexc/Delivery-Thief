#macro RES_W 240
#macro RES_H 160

w = 480*2;
h = 320*2;
window_set_size(w, h);
alarm[0] = 1;

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
instance_create_layer(0, 0, "Instances", oTMASMark); 


	