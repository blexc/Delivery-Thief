/// @description oUIInventory Create

row = -1; col = -1;
combine_c = -1; combine_r = -1;

selected_alpha_normal = 0.3;
selected_alpha_pressed = 0.9;
selected_alpha = selected_alpha_normal;

// kbrd vars
up = 0; 
down = 0; 
left = 0; 
right = 0;
menu = 0; 
interact = 0; 
move_x = 0; 
move_y = 0;

s = 28; // size of inventory boxes
buf = 4; // buffer
tb_x1 = buf;
tb_x2 = WIN_W - buf;
tb_y1 = WIN_H*0.6 + buf;
tb_y2 = WIN_H - buf;