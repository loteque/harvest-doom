extends Node

onready var voice_over = get_node("AudioStreamPlayer")

func _ready():
	Signals.connect("first_soul_collected", self, "_on_first_soul_collected")

func _on_first_soul_collected():
	yield(get_tree().create_timer(3.0), "timeout")
	voice_over.play()
