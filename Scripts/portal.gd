extends Node2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var levels = ["level1.tscn", "level2.tscn"] # contains the name for each level scene
# Called when the node enters the scene tree for the first time.
func _on_body_entered(body: Node2D) -> void:
	animated_sprite_2d.play("close")
	print("Portal Entered!")
	Global.game_controller.current_level +=1 # move index in the levels list 
	Global.game_controller.change_2d_scene("res://Scenes/"+levels[Global.game_controller.current_level])
	Global.game_controller.saved_coins += Global.game_controller.current_score
