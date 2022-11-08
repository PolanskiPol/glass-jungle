tool
extends Node

export var enabled : bool setget set_enabled

func set_enabled(new_enabled : bool) -> void:
	enabled = new_enabled
	functionality()
	
func functionality() -> void:
	if(enabled and Engine.editor_hint):
		var material_count : int = $US_Soldiers.get_surface_material_count() -1
		var percentaje : float = material_count / 100.0
		
		for i in range(0, material_count):
			print(i * percentaje, "%")
			$US_Soldiers.get_surface_material(material_count).next_pass = load("res://Resources/Materials/Outline.tres")
		
		print("Complete!")
