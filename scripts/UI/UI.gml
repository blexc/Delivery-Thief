
function HideInventory(){
	// show game and hide inventory UI
	instance_activate_object(oUIGame);
	if (instance_exists(oText))
	{
		instance_destroy(oText);
		oPlayer.can_move = true;
	}
	instance_deactivate_object(oUIInventory);
}

function ShowInventory(){
	// hide game and show inventory UI
	instance_deactivate_object(oUIGame);	
	instance_activate_object(oUIInventory);
	oUIInventory.my_textbox = NewTextBox("", undefined, true);
}