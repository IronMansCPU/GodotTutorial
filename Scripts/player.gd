extends CharacterBody2D


const SPEED = 130
const JUMP_VELOCITY = -300
@onready var character_sprite = $AnimatedSprite2D
func _physics_process(delta: float) -> void: #runs at 60 times per second (60fps) 
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_pressed("down") and is_on_floor():
		velocity += get_gravity() * delta 
		print("Down key pressed")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction > 0 :
		character_sprite.flip_h = false
	elif direction < 0 :
		character_sprite.flip_h = true
	
	if is_on_floor():
		#play animations
		if direction ==0:
			character_sprite.play("idle")
		else:
			character_sprite.play("run")
	else:
		character_sprite.play("jump")
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	
	
