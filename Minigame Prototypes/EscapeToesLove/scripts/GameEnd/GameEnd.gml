// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GameEnd(_did_win){
	with (oGM)
	{
		game_over = true;
		did_win = _did_win;	
	}
}