/// @description seek and move towards player

if (state == ENEMY_FOLLOW.PATH && alarm[0] == -1 && enemy_sees_player(id))
{
	path_end();
	player_freeze();
	alarm[0] = room_speed;
}