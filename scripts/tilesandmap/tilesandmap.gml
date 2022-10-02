#macro TILEWIDTH  128
#macro TILEHEIGHT 128
#macro MAPWIDTH   8
#macro MAPHEIGHT  8

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
	
	function get_contents()
	{
		return contents
	}
	
	function set_contents(_contents)
	{
		contents = _contents
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