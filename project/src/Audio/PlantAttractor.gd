extends Node

onready var sfx = get_node("AudioStreamPlayer")

func _ready():
	Signals.connect("attractor_plant_planted", self, "_on_attractor_plant_planted")

func _on_attractor_plant_planted():
	sfx.play()
