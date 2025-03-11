extends Node2D

@onready var player: CharacterBody2D = $"../.."
@onready var animation_player: AnimationPlayer = $RotatePoint/AnimationPlayer
@onready var sprite_2d: Sprite2D = $RotatePoint/Sprite2D
@onready var rotate_point: Node2D = $RotatePoint
@onready var hitbox: CollisionShape2D = $RotatePoint/Sprite2D/HitBox/CollisionShape2D

const OFFSET_X = 20 
var originalPosSword
var original_rotation
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	originalPosSword = rotate_point.position.x
	original_rotation = rotate_point.rotation_degrees
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		if player.playerDirection == "left":
			sprite_2d.flip_h = true
			rotate_point.position.x = -OFFSET_X
			animation_player.set_speed_scale(-1)
			rotate_point.rotation_degrees = 180
			hitbox.position.x = -20  
		else:
			sprite_2d.flip_h = false
			rotate_point.position.x = originalPosSword 
			animation_player.set_speed_scale(1)
		
		if Input.is_action_just_pressed("Attack"):
			animation_player.play("slash")
			await get_tree().process_frame
			
