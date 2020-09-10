if (instance_exists(follow))
{
	target_x = follow.x;
	target_y = follow.y;
}

x += (target_x-x);
y += (target_y-y);

x = clamp(x, w_half, room_width-w_half);
y = clamp(y, h_half, room_height-h_half);

camera_set_view_pos(cam,x-w_half,y-h_half);