class_name DialogEasy
extends Node

signal dialog_changed(dialog_text)
signal dialog_over

onready var active : bool = true

var dialogs : Array = []
var current_dialog : int = -1

func _ready() -> void:
	for child in get_children():
		if(child is DialogStreamPlayer):
			dialogs.append(child)
			child.connect("finished", self, "play_next")
			
func play_next() -> void:
	if(active):
		if(current_dialog < dialogs.size() -1):
			current_dialog += 1
			dialogs[current_dialog].play()
			emit_signal("dialog_changed", [dialogs[current_dialog].dialog_text])
		else:
			emit_signal("dialog_over")
		
func stop() -> void:
	dialogs[current_dialog].stop()
	active = false
