draw_set_font(fnTMAS);
w = display_get_gui_width();
h = display_get_gui_height();

game_over = false;
game_start = false;
did_win = false;
msg = "";

enum FADE
{
	IN,
	OUT, 
	OFF
}

screen_transition = FADE.OFF;
percent = 0;

time_max = room_speed * 30;
time_limit = room_speed * 20;
time_left = time_limit;


// make sure only one instance is spawned
treasure_id = instance_find(oTMASTreasure, irandom_range(0, instance_number(oTMASTreasure)-1));
apple_id = instance_find(oTMASApple, irandom_range(0, instance_number(oTMASApple)-1));
clock_id = instance_find(oTMASClock, irandom_range(0, instance_number(oTMASClock)-1));


	