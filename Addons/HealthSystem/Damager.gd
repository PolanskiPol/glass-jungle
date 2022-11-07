class_name Damager, "res://Addons/HealthSystem/health-decrease.png"
extends Node

export var fatally_damage : bool = false
export(int, 1, 500000, 1) var damage_ammount : int = 25

func damage(target : Node) -> void:
	for child in target.get_children():
		if(child is HealthSystem):
			if(fatally_damage):
				child.fatally_damage()
			else:
				child.damage(damage_ammount)
				
			return
