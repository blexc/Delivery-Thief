draw_self();

if (near_dirt)
{
	SetDraw(c_white, fa_left, fa_bottom, 1);
	draw_rectangle(bbox_left+4, bbox_top, bbox_right-4, bbox_top-rect_size, false);
	SetDraw(c_black, fa_center, fa_center, 1);
	draw_text(x, bbox_top-(rect_size*0.25), "!");
}