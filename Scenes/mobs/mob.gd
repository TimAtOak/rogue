extends CharacterBody2D

var health = 3
var is_hurt = false

@onready var player = get_node("/root/game_scene/player")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	%HealthBar.visible = is_hurt || health < 3
	if not is_hurt:
		var direction = global_position.direction_to(player.global_position)
		
		%mobsprite.play("Sprinting")
		velocity = direction * 50
		move_and_slide()
	
func take_damage():

	health -= 1
	%HealthBar.value = health
	is_hurt = true
	%mobsprite.play("Hurt")
	await get_tree().create_timer(1.0).timeout
	is_hurt = false
	if health <= 0:
		queue_free()
