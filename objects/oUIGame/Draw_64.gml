// oGUI DrawGUI

SetDraw(c_white, fa_left, fa_center, 1);
draw_sprite(sQuarter, 0, 5, 5);
draw_text(20, 15, "x " + string(oGameManager.quarters));