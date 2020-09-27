cam = view_camera[0];

cam_zoomed_in_w = RES_W;
cam_zoomed_in_h = RES_H;

// zoomed in by default
w_half = cam_zoomed_in_w * 0.5;
h_half = cam_zoomed_in_h * 0.5;
camera_set_view_size(cam, w_half * 2, h_half * 2);

target_x = x;
target_y = y;

follow = oTMASPlayer;


