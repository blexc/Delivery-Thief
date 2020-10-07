if (instance_exists(follow))
{
	target_x = follow.x;
	target_y = follow.y;
}

x += (target_x-x) / strength;
y += (target_y-y) / strength;

x = clamp(x, w_half, room_width-w_half);
y = clamp(y, h_half, room_height-h_half);

// screen shake
if (oTMAS.time_left % shake_interval >= shake_interval*0.8)
{
	x += random_range(-shake_remain, shake_remain);
	y += random_range(-shake_remain, shake_remain);
	shake_remain = max(0, shake_remain - shake_mag / shake_length);
}

camera_set_view_pos(cam, x-w_half, y-h_half);