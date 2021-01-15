function player_move()
{
	with (oPlayer)
	{
		xvelocity = horizontal * move_speed;
		yvelocity = vertical   * move_speed;
		
		// check for x collision
		if (solid_at(id, x + xvelocity, y))
		{
			while (!solid_at(id, x + sign(xvelocity), y)) x += sign(xvelocity);
			xvelocity = 0
		}
		x += xvelocity;
		
		// check for y collision
		if (solid_at(id, x, y + yvelocity))
		{
			while (!solid_at(id, x, y + sign(yvelocity))) y += sign(yvelocity);
			yvelocity = 0
		}
		y += yvelocity;
	}
}

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