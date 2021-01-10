/// @description debug
draw_self();

if (debug_mode)
{
	draw_set_color(c_blue);
	if (path_exists(temp_path)) draw_path(temp_path, x, y, false);
	
	var _len = UNIT * sight_distance;
	var _xcenter = x + UNIT / 2;
	var _ycenter = y + UNIT / 2;
	set_draw(fa_center, fa_center, (enemy_sees_player(id)) ? c_red : c_green, 1);
	draw_line(_xcenter, _ycenter,
		_xcenter + lengthdir_x(_len, direction), 
		_ycenter + lengthdir_y(_len, direction));
}