///@description IntervalIsOff(value, interval)
///@arg value
///@arg interval
function IntervalIsOff(argument0, argument1) {

	var value = argument0;
	var interval = argument1;

	if (interval == 0) return true;
	return value % interval <= interval/2;


}
