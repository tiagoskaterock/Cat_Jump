extends StaticBody2D

var is_moving = false
var speed = 100

func _ready():
	pass
	
func _physics_process(delta: float) -> void:
	if is_moving:
		position.y += speed * delta		
		if position.y > get_viewport_rect().size.y + 320:
			queue_free()

func _on_area_body_entered(body: PhysicsBody2D) -> void:
	if body.name == "cat" and not is_moving:
		print("_on_area_body_entered()")
		is_moving = true
		get_tree().call_group("node_ground_group", "generate_ground", position.x)
		
