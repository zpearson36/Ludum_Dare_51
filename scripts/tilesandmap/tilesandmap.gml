#macro TILEWIDTH	  128
#macro TILEHEIGHT	  128
#macro MAPWIDTH		  8
#macro MAPHEIGHT	  8
#macro DUNGEONWIDTH   4
#macro DUNGEONHEIGHT  4
#macro GAMETILEWIDTH  MAPWIDTH * DUNGEONWIDTH
#macro GAMETILEHEIGHT MAPHEIGHT * DUNGEONHEIGHT
#macro MONSTERCHANCE  5

enum TILECONTENTS
{
	NONE,
	WALL,
	SPIKES,
	HOLE
}

global.open =   [TILECONTENTS.NONE]
global.wall =   [TILECONTENTS.WALL]
global.spikes = [TILECONTENTS.SPIKES, 1]
global.hole =   [TILECONTENTS.HOLE, 1]

function Tile() constructor
{
	contents = global.open;
	occupant = noone
	
	function get_contents()
	{
		return contents
	}
	
	function set_contents(_contents)
	{
		contents = _contents
	}
	
	function get_occupant()
	{
		return occupant
	}
	
	function set_occupant(_occ)
	{
		occupant = _occ
	}
	
	function set_no_occupant()
	{
		occupant = noone
	}
}

function Map(_mWidth, _mHeight) constructor
{
	mWidth  = _mWidth
	mHeight = _mHeight
	
	tileGrid = ds_grid_create(mWidth, mHeight)
	
	function populate_map()
	{
		for(var i = 0; i < mWidth; i++)
		{
			for(var j = 0; j < mHeight; j++)
			{
				tileGrid[# i, j] = new Tile()
			}
		}
	}
	
	function get_width()
	{
		return mWidth
	}
	
	function get_height()
	{
		return mHeight
	}
	
	function get_tile(_x, _y)
	{
		return tileGrid[# _x, _y]
	}
	
	function get_occupants()
	{
		var occupants = []
		for(var i = 0; i < MAPWIDTH; i++)
		{
			for(var j = 0; j < MAPHEIGHT; j++)
			{
				if(get_tile(i, j).get_occupant())// and 
				{
					if(not get_tile(i, j).get_occupant().isPlayer()) array_push(occupants, get_tile(i, j).get_occupant())
				}
			}
		}
		return occupants
	}
}


function Dungeon() constructor
{
	dungeonTiles = Create_Map()
	dungeon = ds_grid_create(DUNGEONWIDTH, DUNGEONHEIGHT)
	xpos = 0
	ypos = 0
	
	function init()
	{
		repeat(15){dungeonTiles = Update_Map(dungeonTiles)}
		
		for(var i = 0; i < DUNGEONWIDTH; i++)
		{
			for(var j = 0; j < DUNGEONHEIGHT; j++)
			{
				dungeon[# i, j] = new Map(MAPWIDTH, MAPHEIGHT)
				dungeon[# i, j].populate_map()
				for(var m = 0; m < MAPWIDTH; m++)
				{
					for(var n = 0; n < MAPHEIGHT; n++)
					{
						if((i == 0 and m == 0)
						   or (i == DUNGEONWIDTH - 1 and m == MAPWIDTH - 1)
						   or (j == 0 and n == 0)
						   or (j == DUNGEONHEIGHT - 1 and n == MAPHEIGHT - 1)
						   or not dungeonTiles[m + (i * MAPWIDTH)][n + (j * MAPHEIGHT)])
							dungeon[# i, j].get_tile(m, n).set_contents(global.wall)
					}
				}
			}
		}
		//remove walls that border room without corresponding wall in next room
	    for(var i = 0; i < DUNGEONWIDTH; i++)
		{
			for(var j = 0; j < DUNGEONHEIGHT; j++)
			{
				for(var m = 0; m < MAPWIDTH; m++)
				{
					for(var n = 0; n < MAPHEIGHT; n++)
					{
						var noWall = false
						if(dungeon[# i, j].get_tile(m, n).get_contents()[0] == TILECONTENTS.WALL)
						{
						    if(n == 0 and j > 0 and dungeon[# i, j - 1].get_tile(m, MAPHEIGHT - 1).get_contents()[0] != TILECONTENTS.WALL) noWall = true
						    if(n == MAPHEIGHT - 1 and j < DUNGEONHEIGHT - 1 and dungeon[# i, j + 1].get_tile(m, 0).get_contents()[0] != TILECONTENTS.WALL) noWall = true
							if(m == 0 and i > 0 and dungeon[# i - 1, j].get_tile(MAPWIDTH - 1, n).get_contents()[0] != TILECONTENTS.WALL) noWall = true
						    if(m == MAPWIDTH - 1 and i < DUNGEONWIDTH - 1 and dungeon[# i + 1, j].get_tile(0, n).get_contents()[0] != TILECONTENTS.WALL) noWall = true
							
						}
						if(noWall) dungeon[# i, j].get_tile(m, n).set_contents(global.open)
					}
				}
			}
		}
		//populate with enemies
		for(var i = 0; i < DUNGEONWIDTH; i++)
		{
			for(var j = 0; j < DUNGEONHEIGHT; j++)
			{
				for(var m = 0; m < MAPWIDTH; m++)
				{
					for(var n = 0; n < MAPHEIGHT; n++)
					{
						if(dungeon[# i, j].get_tile(m, n).get_contents()[0] != TILECONTENTS.WALL)
						{
							if(irandom(100) < MONSTERCHANCE) dungeon[# i, j].get_tile(m, n).set_occupant(new Enemy(m, n))
						}
					}
				}	
			}
		}
	}
	

	
	function set_pos(_x, _y)
	{
		xpos = _x
		ypos = _y
	}
	
	function get_map()
	{
		return dungeon[# xpos, ypos]
	}
	
	function move_left() { xpos -= 1; return get_map(); }
	function move_right(){ xpos += 1; return get_map(); }
	function move_up()   { ypos -= 1; return get_map(); }
	function move_down() { ypos += 1; return get_map(); }
}