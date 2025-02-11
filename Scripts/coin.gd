extends Area2D

func _on_body_entered(body: Node2D) -> void:
	print("One coin picked up")
	#score counter +1
	queue_free()
