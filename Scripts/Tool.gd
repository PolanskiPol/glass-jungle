tool
extends Node

export var enabled : bool setget set_enabled

func set_enabled(new_enabled : bool) -> void:
	enabled = new_enabled
	functionality()
	
func functionality() -> void:
	if(enabled):
		print("Well, hello there!")
		for child in get_children():
			if(child is MeshInstance):
				child.create_convex_collision()
