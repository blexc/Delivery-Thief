if (global.paused)
{
	alarm[0]++;
	alarm[1]++;	
	speed = 0;
	exit;
}

switch (Deg2Cardinal(direction))
{
	case 0: // right
		Print("right");
		look_x = 1; look_y = 0;
		break;
	case 1: // up
		Print("up");
		look_x = 0; look_y = 1;
		break;
	case 2: // left
		Print("left");
		look_x = -1; look_y = 0;
		break;
	case 3: // down
		Print("down");
		look_x = 0; look_y = -1;
		break;
}

center_x = x + (sprite_get_bbox_right(sprite_index) / 2);
center_y = y + (sprite_get_bbox_bottom(sprite_index) / 2);
end_sight_x = center_x + (look_x * sight_length);
end_sight_y = center_y + (-look_y * sight_length);

// if you're not moving and you're supposed to
if (speed == 0 && array_length(enemyTargetInstances) > 0 &&
	!stop_at_target)
{
	target_index++;
	if (target_index < array_length(enemyTargetInstances))
	{
		target_x = enemyTargetInstances[target_index].x;
		target_y = enemyTargetInstances[target_index].y;
	}
	else
	{
		target_index = -1;
		target_x = xstart;
		target_y = ystart;
	}
	speed = enemySpeed;
}

if (point_distance(x, y, target_x, target_y) > 0)
{
	move_towards_point(target_x, target_y, speed);
}
else speed = 0;

// update sprite index
var _old_sprite = sprite_index;
if (speed != 0)
{
	direction = point_direction(x, y, target_x, target_y);
	sprite_index = sprite_walk;
}
else sprite_index = sprite_idle;
if (_old_sprite != sprite_index) local_frame = 0;

EnemyAnimate();

with (collision_line(center_x, center_y, end_sight_x, end_sight_y, oPlayer, 0, 1))
{
	if (point_distance(x, y, target_x, target_y) <= 0)
	{
		// walk up to the player
		// freeze the player
		// TODO make the player face the 
		// TODO dialogue
		other.stop_at_target = true;
		other.target_x = x;
		other.target_y = y;
		look_x = -other.look_x;
		look_y = -other.look_y;
		can_move = false;

		if (other.x == x && other.y == y)
		{
			EnterMinigame(rTicTacToe, other.id);
		}
	}
}





























