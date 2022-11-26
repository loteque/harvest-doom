extends Node

export (NodePath) onready var cursor_path = ".."

onready var cursor = get_node(cursor_path)

func detect_first_soul():
	if cursor.get_world_grid_cell_item() == 0:
		Signals.emit_signal("souls_detected", 1)
