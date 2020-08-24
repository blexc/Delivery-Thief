function NewTextBox(_msg){
	var _obj;
	if (instance_exists(oText)) _obj = oTextQueued;
	else _obj = oText;
	
	with (instance_create_layer(0, 0, "Instances", _obj))
	{
		msg = _msg;
		if (instance_exists(other)) origin_instance = other.id;
		else origin_instance = noone;
	}
	
	with (oPlayer)
	{
		can_move = false;
	}
}