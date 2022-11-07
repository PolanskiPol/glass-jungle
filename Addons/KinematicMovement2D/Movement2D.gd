class_name Movement, "res://Addons/KinematicMovement2D/move.png"
extends Spatial

export(float, 1.0, 5000.0, 0.01) var max_speed : float = 50.0
export(float, 0.0, 0.99, 0.01) var slide : float = 0.0

onready var speed : float = 0.0
onready var direction : Vector2 = Vector2.ZERO

func _ready() -> void:
	slide = 1.0 - slide
