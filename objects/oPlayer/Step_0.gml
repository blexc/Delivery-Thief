if (global.paused) exit;

// input
var up = 0, down = 0, left = 0, right = 0,
	interact = 0, move_x = 0, move_y = 0;

if (can_move)
{
	up = keyboard_check(global.k_up);
	down = keyboard_check(global.k_down);
	left = keyboard_check(global.k_left);
	right = keyboard_check(global.k_right);
	interact = keyboard_check_pressed(global.k_interact);
}

move_x = right - left;
move_y = down - up;
if (move_x != 0) move_y = 0;

center_x = x + (sprite_get_bbox_right(sprite_index) / 2);
center_y = y + (sprite_get_bbox_bottom(sprite_index) / 2);

#region movement
if (speed == 0 && (move_x != 0 || move_y != 0))
{
	target_x = x + (move_x * PIX);
	target_y = y + (move_y * PIX);
	look_x = move_x;
	look_y = move_y;
	speed = walk_sp;
}

if (point_distance(x, y, target_x, target_y) > 0 &&
	!place_meeting(target_x, target_y, pSolid))
{
	move_towards_point(target_x, target_y, speed);
}
else speed = 0;
#endregion

if (interact)
{
	var xx, yy;
	xx = x+look_x*PIX;
	yy = y+look_y*PIX;
	with(collision_rectangle(xx, yy, xx+PIX-1, yy+PIX-1, pCollectible, 0, 1))
	{
		AddToInventory(self, oInventory.items)
	}
}

// animations
image_alpha = (invunerable) ? 0.25 : 1;