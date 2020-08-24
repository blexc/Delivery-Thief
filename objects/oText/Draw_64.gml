NineSliceBoxStretched(sTextBoxBg, x1, y1, x2, y2);


var _print = string_copy(msg, 1, text_progress);
SetDraw(c_black, fa_center, fa_top, 1);
draw_text((x1+x2)/2, y1+8, _print);
SetDraw(c_white, fa_center, fa_top, 1);
draw_text((x1+x2)/2, y1+7, _print);