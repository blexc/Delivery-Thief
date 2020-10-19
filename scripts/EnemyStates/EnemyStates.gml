function EnemyStateIdle()
{
	x = target_x;
	y = target_y;
	speed = 0;
}

function EnemyStateWalk()
{
	// update target to be the next waypoint
	if (speed == 0 && array_length(enemyTargetInstances) > 0)
	{
		target_index++;
		if (target_index >= 0 && target_index < array_length(enemyTargetInstances))
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
		move_towards_point(target_x, target_y, speed);
	else speed = 0;

	// seek the player
	if (PlayerInSight() && !oPlayer.invunerable)
	{
		with (oPlayer) can_move = false;
		sees_player = true;
		speed = 0;
		state = EnemyStateCaughtPlayer;
	}
}

function EnemyStateCaughtPlayer()
{
	if (oPlayer.speed == 0 && sees_player)
	{
		with (oPlayer)
		{
			direction = point_direction(x, y, other.x, other.y);
			look_x = -other.look_x; look_y = -other.look_y;		
		}
		
		speed = enemySpeed;
		sees_player = false;
		target_x = oPlayer.x - look_x * PIX;
		target_y = oPlayer.y + look_y * PIX;
	}
	else if (sees_player)
	{
		// do nothing	
	}
	else if (point_distance(x, y, target_x, target_y) > 0)
	{
		move_towards_point(target_x, target_y, speed);
	}
	else
	{
		EnterMinigame(enemyMinigameRoom, id);
		state = EnemyStateIdle;	
	}
}

function EnemyStateBackToWalk()
{
	if (target_index == -1)
	{
		target_x = xstart;
		target_y = ystart;
	}
	else
	{
		target_x = enemyTargetInstances[target_index].x;
		target_y = enemyTargetInstances[target_index].y;
	}

	if (point_distance(x, y, target_x, target_y) > 0)
	{
		speed = enemySpeed;
		move_towards_point(target_x, target_y, speed);
	}
	else
	{
		direction = enemyInitDir;
		speed = 0;
		state = EnemyStateWalk;	
	}
}

function PlayerInSight()
{
	for (var i=0; i <= sight_length; i+=16)
	{
		// if you hit the player before a wall then youve caught the player
		if (collision_point(x + (look_x * i), y + (-look_y * i), oPlayer, 0, 1))
			break;	
		
		wall_between = tilemap_get_at_pixel(layer_tilemap_get_id(
			layer_get_id("Solid")), x + (look_x * i), y + (-look_y * i));
		
		if (wall_between) return false;
	}
	
	for (var i=0; i <= sight_length; i+=1)
	{
		if (point_distance(oPlayer.target_x, oPlayer.target_y, x + (look_x * i), y + (-look_y * i)) == 0)
		{
			return true;
		}
	}
		
	return false;
}