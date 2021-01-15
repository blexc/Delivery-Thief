/// @description debug
draw_self();
if (!debug_mode) exit;

// draw path
draw_set_alpha(0.5);
draw_set_color(c_purple);
//draw_line(x			, y			, xwander		, ywander);
//draw_line(x + UNIT	, y			, xwander + UNIT, ywander);
//draw_line(x			, y + UNIT	, xwander		, ywander + UNIT);
//draw_line(x + UNIT	, y + UNIT	, xwander + UNIT, ywander + UNIT);

// draw sight cone
if (instance_exists(oPlayer))
{
	var _hu = UNIT / 2;
	draw_set_alpha(1);
	draw_set_color(c_green);
	draw_line(x + _hu, y + _hu, x + _hu + lengthdir_x(sight_dist, direction - sight_cone / 2),
		y + _hu + lengthdir_y(sight_dist, direction - sight_cone / 2));
		
	draw_line(x + _hu, y + _hu, x + _hu + lengthdir_x(sight_dist, direction + sight_cone / 2),
		y + _hu + lengthdir_y(sight_dist, direction + sight_cone / 2));
}

draw_set_alpha(1);