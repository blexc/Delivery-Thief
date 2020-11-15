function RomanEvents(){
	with (instance_nearest(oPlayer.x, oPlayer.y, oRoman))
	{
		if (global.quest_complete)
		{
			NewTextBox("Thank You!");
		}
		else if (IsHolding(oFakeChessBoard, false))
		{
			NewTextBox("I don't want this. I want a real one!");
		}
		// if player has real chess board
		else if (IsHolding(oChessBoard, true))
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
	with (instance_nearest(oPlayer.x, oPlayer.y, oChessBoard))
	{
		if (IsHolding(oFakeChessBoard, true))
		{
			// swap chess board and fake chess board positions
			oInventory.item_held = self;
			AddToInventory(self, oInventory.items);
			NewTextBox("Carefully swapped fake chess board with the real chess board.");
		}
		else NewTextBox("You can't just take it!");	
	}
}

function DoorEvent()
{
	if (IsInInventory(oKey, false))
	{
		if (oPlayer.can_move)
		{
			oGameManager.spawner = spawner_num;
			oPlayer.can_move = false;
			SlideTransition(TRANS_MODE.GOTO, target);
		}
	}
	else NewTextBox("You need a key to enter.");
}