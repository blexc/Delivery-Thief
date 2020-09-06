// add combination to map
function AddCombination(map, obj1, obj2, result){
	var pair = string(obj1) + " " + string(obj2);
	ds_map_add(map, pair, result);
}

/// @description AddToInventory(instance, grid)
/// @arg instance
/// @arg grid
// returns false if could not add to grid
function AddToInventory(instance, grid){
	for (var r=0; r < ds_grid_height(grid); r+=1)
	{
		for (var c=0; c < ds_grid_width(grid); c+=1)
		{
			var spot = ds_grid_get(grid, c, r);
			if (spot == noone)
			{
				ds_grid_set(grid, c, r, instance);
				instance_deactivate_object(instance);
				return true;
			}
		}
	}
	Print("warning: could not add to grid, too full!");
	return false;
}

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

function IsInInventory(_obj, _can_delete){
	with (oInventory)
	{
		for (var r=0; r < ds_grid_height(items); r+=1)
		{
			for (var c=0; c < ds_grid_width(items); c+=1)
			{
				var spot = ds_grid_get(items, c, r);
				if (spot != noone && spot.object_index == _obj)
				{
					if (_can_delete)
					{
						RemoveFromInventory(spot, items);	
					}
					return true;
				}
			}
		}
		return false;
	}
}

/// @description CombineFromInventory(object, grid)
/// @arg object
/// @arg grid
// returns false if could not find object
function RemoveFromInventory(object, grid){
	var w = ds_grid_width(grid);
	var h = ds_grid_height(grid);
	
	// find object and remove it
	var col = ds_grid_value_x(grid, 0, 0, w-1, h-1, object);
	var row = ds_grid_value_y(grid, 0, 0, w-1, h-1, object);
	
	if (col == -1 || row == -1) return false;

	instance_destroy(ds_grid_get(grid, col, row));
	ds_grid_set(grid, col, row, noone);
}