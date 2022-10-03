// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Node(_x, _y) constructor
{
	xpos = _x
	ypos = _y
	parent = noone
	f = 0
	g = 0
	h = 0
	
	function get_f()
	{
		return f
	}
	
	function set_g(_f)
	{
		g = _f
	}
	
	function get_g()
	{
		return g
	}
	
	function set_f(_f)
	{
		f = _f
	}
	
	function get_h()
	{
		return h
	}
	
	function set_h(_f)
	{
		h = _f
	}
	
	function set_parent(_node)
	{
		parent = _node
	}
	
	function get_parent()
	{
		return parent
	}
}
function pathfinding(_obj1, _objDest){
	start = new Node(_obj1.get_x(), _obj1.get_y())
	dest = new Node(_objDest.get_x(), _objDest.get_y())
	openList = []
	closedList = []
	
	array_push(openList, start)
	var done = false
	while(not done and array_length(openList))
	{
		var currentNode = get_lowest_f(openList)
		array_push(closedList, currentNode)
		if(currentNode.xpos == dest.xpos and currentNode.ypos == dest.ypos){done = true; continue}
		var cardinals = [[-1, 0],[1, 0],[0, -1],[0, 1]]
		var children = []
		for(var i = 0; i < array_length(cardinals); i++)
		{
			var node = new Node(currentNode.xpos + cardinals[i][0], currentNode.ypos + cardinals[i][1])
			if(node.xpos < 0 or node.xpos >= MAPWIDTH or node.ypos < 0 or node.ypos >= MAPHEIGHT) continue
			if(oGameManager.get_map().get_tile(node.xpos, node.ypos).get_contents()[0] == TILECONTENTS.WALL) continue
			if(oGameManager.get_map().get_tile(node.xpos, node.ypos).get_occupant() != noone
			   and not oGameManager.get_map().get_tile(node.xpos, node.ypos).get_occupant().isPlayer()) continue
			node.set_parent(currentNode)
			array_push(children, node)
		}
		for(var i = 0; i < array_length(children); i++)
		{
			if(check_is_in_array(closedList, children[i])) continue
			children[i].set_g(currentNode.get_g() + point_distance(children[i].xpos, children[i].ypos, currentNode.xpos, currentNode.ypos))
			children[i].set_h(point_distance(children[i].xpos, children[i].ypos, dest.xpos, dest.ypos))
			children[i].set_f(children[i].get_g() + children[i].get_h())
			var tmpind = check_is_in_array(openList, children[i])
			if(tmpind and children[i].get_g() > openList[tmpind].get_g()) continue
			array_push(openList, children[i])
		}
	}
	var path = []
	var current = currentNode
	while(current.get_parent() != noone)
	{
		array_push(path, [current.xpos, current.ypos])
		current = current.get_parent()
	}
	
	return path
}

function get_lowest_f(_array)
{
	var tmp = noone
	var tmpI = 0
	for(var i = 0; i < array_length(_array); i++)
	{
		if(tmp == noone) tmp = _array[i]
		else if(_array[i].get_f() < tmp.get_f()){tmp = _array[i]; tmpI = i;}
	}
	array_delete(_array, tmpI, 1)
	return tmp
}

function check_is_in_array(_array, _node)
{
	var tmp = -1
	for(var i = 0; i < array_length(_array); i++)
	{
		if(_array[i].xpos == _node.xpos and _array[i].ypos == _node.ypos){tmp = i; break;}
	}
	
	return tmp
}