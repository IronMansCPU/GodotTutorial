class_name HitBox

extends Area2D
var damage :=1
# no mask, only has layer so it can hit the hurtbox 
func _init() -> void:
	collision_layer = 4
	collision_mask = 0
	
