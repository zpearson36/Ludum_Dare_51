function Enemy() constructor
{
	xpos = 5
	ypos = 7
	sprite = sEnemy
	hp = 5
	max_ap = 2
	current_ap = 2
	
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
		//moves enemy closer to player
		var up    = point_distance(oGameManager.get_player().get_x(), oGameManager.get_player().get_y(), xpos, ypos - 1)
		var down  = point_distance(oGameManager.get_player().get_x(), oGameManager.get_player().get_y(), xpos, ypos + 1)
		var left  = point_distance(oGameManager.get_player().get_x(), oGameManager.get_player().get_y(), xpos - 1, ypos)
		var right = point_distance(oGameManager.get_player().get_x(), oGameManager.get_player().get_y(), xpos + 1, ypos)
		
		var dir = min(up, down, left, right)
		switch(dir)
		{
			case up   :
			{
				if(oGameManager.get_map().get_tile(xpos, ypos - 1).get_occupant() == noone)
					ypos -= 1;
				else if(oGameManager.get_map().get_tile(xpos, ypos - 1).get_occupant() == oGameManager.get_player())
				    oGameManager.get_player().damage(1)
				break;
			}
			case down :
			{
				if(oGameManager.get_map().get_tile(xpos, ypos + 1).get_occupant() == noone)
					ypos += 1;
				else if(oGameManager.get_map().get_tile(xpos, ypos + 1).get_occupant() == oGameManager.get_player())
				    oGameManager.get_player().damage(1)
				break;
			}
			case left :
			{
				if(oGameManager.get_map().get_tile(xpos - 1, ypos).get_occupant() == noone)
					xpos -= 1;
				else if(oGameManager.get_map().get_tile(xpos - 1, ypos).get_occupant() == oGameManager.get_player())
				    oGameManager.get_player().damage(1)
				break;
			}
			case right:
			{
				if(oGameManager.get_map().get_tile(xpos + 1, ypos).get_occupant() == noone)
					xpos += 1;
				else if(oGameManager.get_map().get_tile(xpos + 1, ypos).get_occupant() == oGameManager.get_player())
				    oGameManager.get_player().damage(1)
				break;
			}
		}
		
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
}