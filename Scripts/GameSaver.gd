extends Node

func load_game() -> SaveFile:
	if(ResourceLoader.exists("SaveFile.res")):
		var save_file : SaveFile = ResourceLoader.load("SaveFile.res")
		if(save_file is SaveFile):
			return save_file
			
	return SaveFile.new()
	
func save_game(save_file : SaveFile) -> void:
	ResourceSaver.save("SaveFile.res", save_file)
