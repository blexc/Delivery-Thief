/// @description reset the textbox
// oUIInventory alarm0
var msg = "";
var inst_selected = ds_grid_get(oInventory.items, col, row);
if (inst_selected != noone) msg = inst_selected.title + "\n" + inst_selected.desc;

instance_destroy(my_textbox);
my_textbox = NewTextBox(msg, undefined, true);