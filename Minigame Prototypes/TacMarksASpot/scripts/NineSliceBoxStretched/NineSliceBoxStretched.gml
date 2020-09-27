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