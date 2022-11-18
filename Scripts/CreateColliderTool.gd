tool
extends Node

export var enabled : bool setget set_enabled
#export var omit_meshes_with_name : PoolStringArray = []

var collision_children : Array = []

func set_enabled(new_enabled : bool) -> void:
	enabled = new_enabled
	functionality()
	
func functionality() -> void:
	if(enabled):
		collision_children = []
		print("Well, hello there!")
		
		for child in get_children():
			child.create_trimesh_collision()
				
		yield(get_tree().create_timer(1.0), "timeout")
				
		for child in get_children():
			if(child is MeshInstance):
				child.get_child(0).collision_mask = 8
#				print(child.get_child(0).collision_mask)
