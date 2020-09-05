if (keyboard_check(vk_escape)) game_end();
if (keyboard_check(vk_enter)) game_restart();

if (!game_started &&
	(keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_down)))
{
	alarm[1] = 1;
	if (game_difficulty == 3) alarm[2] = room_speed * 4;
	game_started = true;
}

if (game_over)
{
	msg = " ~~ SCORE ~~ " + "\n" + 
		  "O's Went Through: " + string(circles_went_through) + "\n" + 
		  "O's Missed: " + string(circles_missed) + "\n" + 
		  "O's Total: " + string(circles_spawned);
}
else if (game_ending)
{
	if (instance_exists(oCircle))
	{
		msg = "Collect what you can!";
	}
	else if (oPlane.can_move)
	{
		msg = "Game Over!";
		oPlane.can_move = false;
		alarm[0] = room_speed * 1;
	}
}
else if (game_started)
{
	frames += 1;
	msg = "";
	if (time_limit_sec <= Frames2Sec(frames))
	{
		alarm[1] = -1;
		alarm[2] = -1;
		game_ending = true;
	}
}
else
{
	msg = "~~ Go through the O's ~~";
}


