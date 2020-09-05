/// @description ExitMinigame(quarters_if_win, did_win)
/// @arg quarters_if_win
/// @arg did_win
function ExitMinigame(quarters_if_win, did_win)
{
	with (oGameManager)
	{
		SlideTransition(TRANS_MODE.GOTO, last_room);
	
		if (did_win)
		{
			quarters += quarters_if_win;
		}
		else
		{
			cur_enemy_instance_id = -1;
		}		
	}
}