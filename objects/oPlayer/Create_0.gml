target_x = x; target_y = y;
look_x = 0; look_y = -1;
center_x = x + (sprite_get_bbox_right(sprite_index) / 2);
center_y = y + (sprite_get_bbox_bottom(sprite_index) / 2);

can_move = true;
walk_sp = 1; // must be able to divide by 16 with no remainder

invunerable = false;
invunerable_timer = Sec2Frames(1);

speed = 0;
image_speed = 0;

