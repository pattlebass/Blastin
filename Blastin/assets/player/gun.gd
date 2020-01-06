extends Sprite

var bullet_scene = preload("res://assets/bullet.tscn")

var damage = 1


func _unhandled_input(event):
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("shoot"):
		var bullet = bullet_scene.instance()
		bullet.position = $Position2D.global_position
		bullet.rotation = rotation
		bullet.player = get_parent()
		get_parent().get_parent().add_child(bullet)