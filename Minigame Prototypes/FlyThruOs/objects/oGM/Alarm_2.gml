/// @description spawn ties

instance_create_layer(room_width, irandom_range(24, room_height-24), "Higher", oTie);
alarm[2] = room_speed * 3;