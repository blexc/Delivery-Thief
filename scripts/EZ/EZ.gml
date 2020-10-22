function ScreenShake(_strength, _duration, _frequency)
{
	if (instance_exists(oTMASCamera))
	{
		with (oTMASCamera)
		{
			shake_remain = _strength;
			shake_mag = _strength;
			shake_length = _duration;
			shake_interval = _frequency;
		}
	}
}

function Deg2Cardinal(direction_degrees){
	return floor(direction_degrees/90);
}

function Frames2Sec(_frames){
	return _frames / room_speed;
}

function debug(argument0) {
	show_debug_message(argument0);
}

/// @description Sec2Frames(seconds)
/// @arg seconds
function Sec2Frames(argument0) {
	return room_speed * argument0;
}

///@description SetDraw(color, halign, valign, alpha)
///@arg color
///@arg halign
///@arg valign
///@arg alpha
function SetDraw(argument0, argument1, argument2, argument3) {
	var _color = argument0;
	var _halign = argument1;
	var _valign = argument2;
	var _alpha = argument3;

	draw_set_color(_color);
	draw_set_halign(_halign);
	draw_set_valign(_valign);
	draw_set_alpha(_alpha);
}

///@description SlideTransition(_mode[, targetroom])
///@arg _mode
///@arg _targetroom
function SlideTransition(_mode, _targetroom){
	with(oTransition)
	{
		mode = _mode;
		target = _targetroom;
	}
}

function NewTextBox(_msg, _responses, _dont_take_input){
	if (0) return argument[0];	// gets rid of error msg about parameter count
	var _obj;
	if (instance_exists(oText)) _obj = oTextQueued;
	else _obj = oText;
	
	var _inst = instance_create_layer(0, 0, "Instances", _obj);
	
	with (_inst)
	{
		msg = _msg;
		
		if (instance_exists(other)) origin_instance = other.id;
		else origin_instance = noone;
		
		dont_take_input = false; // DO take input, unless explicitly mentioned
		if (_dont_take_input != undefined)
		{
			dont_take_input = _dont_take_input;
		}	
		
		responses = [-1];
		response_scripts = [-1];
		
		if (_responses != undefined)
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
	
	with (oPlayer) can_move = false;
	
	return _inst;
}

function NineSliceBoxStretched(_sprite, _x1, _y1, _x2, _y2){
	var _size = sprite_get_width(_sprite) / 3;
    var _w = _x2 - _x1;
    var _h = _y2 - _y1;
	
	draw_set_color(c_white);
	draw_set_alpha(1);

    // MIDDLE
    draw_sprite_part_ext(_sprite, 0, _size, _size, 1, 1, _x1+_size, _y1+_size,
        _w-(_size*2), _h-(_size*2), c_white, 1);

    // CORNERS
	// topleft
    draw_sprite_part(_sprite, 0, 0, 0, _size, _size, _x1, _y1);
	// topright
    draw_sprite_part(_sprite, 0, _size*2, 0, _size, _size, _x1+_w-_size, _y1);
	// bottomleft
    draw_sprite_part(_sprite, 0, 0, _size*2, _size, _size, _x1, _y1+_h-_size);
	// bottomright
    draw_sprite_part(_sprite, 0, _size*2, _size*2, _size, _size, _x1+_w-_size, _y1+_h-_size);

    // EDGES
	// left
	draw_sprite_part_ext(_sprite, 0, 0, _size, _size, 1, _x1, _y1+_size, 1, _h-(_size*2), c_white, 1);
	// right
	draw_sprite_part_ext(_sprite, 0, _size*2, _size, _size, 1, _x1+_w-_size, _y1+_size, 1, _h-(_size*2), c_white, 1);
	// top
	draw_sprite_part_ext(_sprite, 0, _size, 0, 1, _size, _x1+_size, _y1, _w-(_size*2), 1, c_white, 1);
	// bottom
	draw_sprite_part_ext(_sprite, 0, _size, _size*2, 1, _size, _x1+_size, _y1+_h-(_size), _w-(_size*2), 1, c_white, 1);
}