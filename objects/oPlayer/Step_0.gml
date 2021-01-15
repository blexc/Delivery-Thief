/// @description move


if (can_move)
{
	horizontal	= input_right() - input_left();
	vertical	= input_down()	- input_up();
	//if (_horizontal != 0) _vertical = 0;
}
else
{
	horizontal	= 0;
	vertical	= 0;
}

player_move();

xcenter = x + UNIT / 2;
ycenter = y + UNIT / 2;