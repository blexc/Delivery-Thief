draw_self();

// debug
draw_circle_color(target_x, target_y, 3, c_green, c_green, 1);

// animations
if (can_dash) image_index = 0;
else image_index = 1;

// speed up flashing when almost vunerable
if (alarm[1] >= Sec2Frames(1)) image_alpha = IntervalIsOff(alarm[1], 15) ? 1: 0;
else image_alpha = IntervalIsOff(alarm[1], 5) ? 1: 0;
