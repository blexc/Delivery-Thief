var msg = (turn == player_choice) ? "player's" : "computer's";
msg += " turn";
var x1, y1, x2, y2;
var buf = 25;

if (!game_start) msg = "choose X or O";

for (var i=0; i < 2; i++)
{
	var choice = (i==0) ? "X": "O";
	x1 = i*(room_width-s);
	y1 = room_height-s;
	x2 = x1+s;
	y2 = room_height-1;

	// draw rectangles
	SetDraw((player_choice == choice) ? c_red : c_white, fa_left, fa_top, 1);
	draw_rectangle(x1, y1, x2, y2, true);
	
	// draw options X, or O
	SetDraw(c_white, fa_center, fa_center, 1);
	draw_text_ext(x1+s/2, y1-buf, choice, 0, 192);
	
	if (game_start)
	{
		draw_text_ext(x1+s/2, y1+s/2,
			(player_choice == choice) ? "player" : "computer", 0, s);
	}
}

for (var r=0; r < 3; r++)
{
	for (var c=0; c < 3; c++)
	{
		// draw rectangles
		SetDraw(c_white, fa_left, fa_top, 1);
		if (r == row && c == column) draw_set_color(c_red);
		
		x1 = room_width/2 + (c-1)*s - s/2;
		y1 = r*s;
		x2 = room_width/2 + (c-1)*s + s/2;
		y2 = s+(r*s)-1;
		draw_rectangle(x1+5, y1+5, x2-5, y2-5, true);

		// draw text
		SetDraw(c_white, fa_center, fa_center, 1);
		draw_text_ext(x1+s/2-1, y1+s/2-1, ds_grid_get(board, c, r), 0, s);
	}
}

if (game_over)
{
	if (draw) msg = "Game results\nin a tie.\nPress 'c'\nto play\nagain.";
	else if (turn != player_choice) msg = "You win!";
	else msg = "You lose.";
}

SetDraw(c_white, fa_center, fa_center, 1);
draw_text_ext(room_width/2, room_height - room_height/4, msg, 30, 192);