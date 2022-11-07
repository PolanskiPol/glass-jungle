class_name Healer, "res://Addons/HealthSystem/health-increase.png"
extends Node

export var fully_recover : bool = false
export(int, 1, 500000, 1) var heal_ammount : int = 25

func heal(target : Node) -> void:
	for child in target.get_children():
		if(child is HealthSystem):
			if(fully_recover):
				child.fully_heal()
			else:
				child.heal(heal_ammount)
				
			return
