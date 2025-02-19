extends Node2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _on_body_entered(body: Node2D) -> void:
	animated_sprite_2d.play("close")
	print("Portal Entered!")
	print("GameController: ", Global.game_controller)
	Global.game_controller.change_2d_scene("res://Scenes/level2.tscn")
