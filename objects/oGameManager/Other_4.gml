
if (room == rInit)
{
	SlideTransition(TRANS_MODE.GOTO, r3Houses);
}
else if (ds_list_find_index(game_rooms, room) != -1)
{
	// entering game room
	Print("game room entered");
}
else if (ds_list_find_index(minigame_rooms, room) != -1)
{
	// entering minigame room
	Print("minigame room entered");
}
