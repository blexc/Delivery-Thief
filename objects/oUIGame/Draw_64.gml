// oGUI DrawGUI

var item=0;
// quarter
SetDraw(c_white, fa_left, fa_center, 1);
draw_sprite(sQuarter, 0, PIX*item++, 0);
draw_text(PIX*item++, 0, " x" + string(oGameManager.quarters));

// item held
if (oInventory.item_held != noone)// && instance_exists(oInventory.item_held))
{
	draw_sprite(oInventory.item_held.sprite_index, 0, PIX*item++, 0);
}

/* debug prints
SetDraw(c_white, fa_right, fa_top, 1);
item = 0;
var msg;

msg = "monitor: " + string(global.monitor_w) + ", " + string(global.monitor_h);
draw_text(display_get_gui_width(), PIX*item++, msg);

msg = "monitor aspect: " + string(global.monitor_w/global.monitor_h);
draw_text(display_get_gui_width(), PIX*item++, msg);

msg = "game window: " + string(window_get_width()) + ", " + string(window_get_height());
draw_text(display_get_gui_width(), PIX*item++, msg);

msg = "game window aspect: " + string(oGameManager.RES_W/oGameManager.RES_H);
draw_text(display_get_gui_width(), PIX*item++, msg);
*/