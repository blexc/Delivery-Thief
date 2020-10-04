randomise();

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

// spawn dirt in random locations
var col_tilemap = layer_tilemap_get_id(layer_get_id("Collision"));
for (var i=0; i < 8; i++)
{
	var xx, yy;
	do
	{	
		xx = irandom_range(0, room_width);
		yy = irandom_range(0, room_height);
		xx -= xx % 16;
		yy -= yy % 16;
	}
	until (tilemap_get_at_pixel(col_tilemap, xx, yy) == 0);
	instance_create_layer(xx, yy, "Instances", oTMASDirt);
}

// assign objects to be 'hidden' in dirt
// need to wait for objects to init
treasure_instance = noone; // to keep track of the dirt which has the treasure
alarm[0] = 1;

