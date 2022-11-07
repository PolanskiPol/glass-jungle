class_name TopDownMovement, "res://Addons/KinematicMovement2D/topDown.png"
extends "res://Addons/KinematicMovement2D/Movement2D.gd"

onready var moving : bool = false

func get_input_direction():
	var horizontal : float = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var vertical : float = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	var normal : Vector2 = Vector2(horizontal, vertical).normalized()
	direction = lerp(direction, normal, slide)
	
	moving = false
	if(horizontal != 0.0 or vertical != 0.0):
		moving = true
		
	return direction
	
func get_direction_to(point : Vector2):
	var origin_2d : Vector2 = Vector2(global_transform.origin.x, global_transform.origin.z)
	var normal : Vector2 = (point - origin_2d).normalized()
	direction = lerp(direction, normal, slide)
	
	moving = false
	if(normal.x != 0.0 or normal.y != 0.0):
		moving = true
		
	return direction

func move(target : KinematicBody2D, direction : Vector2):
	target.move_and_slide(direction * max_speed, Vector2.ZERO)
	
