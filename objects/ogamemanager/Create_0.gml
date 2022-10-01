/// @description Insert description here
// You can write your code in this editor
randomize()

gMap = new Map(MAPWIDTH, MAPHEIGHT)
gMap.populate_map()

gPlayer = instance_create_layer(0, 0, "Player", oPlayer)