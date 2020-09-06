state = EnemyStateWalk;

sight_length = PIX * 3;
center_x = x + (sprite_get_bbox_right(sprite_index) / 2);
center_y = y + (sprite_get_bbox_bottom(sprite_index) / 2);

sprite_walk = sTicWalk;
sprite_idle = sTicIdle;

speed = 0;
target_index = -1;
target_x = x;
target_y = y;
sees_player = false;

image_speed = 0;
sprite_index = sprite_idle;
local_frame = 0;
