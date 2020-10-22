function DialogueResponses(_responses){
	switch(_responses)
	{
		case 0: break;
		case 1: NewTextBox("Bring it to me when you have it."); break;
		case 2: NewTextBox("Fine then!"); break;
		case 3: 
			with (oUIInventory)
			{
				instance_destroy(my_textbox);
				my_textbox = NewTextBox("Select another object to combine with.", undefined, true);
				choosing_option = false;
				combine_c = col;
				combine_r = row;
			}
			break;
		case 4: 
			with (oUIInventory)
			{
				instance_destroy(my_textbox);
				my_textbox = NewTextBox("Selected.", undefined, true); 
				choosing_option = false;
				alarm[0] = Sec2Frames(1.5);
			}
			oInventory.item_held = ds_grid_get(oInventory.items, col, row);
			break;
		case 5: 
			with (oUIInventory)
			{
				instance_destroy(my_textbox);
				my_textbox = NewTextBox("", undefined, true); 
				choosing_option = false;
			}
			break;
		default: debug("error: something went wrong in dialogue responses"); break;
	}
}