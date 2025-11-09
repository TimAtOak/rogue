extends CharacterBody2D

@onready var player = get_node("/root/game_scene/player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	%sprite.animation = "Sprinting"
	velocity = direction * 50
	move_and_slide()
	
