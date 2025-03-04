extends Node2D

const SPEED = 60
var direction =1 
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var kill_zone: Area2D = $KillZone
@onready var animation_sprite: AnimatedSprite2D = $AnimatedSprite2D

@onready var slime_sprite = $AnimatedSprite2D
@onready var ray_cast_left = $LeftRayCast
@onready var ray_cast_right = $RightRayCast
# Called every frame. 'delta' is the elapsed time since the previous frame.
var hitpoints = 2
func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
		slime_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		slime_sprite.flip_h = false
	position.x += direction * SPEED * delta
	
func _on_head_hit_box_body_entered(body: Node2D) -> void:
	print("Slime Killed")
	animation_player.play("death_animation")
	kill_zone.set_collision_mask_value(2, false)
	await get_tree().process_frame  # Waits one frame
	#print(kill_zone.get_collision_mask_value(3))
	
func take_damage(amount: int)->void:
	animation_sprite.play("hit")
	print("Damage: ", amount)
	hitpoints -= amount
	if hitpoints ==0:
		animation_player.play("death_animation")
	
	
	
