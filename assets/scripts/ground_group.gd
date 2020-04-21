extends Node2D

export (PackedScene) var ground

var distance = 320
var maxDistance = 600
var minDistance = 700	

func _ready():
	pass

func generate_ground(current_position_x):
	randomize()
	distance = int(rand_range(minDistance, maxDistance))
	print("distance: " + str(distance))
	
	var new_ground = ground.instance()
	var new_position = Vector2(distance + current_position_x, 1150)
	
	new_ground.position = new_position
	add_child(new_ground)
	
func teste():
	pass
