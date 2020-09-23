var x1_bar = 0; var y1_bar = 0;
var x2_bar = w; var y2_bar = h * 0.1;
var b = 8;

// black bar top
SetDraw(c_black, fa_left, fa_top, 1);
draw_rectangle(x1_bar, y1_bar, x2_bar, y2_bar, false);
SetDraw(c_white, fa_center, fa_center, 1);

// message
draw_text((x2_bar - x1_bar) * 0.5, y2_bar * 0.5, msg);

// timer bar
SetDraw(c_white, fa_left, fa_top, 1-percent);
var time_left_per = 1 - (time_limit-time_left) / time_limit;
var end_x = max(x1_bar+b, (x2_bar-b) * time_left_per);
draw_rectangle(x1_bar+b, y1_bar+b, end_x, y2_bar-b, false);

// fade in/out
SetDraw(c_black, fa_left, fa_top, percent);
draw_rectangle(0, 0, w, h, false);
draw_set_alpha(1);