function CollisionAtTarget(target_x, target_y)
{
	var entity_list = ds_list_create();
	var entity_count = instance_position_list(target_x, target_y, pEntity, entity_list, false);
	var collision_at_target = false;

	while (entity_count > 0)
	{
		var entity_check = entity_list[| 0]; // find list value
		if (entity_check.entityCollision && entity_check != id)
		{
			collision_at_target = true;
			break;
		}
		ds_list_delete(entity_list, 0);
		entity_count--;
	}

	ds_list_clear(entity_list);

	return collision_at_target || tilemap_get_at_pixel(
			layer_tilemap_get_id(layer_get_id("Solid")), target_x, target_y);
}