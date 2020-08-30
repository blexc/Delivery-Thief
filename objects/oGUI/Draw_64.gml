if (ds_list_find_index(oGameManager.game_rooms, room) == -1)
{
	exit;
}

SetDraw(c_white, fa_left, fa_center, 1);
draw_sprite(sQuarter, 0, 5, 5);
draw_text(20, 15, "x " + string(oGameManager.quarters));

if (global.paused)
{
	// draw the items
	var buf = 16;
	var sx = buf;
	var sy = buf;
	var ex = WIN_W-buf;
	var ey = WIN_H-(3*32)+buf;
	
	NineSliceBoxStretched(sTextBoxBg, sx, sy, ex, ey);
	
	for (var r=0; r < ds_grid_height(oInventory.items); r+=1)
	{
		for (var c=0; c < ds_grid_width(oInventory.items); c+=1)
		{
			var x1, y1, x2, y2;
			x1 = sx + buf + (c*s);
			x2 = x1+s;
			y1 = sy + buf + (r*s);
			y2 = y1+s;

			NineSliceBoxStretched(sTextBoxBg, x1, y1, x2, y2);
			
			if (r == row && c == col)
			{
				SetDraw(c_white, fa_left, fa_top, selected_alpha);
				draw_rectangle(x1+2, y1+2, x2-3, y2-3, false);
			}
			
			if (r == combine_r && c == combine_c)
			{
				SetDraw(c_green, fa_left, fa_top, selected_alpha);
				draw_rectangle(x1+2, y1+2, x2-3, y2-3, false);
			}
			
			var inst = ds_grid_get(oInventory.items, c, r);
			if (inst != noone)
			{
				draw_sprite_stretched(inst.sprite_index, 0, x1+3, y1+3, s-6, s-6);
			}
		}
	}

	// display name of object selected and its description
	sx = buf;
	sy = ey+buf;
	ex = WIN_W-buf;
	ey = WIN_H-buf;
	
	NineSliceBoxStretched(sTextBoxBg, sx, sy, ex, ey);
	
	var msg = "";
	var inst_selected = ds_grid_get(oInventory.items, col, row);
	if (inst_selected != noone) msg = inst_selected.title + "\n" + inst_selected.desc;
	
	SetDraw(c_white, fa_center, fa_top, 1);
	draw_text((sx+ex)/2, sy+8, msg);
}