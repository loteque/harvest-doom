extends Node

onready var voice_over = get_node("AudioStreamPlayer")

func _ready():
	Signals.connect("souls_detected", self, "_on_souls_detected")

func _on_souls_detected(num_souls):
	yield(get_tree().create_timer(3.0), "timeout")
	voice_over.play()
