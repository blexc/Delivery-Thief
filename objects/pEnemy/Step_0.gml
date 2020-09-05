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
		look_x = 1; look_y = 0;
		break;
	case 1: // up
		look_x = 0; look_y = 1;
		break;
	case 2: // left
		look_x = -1; look_y = 0;
		break;
	case 3: // down
		look_x = 0; look_y = -1;
		break;
}

center_x = x + (sprite_get_bbox_right(sprite_index) / 2);
center_y = y + (sprite_get_bbox_bottom(sprite_index) / 2);
end_sight_x = center_x + (look_x * sight_length);
end_sight_y = center_y + (-look_y * sight_length);

// if you're not moving and you're supposed to
if (speed == 0 && array_length(enemyTargetInstances) > 0 &&
	!caught_player)
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

// seek the player
if (!caught_player &&
    collision_line(center_x, center_y, end_sight_x, end_sight_y, oPlayer, 0, 1))
{
	// check to see if a wall is between the player and the enemy
	wall_between = false;
	for (var i=0; i <= sight_length; i+=16)
	{
		// if you hit the player before a wall then youve caught the player
		if (collision_point(x + (look_x * i), y + (-look_y * i), oPlayer, 0, 1))
			break;	
		
		wall_between = tilemap_get_at_pixel(layer_tilemap_get_id(
			layer_get_id("Solid")), x + (look_x * i), y + (-look_y * i));
		
		if (wall_between) break;
	}

	with (oPlayer)
	{
		if (!invunerable && !other.wall_between &&
			point_distance(x, y, target_x, target_y) <= 0)
		{
			// TODO dialogue
			other.caught_player = true;
			other.target_x = x;
			other.target_y = y;
			look_x = -other.look_x;
			look_y = -other.look_y;
			can_move = false;
			direction = point_direction(x, y, other.x, other.y);
		}
	}
}

if (caught_player && point_distance(x, y, oPlayer.x, oPlayer.y) <= 0)
{
	EnterMinigame(enemyMinigameRoom, id);
	caught_player = false;
}

#region animations
var _old_sprite = sprite_index;
if (speed != 0)
{
	direction = point_direction(x, y, target_x, target_y);
	sprite_index = sprite_walk;
}
else sprite_index = sprite_idle;
if (_old_sprite != sprite_index) local_frame = 0;

Animate();
#endregion





























