/// @description spawn circles

instance_create_layer(room_width, irandom_range(24, room_height-24), "Higher", oCircle);
alarm[1] = room_speed * 1;