extends Control


#onready var _player = get_parent().get_node("PlayerCamera")
onready var ui_high_score = get_node("HighScoreLabel")

func _ready():
	Signals.connect("souls_detected", self, "_on_souls_detected")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#ui_high_score.text = "High Score: " + str(_player.high_score)
	pass

func _on_souls_detected(num_souls) -> void:
		print("from StaticUI souls collected: %d" % [num_souls])
		ui_high_score.text = "High Score " + str(num_souls)
