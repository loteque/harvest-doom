extends Control

var MENU_OPTION_SELECTED_COLOR = Color(1,1,1,1)
var MENU_OPTION_UNSELECED_COLOR = Color(1,1,1,0.5)
var DEFAULT_SELECTION_INDEX = 0

onready var options = self.get_children()
onready var hovered_index = DEFAULT_SELECTION_INDEX
onready var min_index = 0
onready var max_index = len(options) - 1

func clamp_index(i) -> int:
	return int(clamp(i, min_index, max_index))

func hover_prev():
	self.hover_by_index(hovered_index - 1)

func hover_next():
	self.hover_by_index(hovered_index + 1)

func get_hovered_node() -> Control:
	return options[hovered_index]

func _ready():
	self.hover_default()
	Signals.connect("pause", self, "_on_pause")

func _on_pause(should_pause):
	self.hover_default()

func _input(event):
	if not get_tree().paused:
		return
	if InputMap.event_is_action(event, "ui_pause") and event.is_pressed():
		self.hover_default()
	elif InputMap.event_is_action(event, "ui_up") and event.is_pressed():
		self.hover_prev()
	elif InputMap.event_is_action(event, "ui_down") and event.is_pressed():
		self.hover_next()
	elif InputMap.event_is_action(event, "ui_accept") and event.is_pressed():
		self.select_hovered_option()

func hover(index):
	self.get_child(index).self_modulate = MENU_OPTION_SELECTED_COLOR

func unhover(index):
	self.get_child(index).self_modulate = MENU_OPTION_UNSELECED_COLOR

func hover_by_index(index):
	hovered_index = self.clamp_index(index)
	for i in len(options):
		if i == hovered_index:
			self.hover(i)
		else:
			self.unhover(i)

func hover_default():
	self.hover_by_index(DEFAULT_SELECTION_INDEX)

func select_hovered_option():
	self.get_hovered_node().select()
