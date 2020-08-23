/// @description EnterMinigame(minigame_room, who_started_game)
/// @arg minigame_room
/// @arg who_started_game
function EnterMinigame(minigame_room, who_started_game)
{
	with (oGameManager)
	{
		last_room = room;
		cur_enemy_instance_id = who_started_game;
		
		spawner = 0;
	}

	room_persistent = true;
	SlideTransition(TRANS_MODE.GOTO, minigame_room);
}