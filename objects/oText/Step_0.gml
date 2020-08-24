lerp_progress += (1-lerp_progress)/50;
text_progress += global.text_speed;

x1 = lerp(x1, x1_target, lerp_progress);
x2 = lerp(x2, x2_target, lerp_progress);

if (keyboard_check_pressed(global.k_interact))
{
	var _msg_len = string_length(msg);
	if (text_progress >= _msg_len)
	{
		instance_destroy();
		if (instance_exists(oTextQueued))
		{
			with (oTextQueued) ticket--;	
		}
		else
		{
			with (oPlayer) can_move = true;
		}
	}
	else if (text_progress > 2)
	{
		text_progress = _msg_len;	
	}
}	
