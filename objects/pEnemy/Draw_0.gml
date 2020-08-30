draw_self();

var c = c_white;
if (collision_line(center_x, center_y, end_sight_x, end_sight_y, oPlayer, 0, 1))
{
	c = c_red;
}
draw_set_color(c);
draw_line(center_x, center_y, end_sight_x, end_sight_y);