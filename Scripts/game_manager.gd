extends Node

@onready var coins_collected: Label = $CoinsCollected



var current_score = 0 
# Called when the node enters the scene tree for the first time.
func add_point():
	current_score +=1
	coins_collected.text = "You collected "+ str(current_score) + " coins!"
	EventController.emit_signal("coin_collected", current_score)
