if (global.paused)
{
	var up, down, left, right, menu, interact, move_x, move_y;
	up = keyboard_check_pressed(global.k_up);
	down = keyboard_check_pressed(global.k_down);
	left = keyboard_check_pressed(global.k_left);
	right = keyboard_check_pressed(global.k_right);
	menu = keyboard_check_pressed(global.k_menu);
	interact = keyboard_check_pressed(global.k_interact);
	move_x = right - left;
	move_y = down - up;

	col = clamp(col+move_x, 0, ds_grid_width(oInventory.items)-1);
	row = clamp(row+move_y, 0, ds_grid_height(oInventory.items)-1);

	selected_alpha = (interact) ? selected_alpha_pressed : selected_alpha_normal;
	
	if (interact && combine_c == col && combine_r == row)
	{
		combine_c = -1;
		combine_r = -1;
	}
	else if (interact && ds_grid_get(oInventory.items, col, row) != noone)
	{
		if (combine_c != -1 && combine_r != -1)
		{
			CombineFromInventory(
				oInventory,
				ds_grid_get(oInventory.items, col, row),
				ds_grid_get(oInventory.items, combine_c, combine_r),
				oInventory.items);

			combine_c = -1;
			combine_r = -1;			
		}
		else
		{
			combine_c = col;
			combine_r = row;		
		}
	}
	
	alarm[0] = 1;
}



