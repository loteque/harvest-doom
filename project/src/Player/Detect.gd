extends Node

export (NodePath) onready var cursor_path = ".."

onready var cursor = get_node(cursor_path)

func is_first_soul():
	if cursor.get_world_grid_cell_item() == 0:
		return true
