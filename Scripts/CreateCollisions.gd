extends Spatial

func _ready() -> void:
	for child in get_children():
		if(child is MeshInstance):
			child.create_trimesh_collision()
				
	yield(get_tree().create_timer(0.1), "timeout")
				
	for child in get_children():
		if(child is MeshInstance):
			child.get_child(0).collision_mask = 8
		
		
