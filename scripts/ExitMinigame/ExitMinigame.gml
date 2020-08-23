/// @description ExitMinigame(minigame, did_win)
/// @arg minigame
/// @arg did_win
function ExitMinigame(minigame, did_win)
{
	with (oGameManager)
	{
		SlideTransition(TRANS_MODE.GOTO, last_room);
		room_set_persistent(last_room, false);
		
		room_instance_add(last_room, last_room_pos_x, last_room_pos_y, oPlayer);
		last_room_pos_x = -1;
		last_room_pos_y = -1;
	
		if (did_win)
		{
			quarters += minigame.quarters_if_win;
			alarm[0] = 1; // kill enemy
		}
		else
		{
			cur_enemy_instance_id = -1;
		}		
	}
}