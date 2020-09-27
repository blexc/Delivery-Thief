if (keyboard_check_pressed(global.k_interact))
{
	room_goto_next();
}
time++;
if (time > 1000) time = 0;