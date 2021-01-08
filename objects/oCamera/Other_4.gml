/// @description Insert description here
view_enabled = true;
view_visible[0] = true;

camera_set_view_size(VIEW, display_get_gui_width(), display_get_gui_height());

w = camera_get_view_width(VIEW);
h = camera_get_view_height(VIEW);

follow = oPlayer;
view_w_half = w/2;
view_h_half = h/2;
xToFollow = xstart;
yToFollow = ystart;
strength = 1; // less strength means stronger