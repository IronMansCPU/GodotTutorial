extends Control


@onready var label: Label = $Label
@onready var camera = get_viewport().get_camera_2d()  # Get the Camera2D
var offset = Vector2(0, 0) 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventController.connect("coin_collected", on_event_coin_collected)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func on_event_coin_collected(value:int) -> void:
	label.text = str(value)

#func _process(delta: float) -> void:
#	if camera:
#		global_position = camera.global_position - (camera.get_viewport_rect().size / 2) + offset
	
