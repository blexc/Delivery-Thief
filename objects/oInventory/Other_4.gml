/// @desc replace object indexes with newly created instances

for (var r=0; r < ds_grid_height(items); r+=1)
{
	for (var c=0; c < ds_grid_width(items); c+=1)
	{
		var _obj = ds_grid_get(items, c, r);
		var _inst = noone;
		
		if (_obj != noone)
		{
			_inst = instance_create_layer(-100, -100, "Instances", _obj);
			instance_deactivate_object(_inst);
			ds_grid_set(items, c, r, _inst);
		}
		
		// reapply item held to be new instance
		if (_obj == item_held)
		{
			item_held = _inst;
			instance_activate_object(_inst);
		}
	}
}