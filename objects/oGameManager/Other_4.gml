if(layer_exists("Solid")) layer_set_visible("Solid", false);

if (room == rInit && alarm[0] == -1)
{
	alarm[0] = 15;
}
else if (ds_list_find_index(game_rooms, room) != -1)
{
	// entering game room
	room_persistent = false;

	if (cur_enemy_instance_id != -1)
	{
		if (defeated_enemy)
			cur_enemy_instance_id.state = EnemyStateIdle;
		else
			cur_enemy_instance_id.state = EnemyStateBackToWalk;	
		
		cur_enemy_instance_id = -1;
		defeated_enemy = false;
	}
	
	// create UI inventory, but don't display it
	instance_create_layer(0, 0, "Instances", oUIInventory);
	instance_deactivate_object(oUIInventory);
	
	// create and display game UI display it
	instance_create_layer(0, 0, "Instances", oUIGame);
	
	draw_set_font(fnText);
}