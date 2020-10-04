/// @description assign objects to be 'hidden' in dirt
// 1 apple, 1 color, 1 shake, 1 treasure are allowed -- the rest will be clocks
var inst;
do 
{
	inst = instance_find(oTMASDirt, irandom_range(0, instance_number(oTMASDirt)-1));
}
until (inst.object_assigned == noone);
inst.object_assigned = oTMASApple;

do 
{
	inst = instance_find(oTMASDirt, irandom_range(0, instance_number(oTMASDirt)-1));
}
until (inst.object_assigned == noone);
inst.object_assigned = oTMASShake;

do 
{
	inst = instance_find(oTMASDirt, irandom_range(0, instance_number(oTMASDirt)-1));
}
until (inst.object_assigned == noone);
inst.object_assigned = oTMASTreasure;
treasure_instance = inst;

do 
{
	inst = instance_find(oTMASDirt, irandom_range(0, instance_number(oTMASDirt)-1));
}
until (inst.object_assigned == noone);
inst.object_assigned = oTMASColor;

for (var i=0; i < instance_number(oTMASDirt); i++)
{
	inst = instance_find(oTMASDirt, i);
	if (inst.object_assigned == noone)
	{
		inst.object_assigned = oTMASClock;	
	}
}