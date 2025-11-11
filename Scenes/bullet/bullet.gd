extends Area2D
var pos: Vector2
var rota: float
var dir: float
var speed = 400
var travelled_distance = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position=pos
	global_rotation=rota
	%fire.play()
	%fireball.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	#velocity = Vector2(speed, 0).rotated(dir)
	#var collision = move_and_collide(velocity * _delta)
	#if collision:
	const SPEED = 1000
	const RANGE = 1200
	
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	
	if travelled_distance > RANGE:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	%fire.play()
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
