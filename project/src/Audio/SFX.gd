extends Node

onready var sfx = get_node("AudioStreamPlayer")

func _ready():
	Signals.connect("souls_detected", self, "_on_souls_detected")

func _on_souls_detected(num_souls):
	yield(get_tree().create_timer(0.0), "timeout")
	sfx.play()
