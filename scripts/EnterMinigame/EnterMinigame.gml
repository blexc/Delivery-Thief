/// @description EnterMinigame(minigame_room, who_started_game)
/// @arg minigame_room
/// @arg who_started_game
function EnterMinigame(minigame_room, who_started_game)
{
	with (oGameManager)
	{
		last_room = room;
		cur_enemy_instance_id = who_started_game;
		last_room_pos_x = instance_nearest(x, y, oPlayer).x;
		last_room_pos_y = instance_nearest(x, y, oPlayer).y;
		
		spawner = 0;
	}

	room_set_persistent(room, true);
	SlideTransition(TRANS_MODE.GOTO, minigame_room);
}