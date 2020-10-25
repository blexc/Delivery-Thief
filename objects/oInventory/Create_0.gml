/// @desc inventory

// set up item grid
items = ds_grid_create(6, 3);
for (var r=0; r < ds_grid_height(items); r+=1)
{
	for (var c=0; c < ds_grid_width(items); c+=1)
	{
		ds_grid_add(items, c, r, noone);
	}
}

// setup combination map of string
combinations = ds_map_create();
AddCombination(combinations, oCloth, oRustyChessPieces, oChessPieces);
AddCombination(combinations, oChessPieces, oBoard, oFakeChessBoard);

// initial item (for debug), noone by default
var _obj = oFakeChessBoard;
ds_grid_set(items, 0, 0, _obj);
item_held = _obj; // current item held (and to iteract with)

