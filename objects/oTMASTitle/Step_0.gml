if (keyboard_check_pressed(global.k_interact))
{
	room_goto(rTMAS);
}
time++;
if (time >= 1000) time = 0;