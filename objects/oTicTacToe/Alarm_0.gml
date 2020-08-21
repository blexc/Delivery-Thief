/// @description computer's turn

do
{
	row = irandom_range(0, 2);
	column = irandom_range(0, 2);
}
until (ds_grid_get(board, column, row) == "");

ds_grid_set(board, column, row, turn);
turn = (turn == "X") ? "O": "X";

var state = TTTIsGameOver(board);
switch (state)
{
	case 0: break;
	case 1: game_over = true; break;
	case 2: draw = true; game_over = true; break;
}