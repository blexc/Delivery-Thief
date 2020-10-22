// oText DrawGUI

NineSliceBoxStretched(sTextBoxBg, tb_x1, tb_y1, tb_x2, tb_y2);
var _print = string_copy(msg, 1, text_progress); // the scrolling text

// print possible responses with ><'s between the text
if (!dont_take_input && responses[0] != -1 && text_progress >= string_length(msg))
{
	for (var i=0; i < array_length(responses); i++)
	{
		_print += "\n";
		if (i == response_selected) _print += "> ";

		_print += responses[i];
		if (i == response_selected) _print += " <";
	}
}

SetDraw(c_white, fa_center, fa_top, 1);
draw_text_ext((tb_x1+tb_x2)/2, tb_y1+8, _print, -1, tb_x2-tb_x1-2*PIX);