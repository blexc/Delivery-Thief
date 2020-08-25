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