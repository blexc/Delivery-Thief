var up, down, move_y;

if (can_move)
{
	image_index = 0;
	up = keyboard_check(vk_up);
	down = keyboard_check(vk_down);
	move_y = down - up;
	vsp = move_y * move_sp; // TODO acceleration
	y += vsp;
}
else image_index = 1;

y = clamp(y, 16, room_height-32);
