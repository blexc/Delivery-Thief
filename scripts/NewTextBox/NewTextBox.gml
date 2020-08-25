function NewTextBox(_msg, _responses){
	var _obj;
	if (instance_exists(oText)) _obj = oTextQueued;
	else _obj = oText;
	
	with (instance_create_layer(0, 0, "Instances", _obj))
	{
		msg = _msg;
		if (instance_exists(other)) origin_instance = other.id;
		else origin_instance = noone;
		
		responses = [-1];
		response_scripts = [-1];
		
		if (!is_undefined(_responses))
		{
			responses = _responses;
			// trim markers from responses
			for (var i=0; i < array_length(_responses); i++)
			{
				var _marker_pos = string_pos(":", _responses[i]);
				response_scripts[i] = string_copy(responses[i], 1, _marker_pos-1);
				response_scripts[i] = real(response_scripts[i]);
				responses[i] = string_delete(responses[i], 1, _marker_pos);		
			}
		}
	}
	
	with (oPlayer)
	{
		can_move = false;
	}
}