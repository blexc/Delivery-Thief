///@description SetDraw(color, halign, valign, alpha)
///@arg color
///@arg halign
///@arg valign
///@arg alpha
function SetDraw(argument0, argument1, argument2, argument3) {

	var _color = argument0;
	var _halign = argument1;
	var _valign = argument2;
	var _alpha = argument3;

	draw_set_color(_color);
	draw_set_halign(_halign);
	draw_set_valign(_valign);
	draw_set_alpha(_alpha);


}
