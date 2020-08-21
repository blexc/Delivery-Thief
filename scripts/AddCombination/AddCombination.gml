// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AddCombination(obj1, obj2, result){
	var pair = string(obj1) + " " + string(obj2);
	ds_map_add(combinations, pair, result);
}