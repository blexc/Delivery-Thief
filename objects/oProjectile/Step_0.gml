if (global.paused)
{
	speed = 0
	alarm[0]++;
	exit;
}
else
{
	speed = _speed;
}

direction = point_direction(xstart, ystart, px, py);
image_angle = direction;

// trigger minigame
if (place_meeting(x, y, oPlayer) && !oPlayer.invunerable)
{
	EnterMinigame(rTicTacToe, who_shot_me);
	instance_destroy();
}