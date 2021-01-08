function input_up()
{
	return keyboard_check(ord("W")) || keyboard_check(vk_up);
}

function input_down()
{
	return keyboard_check(ord("S")) || keyboard_check(vk_down);
}

function input_left()
{
	return keyboard_check(ord("A")) || keyboard_check(vk_left);
}

function input_right()
{
	return keyboard_check(ord("D")) || keyboard_check(vk_right);
}