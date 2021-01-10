/// @description create path

enum ENEMY_FOLLOW
{
	PATH,
	PLAYER,
	START
}

temp_path = path_add();
enemy_normal_path_start(id); // if false, following a target

state = ENEMY_FOLLOW.PATH;

direction_start = direction;
sight_distance = 4; // in units