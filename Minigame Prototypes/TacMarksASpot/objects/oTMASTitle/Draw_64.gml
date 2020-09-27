
SetDraw(c_black, fa_center, fa_center, round(sin(time*2*pi/room_speed)));
var xx = display_get_gui_width()*0.5;
var yy = display_get_gui_height()*0.9;
draw_text(xx, yy, msg);