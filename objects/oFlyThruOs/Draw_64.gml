SetDraw(c_white, fa_center, fa_top, 1);
draw_text(w*0.5, 10, msg);
draw_set_color(c_black);
draw_text(w*0.5, 11, msg);

SetDraw(c_white, fa_right, fa_bottom, 1);
draw_text(w, h-1, Frames2Sec(frames));
draw_set_color(c_black);
draw_text(w, h, Frames2Sec(frames));