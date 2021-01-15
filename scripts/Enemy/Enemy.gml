function enemy_update_wander_point()
{
	xwander = 1 + irandom(room_width - 1);
	ywander = 1 + irandom(room_height - 1);
}

function enemy_state_idle()
{
	move_speed_target = move_speed_idle;
	direction = point_direction(x, y, xwander, ywander);
	
	if (distance_to_point(xwander, ywander) < 1)
		enemy_update_wander_point();
	else
		mp_potential_step(xwander, ywander, move_speed, 0);
	
	// find a new point
	while (collision_line_ext(x, y, xwander, ywander, oSolid, 1, 1, UNIT))
		enemy_update_wander_point();
	
	// find player
	if (instance_exists(oPlayer))
	{
		var _player_dir = point_direction(x, y, oPlayer.x, oPlayer.y);
		var _ang_diff = abs(angle_difference(direction, _player_dir));
		
		if (_ang_diff < sight_cone &&
			distance_to_point(oPlayer.x, oPlayer.y) < sight_dist &&
			!collision_line(x, y, oPlayer.x, oPlayer.y, oSolid, 1, 1))
		{	
			state = enemy_state_seek;
		}
	}
}
function enemy_state_seek()
{
	move_speed_target = move_speed_seek;
	
	if (instance_exists(oPlayer))
	{
		if (!collision_line_ext(x, y, oPlayer.x, oPlayer.y, oSolid, 1, 1, UNIT))
		{
			xseen = oPlayer.x;
			yseen = oPlayer.y;
		}
		
		// you caught the player!
		if (place_meeting(x, y, oPlayer))
		{
			alarm[0] = room_speed;
			state = enemy_state_frez;
			return;
		}

		if (distance_to_point(xseen, yseen) > 0)
		{
			mp_potential_step(xseen, yseen, move_speed, 0);
		}
		else
		{
			state = enemy_state_idle;
			enemy_update_wander_point();
		}
	}
}

function enemy_state_frez()
{
	move_speed_target = 0;
}