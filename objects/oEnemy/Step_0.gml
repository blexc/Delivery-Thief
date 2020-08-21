if (global.paused)
{
	alarm[0]++;
	alarm[1]++;	
	exit;
}

center_x = x + (sprite_get_bbox_right(sprite_index) / 2);
center_y = y + (sprite_get_bbox_bottom(sprite_index) / 2);

if (can_shoot &&
	collision_circle(center_x, center_y, projectile_range, oPlayer, 0, 1))
{
	alarm[0] = Sec2Frames(1.25);
	can_shoot = false;
}