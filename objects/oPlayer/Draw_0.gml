/// @description Insert description here
draw_self();
if (debug_mode)
{
	var _x = x + xvelocity;
	var _y = y + yvelocity;
	draw_point(_x, _y);
	draw_point(_x + sprite_width - 1, _y);
	draw_point(_x, _y + sprite_height - 1);
	draw_point(_x + sprite_width - 1, _y + sprite_height - 1);
}