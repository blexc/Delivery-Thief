/// @description seek and move towards player

if (state == ENEMY_FOLLOW.PATH && alarm[0] == -1 && enemy_sees_player(id))
{
	path_end();
	player_freeze();
	alarm[0] = room_speed;
}

if (state == ENEMY_FOLLOW.PLAYER || state == ENEMY_FOLLOW.START)
{
	mp_linear_step_object(xtarget, ytarget, move_speed, noone);
}

if (xtarget == x && ytarget == y)
{
	if (state == ENEMY_FOLLOW.PLAYER)
	{
		player_unfreeze();
		xtarget = xstart;
		ytarget = ystart;
		state = ENEMY_FOLLOW.START;
	}
	else if (state == ENEMY_FOLLOW.START)
	{
		enemy_path_start(id);
		state = ENEMY_FOLLOW.PATH;
	}
}