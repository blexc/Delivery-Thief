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
		thing_found = noone;
		alarm[0] = room_speed * 1.5;
		
		if (place_meeting(x, y, oTMASDirt))
		{
			with (instance_nearest(x, y, oTMASDirt))
			{
				other.thing_found = object_assigned;
				instance_change(object_assigned, true);
				script_execute(object_effect);
			}
		}
		
		if (thing_found == noone)
		{
			state = TMASPlayerStateIdle;
		}
	}
}

function TMASPlayerStateDig(){
	// wait for alarm 0
}