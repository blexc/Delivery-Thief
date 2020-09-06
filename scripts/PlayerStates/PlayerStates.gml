function PlayerStateIdle()
{
	x = target_x; y = target_y;
	if (move_x != 0 || move_y != 0)
	{
		var tx = target_x + move_x * PIX;
		var ty = target_y + move_y * PIX;
		
		look_x = move_x; look_y = move_y;
		direction = point_direction(x, y, tx, ty);
		if (!CollisionAtTarget(tx, ty))
		{
			target_x = tx;
			target_y = ty;
			state = PlayerStateWalk;
		}
		else speed = 0;
	}
	else speed = 0;
	
	if (interact)
	{
		var xx, yy;
		xx = x+look_x*PIX;
		yy = y+look_y*PIX;
		activate = collision_rectangle(xx, yy, xx+PIX-1, yy+PIX-1, pEntity, 0, 1);
	
		if (activate == noone || activate.entityActivateScript == -1)
		{
			// do nothing
		}
		else
		{
			switch (array_length(activate.entityActivateArgs))
			{
				case 0:
					script_execute(activate.entityActivateScript);
					break;
				case 1:
					script_execute(activate.entityActivateScript, activate.entityActivateArgs[0]);
					break;
				case 2:
					script_execute(activate.entityActivateScript, activate.entityActivateArgs[0],
								   activate.entityActivateArgs[1]);
					break;
				case 3:
					script_execute(activate.entityActivateScript, activate.entityActivateArgs[0],
								   activate.entityActivateArgs[1], activate.entityActivateArgs[2]);
					break;
			}	
		}
	}
}

function PlayerStateWalk()
{
	if (point_distance(x, y, target_x, target_y) > 0)
	{
		speed = walk_sp;
		move_towards_point(target_x, target_y, speed);
	}
	else
	{
		state = PlayerStateIdle;
	}
}