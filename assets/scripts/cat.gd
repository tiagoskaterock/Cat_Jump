extends KinematicBody2D

const GRAVITY = 2000
const SPEED = 500
const JUMP_FORCE = -900

var linear_velocity = Vector2(0, 0)
var is_jumping = false
var is_moving = false
var is_alive = true

func _ready() -> void:
	set_process_input(true)

func _physics_process(delta: float) -> void:
	pass
	

