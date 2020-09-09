// TODO make toe move towards the y-axis of player more
if (!oETL.game_over && oETL.game_start)
{
	var distance_from_player = distance_to_object(oETLPlayer);
	speed = (distance_from_player > 32) ? speed_far : speed_close;
	direction = point_direction(x, y, oETLPlayer.x, oETLPlayer.y);
}
else speed = 0;