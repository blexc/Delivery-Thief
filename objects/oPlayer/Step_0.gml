/// @description move
var _horizontal = 0, _vertical = 0;

if (can_move)
{
	_horizontal = input_right() - input_left();
	_vertical	= input_down() - input_up();
	if (_horizontal != 0) _vertical = 0;
}

if (!moving)
{
	// check for input
	if (_horizontal != 0 || _vertical != 0)
	{
		xtarget = x + _horizontal * UNIT;
		ytarget = y + _vertical   * UNIT;
		moving = true;
	}
	
	// check for collision
	if (solid_at(xtarget, ytarget))
	{
		xtarget = x;
		ytarget = y;
		moving = false;
	}
}

if (moving)
{
	// move
	x = approach(x, xtarget, move_speed);
	y = approach(y, ytarget, move_speed);
	
	if (x == xtarget && y == ytarget) moving = false;
}