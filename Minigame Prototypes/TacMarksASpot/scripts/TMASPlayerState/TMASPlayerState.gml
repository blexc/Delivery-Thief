function TMASPlayerStateIdle(){
	if (oTMAS.game_start && !oTMAS.game_over)
	{
		move_x = right - left;
		move_y = down - up;
	}
	else
	{
		move_x = 0;
		move_y = 0;
	}

	hsp = move_x * walk_sp;
	vsp = move_y * walk_sp;
	
	// collisions
	if (hsp != 0)
	{
		if (tilemap_get_at_pixel(col_tilemap, round(bbox_right + hsp), bbox_bottom) == 0 &&
			tilemap_get_at_pixel(col_tilemap, round(bbox_left + hsp), bbox_bottom) == 0 &&
			tilemap_get_at_pixel(col_tilemap, round(bbox_right + hsp), bbox_top) == 0 &&
			tilemap_get_at_pixel(col_tilemap, round(bbox_left + hsp), bbox_top) == 0 )
		{
			x += hsp;
		}
		else
		{
			if (hsp > 0) {
				x = floor(x);
				x = x- ((bbox_right) mod 16) + 16-1;
			}
			else if (hsp < 0)
			{
				x = ceil(x);
				x = x -(bbox_left mod 16);
			}
			hsp = 0;
		}
	}

	if (vsp != 0)
	{
		if (tilemap_get_at_pixel(col_tilemap, bbox_right, round(bbox_top + vsp)) == 0 &&
			tilemap_get_at_pixel(col_tilemap, bbox_right, round(bbox_bottom + vsp)) == 0 &&
			tilemap_get_at_pixel(col_tilemap, bbox_left, round(bbox_top + vsp)) == 0 &&
			tilemap_get_at_pixel(col_tilemap, bbox_left, round(bbox_bottom + vsp)) == 0 ) 
		{
			y += vsp;
		}
		else
		{
			if (vsp > 0)
			{
				y = floor(y);
				y = y - ((bbox_bottom) mod 16) + 16-1;
			}
			else if (vsp < 0)
			{
				y = ceil(y);
				y = y -(bbox_top mod 16);
			}
			vsp = 0;
		}
	}


	if (oTMAS.game_start && !oTMAS.game_over && interact)
	{
		state = TMASPlayerStateDig;
		found_something = true;
		alarm[0] = room_speed * 1.5;
		
		if (place_meeting(x, y, oTMASTreasure))
		{
			oTMAS.screen_transition = FADE.OUT;
			oTMAS.did_win = true;
		}
		else if (place_meeting(x, y, oTMASApple))
		{
			walk_sp = 2;
			instance_nearest(x, y, oTMASApple).x = -100;
			ds_map_replace(inventory, oTMASApple, true);
		}
		else if (place_meeting(x, y, oTMASClock))
		{
			oTMAS.time_left += 10 * room_speed;
			instance_nearest(x, y, oTMASClock).x = -100;
			ds_map_replace(inventory, oTMASClock, true);
		}
		else if (place_meeting(x, y, oTMASColor))
		{
			instance_nearest(x, y, oTMASColor).x = -100;
			ds_map_replace(inventory, oTMASColor, true);
		}
		else if (place_meeting(x, y, oTMASShake))
		{
			instance_nearest(x, y, oTMASShake).x = -100;
			ds_map_replace(inventory, oTMASShake, true);
		}
		else
		{
			found_something = false;	
		}
		
		if (!found_something)
		{
			state = TMASPlayerStateIdle;
		}
	}
}

function TMASPlayerStateDig(){

}