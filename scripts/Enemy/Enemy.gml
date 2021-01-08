// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_sees_player(_this){
	with (_this)
	{
		var _len = UNIT * sight_distance;
		var _xcenter = x + w_half;
		var _ycenter = y + h_half;
		var _xend_view = _xcenter + lengthdir_x(_len, direction);
		var _yend_view = _ycenter + lengthdir_y(_len, direction);
	
		return collision_line(_xcenter, _ycenter, _xend_view, _yend_view,
			oPlayer, false, true);
	}
}

function enemy_path_start(_this)
{
	with (_this)
	{
		if (path_exists(path))
		{
			x = xstart;
			y = ystart;
			path_start(path, move_speed, path_action_restart, false);
			return true;
		}
		else
		{
			return false;	
		}
	}
}