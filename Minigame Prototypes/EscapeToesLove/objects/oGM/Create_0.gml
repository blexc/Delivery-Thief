w = 120*8;
h = 80*8;
window_set_size(w, h);
surface_resize(application_surface, w, h);
alarm[0] = 1;
msg = "";
game_start = false;
game_over = false;
did_win = false;

instance_create_layer(oPlayer.x + 32, oPlayer.y, "Instances", oToe);