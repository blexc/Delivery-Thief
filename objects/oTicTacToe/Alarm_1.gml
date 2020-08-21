/// @description check if game over

// returns a 0, 1, or 2
// 0 -> game continues
// 1 -> game over, someone won
// 2 -> game over, tie

var state = 0;

for (var i=0; i < 3; i++)
{
	if (ds_grid_get(board, i, 0) != "" &&
		ds_grid_get(board, i, 0) == ds_grid_get(board, i, 1) &&
		ds_grid_get(board, i, 0) == ds_grid_get(board, i, 2))
	{
		state = 1;
	}
	
	if (ds_grid_get(board, 0, i) != "" &&
		ds_grid_get(board, 0, i) == ds_grid_get(board, 1, i) &&
		ds_grid_get(board, 0, i) == ds_grid_get(board, 2, i))
	{
		state = 1;
	}
}

if (ds_grid_get(board, 1, 1) != "")
{
	if (ds_grid_get(board, 0, 0) == ds_grid_get(board, 1, 1) &&
		ds_grid_get(board, 0, 0) == ds_grid_get(board, 2, 2))
	{
		state = 1;
	}
	else if (ds_grid_get(board, 0, 2) == ds_grid_get(board, 1, 1) &&
		ds_grid_get(board, 0, 2) == ds_grid_get(board, 2, 0))
	{
		state = 1;
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

if (board_filled) state = 2;

switch (state)
{
	case 0: 
		if (turn != player_choice)
			alarm[0] = Sec2Frames(1);
		break;
	case 1: game_over = true; break;
	case 2: draw = true; game_over = true; break;
}