/// @description Insert description here
// You can write your code in this editor
if(gPlayer.get_hp() <= 0) game_end()
for(var i = 0; i < array_length(enemy_list); i++)
{
	if(enemy_list[i].get_hp() <= 0)
	{
		print(array_length(enemy_list))
		gMap.get_tile(enemy_list[i].get_x(), enemy_list[i].get_y()).set_no_occupant()
		delete enemy_list[i]
		array_delete(enemy_list, i, 1)
		print(array_length(enemy_list))
	}
}