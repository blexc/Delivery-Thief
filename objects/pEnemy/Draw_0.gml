draw_self();

var c = c_white;
if (caught_player)
{
	SetDraw(c_white, fa_center, fa_center, 1);
	draw_text(center_x, y + sprite_get_bbox_top(sprite_index) - 10, "!");
	c = c_red;
}
draw_set_color(c);
draw_line(center_x, center_y, end_sight_x, end_sight_y);

for (var i=0; i <= sight_length; i+=16)
{
	if (tilemap_get_at_pixel(layer_tilemap_get_id(
		layer_get_id("Solid")), x + (look_x * i), y + (-look_y * i)))
	{
		c = c_red;
	}
	else c = c_white;
	draw_set_color(c);
	draw_circle(x + (look_x * i), y + (-look_y * i), 3, false);
}