extends Node2D

const SPEED = 60
var direction =1 


@onready var slime_sprite = $AnimatedSprite2D
@onready var ray_cast_left = $LeftRayCast
@onready var ray_cast_right = $RightRayCast
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
		slime_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		slime_sprite.flip_h = false
	position.x += direction * SPEED * delta
	
