extends Control

onready var show_dialog_at_game_start = false

func _ready():
	visible = show_dialog_at_game_start
	Signals.connect("first_soul_collected", self, "_on_first_soul_collected")

func _on_first_soul_collected():
	self.open()

func close():
	visible = false

func open():
	visible = true

func _input(event):
	var dialog_should_close = InputMap.event_is_action(event, "ui_dialog_continue") and event.is_pressed() and visible
	
	if dialog_should_close:
		self.close()
