state = EnemyStateWalk;

sight_length = PIX * 3;
center_x = x + (sprite_get_bbox_right(sprite_index) / 2);
center_y = y + (sprite_get_bbox_bottom(sprite_index) / 2);

direction = enemyInitDir;
speed = 0;
target_index = -1;
target_x = x;
target_y = y;
sees_player = false;

sprite_index = sprite_idle;
image_speed = 0;
local_frame = 0;
