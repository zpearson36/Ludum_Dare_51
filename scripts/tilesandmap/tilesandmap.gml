#macro TILEWIDTH  64
#macro TILEHEIGHT 64
#macro MAPWIDTH   16
#macro MAPHEIGHT  16


function Tile() constructor
{
	contents = noone;
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
}