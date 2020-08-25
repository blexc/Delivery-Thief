/// @description CombineFromInventory(inventory, inst1, inst2, grid)
/// @arg inventory
/// @arg inst1
/// @arg inst2
/// @arg grid
// returns false if could not combine
function CombineFromInventory(inventory, inst1, inst2, grid){
	// try once
	var pair = string(inst1.object_index) + " " + string(inst2.object_index);
	var new_obj = ds_map_find_value(inventory.combinations, pair);
	
	// try fliping pair if first failed
	if (new_obj == undefined)
	{
		pair = string(inst2.object_index) + " " + string(inst1.object_index);
		new_obj = ds_map_find_value(inventory.combinations, pair);
	}
	
	// add resultant instect, remove original two instects
	if (new_obj != undefined)
	{
		RemoveFromInventory(inst1, inventory.items);
		RemoveFromInventory(inst2, inventory.items);
		var new_instance = instance_create_layer(0, 0, "Instances", new_obj);
		AddToInventory(new_instance, inventory.items);
		return true;
	}
	
	return false;
}