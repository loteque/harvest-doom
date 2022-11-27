extends Node

onready var sfx = get_node("AudioStreamPlayer")

func _ready():
	Signals.connect("first_soul_collected", self, "_on_first_soul_collected")

func _on_first_soul_collected():
	yield(get_tree().create_timer(0.0), "timeout")
	sfx.play()
