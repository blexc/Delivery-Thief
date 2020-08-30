// input
var up = 0, down = 0, left = 0, right = 0,
	interact = 0, move_x = 0, move_y = 0;

if (can_move && !global.paused)
{
	up = keyboard_check(global.k_up);
	down = keyboard_check(global.k_down);
	left = keyboard_check(global.k_left);
	right = keyboard_check(global.k_right);
	interact = keyboard_check_pressed(global.k_interact);
}

move_x = right - left;
move_y = down - up;
if (move_x != 0) move_y = 0;

center_x = x + (sprite_get_bbox_right(sprite_index) / 2);
center_y = y + (sprite_get_bbox_bottom(sprite_index) / 2);

#region movement and collision

if (point_distance(x, y, target_x, target_y) > 0 &&
	!CollisionAtTarget(target_x, target_y))
{
	move_towards_point(target_x, target_y, speed);
}
else speed = 0;

if (speed == 0 && (move_x != 0 || move_y != 0))
{
	target_x = x + (move_x * PIX);
	target_y = y + (move_y * PIX);
	look_x = move_x;
	look_y = move_y;

	if (point_distance(x, y, target_x, target_y) > 0 &&
		!CollisionAtTarget(target_x, target_y))
	{
		speed = walk_sp;
		move_towards_point(target_x, target_y, speed);
	}
}

#endregion

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

// animations
image_alpha = (invunerable) ? 0.25 : 1;
depth = -bbox_bottom;

































