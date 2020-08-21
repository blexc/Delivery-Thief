// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ExitMinigame(minigame, did_win)
{
	room_goto(rMain);
	room_persistent = false;
	
	if (did_win)
	{
		oGameManager.money += minigame.money_at_stake;
		oGameManager.alarm[0] = Sec2Frames(0.25); // kill enemy
	}
	else
	{
		oGameManager.money -= minigame.money_at_stake;
		oGameManager.money = max(0, oGameManager.money);
		oGameManager.cur_enemy_instance_id = -1;
	}
}