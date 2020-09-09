if (room == rInit)
{
	SlideTransition(TRANS_MODE.GOTO, r3Houses);
}
else if (ds_list_find_index(game_rooms, room) != -1)
{
	// entering game room
	Print("game room entered");
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
}