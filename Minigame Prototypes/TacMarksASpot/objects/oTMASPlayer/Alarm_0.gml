state = TMASPlayerStateIdle;

// move the collected objects, if there are any to move
if (thing_found != noone && thing_found != oTMASTreasure)
{
	instance_nearest(x, y, thing_found).x = -100;
	ds_map_replace(inventory, thing_found, true);
}
