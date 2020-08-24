var menu = keyboard_check_pressed(global.k_menu);
var esc = keyboard_check_pressed(vk_escape);
var enter = keyboard_check_pressed(vk_enter);

if (menu) global.paused = !global.paused;
if (esc) game_end();
if (enter) game_restart();

if (keyboard_check_pressed(ord("T")))
{
	NewTextBox("This is a new text!");
	NewTextBox("Yea!");
	NewTextBox("Yea....");
}

if (keyboard_check_pressed(ord("F")) && keyboard_check(vk_control))
	window_set_fullscreen(!window_get_fullscreen());

