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

function ChessBoardEvents()
{
	with (oChessBoard) // TODO THIS IS BEING CALLED TWICE BC THERES TWO CHESSBOARDS IN A SCENE...
	{
		if (IsHolding(oFakeChessBoard, true))
		{
			// swap chess board and fake chess board positions
			oInventory.item_held = self;
			AddToInventory(self, oInventory.items);
			NewTextBox("Carefully swapped fake chess board with the real chess board.");
		}
		else
		{
			NewTextBox("You can't just take it!");	
		}
	}
}