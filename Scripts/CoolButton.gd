extends BaseButton

export var click_audio : Resource = load("res://Art/Audio/Dice.wav")
export var enter_audio : Resource = load("res://Art/Audio/Card.wav")
export var max_scale : float = 1.15

onready var current_scale : Vector2 = Vector2(1, 1)

func _ready() -> void:
	connect("focus_entered", self, "play_mouse_entered")
	connect("mouse_entered", self, "play_mouse_entered")
	connect("focus_exited", self, "return_to_normal")
	connect("mouse_exited", self, "return_to_normal")
	connect("pressed", self, "play_mouse_pressed")
	
func _process(delta: float) -> void:
	rect_scale = lerp(rect_scale, current_scale, 0.12)
	
func return_to_normal() -> void:
	current_scale = Vector2(1, 1)
	
func play_mouse_entered() -> void:
	grab_focus()
	current_scale = Vector2(max_scale, max_scale)
	var inst : AudioStreamPlayer = AudioStreamPlayer.new()
	inst.stream = enter_audio
	inst.bus = "Effects"
	add_child(inst)
	inst.play()
	inst.connect("finished", inst, "queue_free")
	
func play_mouse_pressed() -> void:
	var inst : AudioStreamPlayer = AudioStreamPlayer.new()
	inst.stream = click_audio
	inst.bus = "Effects"
	add_child(inst)
	inst.play()
	inst.connect("finished", inst, "queue_free")
