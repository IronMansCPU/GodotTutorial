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
	originalPosSword = position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		if player.playerDirection == "left":
			scale.x = -abs(scale.x)
			position.x = originalPosSword.x - 8
			
		else:
			scale.x = abs(scale.x)
			position.x = originalPosSword.x
		
		if Input.is_action_just_pressed("Attack"):
			animation_player.play("slash")
			await get_tree().process_frame
			
