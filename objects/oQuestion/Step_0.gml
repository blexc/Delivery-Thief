// move up and down
var cur_second = current_time * 0.001;
var amp = 2;
var per = 2 * pi;
y = amp * sin(per * cur_second) + ystart;

// display msg if player is ontop of ? block
if (collision_rectangle(xstart + 4, ystart + 4, xstart + PIX - 4 , ystart + PIX - 4,
	oPlayer, 0, 1))
{
	if (!triggered_txt_box)
	{
		NewTextBox(msg);
		triggered_txt_box = true;
	}
}
else
{
	triggered_txt_box = false;	
}
