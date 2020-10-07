depth = -bbox_bottom;

up = keyboard_check(global.k_up);
down = keyboard_check(global.k_down);
left = keyboard_check(global.k_left);
right = keyboard_check(global.k_right);
interact = keyboard_check_pressed(global.k_interact);

// indicate if near dirt in draw
if (place_meeting(x, y, oTMASDirt))
{
	near_dirt = true;	
}
else
{
	near_dirt = false;	
}

script_execute(state);

