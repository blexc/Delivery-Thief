// oGUI DrawGUI

// quarter
SetDraw(c_white, fa_left, fa_center, 1);
draw_sprite(sQuarter, 0, x1+buf+buf, (y1+y2)*0.5);
draw_text(x1+(size*0.5)+buf, (y1+y2)*0.5, " x" + string(oGameManager.quarters));

// item held
var _xx = x1+(size*1.25)+buf;
if (oInventory.item_held != noone)
{
	draw_sprite_ext(oInventory.item_held.sprite_index, 0, _xx,
		((y1+y2)*0.5)-8, 1, 1, 0, c_white, 1);
}
