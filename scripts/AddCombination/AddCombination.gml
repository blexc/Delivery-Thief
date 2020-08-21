// add combination to map
function AddCombination(map, obj1, obj2, result){
	var pair = string(obj1) + " " + string(obj2);
	ds_map_add(map, pair, result);
}