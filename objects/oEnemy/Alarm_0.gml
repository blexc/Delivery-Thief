/// @description set target

state = ENEMY_FOLLOW.PLAYER;

var _xtarget = oPlayer.x;
var _ytarget = oPlayer.y;

switch (deg_to_cardinal(direction))
{
	case 0: _xtarget -= UNIT; break;
	case 1: _ytarget += UNIT; break;
	case 2: _xtarget += UNIT; break;
	case 3: _ytarget -= UNIT; break;
}

enemy_follow_path_start(id, _xtarget, _ytarget);