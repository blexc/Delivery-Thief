target_x = x; target_y = y;
orig_x = x; orig_y = y;
look_x = 0; look_y = -1;
vx = 0; vy = 0;
center_x = x + (sprite_get_bbox_right(sprite_index) / 2);
center_y = y + (sprite_get_bbox_bottom(sprite_index) / 2);

moving = false;
walk_sp = 6; // higher means slower

dash_spaces = 2;
can_dash = true;
dash_key_let_go = true;

invunerable = false;