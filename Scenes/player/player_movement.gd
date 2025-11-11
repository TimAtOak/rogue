extends CharacterBody2D

signal health_depleted

@export var movement_speed : float = 500

var health: float = 100.0
var sprint : float = 300
var character_direction : Vector2

func _physics_process(delta):	
	character_direction.x = Input.get_axis("move_left","move_right")
	character_direction.y = Input.get_axis("move_up","move_down")
	character_direction = character_direction.normalized()
	
	#flip
	if character_direction.x > 0: %sprite.flip_h = false
	elif character_direction.x < 0: %sprite.flip_h = true
	
	if character_direction:
		if Input.is_action_pressed("sprint"):
			velocity = character_direction * sprint
			%sprite.animation = "Sprinting"
		else:	
			velocity = character_direction * movement_speed
			if %sprite.animation != "Walking": %sprite.animation = "Walking"
		
	else:
		velocity = velocity.move_toward(Vector2.ZERO, movement_speed)
		if %sprite.animation != "Idle": %sprite.animation = "Idle"
	
	const DAMAGE_RATE = 15.0
	var overlapping_mobs = %Hurtbox.get_overlapping_bodies()

	if (overlapping_mobs.size() > 0):
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%Healthbar.value = health
		if (health) <= 0.0:
			health_depleted.emit()
			
	move_and_slide()
