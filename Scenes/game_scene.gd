extends Node2D

func _ready() -> void:
	get_tree().paused = true

func spawn_mob():
	var new_mob = preload("res://Scenes/mobs/mob.tscn").instantiate()
	%SpawnPath.progress_ratio = randf()
	new_mob.global_position = %SpawnPath.global_position
	add_child(new_mob)

func _on_timer_timeout() -> void:
	spawn_mob()

func _on_player_health_depleted() -> void:
	%GameOver.visible = true
	get_tree().paused = true

func _on_button_pressed() -> void:
	%Start.visible = false
	get_tree().paused = false
