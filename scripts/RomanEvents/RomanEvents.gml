// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function RomanEvents(){
	with (oRoman)
	{
		// if player has real chess board
		if (IsInInventory(oChessBoard, true) || global.quest_complete)
		{
			NewTextBox("Thank You!");
			global.quest_complete = true;
		}
		else
		{
			NewTextBox("Steal the Chess Board.", ["1:Okay", "2:No..."]);			
		}
	}
}