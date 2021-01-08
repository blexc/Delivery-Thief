/// @description delete self if normal mode

if (!debug_mode) instance_destroy();
debug_messages = ds_map_create();