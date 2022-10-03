function Enemy(_x=3, _y=2) constructor
{
	xpos = _x
	ypos = _y
	sprite = sEnemy
	hp = 5
	max_ap = 2
	current_ap = 2
	
	path = []
	
	function get_hp()
	{
		return hp
	}
	
	
	function damage(_dmg)
	{
		hp -= _dmg
	}
	function move()
	{
		oGameManager.get_map().get_tile(xpos, ypos).set_no_occupant()
		
		var nxt = path[array_length(path) - 1]
		
		print(string(nxt[0] - xpos) + ", " + string(nxt[1] - ypos))
		if(oGameManager.get_map().get_tile(nxt[0], nxt[1]).get_occupant() == noone)
		{
			xpos+=(nxt[0] - xpos);
			ypos+=(nxt[1] - ypos);
			array_delete(path, array_length(path) - 1, 1)
		}
		else if(oGameManager.get_map().get_tile(nxt[0], nxt[1]).get_occupant() == oGameManager.get_player())
				    oGameManager.get_player().damage(1)
		
		
	   	oGameManager.get_map().get_tile(xpos, ypos).set_occupant(self)
		current_ap -= 1  
	}
	
	function get_ap()
	{
		return current_ap
	}
	
	function reset_ap()
	{
		current_ap = max_ap
	}
	
	function get_x()
	{
		return xpos
	}
	
	function get_y()
	{
		return ypos
	}
	
	function isPlayer()
	{
		return false
	}
	
	function get_path()
	{
		return path
	}
	
	function set_path(_path)
	{
		path = _path
	}
	
	function reset_path()
	{
		path = []
	}
}