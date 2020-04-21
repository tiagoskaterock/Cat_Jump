extends Node2D

export (PackedScene) var ground	

func _ready():
	pass

func generate_ground(current_position_x):	
	var new_ground = ground.instance()
	var new_position = Vector2(calcDistance() + current_position_x, calcHeight())
	
	new_ground.position = new_position
	add_child(new_ground)
	
func calcHeight():
	var maxHeight = 1000
	var minHeight = 1050
	randomize()
	return int(rand_range(minHeight, maxHeight))
	
func calcDistance():
	var maxDistance = 650
	var minDistance = 550
	randomize()
	return int(rand_range(minDistance, maxDistance))
	
