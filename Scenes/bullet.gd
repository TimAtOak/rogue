extends CharacterBody2D
var pos: Vector2
var rota: float
var dir: float
var speed = 500


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position=pos
	global_rotation=rota
	%fireball.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	velocity = Vector2(speed, 0).rotated(dir)
	var collision = move_and_collide(velocity * _delta)
	if collision:
		queue_free()
