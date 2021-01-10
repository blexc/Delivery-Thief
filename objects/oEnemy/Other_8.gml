/// @description change state

if (state == ENEMY_FOLLOW.PLAYER)
{
	state = ENEMY_FOLLOW.START;	
	enemy_follow_path_start(id, xstart, ystart);
	player_unfreeze();
}
else if (state == ENEMY_FOLLOW.START)
{
	state = ENEMY_FOLLOW.PATH;
	enemy_normal_path_start(id);
	direction = direction_start;

}