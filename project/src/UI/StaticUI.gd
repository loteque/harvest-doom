extends Control


#onready var _player = get_parent().get_node("PlayerCamera")
onready var ui_high_score = get_node("HighScoreLabel")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#ui_high_score.text = "High Score: " + str(_player.high_score)
	pass
