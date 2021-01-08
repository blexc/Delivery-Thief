function solid_at(_xtarget, _ytarget)
{
	return  tilemap_get_at_pixel(
			layer_tilemap_get_id(layer_get_id("Solid")), _xtarget, _ytarget);
}