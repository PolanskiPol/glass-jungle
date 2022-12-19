class_name FPSRaycast
extends RayCast

signal hit(item, collision_point, collision_normal)

onready var time_alive : float = 0.0

func setup(origin : Vector3, rotation_degrees : Vector3, distance : float) -> void:
	collision_mask = 3
	cast_to = Vector3(0, 0, -distance)
	enabled = true
	self.rotation_degrees = rotation_degrees
	global_transform.origin = origin
	collide_with_areas = true
	collide_with_bodies = true
	
func _process(delta: float) -> void:
	time_alive += delta
	if(time_alive > 0.0):
		queue_free()
		
	if(get_collider() != null):
		emit_signal("hit", get_collider(), get_collision_point(), get_collision_normal())
		queue_free()

