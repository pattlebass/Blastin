extends RigidBody2D

var player

func _process(delta):
	if position.distance_to(player.global_position) > 2500:
		queue_free()

func _integrate_forces(state):
	apply_central_impulse(Vector2(40, 0).rotated(rotation))