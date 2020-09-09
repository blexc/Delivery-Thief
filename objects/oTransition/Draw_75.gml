if (mode != TRANS_MODE.OFF)
{
	SetDraw(c_black, fa_left, fa_top, percent);
	draw_rectangle(0, 0, w, h, false);
	draw_set_alpha(1);
}