// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ScreenShake(_strength, _duration, _frequency)
{
	with (oTMASCamera)
	{
		shake_remain = _strength;
		shake_mag = _strength;
		shake_length = _duration;
		shake_interval = _frequency;
	}
}