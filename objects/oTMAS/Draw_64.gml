var x1_bar = 0; var y1_bar = 0;
var x2_bar = w; var y2_bar = h * 0.2;
var b = 16;

if (!game_start)
{
	// black screen
	SetDraw(c_black, fa_left, fa_top, 1);
	draw_rectangle(0, 0, w, h, false);
	NineSliceBoxStretched(sTMASNineSliceBox, 0, 0, w, h);

	// message
	SetDraw(c_white, fa_center, fa_center, 1);
	draw_text(w/2, h/2, msg);
}
else
{
	// black bar top
	SetDraw(c_black, fa_left, fa_top, 1);
	NineSliceBoxStretched(sTMASNineSliceBox, x1_bar, y1_bar, x2_bar, y2_bar);
	
	var map_size = ds_map_size(oTMASPlayer.inventory);
	var key = ds_map_find_first(oTMASPlayer.inventory);
	var count = 0;
	for (var i=0; i < map_size; i++)
	{
		var value = ds_map_find_value(oTMASPlayer.inventory, key);
		if (value == true)
		{
			draw_sprite(key.sprite_index, 0, x1_bar+(count*b), y2_bar);
			count += 1;
		}
		key = ds_map_find_next(oTMASPlayer.inventory, key);
	}

	// timer bar or message
	if (!game_over && oTMASPlayer.state == TMASPlayerStateIdle)
	{
		SetDraw(c_white, fa_left, fa_top, 1-percent);
		var _pretend_time = room_speed;
		var time_left_per = 1 - (time_max-time_left+_pretend_time) / time_max;
		var end_x = max(x1_bar+b*0.5, (x2_bar-b*0.5) * time_left_per);
		draw_rectangle(x1_bar+b*0.5, y1_bar+b, end_x, y2_bar-b, false);
	}
	else
	{
		// message
		SetDraw(c_white, fa_center, fa_center, 1);
		draw_text((x2_bar - x1_bar) * 0.5, y2_bar * 0.5, msg);
	}
}

// fade in/out
SetDraw(c_black, fa_left, fa_top, percent);
draw_rectangle(0, 0, w, h, false);
draw_set_alpha(1);