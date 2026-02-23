extends Sprite2D

@export var speed = 2.0
@export var my_name = ""
@export var moving = false

# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	print("Hello")
	print(position.x)
	print('my name is ', my_name)
	print('am I moving is ', moving)
	
#func_input(event: InputEvent)
	#print(event)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_accept"):
		position.x += speed
	else:
		position.y -= speed
	
