function solid_at_point(_x, _y)
{
	var _solid = layer_tilemap_get_id(layer_get_id("Solid"));
	return tilemap_get_at_pixel(_solid, _x, _y);
}

// given top right corner
function solid_at(_this, _x, _y)
{
	var _solid = layer_tilemap_get_id(layer_get_id("Solid"));
	with (_this)
	{
		var _top_left = tilemap_get_at_pixel(_solid, _x, _y);
		var _top_right = tilemap_get_at_pixel(_solid, _x + sprite_width - 1, _y);
		var _bottom_left = tilemap_get_at_pixel(_solid, _x, _y + sprite_height - 1);
		var _bottom_right = tilemap_get_at_pixel(_solid, _x + sprite_width - 1, _y + sprite_height - 1);
		
		return _top_left || _top_right || _bottom_left || _bottom_right; 
	}
}