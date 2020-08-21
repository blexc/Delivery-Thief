money_at_stake = irandom_range(400, 500);

// create the board
board = ds_grid_create(3, 3);
for (var r=0; r < 3; r++)
{
	for (var c=0; c < 3; c++)
	{
		ds_grid_set(board, c, r, "");		
	}
}

// game vars
player_choice = "X";
row = 0; column = 0;	// current row, column
turn = "X";
game_start = false;
draw = false;
game_over = false;

// drawing vars
s = room_width/5; // size