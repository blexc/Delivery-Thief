if (global.paused)
{
	layer_set_visible(layer_get_id("Inventory"), true);	
	
	var buf = 50;
	var sx = buf;
	var sy = buf;
	var ex = display_get_gui_width()-buf;
	var ey = display_get_gui_height()-buf;
	var w = ex-sx;
	var h = ey-sy;
	
	SetDraw(c_white, fa_left, fa_top, 1);
	draw_rectangle(sx, sy, ex, ey, true);
	
	SetDraw(c_black, fa_left, fa_top, 0.9);
	draw_rectangle(sx, sy, ex, ey, false);
	
	for (var r=0; r < ds_grid_height(oInventory.items); r+=1)
	{
		for (var c=0; c < ds_grid_width(oInventory.items); c+=1)
		{
			var x1, y1, x2, y2;
			x1 = w/2 + (c-1)*s - s/2;
			y1 = h/2 + (r-1)*s - s/2;
			x2 = w/2 + (c-1)*s + s/2 - 1;
			y2 = h/2 + (r-1)*s + s/2 - 1;
			SetDraw(c_white, fa_left, fa_top, 1);
			draw_rectangle(x1, y1, x2, y2, true);
			
			if (r == row && c == col)
			{
				SetDraw(c_white, fa_left, fa_top, selected_alpha);
				draw_rectangle(x1, y1, x2, y2, false);
			}
			
			if (r == combine_r && c == combine_c)
			{
				SetDraw(c_green, fa_left, fa_top, 0.8);
				draw_circle(x1+s/2, y1+s/2, s/2-1, false);
			}
			
			var obj = ds_grid_get(oInventory.items, c, r);
			if (obj != noone)
			{
				draw_sprite_stretched(obj.sprite_index, 0, x1, y1, s, s);
			}
		}
	}
	
	// display name of object selected and its description
	var msg = "";
	var obj_selected = ds_grid_get(oInventory.items, col, row);
	if (obj_selected != noone) msg = obj_selected.title + "\n" + obj_selected.desc;
	
	SetDraw(c_white, fa_center, fa_bottom, 1);
	draw_text(sx + w/2, ey-1, msg);
}