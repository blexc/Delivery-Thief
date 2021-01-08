// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function print(_msg)
{
	show_debug_message(_msg);
}

// put in string in this format: "key: + string(value)"
function add_to_debug(_str)
{
	if (debug_mode)
	{
		var _i = string_pos(":", _str);
		var _key = string_copy(_str, 0, _i);
		
		if (_i == 0)
		{
			oDebug.debug_messages[? "!"] = "INVALID FORMAT: " + _str;
			return;
		}

		oDebug.debug_messages[? _key] = _str;
	}
}