if (ds_list_find_index(oGameManager.game_rooms, room) == -1)
	exit;


SetDraw(c_white, fa_left, fa_center, 1);
draw_sprite(sQuarter, 0, 5, 5);
draw_text(20, 15, "x " + string(oGameManager.quarters));

if (global.paused)
{
	// draw the items

	var sx = buf;
	var sy = buf;
	var ex = WIN_W-buf;
	var ey = WIN_H-(2*32)+buf;
	
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

	// display name of object selected and its description using textbox size
	//sx = buf;
	//sy = ey+buf;
	//ex = WIN_W-buf;
	//ey = WIN_H-buf;
	
	NineSliceBoxStretched(sTextBoxBg, tb_x1, tb_y1, tb_x2, tb_y2);
	
	var msg = "";
	var inst_selected = ds_grid_get(oInventory.items, col, row);
	if (inst_selected != noone) msg = inst_selected.title + "\n" + inst_selected.desc;
	
	SetDraw(c_white, fa_center, fa_top, 1);
	draw_text((tb_x1+tb_x2)/2, tb_y1 +8, msg);
}