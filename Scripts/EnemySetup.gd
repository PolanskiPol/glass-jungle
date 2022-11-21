class_name EnemySetup
extends Spatial

signal trigger_activated

export var trigger : NodePath = ""
export var delay : float = 0.0
export var behind_player : bool = false
export var weak_enemy : bool = false

onready var enemy_spawned : bool = false
onready var enemy_reset_pos : Vector3 = $Enemy.global_transform.origin

func _ready() -> void:
	set_process(false)
	get_node(trigger).connect("body_entered", self, "trigger_spawn")
	
func _process(delta: float) -> void:
	setup_enemy()
	
func trigger_spawn(body : Node) -> void:
	if(body is KinematicBody and body.collision_layer == 8 and !enemy_spawned):
		emit_signal("trigger_activated")
		enemy_spawned = true
		yield(get_tree().create_timer(delay), "timeout")
		set_process(true)
		$SpawnSound.play(0.0)
		$Enemy.setup(body)
		if(!behind_player):
			$Enemy.random_spawn_sound_normal()
		else:
			$Enemy.random_spawn_sound_back()
			
		if(get_node(trigger) != null):
			get_node(trigger).queue_free()

func setup_enemy() -> void:
	if(get_node_or_null("Enemy") != null):
		$Enemy.global_transform.origin = lerp($Enemy.global_transform.origin, $EndPosition.global_transform.origin, 0.23)
		$Enemy.scale = lerp($Enemy.scale, Vector3(1, 1, 1), 0.23)
		if(weak_enemy):
			$Enemy/HealthSystem.max_health = 1
			$Enemy/HealthSystem.health = 1
	else:
		queue_free()
		
func reset() -> void:
	set_process(false)
	$Enemy.scale = Vector3(0, 0, 0)
	$Enemy.global_transform.origin = enemy_reset_pos
