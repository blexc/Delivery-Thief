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