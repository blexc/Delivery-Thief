function enemy_sees_player(_this)
{
	with (_this)
	{
		var _len = UNIT * sight_distance;
		
		var _xcenter = x + UNIT / 2;
		var _ycenter = y + UNIT / 2;
		var _xend_view = _xcenter + lengthdir_x(_len, direction);
		var _yend_view = _ycenter + lengthdir_y(_len, direction);
	
		for (var _xx = _xcenter; _xx <= _xend_view; _xx++)
		{
			for (var _yy = _ycenter; _yy <= _yend_view; _yy++)
			{
				if (collision_point(_xx, _yy, oSolid, false, true))
					return false;
				
				if (oPlayer.xcenter == _xx && oPlayer.ycenter == _yy)
					return true;	
			}
		}
		
		return false;
	}
}

function enemy_normal_path_start(_this)
{
	with (_this)
	{
		path_end();
		if (path_exists(temp_path)) path_delete(temp_path);	
	
		if (path_exists(path))
		{
			x = xstart;
			y = ystart;
			path_start(path, move_speed, path_action_restart, false);
		}
	}
}

function enemy_follow_path_start(_this, _x, _y)
{
	with (_this)
	{
		path_end();
		if (path_exists(temp_path)) path_delete(temp_path);	
	
		temp_path = path_add();
		mp_linear_path_object(temp_path, _x, _y, move_speed, noone);
		path_start(temp_path, move_speed, path_action_stop, 0);
	}
}