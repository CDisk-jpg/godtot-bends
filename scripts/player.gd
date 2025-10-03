extends CharacterBody2D

const acc = 3
const SPEEDx = 110.0
const JUMP_VELOCITY = -120.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var health_bar: ProgressBar = $HealthBar



func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += (get_gravity()-Vector2(0,820)) * delta

		#velocity.y=max(velocity.y-grav,SPEEDy)
	# Handle jump.
	if Input.is_action_just_pressed("jump"): #and is_on_floor()
		velocity.y += JUMP_VELOCITY+JUMP_VELOCITY*(.01)
		velocity.y = clamp(velocity.y, -100,150)
		
		#velocity.y=min(velocity.y,+JUMP_VELOCITY)
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction == 1:
		#flips mc to direction
		animated_sprite.flip_h = false
		#velocity.x += (direction * SPEED)*(.33)
		velocity.x=min(velocity.x+acc,SPEEDx)
		animated_sprite.play("run")

	elif direction == -1:
		animated_sprite.flip_h = true
		velocity.x=max(velocity.x-acc,-SPEEDx)
		animated_sprite.play("run")

	else:
		velocity.x = lerp(velocity.x,0.0,0.1)
		animated_sprite.play("idle")
	move_and_slide()
		
