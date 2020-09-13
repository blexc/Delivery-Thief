SetDraw(c_white, fa_center, fa_top, 1);
draw_text(display_get_gui_width()/2, 7, msg);

SetDraw(c_black, fa_center, fa_top, 1);
draw_text(display_get_gui_width()/2, 8, msg);

SetDraw(c_black, fa_left, fa_top, 1);
draw_text(5, 5, string(percent));

SetDraw(c_black, fa_left, fa_top, percent);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

draw_set_alpha(1);