/// @description move
var _horizontal = 0, _vertical = 0;

if (can_move)
{
	_horizontal = input_right() - input_left();
	_vertical	= input_down() - input_up();
	if (_horizontal != 0) _vertical = 0;
}

player_move(_horizontal, _vertical);

xcenter = x + UNIT / 2;
ycenter = y + UNIT / 2;
