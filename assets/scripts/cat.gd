extends KinematicBody2D

const GRAVITY = 4000
const SPEED = 1100
const JUMP_FORCE = -1100

var linear_velocity = Vector2(0, 0)
var is_jumping = false
var is_moving = false
var is_alive = true

func _ready() -> void:
	set_process_input(true)

func _physics_process(delta: float) -> void:
	play_animations()
	linear_velocity.y += + GRAVITY * delta
	if is_alive:
		if is_on_floor():
			linear_velocity.x = 0
			if is_jumping:
				linear_velocity.y = JUMP_FORCE
		elif is_moving:
			linear_velocity.x = SPEED
		else:
			linear_velocity.x = 0
	
	is_jumping = false

	# morre quando cai
	if position.y > get_viewport_rect().size.y:
		die()
		
	move_and_slide(linear_velocity, Vector2(0, -1))
			
func die():
	if is_alive:
		is_alive = false
		linear_velocity = Vector2(0, JUMP_FORCE * 2)
		$animation.play("dead")
		get_tree().call_group("hud_group", "game_over")
	
# touch screen
func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if event.pressed:
			is_moving = true and is_on_floor()
			is_jumping = true
		else:
			is_moving = false

func play_animations():
	if is_alive:
		if is_on_floor():
			$animation.play("idle")
		else:
			if linear_velocity.y > 0:
				$animation.play("fall")
			elif linear_velocity.y < 0:
				$animation.play("jump")
	else:
		$animation.play("dead")
