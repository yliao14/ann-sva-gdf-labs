extends CharacterBody2D

@export var speed: float = 220.0
@export var jump_velocity: float = -420.0
@export var gravity: float = 1100.0

func _physics_process(delta: float) -> void:
	var x_dir := 0.0
	if Input.is_action_pressed("ui_right"):
		x_dir = 1.0
	elif Input.is_action_pressed("ui_left"):
		x_dir = -1.0
	else:
		x_dir = 0.0

	velocity.x = x_dir * speed

	# Gravity
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0.0

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity

	move_and_slide()
