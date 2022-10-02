#macro TILEWIDTH	  128
#macro TILEHEIGHT	  128
#macro MAPWIDTH		  8
#macro MAPHEIGHT	  8
#macro DUNGEONWIDTH   4
#macro DUNGEONHEIGHT  4
#macro GAMETILEWIDTH  MAPWIDTH * DUNGEONWIDTH
#macro GAMETILEHEIGHT MAPHEIGHT * DUNGEONHEIGHT

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