/// @description debug
draw_self();

if (debug_mode)
{
	var _xcenter = x + w_half;
	var _ycenter = y + h_half;
	var _len = UNIT * 3;
	
	set_draw(fa_center, fa_center, (enemy_sees_player(id)) ? c_red : c_green, 1);
	draw_line(_xcenter, _ycenter,
		_xcenter + lengthdir_x(_len, direction), 
		_ycenter + lengthdir_y(_len, direction));
}