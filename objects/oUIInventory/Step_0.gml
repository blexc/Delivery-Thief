/// @description oUIInventory Step

up = keyboard_check_pressed(global.k_up);
down = keyboard_check_pressed(global.k_down);
left = keyboard_check_pressed(global.k_left);
right = keyboard_check_pressed(global.k_right);
menu = keyboard_check_pressed(global.k_menu);
interact = keyboard_check_pressed(global.k_interact);
move_x = right - left;
move_y = down - up;

var _old_col = col; var _old_row = row;
col = clamp(col+move_x, 0, ds_grid_width(oInventory.items)-1);
row = clamp(row+move_y, 0, ds_grid_height(oInventory.items)-1);

if (_old_col != col || _old_row != row)
{
	// change textbox to have name of object + description
	var msg = "";
	var inst_selected = ds_grid_get(oInventory.items, col, row);
	if (inst_selected != noone) msg = inst_selected.title + "\n" + inst_selected.desc;

	ModifyTextBox(my_textbox, msg);	
}

selected_alpha = (interact) ? selected_alpha_pressed : selected_alpha_normal;
	
if (interact && combine_c == col && combine_r == row)
{
	combine_c = -1;
	combine_r = -1;
}
else if (interact && ds_grid_get(oInventory.items, col, row) != noone)
{
	// TODO ask what you want to do with the item
	// 1 combine with something
	// 2 hold (outside of pause to interact)
	// 3 nothing
		
	/*
	with (instance_create_layer(x, y, "Instances", oText))
	{
		msg = "What would you like to do?\n" +
				"1 Combine\n" +
				"2 Hold\n" +
				"3 Nothing\n";
	}
	*/
		
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
