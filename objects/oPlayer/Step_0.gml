if (keyboard_check_pressed(vk_escape))
	game_end();
	
// if you're not talking to somebody... pause
if (keyboard_check_pressed(global.k_menu) && can_move)
	global.paused = !global.paused;

if (global.paused)
{
	speed = 0;
	exit;
}


if (can_move)
{
	up = keyboard_check(global.k_up);
	down = keyboard_check(global.k_down);
	left = keyboard_check(global.k_left);
	right = keyboard_check(global.k_right);
	interact = keyboard_check_pressed(global.k_interact);
	move_x = right - left;
	move_y = down - up;
	if (move_x != 0) move_y = 0;
}
else
{
	up = 0;
	down = 0;
	left = 0;
	right = 0;
	interact = 0;
	move_x = 0;
	move_y = 0;
}

center_x = x + (sprite_get_bbox_right(sprite_index) / 2);
center_y = y + (sprite_get_bbox_bottom(sprite_index) / 2);

script_execute(state);

// animations
image_alpha = (invunerable) ? 0.25 : 1;
depth = -bbox_bottom;

var _old_sprite = sprite_index;
sprite_index = (speed == 0) ? sprite_idle : sprite_walk;
if (_old_sprite != sprite_index) local_frame = 0;

Animate();

































