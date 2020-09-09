switch (oGameManager.cur_enemy_minigame_difficulty)
{
	case 1: SlideTransition(TRANS_MODE.GOTO, rETL1); break;
	case 2: SlideTransition(TRANS_MODE.GOTO, rETL2); break;
	case 3: SlideTransition(TRANS_MODE.GOTO, rETL3); break;
}