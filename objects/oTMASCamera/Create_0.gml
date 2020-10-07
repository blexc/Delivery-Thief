cam = view_camera[1];

w = display_get_gui_width();
h = display_get_gui_height();

w_half = w * 0.5;
h_half = h * 0.5;

target_x = x;
target_y = y;
strength = 5;

follow = oTMASPlayer;

shake_interval = 1; // frequency of shaking in frames
shake_length = 0;	// total time to shake in frames
shake_mag = 0;		// intensity
shake_remain = 0;	// time remaining