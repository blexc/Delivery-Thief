var xx, yy;
do
{
	xx = irandom_range(16, room_width-16);
	yy = irandom_range(16, room_height-16);
	show_debug_message("sup");
}
until (!place_meeting(xx, yy, oTMASWater) &&
	   !place_meeting(xx, yy, oTMASPlayer));

x = xx;
y = yy;