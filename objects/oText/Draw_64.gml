NineSliceBoxStretched(sTextBoxBg, x1, y1, x2, y2);
var _print = string_copy(msg, 1, text_progress);

if (responses[0] != -1 && text_progress >= string_length(msg))
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
draw_text((x1+x2)/2, y1+8, _print);