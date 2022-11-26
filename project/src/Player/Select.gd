extends Node

export (NodePath) onready var cursor_path = ".."

onready var cursor = get_node(cursor_path) 

func _on_select_first_soul() -> void:
	if Input.is_action_just_pressed("ui_accept") and cursor.get_world_grid_cell_item() == 0:
		cursor.detect_soul()
		cursor.set_world_grid_cell_item(-1)
