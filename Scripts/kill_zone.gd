extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer


@onready var timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	print("Player Died")
	animation_player.play("death_animation")
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	timer.start()
	
	

func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	var game_controller = Global.game_controller  # Access the GameController instance
	if game_controller:
		game_controller.change_2d_scene(game_controller.current_2d_scene.scene_file_path)  # Reload current level
	game_controller.current_score = game_controller.saved_coins # resets coin counter to already saved coins
	
