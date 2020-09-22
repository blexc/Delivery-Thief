var up, down, left, right, interact;

up = keyboard_check(global.k_up);
down = keyboard_check(global.k_down);
left = keyboard_check(global.k_left);
right = keyboard_check(global.k_right);
interact = keyboard_check_pressed(global.k_interact);

var move_x;
var move_y;

if (oTMAS.game_start && !oTMAS.game_over)
{
	move_x = right - left;
	move_y = down - up;
}
else
{
	move_x = 0;
	move_y = 0;
}

hsp = move_x * walk_sp;
vsp = move_y * walk_sp;

if (hsp != 0)
{
	if (tilemap_get_at_pixel(col_tilemap, round(bbox_right + hsp), bbox_bottom) == 0 &&
		tilemap_get_at_pixel(col_tilemap, round(bbox_left + hsp), bbox_bottom) == 0 &&
		tilemap_get_at_pixel(col_tilemap, round(bbox_right + hsp), bbox_top) == 0 &&
		tilemap_get_at_pixel(col_tilemap, round(bbox_left + hsp), bbox_top) == 0 )
	{
		x += hsp;
	}
	else
	{
		if (hsp > 0) {
			x = floor(x);
			x = x- ((bbox_right) mod 16) + 16-1;
		}
		else if (hsp < 0)
		{
			x = ceil(x);
			x = x -(bbox_left mod 16);
		}
		hsp = 0;
	}
}

if (vsp != 0)
{
	if (tilemap_get_at_pixel(col_tilemap, bbox_right, round(bbox_top + vsp)) == 0 &&
		tilemap_get_at_pixel(col_tilemap, bbox_right, round(bbox_bottom + vsp)) == 0 &&
		tilemap_get_at_pixel(col_tilemap, bbox_left, round(bbox_top + vsp)) == 0 &&
		tilemap_get_at_pixel(col_tilemap, bbox_left, round(bbox_bottom + vsp)) == 0 ) 
	{
		y += vsp;
	}
	else
	{
		if (vsp > 0)
		{
			y = floor(y);
			y = y - ((bbox_bottom) mod 16) + 16-1;
		}
		else if (vsp < 0)
		{
			y = ceil(y);
			y = y -(bbox_top mod 16);
		}
		vsp = 0;
	}
}


if (!oTMAS.game_over && interact)
{
	// finding the mark
	if (place_meeting(x, y, oTMASMark))
	{
		oTMAS.screen_transition = FADE.OUT;
		oTMAS.did_win = true;
	}
	else if (place_meeting(x, y, oTMASApple))
	{
		walk_sp *= 2;
		instance_destroy(instance_nearest(x, y, oTMASApple));
	}
}


























