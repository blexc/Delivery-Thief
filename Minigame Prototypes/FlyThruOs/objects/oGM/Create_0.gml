game_difficulty = 3; // 1, 2, 3; easy, medium, hard

window_set_fullscreen(true);
w = display_get_gui_width();
h = display_get_gui_height();
game_started = false;
game_ending = false;
game_over = false;
msg = ""

circles_went_through = 0;
circles_missed = 0;
circles_spawned = 0;

frames = 0;
time_limit_sec = 10;