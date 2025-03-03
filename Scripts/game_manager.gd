class_name GameController extends Node

@export var world_2d : Node2D 
@export var gui : Control 
@onready var pause_menu: Control = $GUI/UI/PauseMenu 


var paused = false # if game is paused or not 
var current_score = 0  # coins score
var saved_coins = 0 
var current_2d_scene
var current_gui_scene 
#var current_3d_scene 
func _ready() -> void:
	Global.game_controller = self 
	current_2d_scene = $WorldLevels/Level1

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		_pauseMenu()

func change_gui_scene(new_scene: String, delete: bool = true, keep_running: bool = false)-> void:
	await get_tree().process_frame  # Wait until the next frame
	if current_gui_scene != null:
		if delete:
			current_gui_scene.queue_free() # Deletes scene entirely
		elif keep_running:
			current_gui_scene.visible = false # keeps running scene but hides it
		else:
			gui.remove_child(current_gui_scene) # keeps in memory, does not run

	var new = load(new_scene).instantiate()
	gui.add_child(new)
	current_gui_scene = new 

func change_2d_scene(new_scene: String, delete: bool = true, keep_running: bool = false)-> void:
	await get_tree().process_frame  # Wait until the next frame
	if current_2d_scene != null:
		if delete:
			current_2d_scene.queue_free() # Deletes scene entirely
		elif keep_running:
			current_2d_scene.visible = false # keeps running scene but hides it
		else:
			world_2d.remove_child(current_2d_scene) # keeps in memory, does not run

	var new = load(new_scene).instantiate()
	world_2d.add_child(new)
	current_2d_scene = new 
	
	_update_score_label()

# Called when the node enters the scene tree for the first time.
func add_point():
	current_score +=1
	EventController.emit_signal("coin_collected", current_score)
	
func _update_score_label():
	var score_label = gui.get_node("UI/CoinUI/Label")
	if score_label:
		if saved_coins!=0:
			score_label.text = str(saved_coins)
		else:
			score_label.text = str(current_score)  # Set the correct score value

func _pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	paused = !paused 
