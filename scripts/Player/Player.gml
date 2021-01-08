function player_freeze()
{
	with (oPlayer)
	{
		can_move = false;	
	}
}

function player_unfreeze()
{
	with (oPlayer)
	{
		can_move = true;	
	}
}