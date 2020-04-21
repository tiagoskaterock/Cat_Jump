extends Node2D

export (PackedScene) var ground

func _ready():
	pass

func generate_ground(current_position_x):
	print("generate_ground()")
	var new_ground = ground.instance()
	var new_position = Vector2(650 + current_position_x, 1150)
	print ("new_position: " + str(new_position))
	print ("new_ground: " + str(new_ground))
	
	new_ground.position = new_position
	add_child(new_ground)
	
func teste():
	pass
