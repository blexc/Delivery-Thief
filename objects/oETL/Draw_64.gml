if (msg != "")
{
	SetDraw(c_black, fa_center, fa_top, 1);
	draw_rectangle(w*3/4, 0, w/4, h/6, false);
}

SetDraw(c_gray, fa_center, fa_top, 1);
draw_text(w*0.5, 10, msg);
SetDraw(c_white, fa_center, fa_top, 1);
draw_text(w*0.5, 11, msg);