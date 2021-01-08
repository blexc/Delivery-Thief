/// @description seek and move towards player

if (!moving_towards_target && alarm[0] == -1 && enemy_sees_player(id))
{
	path_end();
	player_freeze();
	alarm[0] = room_speed;
}

if (moving_towards_target)
{
	if (xtarget == x && ytarget == y)
	{
		enemy_path_start(id);
		player_unfreeze();
		moving_towards_target = false;
	}
	else
	{
		mp_linear_step_object(xtarget, ytarget, move_speed, noone);
	}
}

add_to_debug("card direction: " + string(deg_to_cardinal(direction)));
add_to_debug("sees_player: " + ((enemy_sees_player(id)) ? "true" : "false"));