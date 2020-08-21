/// @description CombineFromInventory(inventory, instance1, instance2, grid)
/// @arg inventory
/// @arg instance1
/// @arg instance2
/// @arg grid
// returns false if could not combine
function CombineFromInventory(inventory, instance1, instance2, grid){
	// try once
	var pair = string(instance1.object_index) + " " + string(instance2.object_index);
	var new_obj = ds_map_find_value(inventory.combinations, pair);
	
	// try fliping pair if first failed
	if (new_obj == undefined)
	{
		pair = string(instance2.object_index) + " " + string(instance1.object_index);
		new_obj = ds_map_find_value(inventory.combinations, pair);
	}
	
	// add resultant object, remove original two objects
	if (new_obj != undefined)
	{
		RemoveFromInventory(instance1, inventory.items);
		RemoveFromInventory(instance2, inventory.items);
		var new_instance = instance_create_layer(0, 0, "Inventory", new_obj);
		AddToInventory(new_instance, inventory.items);
		return true;
	}
	
	return false;
}