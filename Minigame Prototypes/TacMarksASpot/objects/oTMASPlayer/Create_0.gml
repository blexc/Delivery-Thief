state = TMASPlayerStateIdle;
walk_sp = 1;
hsp = 0;
vsp = 0;
found_something = false;

col_tilemap = layer_tilemap_get_id(layer_get_id("Collision"));

inventory = ds_map_create();
ds_map_add(inventory, oTMASColor, false);
ds_map_add(inventory, oTMASClock, false);
ds_map_add(inventory, oTMASApple, false);
ds_map_add(inventory, oTMASShake, false);