class_name HealthSystem, "res://Addons/HealthSystem/health.png"
extends Node

signal healed
signal damaged
signal fully_healed
signal fatally_damaged
signal health_changed

export(int, 1, 500000, 1) var max_health : int = 100
onready var health : int = max_health

func heal(health : int) -> void:
	self.health += health
	emit_signal("healed")
	emit_signal("health_changed")
	if(self.health >= max_health):
		health = max_health
		emit_signal("fully_healed")
		
func fully_heal() -> void:
	health = max_health
	emit_signal("health_changed")
	emit_signal("healed")
	emit_signal("fully_healed")
	
func damage(damage : int) -> void:
	health -= damage
	emit_signal("damaged")
	emit_signal("health_changed")
	if(health <= 0):
		health = 0
		emit_signal("fatally_damaged")
		
func fatally_damage() -> void:
	health = 0
	emit_signal("health_changed")
	emit_signal("damaged")
	emit_signal("fatally_damaged")
