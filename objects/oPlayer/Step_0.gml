if (global.paused) exit;

// input
var up, down, left, right, interact, dash, dash_released, move_x, move_y, spaces;
up = keyboard_check(global.k_up);
down = keyboard_check(global.k_down);
left = keyboard_check(global.k_left);
right = keyboard_check(global.k_right);

interact = keyboard_check_pressed(global.k_interact);
dash = keyboard_check(global.k_dash);
dash_released = keyboard_check_released(global.k_dash);
move_x = right - left;
move_y = down - up;
spaces = 1;

#region movement
// set initial target to move towards
if (!moving)
{
	orig_x = x;
	orig_y = y;

	if (move_x != 0)
	{
		looking_x = move_x;
		looking_y = 0;
		target_x = x + (move_x * PIX * spaces);
	}
	else if (move_y != 0)
	{
		looking_x = 0;
		looking_y = move_y;
		target_y = y + (move_y * PIX * spaces);
	}
}

// change target if dash
if (dash && can_dash && dash_key_let_go && (move_x != 0 || move_y != 0))
{
	can_dash = false;
	dash_key_let_go = false;
	alarm[0] = Sec2Frames(1);
	if (moving)
	{
		target_x += sign(vx) * PIX * dash_spaces;
		target_y += sign(vy) * PIX * dash_spaces;
	}
	else
	{
		target_x += move_x * PIX * dash_spaces;
		target_y += move_y * PIX * dash_spaces;
	}

}

if (dash_released) dash_key_let_go = true;	

// set speed if you're not where you're supposed to be
if (target_y != y || target_x != x)
{
	moving = true;
	vy = (target_y - orig_y) / walk_sp;
	vx = (target_x - orig_x) / walk_sp;
}

// you're going to pass the target, force player to target instead
if (sign(vx) * (x + vx - target_x) > 0)
{
	x = target_x;
	moving = false;
	vx = 0;
}
else if (sign(vy) * (y + vy - target_y) > 0)
{
	y = target_y;
	moving = false;
	vy = 0;
}

// collision
if (place_meeting(x, y+vy, pSolid))
{
	while (!place_meeting(x, y+sign(vy), pSolid)) y += sign(vy);
	moving = false;
	target_y = y;
	vy = 0;
}

if (place_meeting(x+vx, y, pSolid))
{
	while (!place_meeting(x+sign(vx), y, pSolid)) x += sign(vx);
	moving = false;
	target_x = x;
	vx = 0;
}

x += vx;
y += vy;

#endregion

if (interact && !moving)
{
	var xx, yy;
	xx = x+looking_x*PIX;
	yy = y+looking_y*PIX;
	with(collision_rectangle(xx, yy, xx+PIX-1, yy+PIX-1, pCollectible, 0, 1))
	{
		alarm[0] = 1;
	}
}