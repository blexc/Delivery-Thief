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