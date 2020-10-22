// oText Step

text_progress += global.text_speed;
if (dont_take_input) exit; // skip input!

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
				DialogueResponses(other.response_scripts[other.response_selected]);
		}
		instance_destroy();
		if (instance_exists(oTextQueued))
			with (oTextQueued) ticket--;	
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
		text_progress = _msg_len;	
}	
