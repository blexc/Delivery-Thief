/// @desc destroy self
if (place_meeting(x, y, pSolid) && !place_meeting(x, y, oEnemy))
{
	instance_destroy();	
}