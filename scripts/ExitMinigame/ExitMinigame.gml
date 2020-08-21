/// @description ExitMinigame(money_at_stake, did_win)
/// @arg money_at_stake
/// @arg did_win
function ExitMinigame(money_at_stake, did_win)
{
	room_goto(oGameManager.last_room);
	room_persistent = false;
	
	if (did_win)
	{
		oGameManager.money += money_at_stake;
		oGameManager.alarm[0] = Sec2Frames(0.25); // kill enemy
	}
	else
	{
		oGameManager.money -= money_at_stake;
		oGameManager.money = max(0, oGameManager.money);
		oGameManager.cur_enemy_instance_id = -1;
	}
}