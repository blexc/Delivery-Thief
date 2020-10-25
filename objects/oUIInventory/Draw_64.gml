/// @description oUIInventory DrawGUI

// draw the items
var sx = buf;
var sy = buf;
var ex = display_get_gui_width() - buf;
var ey = display_get_gui_height()-(2*32)+buf;
	
NineSliceBoxStretched(sTextBoxBg, sx, sy, ex, ey);
	
var center_x = (ex+sx) * 0.5;
var center_y = (ey+sy) * 0.5;
var inv_width = ds_grid_width(oInventory.items);
var inv_height = ds_grid_height(oInventory.items);
	
for (var r=inv_height-1; r >= 0; r-=1)
{
	for (var c=inv_width-1; c >= 0; c-=1)
	{
		// draw elements in the inventory relative to the center of the sx, sy, ex, ey box
		var x1, y1, x2, y2;
		x1 = center_x - (s*0.5) + ((c - ((inv_width - 1) * 0.5)) * s);
		x2 = x1+s;
		y1 = center_y - (s*0.5) + ((r - ((inv_height - 1) * 0.5)) * s);
		y2 = y1+s;

		NineSliceBoxStretched(sTextBoxBg, x1, y1, x2, y2);
			
		// change alpha of selected
		if (r == row && c == col)
		{
			SetDraw(c_white, fa_left, fa_top, selected_alpha);
			draw_rectangle(x1+2, y1+2, x2-3, y2-3, false);
		}
			
		// change hue of thing we're combining
		if (r == combine_r && c == combine_c)
		{
			SetDraw(c_green, fa_left, fa_top, selected_alpha);
			draw_rectangle(x1+2, y1+2, x2-3, y2-3, false);
		}
			
		// draw sprite of objects in inventory
		var inst = ds_grid_get(oInventory.items, c, r);
		if (inst != noone)
			draw_sprite_stretched(inst.sprite_index, 0, x1+3, y1+3, s-6, s-6);
	}
}
draw_set_alpha(1);
