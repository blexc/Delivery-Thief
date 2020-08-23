/// @description ExitMinigame(minigame, did_win)
/// @arg minigame
/// @arg did_win
function ExitMinigame(minigame, did_win)
{
	with (oGameManager)
	{
		SlideTransition(TRANS_MODE.GOTO, last_room);
	
		if (did_win)
		{
			quarters += minigame.quarters_if_win;
		}
		else
		{
			cur_enemy_instance_id = -1;
		}		
	}
}