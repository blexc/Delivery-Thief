if (keyboard_check_pressed(vk_escape)) game_end();
if (keyboard_check_pressed(vk_enter)) room_restart();

// start game
if (!game_start)
{
	msg = "!! Escape Toes Love !!";
	if (keyboard_check_pressed(ord("C")))
	{
		game_start = true;
	}
}
else if (game_over)
{
	msg = (did_win) ? "You've escaped!" : "You accepted Toe's love?";
	if (instance_exists(oPlayer)) oPlayer.can_move = false;
	// if you press enter exit the minigame
}
