var esc = keyboard_check_pressed(vk_escape);
var enter = keyboard_check_pressed(vk_enter);

if (esc) game_end();
if (enter) game_restart();

if (keyboard_check_pressed(ord("F")) && keyboard_check(vk_control))
	window_set_fullscreen(!window_get_fullscreen());

#region transitions
if (screen_transition == FADE.OUT)
{
	percent+=0.025;
	if (percent == 1)
	{
		screen_transition = FADE.IN;
		if (!game_start)
		{
			game_start = true;
			with (oTMASCamera)
			{
				w_half = cam_zoomed_in_w * 0.5;
				h_half = cam_zoomed_in_h * 0.5;
				camera_set_view_size(cam, w_half * 2, h_half * 2);	
			}
			with (oTMASMark)
			{
				image_alpha = 0;	
			}
		}
		else
		{
			game_over = true;
			with (oTMASCamera)
			{
				w_half = cam_zoomed_out_w * 0.5;
				h_half = cam_zoomed_out_h * 0.5;
				camera_set_view_size(cam, w_half * 2, h_half * 2);	
			}
			with (oTMASMark)
			{
				image_alpha = 1;	
			}
		}
	}
	exit;
}
else if (screen_transition == FADE.IN)
{
	percent-=0.025;
	if (percent == 0) screen_transition = FADE.OFF;
	exit;
}
#endregion

#region game
// pre-game
if (!game_start)
{
	msg = "Tac Marks A Spot!\nFind and dig up the treasure\nbefore time runs out.";
	if (keyboard_check_pressed(global.k_interact))
	{
		screen_transition = FADE.OUT;
		msg = "";
	}
}
// in-game
else if (!game_over)
{
	msg = string(time_left / room_speed);
	time_left -= 1;
	if (time_left == 0)
	{
		screen_transition = FADE.OUT;
		did_win = false;
	}
}
// post-game
else
{
	msg = "Game Over!\n";
	msg += (did_win) ? "You win!" : "You lose.";
}
#endregion
