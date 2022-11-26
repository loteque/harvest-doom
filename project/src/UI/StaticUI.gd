extends Control

onready var ui_high_score = get_node("HighScoreLabel")
onready var ui_soul_count = get_node("SoulCount")

func _ready():
	Signals.connect("souls_detected", self, "_on_souls_detected")


func _on_souls_detected(num_souls) -> void:
		ui_high_score.text = "High Score: " + str(num_souls)
		ui_soul_count.text = "Souls: " + str(num_souls)
