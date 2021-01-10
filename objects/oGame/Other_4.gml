/// @description Insert description here
for (var _x = 0; _x < room_width / UNIT; _x++)
{
	for (var _y = 0; _y < room_height / UNIT; _y++)
	{
		if (solid_at_point(_x * UNIT, _y * UNIT))
		{
			instance_create_layer(_x * UNIT, _y * UNIT, "Instances", oSolid);
		}
	}
}