/// @description oUIInventory Step

if (!choosing_option)
{
	up = keyboard_check_pressed(global.k_up);
	down = keyboard_check_pressed(global.k_down);
	left = keyboard_check_pressed(global.k_left);
	right = keyboard_check_pressed(global.k_right);
	menu = keyboard_check_pressed(global.k_menu);
	interact = keyboard_check_pressed(global.k_interact);
}
else
{
	up = 0;
	down = 0;
	left = 0;
	right = 0;
	menu = 0;
	interact = 0;
}

move_x = right - left;
move_y = down - up;

var _old_col = col; var _old_row = row;
col = clamp(col+move_x, 0, ds_grid_width(oInventory.items)-1);
row = clamp(row+move_y, 0, ds_grid_height(oInventory.items)-1);
selected_alpha = (interact) ? selected_alpha_pressed : selected_alpha_normal;

// when you move your 'cursor'/selection in the grid
if (_old_col != col || _old_row != row)
{
	alarm[0] = -1; // cancel resetting text.
	var msg = "";
	var inst_selected = ds_grid_get(oInventory.items, col, row);
	if (inst_selected != noone) msg = inst_selected.title + "\n" + inst_selected.desc;

	instance_destroy(my_textbox);
	my_textbox = NewTextBox(msg, undefined, true);
}

// when you click on something in the grid...
if (interact) 
{
	alarm[0] = -1; // cancel resetting text.
	var _on_nothing = ds_grid_get(oInventory.items, col, row) == noone;
	
	// error checking
	if (combine_c == col && combine_r == row)
	{
		instance_destroy(my_textbox);
		my_textbox = NewTextBox("can't combine with itself!", undefined, true);
		combine_c = -1;
		combine_r = -1;
	}
	// combine with selected items
	else if (!_on_nothing && combine_c != -1 && combine_r != -1)
	{
		var _did_combine = CombineFromInventory(
			oInventory,
			ds_grid_get(oInventory.items, col, row),
			ds_grid_get(oInventory.items, combine_c, combine_r),
			oInventory.items);
		
		combine_c = -1;
		combine_r = -1;
		
		instance_destroy(my_textbox);
		var _msg = (_did_combine) ? "Combined." : "You can't combine those!";
		my_textbox = NewTextBox(_msg, undefined, true);
	}
	// ask what you want to do with the item
	else if (!_on_nothing)
	{
		choosing_option = true;
		msg = "What would you like to do?";
		var options = ["3:Combine", "4:Hold", "5:Nothing"];
		instance_destroy(my_textbox);
		my_textbox = NewTextBox(msg, options, false);
	}
}

