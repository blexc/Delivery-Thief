draw_self();

if (sees_player)
{
	SetDraw(c_white, fa_center, fa_center, 1);
	draw_text(center_x, y + sprite_get_bbox_top(sprite_index) - 10, "!");
}