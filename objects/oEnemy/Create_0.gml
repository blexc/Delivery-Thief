/// @description create path

enemy_path_start(id); // if false, following a target

enum ENEMY_FOLLOW
{
	PATH,
	PLAYER,
	START
}

state = ENEMY_FOLLOW.PATH;

sight_distance = 4; // in units
xtarget = -1;
ytarget = -1;
w_half = sprite_width  / 2;
h_half = sprite_height / 2;