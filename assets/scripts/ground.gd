extends StaticBody2D

var is_moving = false

func _ready():
	calcSpeed()
	
func _physics_process(delta: float) -> void:
	if is_moving:
		position.y += calcSpeed() * delta		
		if position.y > get_viewport_rect().size.y + 320:
			queue_free()

func _on_area_body_entered(body: PhysicsBody2D) -> void:
	if body.name == "cat" and not is_moving:
		is_moving = true
		get_tree().call_group("node_ground_group", "generate_ground", position.x)
		get_tree().call_group("hud_group", "count_score")
		
func calcSpeed():
	var maxSpeed = 700
	var minSpeed = 50
	randomize()	
	return int(rand_range(minSpeed, maxSpeed))	
