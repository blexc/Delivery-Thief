if (x <= -48)
{
	if (!went_through_already) oGM.circles_missed++;		
	instance_destroy();
}

if (x < oPlane.x)
{
	layer = layer_get_id("Lower");
	if (!went_through_already) image_index = 2;
}

if (oGM.game_difficulty > 1 && !moved && x < room_width/2)
{
	alarm[0] = 1;
}

y += vsp;
y = clamp(y, 24, room_height-24);
