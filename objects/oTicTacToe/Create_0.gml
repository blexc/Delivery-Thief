quarters_if_win = 2;
quarters_to_play = 1;

if (oGameManager.quarters < quarters_to_play)
{
	ExitMinigame(oTicTacToe, false);
}
else
{
	oGameManager.quarters -= quarters_to_play;
	InitTicTacToe();
	
	s = WIN_W/5; // size of squares
}

