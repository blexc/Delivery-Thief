/// @description update camera's destination

// (or whatever object)
if(instance_exists(follow))
{
	xToFollow = follow.x;
	yToFollow = follow.y;
}

// update position of camera
x += (xToFollow - x) / strength;
y += (yToFollow - y) / strength;

// prevent from viewing outside border of room
x = clamp(x, view_w_half, room_width-view_w_half);
y = clamp(y, view_h_half, room_height-view_h_half);

// update view of camera
camera_set_view_pos(VIEW, x-view_w_half,y-view_h_half);