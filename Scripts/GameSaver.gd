extends Node

signal game_loaded

func load_game() -> SaveFile:
	if(ResourceLoader.exists("user://SaveFile.tres")):
		var save_file : SaveFile = ResourceLoader.load("user://SaveFile.tres")
		if(save_file is SaveFile):
			emit_signal("game_loaded")
			return save_file
			
	return SaveFile.new()
	
func save_game(save_file : SaveFile) -> void:
	ResourceSaver.save("user://SaveFile.tres", save_file)
