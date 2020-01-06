extends RigidBody2D

var speed = 400
var jump_force = 600
var on_floor = false
var jump_counter = 0

func _ready():
	#Add self as exception to floor detection rays
	$"floor detection/RayCast2D".add_exception(self)
	$"floor detection/RayCast2D2".add_exception(self)
	$"floor detection/RayCast2D3".add_exception(self)

func _process(delta):
	#Debug
	if Input.is_action_pressed("debug"):
		mode = RigidBody2D.MODE_RIGID

func _integrate_forces(state):
	
	#Left and right
	
	if Input.is_action_pressed("left"):
		linear_velocity.x = -speed
	if Input.is_action_pressed("right"):
		linear_velocity.x = speed
	
	#Jumping
	
	if Input.is_action_just_pressed("up") and (on_floor or jump_counter < 1):
		apply_central_impulse(Vector2(0, -jump_force))
		jump_counter += 1

	#Floor detection
	
	for ray in $"floor detection".get_children():
		if ray.is_colliding():
			on_floor = true
			jump_counter = 0
		else:
			on_floor = false
	

