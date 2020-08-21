/// @description EnterMinigame(room)
/// @arg room
function EnterMinigame(room, who_started_game)
{
	oGameManager.cur_enemy_instance_id = who_started_game;
	room_persistent = true;
	room_goto(room);
}
