extends Control

var START_PAUSE_STATE = true

func _ready():
	Signals.connect("pause", self, "_on_pause")
	pause(START_PAUSE_STATE)

func pause(should_pause):
	get_tree().paused = should_pause
	visible = should_pause

func _on_pause(should_pause):
	pause(should_pause)

func _input(event):
	var pause_pressed = InputMap.event_is_action(event, "ui_pause") and event.is_pressed()
	if pause_pressed:
		pause(!get_tree().paused)
