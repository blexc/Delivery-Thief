/// @desc inventory

// set up item grid
items = ds_grid_create(4, 4);
for (var r=0; r < ds_grid_height(items); r+=1)
{
	for (var c=0; c < ds_grid_width(items); c+=1)
	{
		ds_grid_add(items, c, r, noone);
	}
}
layer_set_visible(layer_get_id("Inventory"), false);

// setup combination map of string
combinations = ds_map_create();
AddCombination(oCloth, oRustyChessPieces, oChessPieces);
AddCombination(oChessPieces, oBoard, oFakeChessBoard);


