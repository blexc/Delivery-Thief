/// @desc replace instances with object indexes

for (var r=0; r < ds_grid_height(items); r+=1)
{
	for (var c=0; c < ds_grid_width(items); c+=1)
	{
		var _inst = ds_grid_get(items, c, r);
		if (_inst != noone)
			ds_grid_set(items, c, r, _inst.object_index);
	}
}

if (item_held != noone)
	item_held = item_held.object_index;