function print(_str)
{
	show_debug_message(_str)
}

function array_choose(_array)
{
	return _array[irandom(array_length(_array) - 1)]
}