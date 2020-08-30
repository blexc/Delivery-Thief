lerp_progress += (1-lerp_progress)/50;
text_progress += global.text_speed;

x1 = lerp(x1, x1_target, lerp_progress);
x2 = lerp(x2, x2_target, lerp_progress);
y1 = lerp(y1, y1_target, lerp_progress);
y2 = lerp(y2, y2_target, lerp_progress);

// cycle thru responses
var up = keyboard_check_pressed(global.k_up);
var down = keyboard_check_pressed(global.k_down);
response_selected += (down - up);
var _max = array_length(responses)-1;
var _min = 0;

if (response_selected > _max) response_selected = _min;
else if (response_selected < _min) response_selected = _max;

if (keyboard_check_pressed(global.k_interact))
{
	var _msg_len = string_length(msg);
	if (text_progress >= _msg_len)
	{
		if (responses[0] != -1)
		{
			with (origin_instance)
			{
				DialogueResponses(other.response_scripts[other.response_selected]);
			}
		}
		instance_destroy();
		if (instance_exists(oTextQueued))
		{
			with (oTextQueued) ticket--;	
		}
		else
		{
			with (oPlayer)
			{
				can_move = true;
				keyboard_clear(global.k_interact);
			}
		}
	}
	else if (text_progress > 2)
	{
		text_progress = _msg_len;	
	}
}	
