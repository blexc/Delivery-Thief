function GoToJail()
{
	with (oGameManager)
	{
		SlideTransition(TRANS_MODE.GOTO, rJail);
		cur_enemy_instance_id = -1;
	}
}