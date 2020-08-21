/// @description EnterMinigame(minigame_room, who_started_game)
/// @arg minigame_room
/// @arg who_started_game
function EnterMinigame(minigame_room, who_started_game)
{
	oGameManager.last_room = room;
	oGameManager.cur_enemy_instance_id = who_started_game;
	room_persistent = true;
	room_goto(minigame_room);
}