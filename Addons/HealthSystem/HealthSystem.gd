class_name HealthSystem, "res://Addons/HealthSystem/health.png"
extends Node

signal healed
signal damaged
signal fully_healed
signal fatally_damaged

export(int, 1, 500000, 1) var max_health : int = 100
onready var health : int = max_health

func _ready() -> void:
	print(health)

func heal(health : int) -> void:
	self.health += health
	emit_signal("healed")
	if(self.health >= max_health):
		health = max_health
		emit_signal("fully_healed")
		
func fully_heal() -> void:
	health = max_health
	emit_signal("healed")
	emit_signal("fully_healed")
	
func damage(damage : int) -> void:
	health -= damage
	emit_signal("damaged")
	if(health <= 0):
		health = 0
		emit_signal("fatally_damaged")
		
func fatally_damage() -> void:
	health = 0
	emit_signal("damaged")
	emit_signal("fatally_damaged")
