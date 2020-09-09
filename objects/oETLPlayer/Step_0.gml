// fly to toe
if (oETL.game_over && !oETL.did_win)
{
	if (distance_to_object(oETLToe) < 1) speed = 0;
	else
	{
		speed = 1;
		direction = point_direction(x, y, oETLToe.x, oETLToe.y);
	}
}
// move normally
else
{
	var left, right, jump;

	if (can_move)
	{
		left = keyboard_check(global.k_left);
		right = keyboard_check(global.k_right);
		jump = keyboard_check_pressed(global.k_interact);
	}
	else
	{
		left = 0;
		right = 0;
		jump = 0;
	}
	
	move_x = right - left;
	hsp = move_x * walk_sp;
	vsp += grv;	

	if (jump && place_meeting(x, y+1, oETLBlock)) vsp = jump_sp;

	if (place_meeting(x+hsp, y, oETLBlock))
	{
		while(!place_meeting(x+sign(hsp), y, oETLBlock)) x+=sign(hsp);
		hsp = 0;
	}
	x += hsp;

	if (place_meeting(x, y+vsp, oETLBlock))
	{
		while(!place_meeting(x, y+sign(vsp), oETLBlock)) y+=sign(vsp);
		vsp = 0;
	}
	y += vsp;
}

switch (sprite_current)
{
	case sprite_idle:
		if (move_x == 1) image_index = 1;
		else if (move_x == -1) image_index = 0;
		break;
}

