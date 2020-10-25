view_enabled = true;
view_visible[0] = true;

camera_set_view_size(view, display_get_gui_width(), display_get_gui_height());

w = camera_get_view_width(view);
h = camera_get_view_height(view);

view_w_half = w/2;
view_h_half = h/2;
xToFollow = xstart;
yToFollow = ystart;
strength = 1; // less strength means stronger