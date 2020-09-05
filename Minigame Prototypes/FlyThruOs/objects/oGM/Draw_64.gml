draw_set_valign(fa_top);
draw_set_halign(fa_center);
draw_set_color(c_black);
draw_text(w*0.5, 10, msg);
draw_set_color(c_white);
draw_text(w*0.5, 11, msg);

draw_set_valign(fa_right);
draw_set_halign(fa_bottom);
draw_set_color(c_black);
draw_text(w, h-1, Frames2Sec(frames));
draw_set_color(c_white);
draw_text(w, h, Frames2Sec(frames));