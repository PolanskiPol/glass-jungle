class_name FPSCamera
extends Camera

export var target_path : NodePath = "" 
export(float, 0, 90, 0.1) var max_vertical_angle : float = 85.0
var target : Spatial
onready var event_relative : Vector2 = Vector2.ZERO

var save_file : SaveFile

func _ready() -> void:
	target = get_node(target_path)
	save_file = GameSaver.load_game()
	save_file.connect("game_loaded", self, "reload_save")
	
func reload_save() -> void:
	print("reloading_config")
	save_file = GameSaver.load_game()

func _input(event: InputEvent) -> void:
	if(event is InputEventMouseMotion and target.active):
		target.rotation_degrees.y -= event.relative.x * 0.2 * save_file.sensitivity
		rotation_degrees.x -= event.relative.y * 0.2 * save_file.sensitivity

		if(rotation_degrees.x > max_vertical_angle):
			rotation_degrees.x = max_vertical_angle
		elif(rotation_degrees.x < -max_vertical_angle):
			rotation_degrees.x = -max_vertical_angle
