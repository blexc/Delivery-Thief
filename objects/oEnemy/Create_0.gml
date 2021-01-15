/// @description 

move_speed_idle = 0.5;
move_speed_seek = 2;
move_speed = 0;

state = enemy_state_idle;
move_speed_target = move_speed_idle;

// player's last seen pos
xseen = x;	
yseen = y;

// idle coordinates
xwander = x;
ywander = y;

sight_cone = 65; // in degrees
sight_dist = 4 * UNIT;