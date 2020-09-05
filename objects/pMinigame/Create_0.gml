if (oGameManager.quarters < quarters_to_play)
{
	GoToJail();
	exit;
}
else
{
	oGameManager.quarters -= quarters_to_play;
	game_difficulty = oGameManager.cur_enemy_minigame_difficulty;
}