if (oPlayer.can_move)
{
	oGameManager.spawner = spawner_num;
	oPlayer.can_move = false;
	SlideTransition(TRANS_MODE.GOTO, target);
}