///@desc TTTIsGameOver(board)
///@arg board
function TTTIsGameOver(argument0) {

	// returns a 0, 1, or 2
	// 0 -> game continues
	// 1 -> game over, someone won
	// 2 -> game over, tie

	var board = argument0;

	for (var i=0; i < 3; i++)
	{
		if (ds_grid_get(board, i, 0) != "" &&
			ds_grid_get(board, i, 0) == ds_grid_get(board, i, 1) &&
			ds_grid_get(board, i, 0) == ds_grid_get(board, i, 2))
		{
			return 1;
		}
	
		if (ds_grid_get(board, 0, i) != "" &&
			ds_grid_get(board, 0, i) == ds_grid_get(board, 1, i) &&
			ds_grid_get(board, 0, i) == ds_grid_get(board, 2, i))
		{
			return 1;
		}
	}

	if (ds_grid_get(board, 1, 1) != "")
	{
		if (ds_grid_get(board, 0, 0) == ds_grid_get(board, 1, 1) &&
			ds_grid_get(board, 0, 0) == ds_grid_get(board, 2, 2))
		{
			return 1;
		}
		else if (ds_grid_get(board, 0, 2) == ds_grid_get(board, 1, 1) &&
			ds_grid_get(board, 0, 2) == ds_grid_get(board, 2, 0))
		{
			return 1;
		}
	}

	// check if tie
	var board_filled = true;
	for (var i=0; i < 3; i++)
	{
		for (var j=0; j < 3; j++)
		{
			if (ds_grid_get(board, i, j) == "")
			{
				board_filled = false;
				break;
			}
		}
	}

	if (board_filled) return 2;

	return 0;


}
