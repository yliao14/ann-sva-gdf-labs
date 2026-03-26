extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 5.0
const GRAVITY = 9.8

func _physics_process(delta):
	# Gravity
	if not is_on_floor():
		velocity.y -= GRAVITY * delta

	# Jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Movement
	var direction = Vector3.ZERO
	if Input.is_action_pressed("ui_up"):   direction.z -= 1
	if Input.is_action_pressed("ui_down"): direction.z += 1
	if Input.is_action_pressed("ui_left"): direction.x -= 1
	if Input.is_action_pressed("ui_right"):direction.x += 1
	
	direction = direction.normalized()
	velocity.x = direction.x * SPEED
	velocity.z = direction.z * SPEED

	move_and_slide()
