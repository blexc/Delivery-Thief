event_inherited();

w = display_get_gui_width();
h = display_get_gui_height();
msg = "";
game_start = false;
game_over = false;
did_win = false;
instance_create_layer(oETLPlayer.x + 32, oETLPlayer.y, "Instances", oETLToe);