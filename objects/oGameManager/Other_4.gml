if (room == rInit)
{
	SlideTransition(TRANS_MODE.GOTO, r3Houses);
}
else if (ds_list_find_index(game_rooms, room) != -1)
{
	// entering game room
	Print("game room entered");
	room_persistent = false;
	
	// if there is an enemy to kill
	if (cur_enemy_instance_id != -1)
	{
		instance_destroy(cur_enemy_instance_id);
		cur_enemy_instance_id = -1;
	}
}
else if (ds_list_find_index(minigame_rooms, room) != -1)
{
	// entering minigame room
	Print("minigame room entered");
}
