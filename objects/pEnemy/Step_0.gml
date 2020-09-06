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

script_execute(state);

var _old_sprite = sprite_index;
if (speed != 0)
{
	direction = point_direction(x, y, target_x, target_y);
	sprite_index = sprite_walk;
}
else sprite_index = sprite_idle;
if (_old_sprite != sprite_index) local_frame = 0;

Animate();





























