msg = "";

// start game
if (!game_start)
{
	msg = "!! Escape Toes Love !!";
	if (keyboard_check_pressed(global.k_interact))
	{
		game_start = true;
	}
}
else if (game_over)
{
	msg = (did_win) ? "You've escaped!" : "You accepted Toe's love?";
	if (instance_exists(oETLPlayer)) oETLPlayer.can_move = false;
	if (keyboard_check_pressed(global.k_interact)) ExitMinigame(quarters_if_win, did_win);
}
