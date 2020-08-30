function RomanEvents(){
	with (oRoman)
	{
		if (global.quest_complete)
		{
			NewTextBox("Thank You!");
		}
		// if player has real chess board
		else if (IsInInventory(oChessBoard, true))
		{
			NewTextBox("Thank You!");
			oGameManager.quarters += 5;
			global.quest_complete = true;
		}
		else
		{
			NewTextBox("Steal the Chess Board.", ["1:Okay", "2:No..."]);			
		}
	}
}