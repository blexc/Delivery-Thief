switch (oFlyThruOs.game_difficulty)
{
	case 1: speed = 2; break;
	case 2: speed = 3; break;
	case 3: speed = 4; break;
}

direction = 180;
image_index = 0;
image_speed = 0;
vsp = 0;
moved = false;
went_through_already = false;

oFlyThruOs.circles_spawned++;