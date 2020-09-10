var up, down, left, right, interact;
up = keyboard_check(global.k_up);
down = keyboard_check(global.k_down);
left = keyboard_check(global.k_left);
right = keyboard_check(global.k_right);
interact = keyboard_check_pressed(global.k_interact);

var move_x = right - left;
var move_y = down - up;

hsp = move_x * walk_sp;
vsp = move_y * walk_sp;

if (place_meeting(x+hsp, y, oTMASWater))
{
	while(!place_meeting(x+sign(hsp), y, oTMASWater))
	{
		x+=sign(hsp);
	}
	hsp = 0;
}

if (place_meeting(x, y+vsp, oTMASWater))
{
	while(!place_meeting(x, y+sign(vsp), oTMASWater))
	{
		y+=sign(vsp);
	}
	vsp = 0;
}

x+=hsp;
y+=vsp;
