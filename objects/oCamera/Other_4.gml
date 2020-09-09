cam = view_camera[0];
follow = oPlayer;
camera_set_view_size(cam, WIN_W, WIN_H);
w = camera_get_view_width(cam);
h = camera_get_view_height(cam);
view_w_half = w/2;
view_h_half = h/2;
xToFollow = xstart;
yToFollow = ystart;
strength = 1; // less strength means stronger