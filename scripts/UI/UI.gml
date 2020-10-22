function HideInventory(){
	// PLAY THE GAME and hide inventory UI
	instance_activate_object(oUIGame);
	if (instance_exists(oText))
	{
		instance_destroy(oText);
		oPlayer.can_move = true;
	}
	with (oUIInventory)
	{
		choosing_option = false;
	}
	instance_deactivate_object(oUIInventory);
}

function ShowInventory(){
	// hide game and show inventory UI
	instance_deactivate_object(oUIGame);
	instance_activate_object(oUIInventory);
	with (oUIInventory)
	{
		// reset position and textbox
		col = -1;
		row = -1;
		choosing_option = false;
		my_textbox = NewTextBox("", undefined, true);
	}
}