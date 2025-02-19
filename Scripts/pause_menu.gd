extends Control


# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#$VBoxContainerpass/Resume.grab_focus()# Replace with function body.

func _on_resume_pressed() -> void:
	Global.game_controller._pauseMenu()

func _on_settings_pressed() -> void:
	pass # Replace with function body.

func _on_exit_pressed() -> void:
	get_tree().quit() 
