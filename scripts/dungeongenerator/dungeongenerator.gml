#macro AWAKECHANCE 60
#macro AWAKETHRESHOLD 5
#macro SLEEPTHRESHOLD 3

function Create_Map(){
	//@func Create_Map
	//@param size_x
	//@param size_y
	var map
	
    for(var i = 0; i < GAMETILEWIDTH; i++)
	{
		for(var j = 0; j < GAMETILEHEIGHT; j++)
		{
			r_num = irandom(100)
			if(r_num > (100 - AWAKECHANCE))
			{
				map[i][j] = 1
			}
			else
			{
				map[i][j] = 0
			}
		}
	}
	
	return map
}

function Clear_Map(map)
{
	    for(var i = 0; i < GAMETILEWIDTH; i++)
	{
		for(var j = 0; j < GAMETILEHEIGHT; j++)
		{
			map[i][j] = 0
		}
	}
	
}

function Count_Neighbors(xx, yy, map)
{
	var count = 0
	
	for(var i = -1; i <= 1; i++)
	{
		for(var j = -1; j <= 1; j++)
		{
			var nx = xx + i
			var ny = yy + j
			if(nx < 0 or ny < 0 or nx >= GAMETILEWIDTH or ny >= GAMETILEHEIGHT)
			{
				continue
			}
			else if (i == 0 and j == 0)
			{
				continue
			}
			else
			{
				count += map[nx][ny]
			}
		}
	}
	return count
}

function Update_Map(map)
{
	var new_map
	for(var i = 0; i < GAMETILEWIDTH; i++)
	{
		for(var j = 0; j < GAMETILEHEIGHT; j++)
		{
			var count = Count_Neighbors(i, j, map)
			if(map[i][j] == 1)
			{
				if(count < SLEEPTHRESHOLD)
				{
					new_map[i][j] = 0
				}
				else
				{
					new_map[i][j] = 1
				}
			}
			else
			{
				if(count > AWAKETHRESHOLD)
				{
					new_map[i][j] = 1
				}
				else
				{
					new_map[i][j] = 0
				}
			}
		}
	}
	return new_map
}