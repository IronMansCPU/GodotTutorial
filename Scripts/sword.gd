extends Node2D


@onready var animation_player: AnimationPlayer = $RotatePoint/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		if Input.is_action_just_pressed("Attack"):
			animation_player.play("slash")
			await get_tree().process_frame
			#animation_player.play("RESET")
