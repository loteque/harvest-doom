extends Node

onready var sfx = get_node("AudioStreamPlayer")

func _ready():
	Signals.connect("menu_item_selected", self, "_on_menu_item_selected")

func _on_menu_item_selected():
	sfx.play()
