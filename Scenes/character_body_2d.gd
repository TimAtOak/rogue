extends Node2D

var bullet_path = preload("res://Scenes/bullet.tscn")

func fire():
	var bullet = bullet_path.instantiate()
	bullet.dir = rotation
	var offset = Vector2(20, 0).rotated(rotation)
	bullet.pos = global_position + offset
	bullet.rota = global_rotation
	get_parent().get_parent().add_child(bullet)

func _process(_delta: float) -> void:
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("fire"):
		fire()
