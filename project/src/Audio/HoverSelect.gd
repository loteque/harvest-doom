extends Node

onready var sfx = get_node("AudioStreamPlayer")

func _ready():
	Signals.connect("menu_item_hovered", self, "_on_menu_item_hovered")

func _on_menu_item_hovered():
	sfx.play()
