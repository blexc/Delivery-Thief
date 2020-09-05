// TODO make toe move towards the y-axis of player more
if (!oGM.game_over && oGM.game_start)
{
	var distance_from_player = distance_to_object(oPlayer);
	speed = (distance_from_player > 32) ? speed_far : speed_close;
	direction = point_direction(x, y, oPlayer.x, oPlayer.y);
}
else speed = 0;